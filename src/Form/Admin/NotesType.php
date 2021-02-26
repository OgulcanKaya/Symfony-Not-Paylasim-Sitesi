<?php

namespace App\Form\Admin;

use App\Entity\Admin\Notes;
use App\Entity\Admin\University;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Proxies\__CG__\App\Entity\Admin\Category;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class NotesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('category', EntityType::class,[
                'class'=>Category::class,
                'choice_label' => 'title',
            ])
            ->add('university', EntityType::class,[
                'class'=>University::class,
                'choice_label' => 'name',
            ])

            ->add('title')
            ->add('keywords')
            ->add('description')

            ->add('image', FileType::class, [
                'label' => 'Image Path',

                // unmapped means that this field is not associated to any entity property
                'mapped' => false,

                // make it optional so you don't have to re-upload the PDF file
                // everytime you edit the Product details
                'required' => false,

                // unmapped fields can't define their validation using annotations
                // in the associated entity, so you can use the PHP constraint classes
                'constraints' => [
                    new\Symfony\Component\Validator\Constraints\File([
                        'maxSize' => '102400000k',
                        'mimeTypes' => [
                            'application/pdf',
                            'application/x-pdf',
                            'image/*'
                        ],
                        'mimeTypesMessage' => 'Please upload a valid PDF document',
                    ])
                ],
            ])
            ->add('pdf', FileType::class, [
                'label' => 'Pdf Path',

                // unmapped means that this field is not associated to any entity property
                'mapped' => false,

                // make it optional so you don't have to re-upload the PDF file
                // everytime you edit the Product details
                'required' => false,

                // unmapped fields can't define their validation using annotations
                // in the associated entity, so you can use the PHP constraint classes
                'constraints' => [
                    new\Symfony\Component\Validator\Constraints\File([
                        'maxSize' => '102400000k',
                        'mimeTypes' => [
                            'application/pdf',
                            'application/x-pdf',
                            'image/*'
                        ],
                        'mimeTypesMessage' => 'Please upload a valid PDF document',
                    ])
                ],
            ])
            ->add('status', ChoiceType::class, [
                'choices' => [
                    'True' => 'True',
                    'False' => 'False',
                ],
            ])

            ->add('detail', CKEditorType::class, array(
                'config' => array(
                    'uiColor' => '#ffffff',
                    //...
                ),
            ))


        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Notes::class,
        ]);
    }
}
