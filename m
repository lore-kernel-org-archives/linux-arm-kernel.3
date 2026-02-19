Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE362E9A057
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjUhhFauofzYmNbZnlEXsUtHBqYmdv6tMCx1c2Q0Afs=; b=CLNV1kGsAm8Ycmw4iUoATwYdxg
	IgdKBqqMR8A6JxA/rxkgAvXgV8Y/3+18CzZYXfuI9IPfgKqbmZyra0n+WxhPOVeJ05Q3gL+DGCj1U
	8rVSXz2EQHpv2G9Iwo5/8REyu0wqgLJ2BsVycNlJqBMut4s4FmCAcRLdpavjc9OcAJb1boTCYKeQh
	kGmr1La//pMtA+7U137x+C4umJ+t4iCUNF7SNEbalfaBqEACkisnoYYsZMK7l662RmfS3G3Bkrcrz
	n+D7+P5FVDVl9FsjL9gtsWvrpQ/lub8TbCMmoT7rrzEGg+t4h3vVfxkv+KYTXC5qvuykB+XvtHulF
	fRCzibiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8mJ-0000000BmcM-1Gho;
	Thu, 19 Feb 2026 18:29:31 +0000
Received: from mail-qk1-x762.google.com ([2607:f8b0:4864:20::762])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8mG-0000000Bmbx-1uFf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:29:30 +0000
Received: by mail-qk1-x762.google.com with SMTP id af79cd13be357-8cb4081e82aso152352485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771525766; x=1772130566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjUhhFauofzYmNbZnlEXsUtHBqYmdv6tMCx1c2Q0Afs=;
        b=OQDZYHJGXvjgSkvCq7BAg5azk5Z4Qaw2ysvCXD957sBslt2zlltymwJA0ef1lPr9v5
         y4j3/Ie4CJjxyxh3L35cvQonr0sESIl2XHmrJ0y+/plDNyCx+W7l+yBjpAHe4Oi/PWJA
         3riJl3cA5UwUmD9xHmAixyYpKcmtygKvbvKN2/NCVKdXRo5FlWqeGrC+4Z4JCL1nZHGR
         lb5Ae4BwOqr9/d/h+sZtaEEwSSgjKkEE91Rj0KYwTyTe97akVc7/1kbrs3FcSnc7naa4
         8mf64pd4q+6ksl3e0LydIBEM8in1gTlD/RP4bPJ48Gv3uILrruKqfWik3mmaRGWZ2mje
         XAiQ==
X-Forwarded-Encrypted: i=2; AJvYcCUcfBn7OPdoekgTmBzsd/+rOOI8InOboJRteQm5kIX3yi9xXcp9MizMpEe3CrIgoFlas/GStH6qTFkXyGD21GUd@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4SfNfCKdpxrhYr5xsN/rAJsAz0f/N6Gj0Fp2iKyJXjbPuRZW
	SX/k2wYCG0XRRu6sY2hG9QmpXqbg9pUD8vRDAe/shBhJHuVS+dxqqLgEhTz44jNBE8EupRnfHLE
	7lMAhSetU9ASnwS9QlfdlvpCmYb2pJ+0OZ/homQoUPodDRgDAGe5FUrb++bfe9XQtaEO6jd0um4
	RIC3tyiuxt7+oExnXcz97aowWh6cFvNqqqNtLMg6nYY96lAuPgEWXaEiPVfRjHMgrkT4iQQCrwX
	s4s5BZnh2BM7FdL+MQolwAdSw/PpAE=
X-Gm-Gg: AZuq6aKGx5roOFgQUl8/G0PW1upPBJDhC3Z/z66U/QE+vEmoTAQqY64dblWGmCHFOQh
	HPjV+u4gEiJMlmRJA/eyAi4wOpcux1sJjwpQi+6Ci0vJjuufDDeHeOVnDAsVJxcvhfcU5UV7ShS
	oHiWmz0cgmXoI4YDzE8UdGjgAbKzvArmUgMcPFqdkbzffCWn+Dxwn7xGGg8Ay8YCDQ8wETpLwVw
	FP5Etfh22LiCJC6krkN/DnVAF0tSKS0gd74oLG9ZqXx+OnC7MRpK5o1WQh0bexTxpC7+uBkcXT4
	xD5oI3Z3KyC1Vgh1tzFf67JDy9XydLOehK5LIz2XuT+DaH0/qsgP+1jScgESVaYzd5HWXapYBbe
	DBPu9WV3nmo+bXqaxEHDYWEca6cfkUZU/c41eIQpd+ZS3HdJlsiqe/YQiCTU5Qx3wacanVBvTou
	ULVo99CkNYDu2Cu2mBgAB4r7Ua5a4Ko6lHv1QZt0OBQmoSFaXKsRfKjGNzyA==
X-Received: by 2002:a05:620a:19a3:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-8cb4bff29camr2468632785a.52.1771525765830;
        Thu, 19 Feb 2026 10:29:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-94.dlp.protect.broadcom.com. [144.49.247.94])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8971cc7aa5dsm31853396d6.1.2026.02.19.10.29.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:29:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-649c8c5e11aso2004447d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771525765; cv=none;
        d=google.com; s=arc-20240605;
        b=WCm9kGS4K2wWx0pBe/fwu3Tc889CJYmz82TV+MPknf0bThFRDUaxHl26LHzWZ2b2G1
         Up5u+P/P55p42wi2U1o0Fa1+YIlrCiuFLkkbt2XcFfSsO05S+IjvhUPEQzwGxLqa9R7z
         kA27CYcCSbuilj984an3ZmHZ1pTgbGaXJhrd7s08CDNVKBQmOepVyKsDfSlqzJt3pViW
         IMJ4OdlT5MrdeKa0f3C6IQAZL+WQV6hCxaOj1ThgzQVa/C2w0M+Ofa5dR4CMkVFqkXu+
         qqPiHqkLC2pTViOO2CQyDxIO+1pEFIDPR/KHUaBLw2ADZOSCO04haUd2H+ZUnW4nfpFD
         D33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zjUhhFauofzYmNbZnlEXsUtHBqYmdv6tMCx1c2Q0Afs=;
        fh=BRpT2dNGTTdyoLVdhv0kdWeI45JF+0J/+yb6oXRfew4=;
        b=Jc8xbC50ORjHd+Sh5QaIvJXfZ4gxCg5AoS66ZaQWQsf9Jjk662vqjttND7Nb21FgtP
         7lxOX6rp2EugRyuC48h5c9A2RE6Ix4C/94HMtJzj6NEQfYT9iSf+i4PHbvmUzF3q1SbI
         7nqgUJCZtneDasd2/X/YAZldeiE7IVbQS0lsWmXmrBPEAr/YW1WkUNJMrXNMrHlEiINR
         QS+eUuvWMqiP84oUslMrwrP233zmyUXL3jZaW99FSinTtjSvkLadG9ZLh5UxIXks2a1v
         e7I+Eiz0e9QY3OYtk998W6K/hpuefBTZi5m/iNzUnTzMTISVNHt3MD/xfXq6EOC0WI/P
         87xg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771525765; x=1772130565; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zjUhhFauofzYmNbZnlEXsUtHBqYmdv6tMCx1c2Q0Afs=;
        b=SZxUZfj/LbxrPEW4OMbew4YIZNBWrVgwpqcq1+QptkLAjvpXsnkNkREZsgAyInNdXd
         VWXGyQGQ+rOjTmrToNzwrxkbcN8fNHsNxyB4y9L+xjDkTA9co2WyMfWPMDQ0enqJ3szO
         U3Oi7BNwGWzDiWv0xuZ4ximrC7BcMVg/ht9is=
X-Forwarded-Encrypted: i=1; AJvYcCUeeKKPV1v6VgIbFRC5fjdMn12mU8fLCKUBcamWJDwVOvC7TH1LbB3r26Rjo9bO/VAV5d1jIdlRsyvosMtHY8KF@lists.infradead.org
X-Received: by 2002:a05:690e:bcf:b0:649:e9a1:c6b6 with SMTP id 956f58d0204a3-64c21a999c5mr14581364d50.30.1771525765133;
        Thu, 19 Feb 2026 10:29:25 -0800 (PST)
X-Received: by 2002:a05:690e:bcf:b0:649:e9a1:c6b6 with SMTP id
 956f58d0204a3-64c21a999c5mr14581346d50.30.1771525764710; Thu, 19 Feb 2026
 10:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 19 Feb 2026 10:29:12 -0800
X-Gm-Features: AZwV_Qg1nPSzCFuirhF1W8U_FMVgFFeuNfKdVjR0j4K_bujf6Bpj2e9WuLvH5yI
Message-ID: <CAHi4H7EeeotJEi_k+khUOP8Bgc7XG0uc6y9_MrUvSCNaK_Rj1w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f62a2b064b317b57"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_102928_565017_9B8665E6 
X-CRM114-Status: GOOD (  19.68  )
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

--000000000000f62a2b064b317b57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The BCM63138 has a brcmper I2C block.
I remember there was some discussion on whether this driver really
works on DSL chips.
Did you have any way to test it?

>
> The interrupt is at INTERRUPT_ID_I2C whic is
> (ISR_TABLE3_OFFSET + 19) =3D 96+115, convert back
> to SPI interrupt 115-32 =3D 83.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63138.dtsi
> index 8e41c7130406..4ca4ec2ffed6 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> @@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
>                         reg =3D <0x8000 0x50>;
>                 };
>
> +               i2c0: i2c@be00 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0xbe00 0x60>;
reg offset 0x3e00 as  the translation window starts from 0xfffe8000.
Patch for 63148 has the same issue.

> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
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
> 2.53.0
>

--000000000000f62a2b064b317b57
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
02OtDVkTptLKNY04jyVYoTJ7WTGa3Y9dFKRJZ4Zg5lAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMjE5MTgyOTI1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAWhGxEj0WDUb7OrFroww2V/uBMDI1GE5tjA1O
kjE/fJudiL4IMIc/DfkzMzaEG5T/cWJN/EhvA7a8LeTJc3iHbs8b3RAjABaPMFGLuW7al7OpLsoL
Mh8Bh8NqWUe17nM8k66kXvGOEfAB4leQMzsIKqaQes/oxeswuvl0F1W62YidfyqItPUus7o9G79I
ZYQKkaN9X235brZl3sCJRr+B0f9HIctbJ3LptE0CTW0U2bnMv3/CQnK+GWiNpjyAXpwQuG2gyaOu
vSmcgAVJfCWuyg/hIjivBF/owMVe9DFAO5xso4vp0NTGmYOJKv6Cp06KkMclS4DHt9XI4Lyxkg6k
lA==
--000000000000f62a2b064b317b57--

