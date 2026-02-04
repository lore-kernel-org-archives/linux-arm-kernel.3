Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF53EEA7943
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qArWqzxBI0HjppSXsRQ9EqfmwMBaNvfe62Ui18ndBvE=; b=uIErdDKoUSdDb8yHzbAqGmbND8
	/DHMhgaPGf3bCX7sL59aEYfZl4SzcKPLr1ppuaexJeLbVJlnX3ebS8EtBsAnGi6WQu9x7Z83rDMpU
	u2jTjn0Spj1DfMxR5rTEAJ9xGgVn9lO4312ztMiIv5RqDvBQAu8OJoQDbcu5FKoeCHpdSVDQMIulO
	3eDcuBqUMPyQYb7yp6oVFpNnarfhbYToNX6d2mapXeCNM3ooOCWbY0bYe3a1xc5L57cFiGCDRetEn
	EcOdnuUDR0IkkJThWWxjcrxmWvctvmWkIvXcV6oANlSKW67mo8Si7FslYwrW8MfKoXSrdl7y2j//p
	zT1QC1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkri-000000097T3-3rj8;
	Wed, 04 Feb 2026 21:56:50 +0000
Received: from mail-oa1-x61.google.com ([2001:4860:4864:20::61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkrg-000000097Se-0733
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 21:56:49 +0000
Received: by mail-oa1-x61.google.com with SMTP id 586e51a60fabf-4042f55de3aso308813fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 13:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770242206; x=1770847006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qArWqzxBI0HjppSXsRQ9EqfmwMBaNvfe62Ui18ndBvE=;
        b=RZpG2UXkCYGDIfrBu3MtKe1GMdMMj9Q/IIrvX02Yujxhegl5OKR7D9LIlq40HcdR3H
         BlTdZdsVKlw0GZZceGl5pKVLc85JzOgVR74LQTfynZohUJpLWEkzTUNCwHj3HdXIpEVm
         L3Y5hlXAwFd6EIM7a4VbD+9g+NuF5yKXAtKLa6UZt1FYyFC7ZMKykLfxXX4XswIQAlnm
         4HFdwIFo3VyHjfvwKmicTJwMNiYkgB76IdWWAL+vpDHLEZwsQvxjArSjQLiU3342UfsJ
         ljy3xwrS7ROIQ1hbiDatzsOn51A4h/vaEZOOWbwLqyCmI8/j4fc6C/OF/ZkW2lTjE6hn
         A9zw==
X-Forwarded-Encrypted: i=2; AJvYcCVQLFiwcC5wWE0QLGuwtAdKzpkmtKk54PYyV7SBvMQCtWibFJM0/omwUJlT0a+gj+jMAqwHv1QtVGd0kv/8XTob@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVKb+wxzRkBYRXq9jPg8oNAD4P0Eqsmh75Us41q2j94YffpLa
	9J6adLt2S5usKuaAI0Kcw/KOXVyCtQ4sTeVhs6zVKeVzXk0qdVD6gopkLlfgLe7wKfIIZB66vGz
	HcTWjI9HibANCt6buczy19vePfhLgr/Omvshlu216a6UMVaU8sbIJncMw2B/pGAduTYkUtRrPq+
	jAFN8uwdVGBFM2wCiA9HxU7GSwNh4zVTJkW/qbQV/j25QajPMBcHymfpc9gE5JI5WX6NF9YtHH4
	9GQjTWsc+GtshfZPmVbonRtZx96pqU=
X-Gm-Gg: AZuq6aIGAB2ToI3br9vRXYyo0K/L/gTZdQvaO9mrXVFxBMDks3Y4fer/xP96K4ZSiO9
	V5sHdzSgqETvaT67jSSBdoWrRTxV5S63uUWmuX09JrIOcohcGMUGmDy+ATOkgFQzNxbJYmnCmOX
	B6sgvk18yZIZyp/JbxwVdbmAHAnpED3c3+nMhNS9RjyGTbYL6kOsHEWhTEjwbja+S4OcAI5YDDK
	93g2k46Sch/lbk789Safvc4jmohm6qvu1yq/MGKEb1hpHK6oxOXtklSBgUlvHa1qFI8BDuN3dO1
	6PtxYSHl/osHd/P2Ndqfw/Zm0nxt/1o74GiwHSyBTvjGo5dS4WW0bzoHflLG4CI7IQx+C8JcLIr
	w5Y+yOaAHQ+JPu0W/y8EbfWL/vUSTjDE4m4w+uEN3OtEht/7risfYbTNfN2uwTuUnqP1mf42gnB
	lf7n5e1kft7FbDdOVlSqbt5MaviZvoFz4fEucn++DqwZ8=
X-Received: by 2002:a05:6871:5e98:b0:404:1e38:60ef with SMTP id 586e51a60fabf-40a75fdb1bcmr445715fac.15.1770242205997;
        Wed, 04 Feb 2026 13:56:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-40a53d5b90fsm382538fac.0.2026.02.04.13.56.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 13:56:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-794b240c0d3so8122107b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 13:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770242205; cv=none;
        d=google.com; s=arc-20240605;
        b=JcPF1GjKztNctMugZ05US8aWlqZwECR0cnyZx1hZ7Hvu7nteoXa0WSvgrc2rxyLEGH
         cNA6kvk5cCEwzm+VXXA9lOUi/NvL769/jZJzLEejXDIQPP40gqtElm3S8N1zDGsp/lvj
         S2yOy1d9YF2vac8HqlmDPAgdhJwxuv/wSTHfdcj0zmUN2+bfIMcI4V9J11xCzwgmHsP/
         9p8Cxb9ILyQ4c7YDCTHtn3V2Iza32riGjqXj6Mjhky3sSc1JeU2RWtw1I6iCinEviT7e
         hAsGyaLfXzrChqUpgt9V4qf9qKlEMptbcwLoYs6gHPNXE8irqr3y2CznePhZBMZu1qma
         vTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qArWqzxBI0HjppSXsRQ9EqfmwMBaNvfe62Ui18ndBvE=;
        fh=qflvYksriJfl3ACPEt16LiYHdLmHXiUwDvTIrjNe66I=;
        b=hz/YspeBYNPm6y1tAqDsvH1TU1aYhYNXniLpnexPo6bWOT67F0tBzQ3076mf3nu2jc
         DGEsFKO1ahDh8TG5NgE7WoxASzfBGUDh4XjVKSUwCkwviduiRD7e/NZ114RioUSa9GmO
         P3Qt+nHB+M8GEDjQQct0slmvWethf2nkPmLIMWA3fvw+M7Da1kPd2oIriu/c8LgH3I/q
         lsCkHm7IEakxwWetgPoAlK0OvizTo3mpMGByyMv3vRD2qrDQ8PZPBOLgBFKt2cxQ2fJf
         0Adwj4JER2S1zpMN5x2gfj4aYq6ZQAmSLmYo3go6h5uQ9iT5V8ZXUdKzZ8hZyvo1pQ0D
         9rjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770242205; x=1770847005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qArWqzxBI0HjppSXsRQ9EqfmwMBaNvfe62Ui18ndBvE=;
        b=ZLxsV1HNd69PA97HZqCsfdFmvr/LWi1g+jc1ISmnXrqx/cqkoMztW3Z9CUKJLGKj02
         p7y089xNRP2SNn1kdfKZu9Ih7uaiR2imXWhMU7stBsTxmMEo5LBFueNyyRXiNOnaRviA
         kPfWA5BkM6desQWt3iIZD6RMr1gEohAYUbL+A=
X-Forwarded-Encrypted: i=1; AJvYcCV3YYAKg4Gf+1V8l1OMK0cKlbjFGImuoy/011NIPS5WeFLEyR8XYzMJB617ObPQ46zet5IWL9Ao+WrxeNGz/VTb@lists.infradead.org
X-Received: by 2002:a05:690c:39c:b0:794:d207:1ce1 with SMTP id 00721157ae682-795153f417cmr7620007b3.14.1770242205159;
        Wed, 04 Feb 2026 13:56:45 -0800 (PST)
X-Received: by 2002:a05:690c:39c:b0:794:d207:1ce1 with SMTP id
 00721157ae682-795153f417cmr7619857b3.14.1770242204816; Wed, 04 Feb 2026
 13:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
 <CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com> <87ldh8fdqm.fsf@bootlin.com>
In-Reply-To: <87ldh8fdqm.fsf@bootlin.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 4 Feb 2026 13:56:32 -0800
X-Gm-Features: AZwV_QjAWfB4et1jYEkpmzxJPCQ4V_oa030EZg2Rq7Wp0AKI93l_wxyNlVsvMv0
Message-ID: <CAHi4H7GFbd29QnHp=5rw7EfvOVvBFN_Q-6j2yAtiFwswHN-TKw@mail.gmail.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d271b1064a06a1f0"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_135648_092882_2E39A2D7 
X-CRM114-Status: GOOD (  15.43  )
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

--000000000000d271b1064a06a1f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Wed, Feb 4, 2026 at 12:36=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello William,
>
> >> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dt=
s/broadcom/bcm-ns.dtsi
> >> index d0d5f7e52a91..46b650abdb90 100644
> >> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> >> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> >> @@ -479,7 +479,7 @@ thermal: thermal@2c0 {
> >>         };
> >>
> >>         nand_controller: nand-controller@18028000 {
> >> -               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1"=
, "brcm,brcmnand";
> >> +               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1"=
;
> >>                 reg =3D <0x18028000 0x600>, <0x1811a408 0x600>, <0x180=
28f00 0x20>;
> >>                 reg-names =3D "nand", "iproc-idm", "iproc-ext";
> >>                 interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> >
> > Acked-by: William Zhang <william.zhang@broadcom.com>
>
> Do you mind if I take it on top of the commit it fixes?
>
That's fine with me.

> Thanks,
> Miqu=C3=A8l
>

--000000000000d271b1064a06a1f0
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
Iy7SGFYuFjkIgWfx44fOZ9IPwfwek9ttV+Xou/1iQVMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMjA0MjE1NjQ1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAqr/xZ330JNbm9N0adEBsoD/XTvZFPDH9tdhj
hq2ReAmNJhZAfs+2t5u7P1q71XapP8rAR86NYH0GFdqY5UBG/kFbq9mvUJDsiXUOIb70/0JRiLAg
tIul7yggtai3G7D6URBgLpdlX7Hk1jsMPQxXPQO8uFQg7E+eC652y2EiugynEQNREx5K42Uk4y8S
Ri5N41elmaZ8EQDF8BnDVnbMAYUdOvyDGg8UVDkFDO4X2dvQ6jJ4K0K0CJhfU24ZJ4kikkBnMRTX
W2vwqgaQ8JP53OfMTvOfcVh7LVgziS59k4JmZGefcJxmjDbu+e7h3MeMg4EAkYCPpFdK2EKEhRPX
GQ==
--000000000000d271b1064a06a1f0--

