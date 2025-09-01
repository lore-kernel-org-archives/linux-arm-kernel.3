Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91208CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W47WDbLRqDEoR/eyh+lVFZUElLchHPCZV+Ef76hdOD0=; b=DdMF74QbwAGCYWC5wpNFVKxHP/
	KmgAX+8PcVVKixXQYZeyuXQMOrF28X05pCflPmcHw1kcFP415p4BGc0Smf+vJSCnePvXMtHRPHw0Q
	hih95eVQxmF0msYJdyJf6o3JKjJvvVHo5V/O17Y7C2g4hahRtg1/l6F1umQn0hfBr7UfwzovWx2IU
	sC3E/xhPl1X3p0+0SkqfJ7m44E4BPYfyWCTh9dl2JGTHX8+Kv7kzFnVud9TFx4NszeXV+YckQTF9k
	CTgpQX72PaOZNxomVv1lY81jgvwjyQik+1LDVXS1Fze656vwjfY+M4726tnbDu8/U43JdW+MUWnwo
	/TIw8LHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHQ-0000000EaOi-0crS;
	Tue, 02 Sep 2025 00:53:48 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCuy-0000000E6RA-3PXG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:22:30 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-53b1736eae2so3429371e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756765347; x=1757370147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W47WDbLRqDEoR/eyh+lVFZUElLchHPCZV+Ef76hdOD0=;
        b=Xg9EmtObm5gf/XjM4DWjqii/sZqPoiaSwU3BJV0YP89ZX3ai+9+V2WT4wFZr6vaFm1
         ei1SPirb6HHkaKnT1njWxsg2py1GgNRTqKNOPNPp2aZPFaHE7u5ltPyeW8eCkkofg1FZ
         4JxZbmxAhxD/Hjsf95yiubUtVHkBrJZElAP3Jv+3Zb4Z8NB66G1SHEWFCnuIVx4WYEGV
         tjNLG4rzpVvMC/MTPKneD6oEnyEzzuItnDTj9Ym1BMgrdsNNIe6khi3ujl6Zy2PTNfCJ
         NuS9kwC/neZAQEZgWzh5hCq2u8zw3EfeXAEdKT+LkdcEFKN/VQYlieGdi+45AUUDEtug
         F0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWCb/YHDsgeA7oz7TW7MZxp5yiVs5Axskemu+RFSbHt2dVDKlFh5G+JZEpiFIYHRB5h4zk5ZFUitJsLHPzh8mW3@lists.infradead.org
X-Gm-Message-State: AOJu0YxALQMl5DYfvwk9nCsYNFdYSJvmHSgXkzpOlrt/rwO5vymQ3wW5
	ZWbF27c5j7/1Whna+NmZzFqYCI/8pWHFjGX6gKebrcmEMr2seDx/Rww7SnfiNWrVQbx7Mi2iCGL
	wRbB8NMQmz80X5lLDPwJL3gQordMeIfmK/28srs1Tsljrr8qbesaqCxOtMwDRKeulDAMiLwjvbB
	7qdrQwbP4IG5ZSypw2xG/QoEiHzEr3u4qhty6jzo6rlgdyYtoQRJatHiQ1BTx4CPKFngkeDTj0Z
	wjLqqi0w7268ePnun288q3cS2NHSP8=
X-Gm-Gg: ASbGnctB0B/Y/RszlLac9+5ag1Ove/PJZEYyjT4zUIK2KyE6mknoy710fFykFqZVsj4
	MDUKx5LrZvsxG5V4oC5DnH0i6rqCy8UrHLemy9qxcXTi2ypK940veGrhw3BFPqGbRjneSc75SZO
	2qXLLcdW4rUAJ5xK7FCECWlUMSk0Z+QCG/9UDJBROIpkbxaD//uF+MJbRAY6SjpiBPyCZqFfa/7
	G46MR/xwA4LLWqFaUCLfZT6XnGEGzKsTS0/3y1u7nz6qpgUW/a6WyJau1TvsOszxMjmWI9gZUY5
	TYTtmtUEpwdkJDCZrnLxtx8Z4wKj3uLDyJskQgtMxfmNNO/kV1sWJ9HpJIva2kjlAl0lfKkhc6i
	i6q9aGkz9rseVW79bRwKikrYCeK+SOeuVG1G4XvJ9Pd1rK9aRF88v6rJ6OP1sgR9R13TRnAvdW6
	TbpiM=
X-Google-Smtp-Source: AGHT+IG/wD4N0YlXFH8VWpzZeKoh3Q6b59zSNHewYgpiIFYoTryMqD5hAa+8PiNwQ0KyIQtVWTyDF3jdoOsX
X-Received: by 2002:a05:6122:2517:b0:543:8c04:43f4 with SMTP id 71dfb90a1353d-544a02f3809mr2983327e0c.14.1756765346865;
        Mon, 01 Sep 2025 15:22:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-544913ec45csm1052928e0c.3.2025.09.01.15.22.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 15:22:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-723924b4436so8405437b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756765346; x=1757370146; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W47WDbLRqDEoR/eyh+lVFZUElLchHPCZV+Ef76hdOD0=;
        b=Q3TZybHCEDwrudn5MOAoFACAgWY6lr5ldbBUh0S76bDqNV7s4sdBKgXI/+FPhltQRy
         0Z95nYq8DT73ua6nN7EUod0Qwa2bGQ0mbSuiECSMUXMVfQOlp256hACVyjtwkpy7C0UW
         3tmBdS8A+vtDfJF9Eeo/XbyVt0sYVEX6p/nmM=
X-Forwarded-Encrypted: i=1; AJvYcCUdZMoRXkAEsou1wkwlfZEs8bKK++aNV/QCjSohmDNnA4VugMQykpk/vT4bVrwMP1s0g0nfD2h6875ZMp1WEkQQ@lists.infradead.org
X-Received: by 2002:a05:690c:25c6:b0:721:6b2e:a08e with SMTP id 00721157ae682-722764d1b3cmr100997137b3.34.1756765346120;
        Mon, 01 Sep 2025 15:22:26 -0700 (PDT)
X-Received: by 2002:a05:690c:25c6:b0:721:6b2e:a08e with SMTP id
 00721157ae682-722764d1b3cmr100997017b3.34.1756765345704; Mon, 01 Sep 2025
 15:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org> <20250901-bcmbca-i2c-dts-v1-2-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-2-ad81f60d4276@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 1 Sep 2025 15:22:13 -0700
X-Gm-Features: Ac12FXz0NUiJzOxSsaQmTaKm7zuD5FwVwOoet20TmsNBnXWLBVazzKdfiXRzLSg
Message-ID: <CAHi4H7FUUvXrSaJkYA38QbK3QeUG7h7KCFSrhUOruPQAV+Ngkw@mail.gmail.com>
Subject: Re: [PATCH 2/8] ARM: dts: bcm63138: Fix RNG and DMA IRQs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006dc0c2063dc4cee6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_152228_890820_366F3EC1 
X-CRM114-Status: GOOD (  17.54  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--0000000000006dc0c2063dc4cee6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Sep 1, 2025 at 5:50=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The RNG and DMA IRQs are wrong: these begin at
> ISR_TABLE3_OFFSET at 94, and are at 94+21 and 94+23
ISR_TABLE3_OFFSET is 96 in the legacy 63138_intr.h.
INTERRUPT_ID_RNG is (ISR_TABLE3_OFFSET + 21)
which is 117. Converting back dtsi SPI interrupt is 117-32 =3D 85
So the original value is correct.  DMA interrupt number need to
be corrected to 87.

Please note there is some inconsistent definition of the ISR table
offset between chips.   But whatever their number is,  the dts SPI interrup=
t
is always equal to INTERRUPT_ID - 32.

> respectively.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63138.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63138.dtsi
> index 4ec568586b14c89daceddea8f17381f72f512a93..d7410bb1b5a8e221d7ca1f2f2=
99ce6d2bc40b763 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> @@ -244,7 +244,7 @@ gpio4: gpio@110 {
>                 rng@300 {
>                         compatible =3D "brcm,iproc-rng200";
>                         reg =3D <0x300 0x28>;
> -                       interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 serial0: serial@600 {
> @@ -317,7 +317,7 @@ pl081_dma: dma-controller@d000 {
>                         // The magic B105F00D info is missing
>                         arm,primecell-periphid =3D <0x00041081>;
>                         reg =3D <0xd000 0x1000>;
> -                       interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
>                         memcpy-burst-size =3D <256>;
>                         memcpy-bus-width =3D <32>;
>                         clocks =3D <&periph_clk>;
>
> --
> 2.50.1
>

--0000000000006dc0c2063dc4cee6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIO3MjZxVdrgmtM4t04xJkb/IsMJX
QJi0b1AENTNIdoAKMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDkwMTIyMjIyNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAFwbYUejRwOnajCokLa17YIV7Lkb5tWL1HKbqFEhvwKbfKnQdXIjBj6OUIaygymm
3x7FN6ldWt7PnZgeLtrs9fibWNVct4sc1S31T1kq0/TrE8vq0oAjJ3bykj35+dUkI0ndy113vzcb
GAOipCqIqJBji2XVEXBC4MAVYuu0if928SBZitP3/BAm4WOO4Tcq5stUXR5ZUGjkZf+0gzBBneQd
daEEw+zImGD+MLLKuXv4UFdC5NHbGQ0W0ZL59sc+Ndrk5Nf/ZB30zJ0QZQIXt0P2E6HXMjsUx7OS
EPbxiKL/0N5+9Q09OPJ6KOt/ERP+JN/lpC8nMnX9Y3GUqsepQp0=
--0000000000006dc0c2063dc4cee6--

