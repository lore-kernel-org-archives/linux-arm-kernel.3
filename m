Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E101606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNzz+Ak3;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=uXmUBz1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=; b=lNzz+Ak3Mva5Nl
	b2c9YEcyeAGUmnlCxfQsrK4v6JY3PctDhP+zpE4X6HQeK5uT0rf+e6p1ktBgSrzk4NELfXy96Yxnp
	KYChYkiF9Q4GNKlJdecNJYmAO8FPXtWi6ZKw1aQ1Xmlmiu0X9wUX/u19R0MzCwxZtkDbGAVmaHA0O
	WcN8+eUvl7rbTkong7IsfkOTdnwZhIkeSeVgTSBe/gHqsiI59j/Ba9+D7RIhE4LuC1A6/nKK5u3Hl
	b0KCa3m2RamXayY5+dJSwwlQZ+ZNdsisvHsBiwisHR4StzyrxJ/9aMQLt0WghxrxxffPVRGV6iw1r
	WXHyaXvN8lf0YQM6JK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeYq-0000000FBv7-3ICM;
	Sun, 01 Nov 2026 23:02:00 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeYo-0000000FBuE-25bb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:01:59 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b125371596so25200907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 15:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574117; cv=none;
        d=google.com; s=arc-20260327;
        b=PBTLtMwo6P2PAiwrnY/6VoOvYFAybWzg7ilsJkckJxQs949QQGv9aUwAb2/ePfiJUO
         lByxfMgBde40MT9zxo/cO+nlKGd8Hbiz13TwXihbvslW3xa3QS1APxbj1BRDFvSxar9f
         V4GydniF3/8xHvKuf+eaiSe0cYRFbhm9GHDLvJKPTbHmz2gh9F4K1Fyn2g8NU4aPGNpu
         Li/D0/ai2A4e5HRv+wf0hc9svPaXwn6D35EYEbD+keP/goqvK3IMhTtuk7jYeUnBYx4C
         gCpc87vy5BXVxBR6VSsTbPv+hWCSqlGii3+IBtHGX65Q73P0MClET3SVmWdrQ2OmLFIa
         Icqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        fh=PrZZhqxz+PWh0hwbTgbBoPqtROfRqRYNHAM7nO43jW4=;
        b=d6/KcNtIjTpjbpIPGZW5FRn1PLsnx+qKXGkPq6/doGsgKsT2H5RalEu4WKommqU30J
         XEQ1j9GYIu09dFMHxVisIkncP25COlx9gsVPOKghKQYCMaItxzJI4pTjquFrebEW9sOH
         S1kcCe03kY9HE5YFI0FaGLBD23hS2jaM6JzxWmkGW3fB9Tjv8fzE+ICIiPjTC3ijCBKY
         KHvc8Zc4V7fE6eUEjuh9W7tS3XhdSbiw+w5ith4WPVoJqcYUED2VtLm+e/eUUYfZTt4N
         io7NzJrkr5PXNnRatyJOswy8/3oKbRVj1AqRlwgG+JiDFIua9ydJx3vzQO6r0P5BGkXs
         D/Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793574117; x=1794178917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=uXmUBz1+sGGBgiwmaNDNinDvW8QsN8J2MoDPQDGhQXjhAK2CU1ns/MK7FMLmuqCmZR
         /tldYocErhYEIj7Tlv+k7N6kyYTr79iC/5pLLC7IckA0N8fXUNrTMDd/EW8OJtxQbcDB
         WDZAZYNyThG9+B7ZMYmd1jODzw1dVJvjgg+Or8PzyldpMW/ClHl/gm8rES/t4no4n6n9
         T6d82pVBwvOsXQQ6xdJTQfMOBekPW/pIb7A98X4xi14Sbdkr/HLxkqpJ1GdyClb6B5ZJ
         W3r24BkTAuTmqEqds/zU+wWl4+S0xJpRnq8jmLQv6C8itbZnscvBJYD15wmFdSx/qon0
         5yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574117; x=1794178917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=F5d8ABXjb9r3zP88pWtoyMXDY2tvZreAPvrXFT/1KCW0uGgKvdpZvFATwwPQ1z2i66
         bm/piVj9fqxctCmeFRDP3edR9AWZKyT8dTpiimoDmjhdcMG2cZ0BUflOM1UzHPP2Tevr
         jyLtk9NSBx7+H57+BgWrUGgrqhAtGW6yP3i32PUGDVFj8cqwHP5W3QBLoh335EY7p+Aw
         u2rhgsLNOPHN+9FiQB7+2BN+QAHxNPHSEdzQT9rX4lMBHV5l9XdAt+d7xDw0Z/jrsXaO
         6uWaF2JQ92I8iIwUlWSmkYSsVShCFw1ODyFgF/sObguJdZWXrZ6fleUiFAD8es8Tpwhv
         dVCg==
X-Forwarded-Encrypted: i=1; AKwUvBxgs4ijBTXkG1MaApvePBjR1UU8+gVRjhSv9FSPT8iP/qPttDWwxpQjgbB3mQaeknjefVSv4mbXY48+MnP38Eq1@lists.infradead.org
X-Gm-Message-State: APuU4Z85lCEIJiuDz18zm1HFhF30j2/VoED5fbjlapW+ZrmLANyXNuuO
	W6BaL3BMUWyj+zyARWt1k5c5jrMtoF4kPm1X2Nj6KajNRNi4H/vZV9jJc+TdIJt2ry37a2q5834
	kdGjatEF0arWNuwuO1p3Lmf2TVP1tpro=
X-Gm-Gg: AYBFou2SZQy7xAZDp7891SevgxZ7FlXrw2Pi2P4ifw+OhWv1k0y0pbkkctF8wfOZijN
	FgRzfsq+6SKK8FZCzr4N9UTdd5zrVYAOMrFD47gxy4U6FWsT4AD/E/J7gD5AxyhoGnsODZMyWEd
	U41XWJn87KFuR22mIIm0iK5xg1g0Wfmy4lz7dVCo8L/EQ4v1hGBA4c9wtvxzeDuCijF662vtxcD
	Zkkq6erCtV57+Ye7PbnCKWl3xS9dGOssvVsLYzSji6JqCaSK7orowlhNVGLqavDufNLOdhNmc6n
	tLW3/4hH9RZwvm9Nug8SUWlthT5GnOIzvshVPOMwWAqfinOHRnZaEXmj66RVdZp1PHsy3iBJwus
	XsHMM4iK0ZagmGzADKA7kLE9d/a1NC7fFFR1MxW7Jb2T+w2WelKaFxX54Zs4oDfm1IGLPeQ==
X-Received: by 2002:a05:690e:4084:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67a8d60ce47mr8913440d50.42.1793574117117; Sun, 01 Nov 2026
 15:01:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 00:01:46 +0100
X-Gm-Features: AclHuK_6zPYcTTvvo1ADEqHJgjW6vbl_w9ibYmytUlZi0WtkMQH9WoT0aPoNmLU
Message-ID: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_150158_537811_3C6F9FCD 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

On Sun, Oct 25, 2026 at 8:23=E2=80=AFPM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> Tested on an S905W2 board: suspend to RAM, the power key on the remote
> resumes it.
Can you help me out with better understanding: is the firmware
involved in suspend or is this CPU core idle state suspend (meaning:
firmware is not involved)?

