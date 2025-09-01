Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF8ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikVbO3ayc+UDxrAfMQi45tGbFbabiln7QSUh7+CEV/M=; b=uM08fxAgKFGbMkn+mA6w9emqLh
	SmY7c1uDUKAYPuxWh3rPtAnkMPJGLBRM353VLCNfUeVcWItlsmd6FjCb31radz9NwG2Vkah8Y42RK
	JZcPZ6/8ONWMX/EfWrYRIYciNGzU5u9ChIIRsJ3LKfZU5SKMArxzHcqF6JHKKOI5v7/RrVgFvOwY6
	TCytdZYvO4veawYaEHWpCots8Qf4rsS84A3wpMm4wc/Z1q3YjSM5XNYJq2zi7GuFVtx/MvqXqlUMl
	fgMRV0pukZSAc0CVJ2WOAvMp7P1jOIFtpXcHDX7BK6NmNT1tkl2NXiSpVO10gzoOC7tBhq4H3zKgH
	aIo4Tbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHR-0000000EaQq-1OBb;
	Tue, 02 Sep 2025 00:53:49 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCyd-0000000E778-43QN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:26:17 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-77256e75eacso1436791b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756765575; x=1757370375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ikVbO3ayc+UDxrAfMQi45tGbFbabiln7QSUh7+CEV/M=;
        b=LCUYC165jkVggrfVCJWMQhHBlzFcMSstbHlPNPefHHZvfQdJ9bD01wK1MrMmpwN8+a
         PPARoR90Y1rUCNMklWwqNglqnnbpe6KoqbjYZxJ7fzunRuPaDc/E1Pzzpi7P2RVysMy1
         g1nLEYG1jJVf0fUc5wmtxPDF3+wCWuHP2KGeksOGbjn47PvSaoOBr9R3xPmfhlI/BGfL
         1DZJBUqWussYjRhp0T5EaWViMYK6PtmP3wOATs2q78qKssxrih9bHqhxpfTbPJQ85ceM
         m171XVJCe5tBtJF3UV5Y5ox9PMhXqxcT/i3Tada+M4baHPNLRuXvORPN1uBfkmRmD6UY
         UZYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/xPP4R1xiuoID5BYGcnO7cJsyVzvwWyjvSGl54rcQyITPzDmKq2zk4oWtd/rLU6Uh0lZvdYf2bQGt5emkAQHz@lists.infradead.org
X-Gm-Message-State: AOJu0YwTEq3UV2JOZ0O7iM8JxsEwcdxAPYZHgraQa0EUBVz7p7pGdSRD
	ibC4aAxieY8TfwOVMMWYGsKaOEBEkTKjoZ8jdqyQqe7zrHGodLPJZaNQSq470jIm5Ds8E/wnbYK
	GAS2zWC6w10jacHCy2lBodq8Wbk3G6VwGbGdS+KZHz4K/f7M+GU4FPp4wCt52GLOF9VyamM0oYQ
	j0SiWOjblJXQEpOmvqXMQlhRy+PzqrQLj00bmM/Qxd0jJOwbv6mzlMshOyD5QrC8NTUxPL/THvU
	VA2qzc3x91WJoofxrVFJ0nX7F9+qS8=
X-Gm-Gg: ASbGncuQTKzgbD/z320WaV0QuhMm4mlamhwwjYPVnNPvAJ5P96uWFvM5/XIMveHGJT7
	GwXfK16tIG6SpJW5ULIBUrqpd7HPh1VuKGk8TFR+NOZYIRIM9kKJoEwuY0SYtpxnyGcXKfZIb7h
	XeEkCtTVNr0ikiyVMe72zgXasFmKancJBG1KKzkuSHo0P0Ecm5EXsFxRW6G7M/kn9gSE6GLYhfh
	nHm99IpitBWkIbhw8czxk1pG+yB0uYucNLgA/NXkaI+F9IiROkFwTu+9e24L700adjOQ1S1cIp0
	wBnJOdUBqCmZZpdse2yrMudfsU2rxYC6jib0bpFwr850HxK1FMKVvB+9KdBx2a7haeIaGcEXceU
	lMA95tOXBqBg9cn4G1hLw+i/i/Y/WbHu8F07KymVKu2ftlgeZ1R+FK1dDCoGqd5nCF359dJyRcs
	K6
X-Google-Smtp-Source: AGHT+IFRHv+FzHoRcIatgrluL3G3Jr0Y2vPj2TNFMU0V/2nV/tePC3CgaE5tyd2Axzp27RTtSdZ39a4nghHI
X-Received: by 2002:a05:6a21:9997:b0:243:b3e2:c9fc with SMTP id adf61e73a8af0-243d6dd565bmr12091749637.3.1756765575017;
        Mon, 01 Sep 2025 15:26:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b4f8181f894sm225398a12.5.2025.09.01.15.26.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 15:26:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-722693e327eso37552847b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756765574; x=1757370374; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikVbO3ayc+UDxrAfMQi45tGbFbabiln7QSUh7+CEV/M=;
        b=LBOcIl0AttO8CWKXN6FwgYFeFbOVr4GryjXwKQpx1DHbQZFM5oBebccjwvid7NRDrC
         NVC3VUg7egKPL9oRTltz0g32FL1+TRDkgyYwNzfa6oUPI4XDxoLGk1XIdxBJPwWjKBf3
         y9R/goKrCltEsTUV+x7+PSniNhjejygifJ8FY=
X-Forwarded-Encrypted: i=1; AJvYcCX5kx2P3YjjPb6b1WbnxYvP6Ri8y8A80RmRwqbwL9TZ/yf5F40dgjWeMHkshYsRjdijXbm6T7t//8HtXLYWCbwP@lists.infradead.org
X-Received: by 2002:a05:690c:45c8:b0:71f:ee38:1cb6 with SMTP id 00721157ae682-72276591235mr91353237b3.54.1756765573638;
        Mon, 01 Sep 2025 15:26:13 -0700 (PDT)
X-Received: by 2002:a05:690c:45c8:b0:71f:ee38:1cb6 with SMTP id
 00721157ae682-72276591235mr91353077b3.54.1756765573214; Mon, 01 Sep 2025
 15:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org> <20250901-bcmbca-i2c-dts-v1-1-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-1-ad81f60d4276@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 1 Sep 2025 15:26:01 -0700
X-Gm-Features: Ac12FXyvY9TnyMlGynxBc_CukTr_22oBNIUS-LcbJe5EdHErLzqgUiCkaAjohYQ
Message-ID: <CAHi4H7GBKqqKGmKeWhudXXNSOFmCiLhztn3if1fy0dnWbsKyWg@mail.gmail.com>
Subject: Re: [PATCH 1/8] ARM: dts: bcm6878: Fix PL081 DMA block IRQ
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fe4aab063dc4db2a"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_152616_011268_523B1983 
X-CRM114-Status: GOOD (  17.69  )
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

--000000000000fe4aab063dc4db2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 5:50=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> This iRQ is on SPI_TABLE_OFFSET_2 which begins at
> 64, designated 64+30 =3D 94.
>
SPI_TABLE_OFFSET_2 is 96 in 6878.  96+30 =3D 126.  Convert back
dtsi SPI interrupt 126 - 32 =3D 94

The change is good but just want to point out the table definition
value and the conversion.

Reviewed-by: William Zhang <william.zhang@broadcom.com>

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/=
broadcom/bcm6878.dtsi
> index dd837bf693905736a7b8ef9cfefea8368e6df6ed..5a37bfd7f53f16fa07cc93b57=
0a585ec34f5f443 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
> @@ -244,7 +244,7 @@ pl081_dma: dma-controller@11000 {
>                         // The magic B105F00D info is missing
>                         arm,primecell-periphid =3D <0x00041081>;
>                         reg =3D <0x11000 0x1000>;
> -                       interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>                         memcpy-burst-size =3D <256>;
>                         memcpy-bus-width =3D <32>;
>                         clocks =3D <&periph_clk>;
>
> --
> 2.50.1
>

--000000000000fe4aab063dc4db2a
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIKx5V/r65TBH7DLuGVl1Yr3C5GWo
3o0pP41zfHXzqDoLMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDkwMTIyMjYxNFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAAVISCjPchrpDDh2wVNrkrjMV0PEt83/A4H3YPvq8gTNL+SB6186/rbS12TrK2Ls
0OgX4oIppkqVKFbDqvU1jZbekjZJE5pChXXBaThDJu6/vkwrdLdEiMbvCxmtf6muT0gMJN4z7fM+
fY06l2hLHFd8PQgdMYKsB5c1+GstSHozdCXxJBGq358Ap2udAru3UfoDGfW4IxlcrsORgFFYdQiC
1b1q1QK1Oi1t4XUJPkf75v9+zbCt5qbuNNn1zYCnbvf09uu1aqxsGtV8t64kv9wciin0NSbqPqOj
9iXNwhs43GYTR01oKNTOT4SuiU14h75m3aVZhO4edgIbu4rj1k8=
--000000000000fe4aab063dc4db2a--

