// File Name    : ExerciseDescription.swift
// Description  : This file holds the logic for storing an exercise description obj.
// Programmer(s): Arindm Sharma, Zivojin Pecin, Jody Markic, Kyle Jensen
// Date         : Jan 1, 2018

import UIKit


class ExerciseDescription
{
    var name : String
    var description : String
    var required : [String]
    var difficulty : Int
    var image : UIImage
    
    // Name         : init()
    // Description  : acts as the initializer for the class
    // Parameters   : name: String, description: String, required: [String], difficulty: Int, image: UIImage
    // Returns      : N/A
    init(name: String, description: String, required: [String], difficulty: Int, image: UIImage)
    {
        self.name = name
        self.description = description
        self.required = required
        self.difficulty = difficulty
        self.image = image
    }
    
    // Name         : init()
    // Description  : acts as the initializer for the class
    // Parameters   : none
    // Returns      : N/A
    convenience init()
    {
        self.init(name: "", description: "", required: [], difficulty: 0, image: UIImage())
    }
    
    // Name         : getShoulderDescriptions()
    // Description  : helps retreivie descriptioin for shoulder exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getShoulderDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
                ExerciseDescription(name: "Dumbbell Press", description: "Grab a couple of dumbbells and sit on a military press bench or a utility bench that has a back support on it as you place the dumbbells upright on top of your thighs. Clean the dumbbells up one at a time by using your thighs to bring the dumbbells up to shoulder height at each side. Rotate the wrists so the palms of your hands are facing forward. This is your starting position. As you exhale, push the dumbbells up until they touch at the top.\n\nAfter a second pause, slowly come down back to the starting position as you inhale. Repeat for the recommended amount of repetitions. To keep tension on your delts at all times, do not lock out your elbows when pressing the dumbbells.", required: ["Dumbbells", "Military/Flat bench"], difficulty: 4, image: UIImage(named: "shoulder press.png")!),
                
                ExerciseDescription(name: "Military Press", description: "Take a barbell. Rotate the wrists so the palms of your hands are facing forward. This is your starting position. As you exhale, push the barbell up.\n\nAfter a second pause, slowly come down back to the starting position as you inhale. Repeat for the recommended amount of repetitions. To keep tension on your delts at all times, do not lock out your elbows when pressing the barbell.", required: ["Dumbbells", "Flat bench"], difficulty: 3, image: UIImage(named: "militairy press.jpg")!),
                
                ExerciseDescription(name: "Front Raise", description: "While standing straight, hold a barbell plate in both hands at the 3 and 9 o'clock positions. Your palms should be facing each other and your arms should be extended and locked with a slight bend at the elbows and the plate should be down near your waist in front of you as far as you can go.  Tip: The arms will remain in this position throughout the exercise. This will be your starting position.\n\nSlowly raise the plate as you exhale until it is a little above shoulder level. Hold the contraction for a second. Tip: make sure that you do not swing the weight or bend at the elbows. Your torso should remain stationary throughout the movement as well. As you inhale, slowly lower the plate back down to the starting position.Repeat for the recommended amount of repetitions.", required: ["Dumbbells"], difficulty: 2, image: UIImage(named: "front raise.jpg")!),
                
                ExerciseDescription(name: "Side Raise", description: "Pick a couple of dumbbells and sit at the end of a flat bench with your feet firmly on the floor. Hold the dumbbells with your palms facing in and your arms straight down at your sides at arms' length. This will be your starting position./n\nWhile maintaining the torso stationary (no swinging), lift the dumbbells to your side with a slight bend on the elbow and the hands slightly tilted forward as if pouring water in a glass. Continue to go up until you arms are parallel to the floor. Exhale as you execute this movement and pause for a second at the top.Lower the dumbbells back down slowly to the starting position as you inhale. Repeat for the recommended amount of repetitions.", required: ["Dumbbells", "Flat bench"], difficulty: 4, image: UIImage(named: "side raise.jpg")!),
                
                ExerciseDescription(name: "Lateral Raise", description: "Start by standing to the right side of a low pulley row. Use your left hand to come across the body and grab a single handle attached to the low pulley with a pronated grip (palms facing down). Rest your arm in front of you. Your right hand should grab the machine for better support and balance.\n\nMake sure that your back is erect and your feet are shoulder width apart from each other. This is the starting position.Begin to use the left hand and come across your body out until it is elevated to shoulder height while exhaling.Feel the contraction at the top for a second and begin to slowly lower the handle back down to the original starting position while inhaling.", required: ["Cable Pulley"], difficulty: 3, image: UIImage(named: "lateral raise.jpg")!)
            ]
        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Бучице за рамена", description: "Зграбите неколико гонича и седите на војној прес клупи или клупи за помоћ која има леђну подршку на њој док постављате кравате усправно на врх вашег бутина. Очистите тегове један по један користећи своје бутине како би доносили тегове до висине рамена на свакој страни. Ротирајте зглобове тако да су дланови руке окренути према напред. Ово је ваша почетна позиција. Док издахнете, гурите туне док се не додирну на врх. По другој паузи, полако се спустите на почетну позицију док удишете. Поновите за препоручену количину понављања. Да бисте стално држали напетост на својим деловима, не затварајте лактове притиском на тикове.", required: ["Бучице"], difficulty: 4, image: UIImage(named: "shoulder press.jpg")!),
                
                ExerciseDescription(name: "Потисак шипке испред главе", description: "Узми мрљу. Ротирајте зглобове тако да су дланови руке окренути према напред. Ово је ваша почетна позиција. Док издахнете, гурајте мрена горе. По другој паузи, полако се спустите на почетну позицију док удишете. Поновите за препоручену количину понављања. Да бисте стално држали напетост на својим деловима, не затварајте лактове притиском на мрљу.", required: ["Шипка и тегови"], difficulty: 3, image: UIImage(named: "militairy press.jpg")!),
                
                ExerciseDescription(name: "Предње летење", description: "Док стојите равно, држите плочу за мрљу у обе руке на положајима 3 и 9 сати. Ваше дланове би требало да буду окренути једни другима, а руке треба проширити и закључати са благим кривинама на лактовима и тањир мора бити у близини вашег струка испред вас што је више могуће. Савет: Руке ће остати на овој позицији током вежбања. Ово ће бити ваша почетна позиција. Полако подигните плочу док се издахне док не буде мало изнад нивоа рамена. Задржите контракцију на секунд. Савет: уверите се да не куглате тежину или савијте на лактовима. Ваш торсо би требао остати непокретан током читавог покрета. Док удишете, полако спустите плочу на почетну позицију. Поновите за препоручену количину понављања.", required: ["Вучице"], difficulty: 3, image: UIImage(named: "front raise.jpg")!),
                
                ExerciseDescription(name: "Летење у предклону", description: "Изабрати пар гитариста и сједити на крају равне клупе чврсто на ногама. Држите гуме са длановима окренутим према њој, а руке на доле на рукама. Ово ће бити ваша почетна позиција. Док држите торсо стационарно (без замаха), подигните гаће са ваше стране са благим савијањем на лакат и руке благо нагнете напред као да сипате воду у стаклу. Наставите да се крећете док вам оружје не буде паралелно са подом. Издужите док извршавате овај покрет и зауставите на секунду на врху. Испустите гуме спуштајући полако до почетне позиције док удишете. Поновите за препоручену количину понављања.", required: ["Вучице"], difficulty: 4, image: UIImage(named: "side raise.jpg")!),
                
                ExerciseDescription(name: "Летење у предклону са машином", description: "Изабрати пар гитариста и сједити на крају равне клупе чврсто на ногама. Држите гуме са длановима окренутим према њој, а руке на доле на рукама. Ово ће бити ваша почетна позиција. Док држите торсо стационарно (без замаха), подигните гаће са ваше стране са благим савијањем на лакат и руке благо нагнете напред као да сипате воду у стаклу. Наставите да се крећете док вам оружје не буде паралелно са подом. Издужите док извршавате овај покрет и зауставите на секунду на врху. Испустите гуме спуштајући полако до почетне позиције док удишете. Поновите за препоручену количину понављања.", required: ["Gym Machine"], difficulty: 3, image: UIImage(named: "lateral raise.jpg")!)
            ]

        }
        return descriptions
    }
    
    // Name         : getChestDescriptions()
    // Description  : helps retreivie description for chest exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getChestDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
                ExerciseDescription(name: "Bench Press", description: "Lie back in a barbell bench press station with your feet flat on the ground and your head against the bench. Your eyes should be directly below the racked bar. Grab the bar with an overhand grip slightly wider than shoulder-width. Keeping your arms fully extended, unrack the bar so that it's directly over your chest. This is the starting position.\n\nKeeping your elbows in, lower the bar to touch your chest at nipple level, then push it up explosively until your arms are straight again. As you perform the lift, make sure to engage your core and avoid excessively arching your lower back or moving your chest. That's one rep.", required: ["Barbell", "Weights", "Flat bench"], difficulty: 4, image: UIImage(named: "bench press.jpg")!),
                    
                ExerciseDescription(name: "Decline Press", description: "Using a medium-width grip,lift the bar from the rack and hold it directly above you with your arms locked. The arms should be perpendicular to the floor. This will be your starting position. In order to protect your rotator cuff, it is best if you have a spotter help you lift the barbell off the rack.\nAs you breathe in, come down slowly until you feel the bar on your lower chest.\n\nAfter a second pause, bring the bar back to the starting position as you breathe out and push the bar using your chest muscles.", required: ["Barbell", "Weights", "Decline bench"], difficulty: 3, image: UIImage(named: "decline bench.jpg")!),
                    
                ExerciseDescription(name: "Incline Press", description: "Set an incline bench at a 30-45-degree angle. Grab two dumbbells using an overhand grip, and sit with your back and head against the bench and your feet flat on the ground. Lift both dumbbells above your face with your arms extended. This is the starting position.\n\nLower both dumbbells until you reach the middle of your chest, then press the weights up and slightly toward each other until you reach the starting position again. That's one rep.", required: ["Dumbbells", "Incline Bench"], difficulty: 4, image: UIImage(named: "incline bench.png")!),
                    
                ExerciseDescription(name: "Dumbbell Fly", description: "Start with this chest isolation movement to warm up the pecs and stretch the fibers out early so they have more room for the blood to flood in later in the workout. Using an incline bench helps target the top of the chest, but you'll need to pay close attention to your form to keep your shoulders and traps out of the movement.\n\nAs you lower the weights on each rep, give your muscles a good stretch at the bottom of the movement and squeeze your arms together as hard as you can at the top. Remember, if you don't feel the pecs stretch and flex, the rep doesn't count.", required: ["Dumbbells", "Incline Bench"], difficulty: 4, image: UIImage(named: "dumbell fly.jpg")!)
            ]

        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Бенч прес", description: "Вратите се у станицу за стампу са стражњом ногом, стојите ноге равно на тлу, а глава против клупе. Твоје очи требају бити директно испод пукотине. Ухватите шипку помоћу прикривача за надмоћ, мало ширу од ширине рамена. Држите руке у потпуности продужене, унтрашите шипку тако да је директно преко груди. Ово је полазна позиција. Одржавањем лактова, спустите траку да бисте додирнули груди на нивоу брадавице, а затим га експлозивно гурните док вам руке нису равне. Док изводите лифт, обавезно укључите језгро и избегавајте претерано завртање доњег дела или покретање груди. То је један реп.", required: ["Бенч прес"], difficulty: 4, image: UIImage(named: "bench press.jpg")!),
                
                ExerciseDescription(name: "Спуштени бенч прес", description: "Користећи ручицу средње ширине, подигните шипку из рацк-а и држите је директно изнад вас рукама закључаним. Руке треба да буду окомито према поду. Ово ће бити ваша почетна позиција. Да би заштитили вашу ротирајућу манжетну, најбоље је да имате помоћника који вам помаже да подигнете мрена са рацк-а. Ако дишете, спустите се полако док не осетите траку на доњим грудима. Ако секунд паузирајте, вратите шипку назад у почетну позицију док дишете и притиснете шипку помоћу мишића у грудима.", required: ["Спуштени бенч прес"], difficulty: 3, image: UIImage(named: "decline bench.jpg")!),
                
                ExerciseDescription(name: "Подигнути бенч прес", description: "Поставите клупу за нагиб са угловима од 30-45 степени. Зграбите два тиква помоћу надлактичног држања и сједите с леђима и главе против клупе, а ноге равне на тлу. Подигните оба гонича изнад вашег лица с раширеним рукама. Ово је полазна позиција. Лагано обадвајте све док не стигнете до средине грудног коша, а затим притиснете тегове нагоре и благо једни према другима док поново не дођете до почетне позиције. То је један реп.", required: ["Подигнути бенч прес"], difficulty: 4, image: UIImage(named: "incline bench.png")!),
                
                ExerciseDescription(name: "Летење лежећи", description: "Почните са покретом изолације у грудима како бисте загрејали пецове и рано истегнули влакна, тако да им је више простора за поплављање крви касније током тренинга. Коришћење клупе за нагиб помаже циљању на врх груди, али морате пажљиво обратити пажњу на вашу форму да бисте извукли рамена и замке. Ако смањите тежине на сваком репу, дајте мишићима добро стегнути на дну покрета и стисните руке заједно што је тешко колико можете на врху. Запамтите, ако не осјећате да се пецови расе и флексирају, реп се не рачуна.", required: ["Бучице"], difficulty: 3, image: UIImage(named: "dumbell fly.jpg")!)

            ]
        }
        return descriptions
    }
    
    // Name         : getBicepDescriptions()
    // Description  : helps retreivie descriptioin for bicep exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getBicepDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
                ExerciseDescription(name: "Dumbbell Curl", description: "Sit down on an incline bench with a dumbbell in each hand being held at arm's length.  Tip:Keep the elbows close to the torso.This will be your starting position.\n\nWhile holding the upper arm stationary, curl the right weight forward while contracting the biceps as you breathe out. As you do so, rotate the hand so that the palm is facing up. Continue the movement until your biceps is fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps. Tip:Only the forearms should move.Slowly begin to bring the dumbbell back to starting position as your breathe in.", required: ["Dumbbell", "Incline bench"], difficulty: 3, image: UIImage(named: "dumbbell curl.jpg")!),
                
                ExerciseDescription(name: "Barbell Curl", description: "Stand up with your torso upright while holding a barbell at a shoulder-width grip. The palm of your hands should be facing forward and the elbows should be close to the torso. This will be your starting position.\n\nWhile holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out.  Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard.", required: ["Barball", "Weights"], difficulty: 4, image: UIImage(named: "barbell curl.jpg")!),
                
                ExerciseDescription(name: "Preacher Curl", description: "Grab a dumbbell with the right arm and place the upper arm on top of the preacher bench or the incline bench. The dumbbell should be held at shoulder length. This will be your starting position. As you breathe in, slowly lower the dumbbell until your upper arm is extended and the biceps is fully stretched.\n\nAs you exhale, use the biceps to curl the weight up until your biceps is fully contracted and the dumbbell is at shoulder height. Again, remember that to ensure full contraction you need to bring that small finger higher than the thumb.", required: ["Dumbbell", "Preacher bench"], difficulty: 4, image: UIImage(named: "preacher curl.jpg")!),
                
                ExerciseDescription(name: "Concentration Curl", description: "Face the Bench (flat position) and bend over until your back is parallel to the ground. Place opposite of curl hand on bench for balance. With palm facing in, bring weight to chest, squeeze and then bring it back down to start position.", required: ["Flat bench", "Dumbbell"], difficulty: 5, image: UIImage(named: "concenteration curl.jpg")!),
                
                ExerciseDescription(name: "Reverse Curl", description: "Stand up with your torso upright while holding a bar attachment that is attached to a low pulley using a pronated (palms down) and shoulder width grip. Make sure also that you keep the elbows close to the torso. This will be your starting position.\n\nWhile holding the upper arms stationary, curl the weights while contracting the biceps as you breathe out. Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second as you squeeze the muscle.Slowly begin to bring the bar back to starting position as your breathe in.", required: ["Low pulley", "Straight bar"], difficulty: 4, image: UIImage(named: "reverse curl.jpg")!)
            ]

        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Бицепс прегиб", description: "Седите на клупи за нагиб са гумом у свакој руци која се држи на дну руке. Савет: Чувајте лактове близу торза. Ово ће бити ваша почетна позиција. нВхиле држећи надлактицу у стационару, увлачи праву тежину напријед док закључује бицепс док издушите.Како то чините, окрените руку тако да је длан окренут нагоре. Наставите са покретом док се бицепс не потпуне и губе држите уговорену позицију на тренутак док стиснете бицепс Савет: Само подлактице треба да се померају. Почните да вратите гребен назад у почетну позицију док удишете.", required: ["Бучице"], difficulty: 3, image: UIImage(named: "dumbbell curl.jpg")!),
            
                ExerciseDescription(name: "Бицепс прегиб шипка", description: "Устаните са својим торзом усправно док држите мрена на држачу ширине рамена. Длан руке треба окренути према напред и лактови би требали бити близу торза. Ово ће бити ваша почетна позиција. Док држите горње руке у стању мировања, увлачите тегове напред док закључујете бицепс док изађете. Наставите са покретом док се бицепс не потпуне, а трака је на нивоу рамена. Држите уговорену позицију на секунд и стисните бицепс тешко.", required: ["шипка"], difficulty: 4, image: UIImage(named: "barbell curl.jpg")!),
            
                ExerciseDescription(name: "Једна рука прегиб", description: "Зграбите бучицу десном руком и поставите надлактицу на врх клупе за проповеднике или клупу за нагиб. Гумица треба држати дужине рамена. Ово ће бити ваша почетна позиција. Док удишете, полако спустите бучицу док се надлактица не прошири и бицепс се потпуно испруже. Ако се издахнете, користите бицепс како бисте увијали тежину све док се ваши бицепс не потпуне, а бућица је на висини рамена . Опет, запамтите да за обезбеђивање потпуне контракције потребно је да тај мали прст повећа од палца.", required: ["Бучице"], difficulty: 4, image: UIImage(named: "preacher curl.jpg")!),
            
                ExerciseDescription(name: "Концентрациони прегиб", description: "Фаце тхе Бенцх (равно место) и савијте се све док вам леђа не буде паралелна са земљом. Поставите супротно од рукавице на клупи за равнотежу. стисните и вратите је назад на почетну позицију.", required: ["Бучице"], difficulty: 5, image: UIImage(named: "concenteration curl.jpg")!),
            
                ExerciseDescription(name: "Обртни прегиб", description: "Устаните са својим торзом усправно држећи везник који је причвршћен за мале шкрипце помоћу прозираног (дланове доле) и грипом ширине рамена. Уверите се и да држите лактове близу на торзо.То ће бити ваша почетна позиција. нАко држите горње руке стационарно, увијте тегове док затежете бицепс док издушите. Само подлактице треба да се крећу. Наставите са покретом док се бицепс не потпуне, а бар је на нивоу рамена. Држите уговорену позицију на секунду док стиснете мишић. Почните да вратите шипку назад на почетну позицију док уђете.", required: ["Бучице"], difficulty: 4, image: UIImage(named: "reverse curl.jpg")!)
            ]
        }
        return descriptions
    }
    
    // Name         : getTricepDescriptions()
    // Description  : helps retreivie secription for tricep exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getTricepDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
                ExerciseDescription(name: "Tricep Pushdown", description: "Standing upright with the torso straight and a very small inclination forward, bring the upper arms close to your body and perpendicular to the floor. The forearms should be pointing up towards the pulley as they hold the bar. This is your starting position.\n\nUsing the triceps, bring the bar down until it touches the front of your thighs and the arms are fully extended perpendicular to the floor. The upper arms should always remain stationary next to your torso and only the forearms should move. Exhale as you perform this movement. After a second hold at the contracted position, bring the bar slowly up to the starting point. Breathe in as you perform this step.", required: ["High pulley", "Straight bar"], difficulty: 3, image: UIImage(named: "tricep pushdown.jpg")!),
                
                ExerciseDescription(name: "Overhead Extension", description: "To begin, stand up with a dumbbell held by both hands. Your feet should be about shoulder width apart from each other. Slowly use both hands to grab the dumbbell and lift it over your head until both arms are fully extended.\n\nThe resistance should be resting in the palms of your hands with your thumbs around it. The palm of the hands should be facing up towards the ceiling. This will be your starting position.Keeping your upper arms close to your head with elbows in and perpendicular to the floor.", required: ["Dumbbell"], difficulty: 3, image: UIImage(named: "overhead extension.jpg")!),
                
                ExerciseDescription(name: "Dumbbell Kickback", description: "Start with a dumbbell in each hand and your palms facing your torso. Keep your back straight with a slight bend in the knees and bend forward at the waist. Your torso should be almost parallel to the floor. Make sure to keep your head up. Your upper arms should be close to your torso and parallel to the floor. Your forearms should be pointed towards the floor as you hold the weights. There should be a 90-degree angle formed between your forearm and upper arm. This is your starting position.\n\nNow, while keeping your upper arms stationary, exhale and use your triceps to lift the weights until the arm is fully extended. Focus on moving the forearm. After a brief pause at the top contraction, inhale and slowly lower the dumbbells back down to the starting position.", required: ["Dumbbell"], difficulty: 3, image: UIImage(named: "dumbbell kickback.jpg")!),
                
                ExerciseDescription(name: "Bench Dip", description: "Set the bar to about knee height. Sit on the bar and place your hands on either side of your hips, fingers forward. Extend your legs in front of you and straighten your arms so your weight is balanced between your hands and your heels.\n\nBend your elbows and lower yourself down, keeping your back close to the bar. When your elbows make 90-degree angles, press through your hands and return to the start.", required: ["Flat bench/smith rack", "Weights"], difficulty: 2, image: UIImage(named: "bench dip.png")!)
            ]

        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Трицепс екстензија", description: "Стојећи усправно са торсом равном и веома малом нагибом напред, доњи горњи рукав близу твог тела и праволинијски на под. Подлактице треба усмерити према каишу док држе бар. Ово је ваша почетна позиција. Користите трицепс, спустите траку док не додирне предњи део вашег бутина, а руке су потпуно проширене праволинијски на под. Веће руке треба увек остати стационарно поред вашег торза и само подлактице би требало да се крећу.Уживајте док изводите овај покрет.По секунду држите на уговореном положају, полако спустите бар до почетне тачке.Дозите док извршите овај корак.", required: ["Машина са кабловима"], difficulty: 4, image: UIImage(named: "tricep pushdown.jpg")!),
                
                ExerciseDescription(name: "Трицепс екстензија са бучицама", description: "Да почнемо, ухватимо се бачвама које држимо обе руке. Ваше стопало треба да буде око ширине рамена. Полако користите обе руке да зграбите бучицу и подигнете га над главом све док се обе руке не прошире. Отпор треба да се одмара у длановима рукама помоћу палца око ње. Длан руке мора бити окренут према горе према плафону. Ово ће бити ваш почетни положај. Држати горње руке близу главе, са лактовима и правим на под.", required: ["Бучице"], difficulty: 3, image: UIImage(named: "overhead extension.jpg")!),
                
                ExerciseDescription(name: "Трицепс екстензија 2", description: "Почните са бучицом у свакој руци и длановима окренутим према торзу. Држите леђа равном малом кривином у коленима и савијте се напред у струку. Ваш торсо треба да буде скоро паралелан поду, обавезно држите главу горе, ваша горња рука би требало да буде близу вашег трупа и паралелно са подом, а подлактице треба усмерити према поду док држите тегове. вашу подлактицу и надлактицу.То је ваша почетна позиција. нНово, док држите горње руке стационарно, издахните и користите свој тришај да бисте подигли тежине све док рука није потпуно проширена.Узадите се кад померите подлактицу Након кратке паузе на врху контракције, удахните и полако спустите кравате назад на почетну позицију.", required: ["Бучице"], difficulty: 3, image: UIImage(named: "dumbbell kickback.jpg")!),
                
                ExerciseDescription(name: "Пропадања", description: "Поставите траку на висину колена. Сједи на шипку и ставите руке на обе стране бокова, прстима напред. Проширите ноге испред себе и исправите руке, тако да је ваша тежина уравнотежена између руку и пете. Отклоните лактове и спустите се доле, држите леђа близу траке. Када ваши лактови имају углове од 90 степени, притисните руке и вратите се на почетак.", required: ["Сталак за пропадање"], difficulty: 2, image: UIImage(named: "bench dip.png")!)
            ]
        }
        return descriptions
    }
    
    // Name         : getBackDescriptions()
    // Description  : helps retreivie descriptioin for Back exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getBackDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
            
                ExerciseDescription(name: "Dead Lift", description: "Your feet should be spaced hip-width apart with your grip just outside your legs. Use an overhand grip. Your back should be flat—neutral spine—from start to finish. Your shoulders should be back and down.The bar should remain in contact with your legs for the entire range of motion.\n\nYour hips and knees should move together to transfer the bar from the ground to an upper-thigh, locked position.", required: ["Wrights", "Barbell", "Rack (optional)"], difficulty: 4, image: UIImage(named: "dead lift.jpg")!),
            
                ExerciseDescription(name: "One-Arm Row", description: "Pull the resistance straight up to the side of your chest, keeping your upper arm close to your side and keeping the torso stationary. Breathe out as you perform this step.  Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. Also, make sure that the force is performed with the back muscles and not the arms.\n\nFinally, the upper torso should remain stationary and only the arms should move. The forearms should do no other work except for holding the dumbbell; therefore do not try to pull the dumbbell up using the forearms.Lower the resistance straight down to the starting position. Breathe in as you perform this step.", required: ["Dumbbells", "Flat bench"], difficulty: 3, image: UIImage(named: "one arm row.jpg")!),
            
                ExerciseDescription(name: "Front Chin-Up", description: "As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.\n\nPull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.", required: ["Chin-up bar", "Weights (optional)"], difficulty: 5, image: UIImage(named: "front chin up.jpg")!),
            
                ExerciseDescription(name: "Seated Row", description: "As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.\n\nPull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement.  Tip:Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar.", required: ["Dumbbells", "Flat bench"], difficulty: 3, image: UIImage(named: "seated row.jpg")!),
            
                ExerciseDescription(name: "Lat Pulldown", description: "After grabbing the bar, engage your lats before you even start pulling, and keep your traps and upper back pulled down. Your head should be slightly tilted back, but your torso should remain bolt-upright, much like you're doing a seated pull-up. Pull your elbows toward the ground with your back, not your biceps.\n\nAs you pull, keep your upper back shifted down; when you fatigue, your traps will want to jump in and help your lats. Remember, the purpose of this movement is to train the lats, so try to avoid recruiting other muscle groups. Pull the weight down slowly, squeeze, and release it just as slowly. The only parts of your body you should be consciously moving are your elbows. If you start to lean back, you'll start recruiting your rhomboids, so stay upright.", required: ["Lat bar", "Pulldown cable", "Flat bench"], difficulty: 4, image: UIImage(named: "lat pulldown.jpg")!)
            ]

        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Мртво дизање", description: "Ваше ноге би требало да буду размакнуте ширине кичме уз ваш приањ изван ногу. Користите рукав. Лака би требала бити равно неутрална кичма - од почетка до краја. Ваша рамена треба да буду назад и доле. Трака треба да остану у контакту са ногама за читав спектар кретања. Ти колки и колена треба да се крећу заједно да преносе траку са земље у позадину, закључану позицију.", required: ["Шипка"], difficulty: 0, image: UIImage(named: "dead lift.jpg")!),
                
                ExerciseDescription(name: "Једноручно веслање", description: "Повуците отпор директно на страну грудног коша, држите надлактицу близу своје стране и држите торсо стационарно. Удахните док изводите овај корак. Савет: Концентришите се на стискање мишића у леђа када стигнете до потпуне уговорене позиције. Такође, уверите се да се сила изводи са леђима у мишићима, а не рукама. Финално, горњи труп треба да остане непромењен, а само руке треба да се крећу. Подлактице не смеју радити ништа друго осим држања бучица; зато не покушавајте да извучете гуму уз помоћ подлактице. Повећајте отпор директно до почетне позиције. Удахните док изводите овај корак.", required: ["Бучице"], difficulty: 2, image: UIImage(named: "one arm row.jpg")!),
                
                ExerciseDescription(name: "Згибови", description: "Пошто имате обе руке испружене испред себе држећи шипку уз изабрану ширину хватања, вратите торзо уназад око 30 степени док правите кривину на доњој страни леђа и извадите груди. Ово је ваша полазна позиција. Вучите торзо док бар не додирне ваш горњи сандук тако што црта рамена и горња рука доле и назад. Издужите док изводите овај део покрета. Горњи труп би требао остати непокретан док се креће кроз простор, а само руке би требало да се крећу. Подлактице не смеју радити ништа друго него држати шипку.", required: ["Шипка"], difficulty: 3, image: UIImage(named: "front chin up.jpg")!),
                
                ExerciseDescription(name: "Седеће веслање", description: "Пошто имате обе руке испружене испред себе држећи шипку уз изабрану ширину хватања, вратите торзо уназад око 30 степени док правите кривину на доњој страни леђа и извадите груди. Ово је ваша полазна позиција. нВучите торзо док бар не додирне ваш горњи сандук тако што црта рамена и горња рука доле и назад. Издужите док изводите овај део покрета. Савет: Концентришите се на стискање мишића у леђа када стигнете до потпуне уговорене позиције. Горњи труп би требао остати непокретан док се креће кроз простор, а само руке би требало да се крећу. Подлактице не смеју радити ништа друго него држати шипку.", required: ["Машина за веслање"], difficulty: 3, image: UIImage(named: "seated row.jpg")!),
                
                ExerciseDescription(name: "Лат машина", description: "После хватања шипке, уклопите латс пре него што почнете повући и држите своје замке и горњи део леђа спуштени. Твоја глава треба мало нагнути уназад, али ваш торзо треба да остане усправан, слично као да седите на путу. Повуците лактове ка тлу са леђима, а не вашим бицепсима. нАко вучете, држите горњи део леђа померени; када уморите, ваше замке ће хтети да уђу и помогну вашем ланцу. Запамтите, сврха овог покрета је обучавање лата, па покушајте да избјегнете регрутовање других мишићних група. Полако повуците тежину, стисните и пустите га тако споро. Једини делови вашег тела на које бисте требали бити свесно да се крећете су ваши лактови. Ако почнете да се ослоните, започете регрутовање ваших ромбоида, па останите усправни.", required: ["Лат машина"], difficulty: 4, image:UIImage(named: "lat pulldown.jpg")!)
            ]
        }
        return descriptions
    }
    
    // Name         : getLegDescriptions()
    // Description  : helps retreivie descriptioin for leg exercises.
    // Parameters   : none
    // Returns      : ExerciseDescription
    static func getLegDescriptions() -> [ExerciseDescription] {
        var descriptions : [ExerciseDescription] = []
        if(LanguageSelected == 1) {
            descriptions = [
                ExerciseDescription(name: "Front Squat", description: "Lift the bar off the rack by first pushing with your legs and at the same time straightening your torso. Step away from the rack and position your legs using a shoulder width medium stance with the toes slightly pointed out. Keep your head up at all times as looking down will get you off balance and also maintain a straight back. This will be your starting position.\n\n Begin to slowly lower the bar by bending the knees as you maintain a straight posture with the head up. Continue down until the angle between the upper leg and the calves becomes slightly less than 90-degrees. Begin to raise the bar as you exhale by pushing the floor mainly with the middle of your foot as you straighten the legs again and go back to the starting position.", required: ["Barbell rack", "Barbell", "Weights"], difficulty: 4, image: UIImage(named: "front squat.jpg")!),
                
                ExerciseDescription(name: "Lunge", description: "Keep your spine erect with no wavering forward, backward, or side to side. If you're traveling in a forward direction, your body can be slightly tilted forward to keep momentum and kinetic energy rolling, but you should always be able to draw a straight line from the top of your head to the knee of your trailing leg.\n\nBring the knee of the trailing leg to the floor to encourage proper stride length and a strong stretch in the quads and hips. The knees should always point straight ahead. In the bottom position of your walking lunge, the worst mistake you can make is to allow the knees to travel inward and out of alignment with your ankles, shoulders, and hips.", required: ["Dumbbell"], difficulty: 3, image: UIImage(named: "lunge.jpg")!),
                
                ExerciseDescription(name: "Leg Extensions", description: "For this exercise you will need to use a leg extension machine. First choose your weight and sit on the machine with your legs under the pad (feet pointed forward) and the hands holding the side bars. This will be your starting position.\n\nUsing your quadriceps, extend your legs to the maximum as you exhale. Ensure that the rest of the body remains stationary on the seat. Pause a second on the contracted position. Slowly lower the weight back to the original position as you inhale, ensuring that you do not go past the 90-degree angle limit.", required: ["Leg Extension Machine"], difficulty: 4, image: UIImage(named: "leg extension.jpg")!),
                
                ExerciseDescription(name: "Leg Press", description: "Using a leg press machine, sit down on the machine and place your legs on the platform directly in front of you at a medium (shoulder width) foot stance. Lower the safety bars holding the weighted platform in place and press the platform all the way up until your legs are fully extended in front of you.\n\nAs you inhale, slowly lower the platform until your upper and lower legs make a 90-degree angle. Pushing mainly with the heels of your feet and using the quadriceps go back to the starting position as you exhale.", required: ["Leg Press Machine"], difficulty: 3, image: UIImage(named: "leg press.jpg")!),
                
                ExerciseDescription(name: "Leg Curl", description: "Adjust the machine lever to fit your height and lie face down on the leg curl machine with the pad of the lever on the back of your legs (just a few inches under the calves).  Tip: Preferably use a leg curl machine that is angled as opposed to flat since an angled position is more favorable for hamstrings recruitment.\n\nKeeping the torso flat on the bench, ensure your legs are fully stretched and grab the side handles of the machine. Position your toes straight (or you can also use any of the other two stances described on the foot positioning section). This will be your starting position. As you exhale, curl your legs up as far as possible without lifting the upper legs from the pad. Once you hit the fully contracted position, hold it for a second.", required: ["Leg Curl Machine"], difficulty: 5, image: UIImage(named: "leg curl.jpg")!)
            ]
        } else if(LanguageSelected == 2) {
            descriptions = [
                ExerciseDescription(name: "Предњи чучањ", description: "Подигните даску са рацк-а тако што ћете прво гурати ногама и истовремено исправљати торзо. Одвојите од рампе и поставите своје ноге користећи средњи положај ширине рамена са малим нагибом прстију. Држите главу све док гледате доље ће вас извући из равнотеже и одржати праву леђа. Ово ће бити ваша почетна позиција. Почните полако спуштати шипку савијањем колена пошто држите равну држу са главом горе. Наставите даље док угао између горњих ногу и телади не постане нешто мање од 90 степени. Почните да подигнете шипку док се издахнете гурањем пода углавном средином стопала док поново поравнате ноге и враћате се на почетну позицију.", required: ["Шипка"], difficulty: 3, image: UIImage(named: "front squat.jpg")!),
                
                ExerciseDescription(name: "Искорак", description: "Држите кичму усправно без завијање напред, назад или бочно на страну. Ако путујете у правцу кретања, ваше тело може бити мало нагнуто напред да бисте задржали динамичну и кинетичку енергију, али увек треба да правите праву линију од врха главе до колена ваше задње ноге. Спустите колено задње ноге на под како бисте подстакли праву дужину корака и снажан део у четверама и боковима. Колена треба увек да усмеравају право напред. На доњем положају вашег ходања, најгора грешка коју можете направити јесте да дозволите кољенима да путују унутра и изван поравнања с вашим зглобовима, раменима и боковима.", required: ["Шипка"], difficulty: 4, image: UIImage(named: "lunge.jpg")!),
                
                ExerciseDescription(name: "Ножна екстензија", description: "За ову вјежбу ћете морати користити машину за проширење ноге. Прво изаберите своју тежину и седите на машини ногама испод подлоге (ножи усмерене напред) и руке држећи бочне шипке. Ово ће бити ваша почетна позиција. Узадите квадрицепс, продужите ноге до максимума док издахнете. Осигурајте да остатак тела остаје непокретан на седишту. Паузирајте секунду на уговорену позицију. Полако спуштајте тежину назад у првобитно стање док удишете, како не бисте ишли преко граничног угла од 90 степени.", required: ["Машина за ноге"], difficulty: 3, image: UIImage(named: "leg extension.jpg")!),
                
                ExerciseDescription(name: "Hожна преса", description: "Користећи машину за пресовање ногу седите на машини и ставите ноге на платформу непосредно испред себе на средњој (ширини рамена) положају стопала. Спустите сигурносне шипке држећи пондерисану платформу на месту и притискајте платформу све док ноге не буду потпуно испружене испред вас. Ако удишете, полако спустите платформу све док горњу и доњу ногу не направите 90- степени угао. Притискивањем углавном са петама на ногама и коришћењем квадрипса враћате се на почетну позицију док издахнете.", required: ["Машина за ноге"], difficulty: 4, image: UIImage(named: "leg press.jpg")!),
                
                ExerciseDescription(name: "Ножна екстензија", description: "Подесити ручицу машине како би се подесила на висину и лежала лицем према доле на машини за ножну завојницу помоћу јастучнице на полеђини ногу (само неколико центиметара испод телади). Савет: Пожељно користите машину за савијање ногу која је подупрта за разлику од равне, јер је подигнута позиција повољнија за запошљавање хамстрингса. Ограничите торсо равно на клупи, уверите се да су вам ноге потпуно испружене и зграбите бочне ручице машина. Поставите прсте равно (или можете користити и било који од других ставова описаних у одељку за позиционирање стопала). Ово ће бити ваша почетна позиција. Док издахнете, закривите ногу што је више могуће без подизања горњег дела ногу. Када погодите потпуно уговорену позицију, држите га на секунд.", required: ["Машина за ноге"], difficulty: 5, image: UIImage(named: "leg curl.jpg")!)
            ]
        }
        return descriptions
    }
}

