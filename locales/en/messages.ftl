-raw-not-in-call   = Qrupda səsli söhbət açıq deyil
-raw-not-streaming = Hazırda mahnı oxumur.
-error             = ❌ | <b>{$t}</b>
-ok                = ✅ | <b>{$t}</b>
-response          = {$e} | <b>{$t}</b>
-not-in-call       = {-error(t: "Hazırda mahnı oxumur.")}
-not-streaming     = {-error(t: "Hazırda mahnı oxumur")}

not-in-call     = {-not-in-call}
not-streaming   = {-not-streaming}
raw-not-in-call = {-raw-not-in-call}

errors =
    .no-call        = {-error(t: "Hazırda mahnı oxumur.")}
    .no-video-found = {-error(t: "Mahnı tapılmadı.")}
    .unknown        = {-error(t: "Xəta baş verdi.")}
    .file-too-big   = {-error(t: "Bu fayl çox böyükdür.")}
    .no-assistant   = {-error(t: "Mənim asistanım bu qrupda yoxdu!")}
    .error          = {-error(t: "Xəta baş verdi:")} {$message}

inputs =
    .audio-file    = Audio File
    .custom        = Custom Input
    .voice-message = Voice Message

shuffle =
    .shuffling      = {-response(e: "🔀", t: "Qarışdırılır...")}
    .no-enough-items = {-error(t: "Qarışdırmaq üçün kifayət qədər element yoxdur.")}

cache = {-response(e: "🗑", t: "Keşlər silindi.")}

now = 🎵 | Hazırda yayımlanır <b><a href="{$titleUrl}">{$title}</a></b> by <b><a href="{$requesterUrl}">{$requester}</a></b>...

panel = 
    .text = {$nowEmoji} | <b><a href="{$nowUrl}">{$now}</a></b>
    ➡️ | <b><a href="{$nextUrl}">{$next}</a></b>
    .updated = Yenilənib.
    .nothing-now   = İndi heç nə yayımlanmır
    .nothing-next  = Sonrakı heç nə yayımlanmır

    .pause = {
        $result ->
        [true] Fasilə verildi.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .resume = {
        $result ->
        [true] Resumed.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .skip = {
        $result ->
        [true] Skipped.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .stop = {
        $result ->
        [true] Stopped.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .mute = {
        $result ->
        [true] Səssiz.
        [false] Artıq səssizdir.
        *[null] {-raw-not-in-call}
    }

    .unmute = {
        $result ->
        [true] Səssizdən çıxarıldı.
        [false] Səssiz deyil.
        *[null] {-raw-not-in-call}
    }

    .shuffling       = Qarışdırılır...
    .volume          = Səs səviyyəsi təyin edildi {$amount}.
    .no-enough-items = Qarışdırmaq üçün kifayət qədər element yoxdur.

playlist =
    .queuing           = 🎶 | <b>{$x} element növbəyə qoyulur...</b>
    .streaming-queuing = 🎶 | <b>{$x} element yayımlanır və növbəyə qoyulur...</b>

volume =
    .set     = 🔈 | <b>Səs {$amount} olaraq ayarlandı.</b>
    .invalid = {-error(t: "0 ilə 200 arasında bir rəqəm keçin.")}

lyrics =
    .not-found = {-error(t: "Mahnı sözləri tapılmadı.")}
    .lyrics    = <b>{$title}</b> #lyrics
    
    {$lyrics}

search =
    .canceled         = {-ok(t: "Axtarış ləğv edildi.")},
    .no-results-found = {-error(t: "Heç bir nəticə tapılmadı.")}
    .active           = {-error(t: "There is an active search.")}
    .not_active       = {-error(t: "There is no search active.")}
    .header           = <b>🔍 | Search results for {$query}...</b>
    .no-query         = {-response(e: "❔", t: "What do you want to search for?")}
    .footer           = <i>Reply the number of the result you want to stream or /cancel.</i>
    .result           = 
        {$numberEmoji} <b><a href="{$url}">{$title}</a></b>
        {"  "}├ {$durationEmoji} {$duration}
        {"  "}├ 👁 {$views}
        {"  "}├ 📅 {$uploadTime}
        {"  "}└ 👤 {$uploader}

stream =
    .streaming = {-response(e: "▶️", t: "Qoşulur...")}
    .queued-at =  #️⃣ | <b>{$position} mövqeyində növbəyə alınıb.</b>
    .no-input = {-response(e: "❔", t: "Nə yayımlamaq istəyirsiniz?")}

pause = {
    $result ->
    [true] {-response(e: "⏸", t: "Fasilə verildi.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

resume = {
    $result ->
    [true] {-response(e: "▶️", t: "Davam etdi.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

skip = {
    $result ->
    [true] {-response(e: "⏩", t: "Atlandı.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

stop = {
    $result ->
    [true] {-response(e: "⏹", t: "Dayandı.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

mute = {
    $result ->
    [true] {-response(e: "🔇", t: "Səssiz.")}
    [false] {-error(t: "Artıq səssizdir.")}
    *[null] {-not-in-call}
}

unmute = {
    $result ->
    [true] {-response(e: "🔈", t: "Səssizdən çıxarıldı.")}
    [false] {-error(t: "Səssiz deyil.")}
    *[null] {-not-in-call}
}

loop = {
    $result ->
    [true] {-response(e: "🔁", t: "Döngə işə salındı.")}
    *[false] {-response(e: "🔁", t: "Döngə söndürüldü.")}
}
