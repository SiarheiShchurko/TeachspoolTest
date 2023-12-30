import Foundation

final class OnboardingVM: OnboardingProtocol {
    var onboardingArray: [OnboardingModel] = [OnboardingModel(imageName: String.OnboardingImages.firstSlide,
                                                              slideText: "Ordina a domicilio senza limiti di distanza. Non è magia, è Moovenda!",
                                                              secondaryText: "PRONTO?"),
                                              OnboardingModel(imageName: String.OnboardingImages.secondSlide,
                                                              slideText: "Ogni tanto inviamo degli sconti esclusivi tramite notifiche push, ci stai?",
                                                              secondaryText: "PROMOZIONI"),
                                              OnboardingModel(imageName: String.OnboardingImages.thirdSlide,
                                                              slideText: "Per sfruttare al massimo l'app, puoi condividerci la tua posizione?",
                                                              secondaryText: "POSIZIONE")
    ]
}
