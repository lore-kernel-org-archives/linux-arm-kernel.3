Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377E9CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijs4+jAKBTPDXfRWo2P8v6Wlugs8xhGPT/6Gy7bqNNY=; b=ND6hfaTNYGeZ+chu+5KUH31k9E
	o8WhK1GXBpnYyIcIdmEhIfqJs14OdSdXLqvowMzdcumgY7qin/b2jGxisk+gMuprX35n1HIY/YHcL
	sJxIq0REaJo4/EHEygXa/bLhvrxMiPTPsIQpqnLuVXkhiK2vRhoGsxq3vXx+VN6zvcRFlkBWOqvss
	8Hfsa7+5vn0Zc9yvEVHq4dZGPnZ6XqHXhTBdhlqH8IeL9s2+jUS7RIHzMCp21aaOvvJD6bmpJe81q
	RtUs+1WQutksJC1XxvSn8Ske2Z4zaNcCqIpIY4NWtBot0pV7YqPI6TJUJy68OFWzP4GjEIGgMEyx1
	mO3IRwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHT-0000000EaUF-16nw;
	Tue, 02 Sep 2025 00:53:51 +0000
Received: from mail-yb1-xb62.google.com ([2607:f8b0:4864:20::b62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utD4X-0000000E7ss-0RCx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:32:22 +0000
Received: by mail-yb1-xb62.google.com with SMTP id 3f1490d57ef6-e96d65194c1so3722214276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756765940; x=1757370740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ijs4+jAKBTPDXfRWo2P8v6Wlugs8xhGPT/6Gy7bqNNY=;
        b=fmNXtWlA6tDOrQ8QNFfsXfOuZ9c1+Fh3fZ1jmWuHCBFGgZrWC+0tzGgUea4rBa7jVW
         nwlYN8krL8fqP+VcX2Zsd1L9CQV7YoX8mKUGhni3dQj6q2+ka8YlrUEBqSZxw/QZ29oJ
         WANI3ON+sttw9WOrGbTW3m5J27VDOJc6SuFxjMRTPG5MM2fMl+2y5LKEocGljokqB3EV
         CwaCowIC5B9UN+r9AwZbpEOWn4XhPgSQkDUQmOv0QMR22/XhtF99nR8MDC5r298OQEcm
         j8Fv2f0GZePMutjgdCA6b0IPSzZnZqmNdBulbTBOE1SNJVKV40IeBqSUaiJrMbRFQXKO
         OdyA==
X-Forwarded-Encrypted: i=1; AJvYcCVbyL/pY85cuNHBzfEK2ZjDzM9rLeCInKDSctZz4HIzAsXIf0dnYEXvRQhixmUghrvJJRy+uJlaSfNP8C1JDNt+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/eOjx09jaridV49McEVF9QNq9SfLHKx11AoDrU9zXh5ujrQBQ
	wfu0sKxZoSVXPDZxvtfg/VtYk/5vIZrYQuhXKoJVoONOLiNAVgtc4CBAjBpaZvfggZL/dQS792s
	SUTNdPIhsAV9GGp4EGqPUSlyV7ovjQZbxYfnthg11Q7t2Fw4FH3s8PKWjBsVGBh/2MACoG/YUoI
	/YHjT8vZS9Y6CUMvbMb5FEoKBrqf8j/h1miGFKuP2AP6+J80SVzHZfB1WdtOiGZR3juOSPdcS/N
	GTZw29/zO73jrLd0Bs26tsHU9do744=
X-Gm-Gg: ASbGncswLuLuhkYRoXnKg8j/AoCOCw1bl9PHdYF6wJ3rI8JjogLhqcYlhe1xRKXfsSY
	JySRRSuugL2iCuS9n46GTAPOEUbP/aB+k4qPo5mD0yn7jN1LuQq9PvvR6nP1XUrlXllVNmLtS38
	7h3S5kozO/rnzz0UtUmRV5o0o1hO9nFKxXmgBim+o7LIRUQ/8CGN1SrpRwLlx6ClnlmoVUaVvnP
	Vk2PyEjP+f8swjuC6W0pKI61Z1HUjLfpxaQQD52IkhBjK1pcnHcLKO61reMYsuhbxUrRZvATqxX
	iWEUR6YUZKM95F+c1x+eld5Hywy/Pg91rLpIHL31rTSiMYpGv+iMqw7bau5N2JTszWQJ5FX/ZDL
	t4MlOTSyr6jQiae7yv6J7OnD3d32p2dVf16zEjmKBkJ51+cDkOSF/Avu6pJyHcbLoOJNKSERSR4
	A9
X-Google-Smtp-Source: AGHT+IEc02JNUxNODsPOKq0Mw99MGBbNVqGdWIbWjctXtDQLNbIWaUekFnL5bBGmlY6AJr23Fvfa+IC7h548
X-Received: by 2002:a05:690c:e21:b0:722:74f1:6a7b with SMTP id 00721157ae682-7227635be8emr126666537b3.10.1756765939847;
        Mon, 01 Sep 2025 15:32:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-723a82c4699sm115457b3.4.2025.09.01.15.32.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 15:32:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-71d600f9467so60099907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756765939; x=1757370739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijs4+jAKBTPDXfRWo2P8v6Wlugs8xhGPT/6Gy7bqNNY=;
        b=N+9m0H1DZd5olR5H3ZRJaIcx/KxZxmyQ9MJTOx7pIAAtyPV1cJ944Xvhgv6VCLlT2D
         GMNwWID7AiIGdJ1k27OtojeYQE7a06hsCH9IyHEuY/FahPvnDdcQnru7JaJzc36R1YEh
         XV/Wq/yHXVJ5W90lvBGHXRtfqEclHBAtttJyo=
X-Forwarded-Encrypted: i=1; AJvYcCUeX7Q2H3s3jAYO+gXQOG6wcr5GijxgiVfmqOYbgwd+MPXrwZG9kSzwva7uTN/urHTrR+yS/l2JZZnZ5F/0tAxD@lists.infradead.org
X-Received: by 2002:a05:690c:6a0a:b0:71a:3ad2:4b31 with SMTP id 00721157ae682-7227652d6edmr104608847b3.42.1756765939085;
        Mon, 01 Sep 2025 15:32:19 -0700 (PDT)
X-Received: by 2002:a05:690c:6a0a:b0:71a:3ad2:4b31 with SMTP id
 00721157ae682-7227652d6edmr104608637b3.42.1756765938681; Mon, 01 Sep 2025
 15:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org> <20250901-bcmbca-i2c-dts-v1-7-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-7-ad81f60d4276@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 1 Sep 2025 15:32:06 -0700
X-Gm-Features: Ac12FXwJvBnI3xeUwXp939NJSH3nRCJkk4QFRVo1f3oPJBE0BY6ZXKuj0eAvdcA
Message-ID: <CAHi4H7FUG9BUcwLk2Owu6FeVkSNDvVcnHTiw+x2p5y+XYK4pqQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] ARM: dts: bcm63138: Add STB I2C block
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c7ed4a063dc4f1bd"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_153221_148091_6C921124 
X-CRM114-Status: GOOD (  14.97  )
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

--000000000000c7ed4a063dc4f1bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dtsi interrupt should be 83.

On Mon, Sep 1, 2025 at 5:50=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The BCM63138 has a STB I2C block.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63138.dtsi
> index d7410bb1b5a8e221d7ca1f2f299ce6d2bc40b763..3bf41760ea52a74632744c50a=
5d096e8b193a046 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> @@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
>                         reg =3D <0x8000 0x50>;
>                 };
>
> +               i2c0: i2c@be00 {
> +                       compatible =3D "brcm,brcmstb-i2c";
> +                       reg =3D <0xbe00 0x60>;
> +                       interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 pl081_dma: dma-controller@d000 {
>                         compatible =3D "arm,pl081", "arm,primecell";
>                         // The magic B105F00D info is missing
>
> --
> 2.50.1
>

--000000000000c7ed4a063dc4f1bd
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIU6qFu3FWYLD6VJNEXbt/sij/Oy
Q2xFh1uXSuMYis/qMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDkwMTIyMzIxOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBADPaaU3ldqDdxL8knCSneWwmsGyF8CM1pyBvewyG1rof2WVwBfZ6oibsfQPjw88w
F/f1VxMfwQqKoF8kSXvI+b1GIh4Iili3VO1hyb091u3RTmXmcLqjALt7LfUDckzZvetdYok52c1X
vSjabrLFgpAvsgvMjkJvswQiXE2kb6z8sr+zfyL29x0v+kRSyIgmKELOnhtPm6kL/rgBfE27XxWE
SrSBrJUJpChg+iPT/UNT3sJ8H+ps0sFoqHjNLIeb4b3XxHkPJPRmK8jWz1yV8QK4MGR2UvqRyXS5
iwr+qEO6BhhwHoaeerr3nI+ZIxxczE/VWgJfFrLENzNn+uO5nHA=
--000000000000c7ed4a063dc4f1bd--

