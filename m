Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1AFB5EA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYVslnrFY4LAtSLJKNBiI1m0GpVL+vgdZZf3Drf0geY=; b=2BJVS8VDTr1xenYvdlZ0QGyf3C
	NMlDM/vGhmDcItjIlha2U6XyjYZEB7eFcOMAwFhsp/Xqwrukl+5nRdzBr5rqmAZbY0kVkwkoWCdh+
	YZwvbbd0Ki1YzQwrSbD2jSZ6ylGxK7BLWxIjCnnaZHzvcCL31KnGCoK69tVdOcbWQMcOHSTz00nhR
	BGW0wZHiLv0k4Qayg4+1HEYWIha/j5HQDILoVpeTC/khwavkIsWge186/ujcwzNwQ1g+IAHS9gi31
	VxkvGpaMAls9g7HNhYoxx/cJhanpsF7BHdk74VoCXu9sZ18AY5hF8Ueq/ZJORPqYVcPHZyqA68VXb
	gZR03QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JJ2-00000005BfW-0pir;
	Tue, 17 Mar 2026 01:33:12 +0000
Received: from mail-yx1-xb162.google.com ([2607:f8b0:4864:20::b162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JIy-00000005Bew-3yPj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:33:10 +0000
Received: by mail-yx1-xb162.google.com with SMTP id 956f58d0204a3-64ad46a44easo4993369d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711187; x=1774315987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYVslnrFY4LAtSLJKNBiI1m0GpVL+vgdZZf3Drf0geY=;
        b=XVmaiBJELPKfkjpDATjpPXOtROK5FiWHxYgsmO7M4laJL0X+AkabWU9JnDxTmCDYEU
         GjvVsC5+sp9G4bjg/k2jmpux9YQ8ssD9DOZO7lICi/QsSbx9XA25DWRqYJRBBiv/42/f
         KDjrxjYYP6+zCZEu+yO3Zlh2qlqV+LQWLj8TahFm47OPNcoUvUWJDUxiPP6xEnFJxFAl
         oEwcxtY9P+AXMHSd/MXmjUIM/VdJIMpaQ59AcDsSuitOSouRDzuXPXdLmNiRlZGyp7sW
         csq8NmPjtlyA6tef9XofHi2DPP/m9kOsiR36iR3Jf8pGLBCie5/z/2FTur1REM1F9Cfw
         F/Kw==
X-Forwarded-Encrypted: i=2; AJvYcCVmtAozI9u9rpCq78zaoo8ARDPjfSRz2b+mE/cHcEsFG9ZmMatjPmDb16CQaA09EU35pitPWuSx/PojBDF6ztZi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx9DRI6y/9CjPXTW5ZsQW1u5cSN4FiagZEVF9DobjZwmHq77N0
	DXOMLnlUD1DcQ08j06u5Gjl3r/gg9YO2PatgFwxKv/GLf5i/cgdYdTDP4PDK8fmzUTg8MSCsray
	SbJtd3j/WDBjmuHFF65WMoxB3hjRBp7PJo3UwUwgZrMUwBDjSnzkgYLLLSE42dudhkkI4IktmOi
	UOKMGML8niEFO3FjctOb4wH3GQ0lWMzq4EQPBCC1rIs51K3z5xIJkVeB8lxDY0GLtviPCT1DgPO
	mn+Ai5Lv6QcHsuGHZ4aQNnRdb3Bs/8=
X-Gm-Gg: ATEYQzy5k3VLdQEo7rUmjOf+ScZUKzHyIUWyE1DUaZnmQP+fvkvAUCTwThIWaedRowU
	2x6fUXy2QiXzdFyMbivxGm29idoa1uG8CiSsQzZya82VX0FZmjDIShPhYiF2bhh4na6nLUAQhrI
	gVmzEcyCZW+SSblQgo6YNnZJoE4tbgcCmmm99Z8Z7IwzHKDYB0O/eMsXcNgujiE0mo+WPoQNlGD
	qYWFRVS0EtmDhn9H/wgptvYFbM9OCUrUCqDu1GLCLru7e3cdKwKZcnLetkXALGuGcWQJokI5Fpr
	S8+ArYVXaByupjeKMK7eQug9XYxs49td9oAKfidOA3Q+HXunggYCs68ozN8j2pZ2MErwQSLzpf2
	yN2WIz5lcOI23Y4RiMIqfTPbv0zu0lv9dr6VJpQU1Wq4YiUJ1sLkbtNx75V9rm4qPYIgzxCYTgq
	5X7C33J7xn+phfUQowRZqZm+yN/3GjPwrBSOLxkY19yRy+AFxPiYZN2HISlUSu
X-Received: by 2002:a53:e947:0:b0:64c:f1cc:6308 with SMTP id 956f58d0204a3-64e63046cd4mr11440673d50.54.1773711186832;
        Mon, 16 Mar 2026 18:33:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-64e65a5613dsm1242808d50.5.2026.03.16.18.33.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:33:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7983f854288so116026157b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773711186; cv=none;
        d=google.com; s=arc-20240605;
        b=TxFDnKIa6lvfP3tBwr0+6+I1AEA5S15zybU8ut+9qxqy21MQbyxtKToLk9CsI8SJWn
         hVxu089TlZ2bdy28m8dZciwl1HKiAmFc5HXaxE2xdorav/tISLMEa+7Y2dFjK5mUWLuw
         b+0XM81RcWky+HIf/uhAlmM/rrnBmrRBIxGNxQ3SgNlWaeQsLKOOI/IjuSGfj0bsPQGD
         Z1IoR9MdoFOIVeBpbanXV+p+lYFeBPbwEpsGTMYl3WtAUlD3il894LsT7yCeI0gx8Son
         qhxoQd74UWT9DTKPlZEQEQNsgvHrOcvfPPInIz9jBmrV3Zt+LehfSgedq+fRc9YzjFPf
         d1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VYVslnrFY4LAtSLJKNBiI1m0GpVL+vgdZZf3Drf0geY=;
        fh=skMCBn+BGH6eo6BoFzK4prk02qA6xfK5uS5Rle71LtA=;
        b=IbUmFPfb05TSC4vzlxVGuS+vrxW+72KTgNc6wcINvEW6gFf2ok9VPZim++QB+e86zA
         TrwPxfmugaprATIWMChTmNS0Xj4nbjaHRR7E3m5qM72ZmFMROZvKv2Oqsf+dbcCc5BAI
         3Lkwr1Kcz2RuCYpTlDA62vLrfKuJ7hzvC2cY73R9RLgpVySkH9diww+shjr9CWt7DS8U
         ChSrcLkSl9fxKhCLXba99mBZXgWioO1nRrYmw6Cr2wLEWQ6yi5yglfqlR+qhaGb7xPie
         eiadYVGCFXXthWK3brjErBurlQub2v0ezn0ZyJNjwpRIy7uGwg2QGSgD8ZnJU55irFbV
         OBjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773711186; x=1774315986; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYVslnrFY4LAtSLJKNBiI1m0GpVL+vgdZZf3Drf0geY=;
        b=OOYBL509E5bMW5kIrpMXKu2Sc1EKCAPciYomTOA5SD1P6upnWCfo9ztI4ZD0vOftJ9
         fIGC/4fg23uMs/X8NF5xiDx2L0k8vOnKF9Ov/WDcum4KjU7jr8eQtzZUaCXY/Zb+bITd
         Sg8hUzwscgaVb8Rb7Nf1yr2K2j8RBFM5K5d/0=
X-Forwarded-Encrypted: i=1; AJvYcCVVfXnxbblL/RroIeIrnKBTgSMd1gqNkvftA8tUEFdH2y9RWIfT4rb2kEh0aRvxnF9nRRSpOItqJTZv8xlxHh/R@lists.infradead.org
X-Received: by 2002:a05:690c:998f:b0:798:980f:6706 with SMTP id 00721157ae682-79a1c0e4895mr161218917b3.22.1773711185972;
        Mon, 16 Mar 2026 18:33:05 -0700 (PDT)
X-Received: by 2002:a05:690c:998f:b0:798:980f:6706 with SMTP id
 00721157ae682-79a1c0e4895mr161218757b3.22.1773711185555; Mon, 16 Mar 2026
 18:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-3-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-3-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 16 Mar 2026 18:32:54 -0700
X-Gm-Features: AaiRm516h62NjuprA8k88qV4-uInUeFt5d6Qw1QdYEhYxt194bXbwsor802hRyo
Message-ID: <CAHi4H7G-W7fYBtivW1_YE-PawdsFTL_a3JM8UPo5xR4RaLqGVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ARM: dts: bcm6846: Add I2C bus block
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000032ac9f064d2e51af"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_183309_064801_57AB8A3B 
X-CRM114-Status: GOOD (  16.48  )
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

--00000000000032ac9f064d2e51af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:30=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The BCM6846 has a brcmper I2C block.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/=
broadcom/bcm6846.dtsi
> index f5591a45d2e4..47f177323c18 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> @@ -242,6 +242,15 @@ mdio: mdio@2060 {
>                         status =3D "disabled";
>                 };
>
> +               i2c0: i2c@2100 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0x2100 0x60>;
> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 pl081_dma: dma-controller@59000 {
>                         compatible =3D "arm,pl081", "arm,primecell";
>                         // The magic B105F00D info is missing
>
> --
> 2.53.0
>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

--00000000000032ac9f064d2e51af
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
VoRq8/xdhFX+pP73FNaqaNa+rQmHAhn/eCinS5ZApKowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzE3MDEzMzA2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAY0Kj91Uk4RVDcJhz7LPVvJB+UwAeX/H3aI4z
mW+dI+uJ2V+5mhRWfvop7J3/0KhTiWhyD0FY2ON/4qZF1q8kSv8m7Id47c9P5SWqXAawMLl4lkqx
SgwTeicoDBXw0RtX+WD71sy47WR+gVx644ScV5DbcjFOzGrLwXVb4DTcG22Tk0DVNr18AIMpF2bN
awFK1gVb4c8x5k9FSLxhi+BlxJzzhf/K8qJ5cLcsKMpOCD9l8epkdTrq2tNwC1jo/nyqNFx0AU8Q
NlHLU5BCypJwU2JKoVq9O21MakHc7wNnnkVnxvmbX0umIlAZuQz4MnCkWxjYnzrLl6G03ZIXcAKB
zA==
--00000000000032ac9f064d2e51af--

