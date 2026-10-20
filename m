Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=frJGCn5q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RJZkxn2G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=; b=frJGCn5qy/FAVkh2X3V4rOL3dA
	OJDVUXRkA59JzWMyYxPG4g+TeUrpnVQAdoZNlLaZfOVIE5G3O8EyyFEPxdfI0DwD4FPXIowlf1gpl
	AGHKd3ncmBzdVRsw2bOr9KjpmvQxt8i/afeOsWgJa6McBih+30s1idKQad/Vfk+gfVk/lMGlttrpX
	PWJ3mpQQ9r9AtfuQIBWts058/c8wBIUpSMxld/zS/eiXj5wLYJbmZsHogSIj0ogldS2hz1o2Y/JBM
	qSdQyffIMBOTLk3QXp9p3kqIlFp1sXGDnXvc7loNXfLq6AKLV6aKJiTPBM4BXXnCwN61jgv+Pp9Si
	m2g5mpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFKd-0000000AWin-34V3;
	Tue, 20 Oct 2026 19:17:07 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFKa-0000000AWhy-10Zk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:17:06 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-150b2fbd784so110188c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523823; x=1793128623; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=;
        b=RJZkxn2GSUkZZjDtTXNflMcrE9/opkXj6VObe/421c6aaa/xO9T6JrozLShzvpGWn8
         z2sMvWXO03TCHLGJH+9Mztua1/eQVoMoKUTQvH38ljChVVXIKe2fvZU5oUPL8C0yxsXw
         spOSNeMOnQxWT9HhZOVxNPoptWQK/DzsiE3D4VQDHFDOXsATADfptuDFsWPL9F1O0RaS
         svmVtIWZ1l2aZ71WOlCRf/ge8Ar8EsFN2bbN//L3Z6whTSmRj43m5cUSmQgLgNpLw1wl
         9s+r+XFxCr4ROOCTyhxWCrQApUHnCzHl7ESd+UPusf11mk9dkWeTa+tOcT+8TjQ9a+Pj
         PsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523823; x=1793128623;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=;
        b=hn0h64035JYGj0p6tQt0FC6H54sqNZ+hgnV0UvRoi0s82YMafWKTVinUooNit5O7Ll
         4i/jFaHl5asLyRrAodZ08bxWNqdyQLH1E12srYAXw7ZO6U+lVzxbEjeWam4HfTYPI9bq
         uAx2lznunNIzCHYTRzmHKxlZYHm9Xq4xnS/oTJfnhOYu5TKSXNWyHYjs1DRK1osRXyRK
         r17wSIQCvl7NpQw5fNwCYSO3dwccE9BzEQ2scaohY18Oxp6YStbe8kagJ2AyaNYO1+JY
         97lQb57vCRUBBWTjousPKHFQCOA+rYob2ZcbcVB2Y4X79eIGOxjaiqYkYzUjjl9ZIP6y
         fyZA==
X-Forwarded-Encrypted: i=1; AKwUvBwcmmw8t1Q3+JkVwfRfYSlJLKzelBcQamvj0R9UbUMUUgwO/C6Jh+rsjmFxLt+DU90oMNAF1QkdkiT1fG3fmJ3U@lists.infradead.org
X-Gm-Message-State: AFq9FYKh6Vs8KQFBxU4ZNvYH5ni8t+SLXb4J0aV4DJoPPugjLUf7rR7P
	O1dMekdZ9lGgqMxWR+Do/j9ia7EUucZ6OSWB4t6kYp1tXIqlO/eYpFcb
X-Gm-Gg: AYBFou1hA+R7tEYnjS7ZJif2aZqbCsUtzsCL3VGJQ1C8QFX4dZrVo2WDuYnM90lElNJ
	6fzYcNX+oT/tPeR0Eg3s5GMaWcjVayYarU+lgNpwof6ezBIsmmP/6LlhYoywR8xzxjrRu9UGcDU
	9MPR/tN2deqWhTM67vsk+vYqtf4xZ5d72jlwsGgLRUaZhHFyn0w6K0KDqgUSGthW8UtOEPacBJi
	p/IEpL0cQthntM8/E7F8lgevLbxIKSNkIaiBn8hNiiKkzsKcXs8CeF4efAH17NkgCp4Y7X/rw23
	VcaMDUJeMyDJVVSoiY6g30AaFcU0aM0jWVPdDKWd2uR69tZ1JO1onGdDTZ2qtyeDN9u1+akPnjC
	atzg7QJ7vgGzQOYuRgGTevuzbFp6S/CVep14uigvNgiG4aW3e5VTy0GWQsx5oKKYHieKVPyoBJR
	laRrz1IIgF+BrgKMVrWWMVfGNBIN8zj/z2GZEEI+JgF21RjDpgq6vx+0SJ5ugAEyij7Q==
X-Received: by 2002:a05:701b:280f:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1850fa07d82mr20915641c88.1.1792523822861;
        Tue, 20 Oct 2026 12:17:02 -0700 (PDT)
Received: from localhost ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926035sm587423c88.1.2026.10.20.12.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:17:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:16:58 -0300
Message-Id: <DM9WNTXQM9N8.2G10WSI71TL88@gmail.com>
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
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com> <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
In-Reply-To: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_121704_278092_07559EAB 
X-CRM114-Status: GOOD (  42.12  )
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

Hi Martin,


> The patch only changes when the VCHIQ bus and driver are registered durin=
g
> boot. So it's enough to check these two cases to validate the patch:
> - without my patch: dmesg shows the "unable to register with bus_type
>   'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
> - with my patch: the error is gone and bcm2835_hdmi is present in
>   /proc/asound/cards.
>

Understood. Of the two cases, the second one is already tested if I'm not
mistaken. I will check the 'without your patch' case first, and then
I'll rerun the test with your patch.

> (Since the Pi Zero has no Headphones jack, you need to test both cases wi=
th
> snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never=
 shows
> up, even when everything works.)
>
> Could you check these two cases?
>

Yes, will do.

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

Ah ok, I did not know that. Thank you for the explanation.

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

Ok, I=E2=80=99ll test the patch first with the current configuration, then
with simple-framebuffer enabled in a second step.

Regards,

Gaston

> Regards,
> Martin


