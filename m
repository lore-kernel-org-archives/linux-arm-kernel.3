Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5543FB5EA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJuTw8Ld00ZSIgswH7xVTN2U52UQuDFTOsjlqi1JQAs=; b=YVgr4On3XSTfZo2wyxHlw0BPj0
	qKfynJU6ds3aqDz8rn6lSCmoDLFYC6Po0Z1JMMBrnbKx/yi2j5NrBDONqGjIKqd4/j/D0viqPkt/k
	ntv3H1NlRrs8Vfxo3TfPGPXnuFO/GRSDqNNDQYVFztEhsRi8mUrty4qRQ2UTK0nrQ20nm8IKgp9wT
	swKpa/lxq4kZxU+z79/Oobey0RtbMW1tRJ2RwHi/vUGthP9U/5ozBFyyUNYCu9GuFaPxrHn+oA2EF
	AvwXi/AdPOZ8kzBfd5y+lkGvAkk2u/733DBOIZPxrDVBuEYhOd/bU93MTVciFgCc9nNDga0FXstbp
	EOng5ktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JQ8-00000005CQL-0NJL;
	Tue, 17 Mar 2026 01:40:32 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JQ5-00000005CPp-0JUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:40:30 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2ae3a2f6007so42029455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711628; x=1774316428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJuTw8Ld00ZSIgswH7xVTN2U52UQuDFTOsjlqi1JQAs=;
        b=EVMAAVk5DRukCKqkbqpSueWySDaeyzoR8UNWDbFXiXMMn3J9VmiS12J/IbMEFneLP1
         PwuWg/rR7tO6L4Ia8gitg8BG3L7pHRjkDIuIVl2UWwrf2WDhFTot7/CF99oBIvNIf4Iw
         UP1oPE5bjNXCLlYdo5mOucM4PEEkCoIrlbRcuSiQMOv7gTAZMyFfziNnVJosVnhm/dLI
         2vaf62TGSwwbpcqLxWQmUjWBerBhbt3QYUAQtJUiRBgYQou6KaFFc6O6cVnnfrbkTSjd
         NXxNcnFi9Bf03ZPNODrx7rwoMwWZyulB+wI4XiOa9QHQWecYYIfB7FKQLCEUUybjtVJB
         DFqA==
X-Forwarded-Encrypted: i=2; AJvYcCVBGC0fBQnbX9Et89o1xCQMvxtjmZ6g4Wh11IDP2hwMGz7ytUm9VYiwmmht32VJAAzdmCT0b9X7dNhZcwftWUFg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy04UkN+kOmU2km2vqEAjfXgFFiDAxreriMAnjWlZkJamsm5kKB
	fpxgS/uO67Z8FuotkPV3sTQLWtF6sKKerrcQO8xHfQV8/RAXZ0QIzqg2Rn6ytg2PD+iWPQhTEYu
	GbPAYR8jEcRTqkEWw00d1HcrGKVK1M16Pl4ZMdaYLhDEB/l8NNTdrliZeiovz4Jn6C3aaKV5onA
	x8bTInmUrLKP0PIAZY0lAqE9hhQmrA82jd5Fh292eOKqia6OOhwE+WEsMVJfCd2wRkTe5xm1xrq
	8Mn9IgElYEvRdRpuk9acvTBwqE6NzE=
X-Gm-Gg: ATEYQzwVo+8iYdrHgCN/Av63gKYI2WM2jK377VcJFcQ0VSsk1ta54I2KCpJImF39nRU
	hQGK4bUfqjM7V7J5m0Z2CQDe6K0EEMyL90FnKXUsxTL30RZXu3rkq+bErw37UYP4H1GAL+O8uY8
	o2Nmaqs/VgMxUbP2g7fLj4dhxY6DI3vNJecXhicBVxsHrJvrzXq5xc6tiUspL80rQhORSERZK4U
	Ljf4Ybm99pJvMkMwuF8/7nKKHMLUEHusLqsK3SviM/sGTYxtx0g5ndd24Bpwbfbf7wOOqrDY97j
	/2pdHeY32Ur0r/82FDilXmtT/kD62R95nIOwXNXgH9WIRUw2yU2mOWe56VWTgHbU+WOoxA3HGh1
	oxiJfq19yCBQ11IgY/29UrKcUBkWWI0iI/gF37exXCqeA/nm01OgDCE4r8ipITGqpQzmIhh45Xk
	CXsUzXnm0f2e+dnZbP3NFmKglxpUvffQIPH1L6SoQ63M1ad6ow5YKtzvZrgN3r
X-Received: by 2002:a17:902:f70a:b0:2ae:3bb2:a8cb with SMTP id d9443c01a7336-2aecac49127mr161491565ad.40.1773711627799;
        Mon, 16 Mar 2026 18:40:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b062b8d3f2sm2175525ad.10.2026.03.16.18.40.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:40:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64ca2fce86bso12080485d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773711626; cv=none;
        d=google.com; s=arc-20240605;
        b=fV/MoSZpV9W7wd8AQcxrVJv24IIL+KJfm/iSFw38BXPlhEa+znmlUBDJMcsI8KAV7j
         nNhwa3g9hqlcXM3Y3kBaev39fGxMcpCO0gc34r//i/7LR/ciZcPaeIVgbjT7VONlWb24
         /RpRseIBwyBjiAFb+SUlISooPjqoLPLjjrlSRLNSXX65HGxv51Bc9dqlfyj/CmXWgOIk
         J2LR5ZP1xHWMV6PZZ/7NlOnFPnIZhdlzKRe2+FtKBk6gAQpAKePZ4+TfBKRG8Kg+A1a7
         xV48bQWjEDGXj0/JksfDfTECo35ut+Zjq5If7WfxSexo8/SS6/U457V3MhBrnHdeFJ1e
         AfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mJuTw8Ld00ZSIgswH7xVTN2U52UQuDFTOsjlqi1JQAs=;
        fh=UuyNR2sUhhARmPvLHdn3uzBEfy7imYPUFp3QZJD7LsY=;
        b=JaQEzM/yodfKNKg4Nn/t9nvzTqVvWrL2CuHz/O2l7pGxK7irpb5usDyTvOaIitBERK
         t2R31e3CVSozEgdylpv2m+kk/yv7rQQptnOZpPkKeLc3XungS6JHKKbipgOmUSw4py3v
         v3dKJjpkbpKX7hkR28G69K8gCWlQ9hpLZsdAKmHGVwsdxv26Cbq/zWyuOqLI9yNPMA1y
         f5gp775gdV4dHMbgTGGgmoZtHjYYR1l9QePAjIN+KclxBpuHyxTdutW54DHOUJ487L5X
         T7lMUedTUaeGE1B0NS7LFbm/ipGwST0dLuC+VSHgZYFBxkGN638L4s7Il908LIvZwrUA
         6xIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773711626; x=1774316426; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJuTw8Ld00ZSIgswH7xVTN2U52UQuDFTOsjlqi1JQAs=;
        b=iAWIncyT910QQ4GrGbngyhVqYDT9Q146QYsVLU63v0lWc79+HLf7ZuLl0HRW8dVKtM
         erU4wIXnV0FS/hzFP29H/hYapOZGzj/oTjbOeCJY5ibDlpwxTClti900p0iTBeS/eNAC
         sxpW3IjRyrHrAAEigvQ/bZf9e4M31adJsNnoE=
X-Forwarded-Encrypted: i=1; AJvYcCWBcb1DLvKcsIGobIDkgMLh1bR4WDKTwjno1xn28Yt80jEQRKt5nl/V0r/ai5bYOBSgSga4CzIJgS3pSHSuRNGr@lists.infradead.org
X-Received: by 2002:a53:ac45:0:b0:64a:e781:891f with SMTP id 956f58d0204a3-64e62fa467bmr11946525d50.28.1773711626645;
        Mon, 16 Mar 2026 18:40:26 -0700 (PDT)
X-Received: by 2002:a53:ac45:0:b0:64a:e781:891f with SMTP id
 956f58d0204a3-64e62fa467bmr11946515d50.28.1773711626294; Mon, 16 Mar 2026
 18:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-7-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 16 Mar 2026 18:40:15 -0700
X-Gm-Features: AaiRm50UO5eMkAdUstyjJNsE8tM4Vv2g7KpxwCl0h7vRMsHwX15-XKYAWyPiJ5k
Message-ID: <CAHi4H7H+6KL=04f7Q_hzsDxga9L4gR6PNwZByRyDtEAwGuyB0A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ARM: dts: bcm63148: Add I2C block
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000758bfd064d2e6b3f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_184029_153119_B8BE3F58 
X-CRM114-Status: GOOD (  20.16  )
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

--000000000000758bfd064d2e6b3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The BCM63148 has a brcmper I2C block.
>
> The peripheral range needs to be extended to accommodate
> it. The Boot LUT is at offset + 0x10000 so extend it to
> cover at least that too, 128 KB.
>
> INTERRUPT_ID_I2C is at (ISR_TABLE3_OFFSET + 19) =3D 96+19 =3D 115,
> convert back to SPI IRQ 115-32 =3D 83.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63148.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63148.dtsi
> index e071cddb28fc..52aea853095c 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
> @@ -97,7 +97,7 @@ bus@ff800000 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> -               ranges =3D <0 0xfffe8000 0x8000>;
> +               ranges =3D <0 0xfffe8000 0x20000>;
>
>                 /* GPIOs 0 .. 31 */
>                 gpio0: gpio@100 {
> @@ -197,5 +197,14 @@ nandcs: nand@0 {
>                                 reg =3D <0>;
>                         };
>                 };
> +
> +               i2c0: i2c@be00 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0xbe00 0x60>;
Same as 63138. Should be 0x3e00.

> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
>         };
>  };
>
> --
> 2.53.0
>

--000000000000758bfd064d2e6b3f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
wsEiAGEpzXnO8ZLjoQ4zequ5dONNVvk0GdB8UGrf5kMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzE3MDE0MDI2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAEKUrAkhklHBDDMEAJNTBy3b3zLv5yRVNbHqO
N3yNv3qpIpLA5PwLe68AcHG+OELMWEi2ol7Mfyuc6YiLPpP5UXD/HXqIBIqrD8DsMATu0qJUYI/7
PgiUDx/Coe25qHVUb+jiaea77QZG5yDo+YY1RQLNhXAdb2PlOVq5yI5q4xMhu9GQfuUysZ8DqH4Q
6PdCK+jlwm3JHYtio4X9ZYK3kdbrOfYi1p4yNQG3vCXUiZbJRW81Kx+BLqJkO5uwBCv1cpmexpGF
BB8GU+6we5LNplZ4Lsk8LEGEuGo0LPPu4mEKvci43PYZp+Of2HB7nLpYP60fwEx4zth/eFH5diXI
zw==
--000000000000758bfd064d2e6b3f--

