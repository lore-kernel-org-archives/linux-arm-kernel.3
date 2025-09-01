Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B788ACA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1wzEaGEyJKWF3exNJRId3L7l7T2GO4fqBrtzclF9xY=; b=GY3MQd/nA57ckkddOnfIdoOsUa
	+tn/5BmftohdKAgKbm+v0aXoIDHWigzs8MWFVaPQC5QFZi4yGT27gDmMEWHhPKEiuqQyO9v8TXArZ
	g1QdwQJ7BSo9IGUClJFVedijCk3aW6Kdwsojy+TIHFu+up8tVKTlRJmhVAZLzcUI3j7GXgufmUKmn
	eRf7N1OWOhmSiIKx4+QLl4jcZUmwmeC4EzcCMbRILCdqYl/KtCeJGEtrVRMWjSYs0Va/lrcwBDQ10
	0ciWl1Elux+j4IPSoMTpMTXYzEo53eFIksO15QuUja2W2qQlHqamSLnuYSMX7U1eW5KC6XGslomVa
	pRdWyadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHS-0000000EaSy-299S;
	Tue, 02 Sep 2025 00:53:50 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utD1R-0000000E7V9-2bo0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:29:11 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-72267c0505fso22615917b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756765748; x=1757370548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1wzEaGEyJKWF3exNJRId3L7l7T2GO4fqBrtzclF9xY=;
        b=NI4/FFf2PWDh2xj5KwzDSvjslYvDqovuRSKc7tMzetNxxSCcVxp7g9TgyMv5x0BNcu
         jKMVHxvxOGSzgQbymZwf0vqc1HeOhy3VtjBF1ziwlQSN3ox+KOvJ/QGOOMFCHDKGQguN
         2FGpTTueQJzkbV08HPNU+TWT9HdVhJ1i+lJ21h4O4+RyVt0btCzhsSj34VRg5hr1hvl5
         M56rJs8MlOFdBW5joUUIONjt3hAA7a9nwyi+Cbx6N+D9c6KyjmgE/VsSPbJBhamWIw51
         nNvRfgvbqL3w8+Kxnv8nG+un7H/juDH6kkHFAsUq0tD8L1RM+1ME91BFuusGa1QSIo3g
         IY/w==
X-Forwarded-Encrypted: i=1; AJvYcCWiNnjCgs+hghiOXHRHWU02wcb+0xBezkgoP63m+fRSZGt4DucCH+miGXgO2JVkNl4XuhvGOeS+4yqPt9hDZYkq@lists.infradead.org
X-Gm-Message-State: AOJu0YxS+THfPJUE7L/M+agCXjJnFaTRqMPjM/EkDD+tx78DH8uK5AfO
	2FWAAcywZ9rlqCUJ7rORkJQuwOPaSMXBpvZOK/obvCldCjc7cbrxQLgbEtURgjHYwK5onwj2pwj
	zyJ1udGDkaTLUbTpQkmqTGd7ZuyV9vXvB1VP5WW58jWcoj8TBJSUg1/D7h1mxVrdUF3uZOX8Kzw
	rQXnbv5IVJFhmdtfiK1ap4X1uxIIEG2eNcYMbdN4TYQ08BsjTCZmDxduEoUFQJ09q5/TrseObFT
	IygFMM5c8Pjpl/UgITBLUeGGVqVdxE=
X-Gm-Gg: ASbGncs7WuabeZsbzhb4eZnNsRlBhoB4vjsvccVMPeOVbTuk59BlbVI+mPqLjFVDMnS
	cNdOPfZCgaBBeTRULS7kI8t0NiN4txnCCgLnaxLPGNS2/tmBEujqmmQPtU3OxdTUOe69IbGizDC
	9hyR5Jl7DEYy9hrDtciI8PJy3yb98gSEFOZmW0Aj09/wUdXN5OwBoQCdFctndlpEkyRCx/RSUwE
	6qbo683Mw1ikZKGAX2nbfXbMMltBV8sddhPSywA3MtedKy8WWJAmZ6WLE0NYSQV5gmwPeeTQJjT
	61l4TltHSSOdzaaTOWZ1GeTvn22t/v+lNAD5cnNJHswbiZ8Cw29Lwty1K7gY9CBhJ+1keY0ppCk
	1KtPCm8+kTkhwcq4lJTnMBPPy9HNqn+BZNhkD7r5GojNXmsQAuA9B100yxmAed/ysqwtXFG9bnf
	fs
X-Google-Smtp-Source: AGHT+IGvH1d+c+SqxgQcugyTSHHXDlsQVGJRJyQ1ltADUtTuFufrh1Ixd0wsdhRD9CZrIUe0lMolwqj7AiOg
X-Received: by 2002:a05:690c:305:b0:71f:8db0:12a3 with SMTP id 00721157ae682-72276333b99mr115045137b3.1.1756765748503;
        Mon, 01 Sep 2025 15:29:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-723a8567e56sm118757b3.42.2025.09.01.15.29.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 15:29:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7228d167060so20191287b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756765748; x=1757370548; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B1wzEaGEyJKWF3exNJRId3L7l7T2GO4fqBrtzclF9xY=;
        b=DMeS+GfIokzZsqsILn+nZT2Rgzrz0mDnUAUlcXIvLNm6uaxfD2ZAM3Ib/FiJxHLDod
         rlz6kqjA1istXHZKagn0Dnvi2txln0HVxnTKrFKNeBLiE7jch68NRZcnO+x5O3Pta2Pq
         M+9L3FXuU7nq48uWxjkzgzj1cBtWT8ClRCRYo=
X-Forwarded-Encrypted: i=1; AJvYcCWcnRnHYIlB/+q5uuw7CrEB5ZgU5wMiLRTI71h7bwUf+cPDqPCFMzGkE0DAbVmNRI19Z90ufyouHKEyARG8nETa@lists.infradead.org
X-Received: by 2002:a05:690c:6284:b0:71a:17fa:bf06 with SMTP id 00721157ae682-722763605f2mr132381547b3.12.1756765747737;
        Mon, 01 Sep 2025 15:29:07 -0700 (PDT)
X-Received: by 2002:a05:690c:6284:b0:71a:17fa:bf06 with SMTP id
 00721157ae682-722763605f2mr132381347b3.12.1756765747160; Mon, 01 Sep 2025
 15:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org> <20250901-bcmbca-i2c-dts-v1-3-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-3-ad81f60d4276@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 1 Sep 2025 15:28:54 -0700
X-Gm-Features: Ac12FXwEgIeue5lME14CB34rRKx-fvls7N9XQBUinG3xbeARiJxdX_UKRfzdQjw
Message-ID: <CAHi4H7HO5Ev4iONcHvRSephX23tGZd7Mf0wbkr+Uup_NroqG7g@mail.gmail.com>
Subject: Re: [PATCH 3/8] ARM: dts: bcm63148: Fix RNG IRQ
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005f5b83063dc4e6cd"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_152909_664129_15DB5D00 
X-CRM114-Status: GOOD (  17.26  )
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

--0000000000005f5b83063dc4e6cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 5:50=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The BCM63148 RNG is at IRS_TABLE3_OFFSET at 94 so
> the IRQ is at 94+21 =3D 115.
>
TABLE3 offset 96.  96 + 21 - 32 =3D 85.  Original value is correct.
When in doubt,  you can always cross check
the uart0 interrupt definition.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63148.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63148.dtsi
> index e071cddb28fc2888b8f408b4bc275290dd135642..d94da16ab799c0ab25946e9cf=
24ae25812e85817 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> @@ -152,7 +152,7 @@ gpio4: gpio@110 {
>                 rng@300 {
>                         compatible =3D "brcm,iproc-rng200";
>                         reg =3D <0x300 0x28>;
> -                       interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
>                 uart0: serial@600 {
>
> --
> 2.50.1
>

--0000000000005f5b83063dc4e6cd
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
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIEFjvX+mSEOeam9I/CsopRQ3b6Df
upzdPtHduLUVNgSXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDkwMTIyMjkwOFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAHpRQZuSJtwO9SQRdd6D/Qzk9/hHiHy4+UMdB+cvNim13HP9+QKT33V7HP/JG+DJ
cj5B17z3vdKFNCJwWmVq9OkU036ZRMh8DB4wGNrgpwKxvFNVLz0U1B9cU2/6OfSvVHegGcPUgbdK
nok3CDDexhzZb0vgalWU6uehZ1c7s7TeKUM7CPjusAE8WD1ucA8absSP5wsClxMYWrP7njboYpYc
oMe6ogmXaH8aupfZzWpy8+9iBc+MyMZ1wwc8mV9UlPauBtpf/c2pyRbyJXCdHZj94NaUvs2H7TTu
2JT+cOX9AnE4osUDXg81ODJRg7qEWRWybuP9UaTS2ZM2kXsknSA=
--0000000000005f5b83063dc4e6cd--

