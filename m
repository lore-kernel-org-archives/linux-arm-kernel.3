Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKK2NQv1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+211Saj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=; b=QKK2NQv1B3tVGMwkI6Qq6U5uWl
	5KoXNeVzG8HlYYdn+4rlitWxEWI2Gsf3N+Zg+F2atitcPKsYLx1oeu954rJZs9lcjFxvbrIc29HAW
	5iFxm8icjk4efq7tgWzo6e5K9FFZGhRQGq0kGzjvpj8NKLr3jr/NgYH/DTpI9odvnnb3PUURSqvca
	E4sVA8cTTT4ILHX3DJH1AkAhd07+pkrFrmys5UrIqJb6KupaqQqG2JJSFb4FH5SwRlCoB+oUiUECb
	zQYFu1U0YWoSNTisP06TNJDWjbiny+wk6C3OAUTqGeWXfez/qhPbv5EjA1Bahs1A21CLxcI/Gx41z
	dQ2suLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbcf-0000000CiCy-2LLV;
	Wed, 21 Oct 2026 19:05:13 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbcd-0000000CiC5-0vdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 19:05:12 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-9906dc6308bso32765241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609510; x=1793214310; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=V+211SajSADdzbaDrBp8kBkLNtrmsAGYIYfg9F7q45Yci7d8uiCbgnc2bkuKea2LFE
         A10fLiDoLo1qy/OYJYG/wnRDTlNsBF66F9srO9RiveA8ypKd7NYKKiUSzT55KTSPhUSc
         6frYo49DojoabdmD8nGBu5ZCo1Dy1LKROdYRTW7OkU/CZCLa3K1sE4+Jr2e2H535NsiC
         aqhVR0+JIG8P+yxLlF+9d/ZvSjgKjKXbJQc4yHV5K8o+Opw69fggHr7JowraEYuxTzb6
         040qb/fTNVIgHvcqhFrPaJOjQFoNApyFv94FALq79fUdkehagHjAj9u8xrUYE1fofOh7
         4+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609510; x=1793214310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaJdLtbHiyXcMFgqBwOm4F2HMHkjIk9pI39u14xSXTs=;
        b=KyKWY+u+miNFqzoEGsVpIhZfgqTwfO/0Avi+gfX0VNtUrQBfisezpAUZQAMtqiyh1A
         jQZJUgyLFGIQ8uX9MMNHUukMAMjd9JqDR3HHoKcPOYrjfr8CL/S7A/I44/m3+hziVsg8
         LDmvgyLvdQVf3Swl49rmgFLqJuJV5qzXZyJxfkAhSie6371mATXNZvHm78TjRtpuXUbJ
         EqTCzMbJxBR5B4H8Fn5eLOb3K3LxFSGtzxttWg1lSLqsAIv6eVm9XGI28OSOgOc1sFT5
         qeJN5CfQYxq8NhzNZ9kSnVyR5eaJEmXFI/tLHySNZXZ2/s74LdCOu68No5lfJ5lV2y0R
         PNaw==
X-Forwarded-Encrypted: i=1; AKwUvByNkZ+AY8frbBZ58vL1WuzGcljWHUKkW7iuAyRB9loT+TiSoTKSGeOIzFA9rGtTsje6Zph8ZiItNEW6qGy22yMa@lists.infradead.org
X-Gm-Message-State: AFq9FYJPLUiCU3/lTXmyiDYxqsqzLngX/Py7Z3FaAEHIgUzhC5Vkiuc8
	v5qv/Y5ZelHk5CGt5yYcH77U8+6QiAM89BH0ww57Xtc1eKYQ4Q5luNujG29gLnpi
X-Gm-Gg: AYBFou0EVpLzYniOwm0xwnmkdyuw9Whuj3TRKcsP2A8azxrW0828p9Z51hjg/6gDuF6
	d4YPYn0cbFVmoJf3uOwNEuQkXb8Z1y4Mxgraqn9Fe9X04k5hxI3QJI+bupfJhkVTZiLh/qbUOvw
	D+7qZqZ6VUxDyf0I5OU3ShTjAQ+qO3RmRtPSI/1FEQdlsU99m2Hl076pVYQXPwXP3dKtSE08/X3
	wyNnMXqa5sW9ZSReD+j4T/8k64XAAUjyWR48uoJjQQQ/IU9ir4ruJjvpDBxPLQc2mJIDRm7T2mF
	nH5T59aP7xGoJDYENOVCwNeVuwECjYk+3NaPC2m/AU53h5ihCjlJhbpjIVet/1UCi0Z+uNxOpeD
	/vfTNPUS/YSH/vjqTRrQCgMgn9aZI/k682hWDS95IvrCyelqY3U79g6hFIQ+Hr4NJxTz8cam+Ka
	RibAdq/fcgQQc7eG8JhL1J4AcWhpG08WBfM5Pvf4R+NcOi3Mkctug7a0l3fU9lnUlv+xIbjVomX
	Whtw/gY2rtA20X9gllfoDX5I/qEizEDZs4arS17lBWjSlEJH1w=
X-Received: by 2002:a05:6102:3e92:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc92461809mr1156246137.1.1792609509675;
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
Received: from localhost ([2802:8012:39:ac00:85dd:f0f7:d2d2:5158])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc921b6094sm3818360137.1.2026.10.21.12.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 12:05:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 16:05:03 -0300
Message-Id: <DMAR194TTSQN.1VUF47V1A3YUX@gmail.com>
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com> <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
In-Reply-To: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_120511_299054_FD31442D 
X-CRM114-Status: GOOD (  40.55  )
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

On Mon Oct 19, 2026 at 9:26 AM -03, Martin Wetterwald wrote:
> On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.co=
m> wrote:
>
>> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
>> thinks seem not to be working with that interface.
>>
>> Im trying to debug what happens in that condition; I will need a couple
>> of days I guess. So far, this is what I could check.
>>
>> Any feedback on the test or debugging would be appreciated.
>
> Hi Gaston,
> Thanks for digging into this.
>
> The patch only changes when the VCHIQ bus and driver are registered durin=
g
> boot. So it's enough to check these two cases to validate the patch:
> - without my patch: dmesg shows the "unable to register with bus_type
>   'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
> - with my patch: the error is gone and bcm2835_hdmi is present in
>   /proc/asound/cards.
>
> (Since the Pi Zero has no Headphones jack, you need to test both cases wi=
th
> snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never=
 shows
> up, even when everything works.)
>
> Could you check these two cases?
>

Hi Martin,

Results on the two cases:

Case 1:=20
    - dmesg shows 'Driver bcm2835-audio was unable to register with bus
      type 'vchiq-bus' because the bus was not initialized'.
    - cat /proc/asound/cards shows only: vc4hdmi.

Case 2:
    - dmesg does not show 'Driver bcm2835-audio was unable to
      register..'
    - cat /proc/asound/cards now shows:
        0 [vc4hdmi  ]: vc4-hdmi - vc4-hdmi
                       vc4-hdmi
        1 [HDMI     ]: bcm2835_hdmi - bcm2835 HDMI
                       bcm2835 HDMI

So your patch works on the Raspberry Pi Zero v1.3.

Regards,

Gaston
>
> Testing that you can hear the sound going through bcm2835-audio is a full
> functional test that goes even further than the patch: it does not only t=
est
> bus registration but also that the audio driver is working.
>
> On my side, without vc4-drm, I can successfully hear sound through both b=
cm2835
> Headphones and bcm2835 HDMI:
>
>   # aplay -l
>   **** List of PLAYBACK Hardware Devices ****
>   card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
>   [...]
>   card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
>   [...]
>   card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
> Headphones [bcm2835 Headphones]
>   [...]
>
>   # speaker-test -D plughw:0,0 # (HDMI)
>
>   # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)
>
>
> If you still want to output sound through bcm2835_hdmi (optional):
>
> There can only be one owner of the HDMI port: either the firmware or the
> kernel.
> When the Raspberry Pi boots, the firmware first owns the HDMI and display=
s a
> rainbow splash. Then it launches Linux.
>
> There are 2 ways for the kernel to deal with the video output:
>
> 1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controll=
er
>    from the firmware and handles everything itself (this is your case).
> 2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), th=
e
>    kernel leaves the HDMI to the firmware and just writes pixels to a
> memory area
>    (the framebuffer) set up by the firmware.
>
> I get a similar problem on my side when sending sound through bcm2835_hdm=
i with
> vc4-drm loaded: my screen shuts down (but the kernel is still alive).
> It most likely comes from the firmware and the kernel both trying to driv=
e the
> same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and th=
e
> firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to =
touch
> it.
>
> A simple way to output sound through bcm2835_hdmi is to not use the vc4-d=
rm
> driver at all, and use simple-framebuffer if you still want a display.
>
> To remove vc4-drm:
> - Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or black=
list the
>   module.
> - Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-=
kms-v3d).
>
> To enable simple-framebuffer, use one of the two configs:
>
>   CONFIG_DRM=3Dy
>   CONFIG_DRM_SIMPLEDRM=3Dy
>   CONFIG_DRM_FBDEV_EMULATION=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> or, the older way:
>
>   CONFIG_FB=3Dy
>   CONFIG_FB_SIMPLE=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> (FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are on=
ly
> needed to see the boot messages on the screen, with console=3Dtty1 on the=
 command
> line.)
>
> If you have remote access to your Pi Zero (either through network+SSH or
> through serial console), you actually don't even need the simple-framebuf=
fer:
> you can just remove vc4-drm, and let the firmware display its rainbow spl=
ash on
> the HDMI port.
> Then you can login to your Pi Zero through SSH for example and launch
> speaker-test.
> As long as the HDMI video output is active, it's enough for the sound to =
be
> able to go through, even if the image was not drawn by Linux.
>
> But again, this full functional test is optional.
>
> Regards,
> Martin


