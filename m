Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3551FB5EA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9NR44X8AwY4XRkCM1y4bI5+rQrT649NXzfL/j8t95M=; b=cZvXas83LPrCsCHAAFT4VTe1AI
	tkWTIfEqDib33g/Cpi61mr/IdF4yn+M4e8QzDg2+N4mgpMWAtUrvThj8DfRwxsOjUMrrk0Rj+lghB
	/CMD6noyG9tAak2VT67XalQLyCeAgFZZaGwZr1kDroRzcv3WNCgTydgJhFofxwfA6xle82VfR9Wvs
	qUQtY74Ohy6yde5zfT7rbUKvADhxAW5QMI/Hjjddquxlm2vkG0u5aRZax+iBRZZYwwsdTPM6QYVDt
	hnenOeaX0ekaFMBNLELSUIUwMCnpFS2yAW9hDSEE4JqroicRX/z0viJloxwCaK/O25NMNHe/9LmNV
	odvQkhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JSf-00000005Cif-0qlw;
	Tue, 17 Mar 2026 01:43:09 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JSc-00000005CiE-3X3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:43:08 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-89a465bd7edso37708986d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711785; x=1774316585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9NR44X8AwY4XRkCM1y4bI5+rQrT649NXzfL/j8t95M=;
        b=GdBdBe0Hrux5QV/p+hAe5LdKLTka6EGkE0Rk8DM8Z+0i10IK7y/sIo9J2PJA0i//lq
         dkCSoZrJN5BWPhn08pSDQqH+ngZDwiKqKiSN1jTbU9ofOjrQnoVmahUPeEyTFUKomRR9
         Qr2okIogBgqh4d/sGNRTs4X0CENJSa7cu51kudHGsnhd2feho1kyAvM6s4GUaVOYlgl+
         kq2VfSICCL2a8c4oE5YDZeS7HDaNITnxA3mQbzeFMYtaRsNae/F/gEc1yRdZvOI/w23P
         +Lbu9YJlGuoKds+SgDJzxFCzQjsfz7VOF84LCbunSOIKXfbu7EZiLJNCu/cVG/aT3uoo
         TG8A==
X-Forwarded-Encrypted: i=2; AJvYcCUdaxelijvTG4+i338Iyq9kb4B9ILrATe5Kq2TjRF4QpIuOFBb9cEK86lzSjtNqDojjvoz0LnuzZ6R+WYO0pIO2@lists.infradead.org
X-Gm-Message-State: AOJu0YxHuEv4fECrGQ/e0r0UEMGVVR0BRNDrVqLLsWjI/wUaPls9NTA1
	xm7LzN1DDKgCQg0ZizxoHYvBF/GJ+XgUQMjYSqG0VHLBxyXf+kzBFvQ+tMay8AO5Rfp2kHAFgvG
	Uc+NwGjDlRbLFkwS+3eMcl51re8995AEpr6ls1UeLkAm5+5VR0o6PJuPrEnKNxJ54mkYgGK7ZvN
	0u33ltPodJ39xb4fhpdO4RmH2KTaaCEtSpJ6/7nrFbgi2sdjP6DeF7T7SYFF+fsfg0/FZiPpoQH
	p+qVSxJ63sVOEwjmoWGWdXgCKzsaYE=
X-Gm-Gg: ATEYQzzYXMNzzPqZCudS3ur14zGAadr3qUPtRg/hZzS8yi/7dG6gC490PZcIwPIwUqC
	h8JVM0BrFhKYj2UGflQ7K6VpGWEVLDcvDY1vPK6CgOcOI4wjc8BFpFDu6dhgqiagpG9Edoqc4c4
	f3cU3y1DUylG0xFpvvwR6BgiXIMFvzudaO7C4eVJ5x+waKVpuWEsb1Ng6VRZwAsLLqN1zWPbnu6
	GijyN1joaFTrCNWkosU0lwFoEz8hkVdM3JbQPML15uCTMRy/Q4q94siNCv9wvqIH9Fdq1iLbvwq
	0KJLRfzsQOKiF4s7uF9Ua+3FjEwXd1xQau5/E9z/AFske+YgvS0LhlSDZYXAuCoBD99yrAhDkCL
	UtZKA4JmtilrW/fVZpRkeW8nF/Pofus4/Xi2+5N2rxrjjOdVcKPcqPYdHc/japv8Y5maZn3AFMg
	+0EBo2LlzNN+v3odyBj9qeuh6IXcdvomqRtd2HWPDhoXN1ce2Tbs6vd4s9Bw==
X-Received: by 2002:a05:6214:1253:b0:899:efbf:9287 with SMTP id 6a1803df08f44-89a81ebb5ebmr238044806d6.31.1773711785339;
        Mon, 16 Mar 2026 18:43:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-63.dlp.protect.broadcom.com. [144.49.247.63])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a65ac1453sm18457606d6.0.2026.03.16.18.43.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:43:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64cb3951982so10534688d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773711784; cv=none;
        d=google.com; s=arc-20240605;
        b=UFLoqWI7ujgscfSzKVQqHBcOrxtRA6oz7S20X5koboIpZXPq8BElLvI3Wh+vi0tiPv
         v5Ukhxhe3Kq/+g/+7qzmKEx3v9pejzDwcICKjbqDvAMcCTBfhEDMKLircHM8LWJi2cPc
         GMo5A5FZ0FtenGSXdXgoevVthezcsbYogE+NBkUoujVOQfmrhgRqZE1ET2q4XSGUxAMv
         woKd8PK443R+vUyBxmMxrHdKzhDL5zVvwpZBCVYG48ILxjS94sND10mGMh/eQMBfc+QE
         RMRYluD2mxUFTvUYf8PkjHyb+cEN+mrtR8aeCCNGVOselL0zkvhFmEif/X1EZpPpRxPk
         VF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O9NR44X8AwY4XRkCM1y4bI5+rQrT649NXzfL/j8t95M=;
        fh=OZLmV5ewwjYnAfrjd1PIbcMLS4TZfiBrgPq8mBZ0zZc=;
        b=EEiOloFaTH2LKHOcHantADwLOxpDQ5w7pRjSeU+v8CiJfvwiSlVc8DFjNwZ0B2s9Ge
         6zToljxZt5A3sdQq0JjqIz/vwoVADmFDiP2hYS0FkCTbqBUiuHG+eJFBgcrnsrYOJJtP
         TKu5cNLFwWEWknfFWoBk6MA7bROi17RyqKsNIIeGMayc9TbAjUkjH/BfQ24+S5CRZTgR
         GmH1Jh8teYRZz3Mcj39BnevJuVCbK7FIN/13hFeRjBjosRx14VAjJTMMG4AqTOVj53oD
         uQl+PsKTbpCWfBA3ltuplDNg3n6wnnTZdOK4dEfqYSAkcyEpeof+jNDLxVQNN4FhKqzY
         oWnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773711784; x=1774316584; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9NR44X8AwY4XRkCM1y4bI5+rQrT649NXzfL/j8t95M=;
        b=awl9KJl91Ww2dybM9SjbLULJsPp9zVTMYfDehtcLtuPeXDAe/8cQsdGJtJrvpcZiT7
         0ZWuxm3WfmRZxQyb3A9Sjqq+CcwoAE1hZR0YWOA/WNkVkpGeBkntj0rjiSRJT1aYCBiz
         a6osO4cSRWkfwmUu4LiA5hes1DutZ9ZZNbvAM=
X-Forwarded-Encrypted: i=1; AJvYcCVjj7LCU9/oc7PTzjNXHsTENKVCnN9mm4Nls1ginDONBr5djenLTkw3rS4A5wJBO5u3jDG6nWvsecd5PH7A/iyB@lists.infradead.org
X-Received: by 2002:a05:690e:438b:b0:649:e6de:8f3f with SMTP id 956f58d0204a3-64e62f4db4fmr12095767d50.32.1773711784318;
        Mon, 16 Mar 2026 18:43:04 -0700 (PDT)
X-Received: by 2002:a05:690e:438b:b0:649:e6de:8f3f with SMTP id
 956f58d0204a3-64e62f4db4fmr12095759d50.32.1773711783883; Mon, 16 Mar 2026
 18:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
 <20260218-bcmbca-i2c-dts-v2-6-5373ef82c50c@kernel.org> <CAHi4H7EeeotJEi_k+khUOP8Bgc7XG0uc6y9_MrUvSCNaK_Rj1w@mail.gmail.com>
 <cde82a14-671d-4dea-9212-740467dce128@broadcom.com>
In-Reply-To: <cde82a14-671d-4dea-9212-740467dce128@broadcom.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 16 Mar 2026 18:42:52 -0700
X-Gm-Features: AaiRm53ORRFwTZ-IK_ptpUzGnhrek656FsMH_GeAnU7Gn_iGLqTrX0PFKqmrSfc
Message-ID: <CAHi4H7EesTHgnjtR_vPJEwDK0w7UjtOCgvyZBkpZgFBTV-RRnw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ARM: dts: bcm63138: Add I2C block
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Linus Walleij <linusw@kernel.org>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000de4b71064d2e740e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_184306_934171_A0AECB03 
X-CRM114-Status: GOOD (  26.79  )
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

--000000000000de4b71064d2e740e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 1:53=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 2/19/26 10:29, William Zhang wrote:
> > On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> >>
> >> The BCM63138 has a brcmper I2C block.
> > I remember there was some discussion on whether this driver really
> > works on DSL chips.
> > Did you have any way to test it?
>
> I did a long time back and staged my changes in this branch:
>
> https://github.com/torvalds/linux/compare/master...ffainelli:linux:bcm631=
48
>
> where the SFP could be discovered properly on the BCM963148REF board.
>
Great to hear it works on the 63148 board.  Then it should be fine for
other chips as well as they share the same ip block.

> >
> >>
> >> The interrupt is at INTERRUPT_ID_I2C whic is
> >> (ISR_TABLE3_OFFSET + 19) =3D 96+115, convert back
> >> to SPI interrupt 115-32 =3D 83.
> >>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >>   arch/arm/boot/dts/broadcom/bcm63138.dtsi | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/=
dts/broadcom/bcm63138.dtsi
> >> index 8e41c7130406..4ca4ec2ffed6 100644
> >> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> >> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> >> @@ -312,6 +312,15 @@ bootlut: bootlut@8000 {
> >>                          reg =3D <0x8000 0x50>;
> >>                  };
> >>
> >> +               i2c0: i2c@be00 {
> >> +                       compatible =3D "brcm,brcmper-i2c";
> >> +                       reg =3D <0xbe00 0x60>;
> > reg offset 0x3e00 as  the translation window starts from 0xfffe8000.
> > Patch for 63148 has the same issue.
>
> Agreed, offset 0x3e00 is also what I used:
>
> https://github.com/torvalds/linux/commit/01e1e67b294127562294802914ca0741=
ae7808f8
>
> >
> >> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH=
>;
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <0>;
> >> +                       status =3D "disabled";
> >> +               };
> >> +
> >>                  pl081_dma: dma-controller@d000 {
> >>                          compatible =3D "arm,pl081", "arm,primecell";
> >>                          // The magic B105F00D info is missing
> >>
> >> --
> >> 2.53.0
> >>
>
>
> --
> Florian

--000000000000de4b71064d2e740e
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
tYVucWoqwoo6589lzpWeW1BtW02JHtUb/PLXaMXdh0MwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzE3MDE0MzA0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAWU+8aHCrr3/R6PKKYDOScuRVOpCNmqycszRG
b5w/hXRCQ7ZUZV62h1ATrxiEEZFg7Giu8DQY9WiyUWnK4glCKn13qTc00rZecuq8oi+5HtW6p8m4
4nW+g1Mpul32pqF0OePY1CmlzeYOgH0qDtaX5Dg2BYuDyfT1aUN0KfL3zgDr6MFUEcl9HZsRieA1
XdkkfPXHv7Zxq5TFskGiqzv5Uai/4aSLNEGx4DeuYcnEl22KgeGHqivYopJ6pUUsBNsLpSHxU71l
TdP0q26vpYZknwkdOzH2JAOhjsSGJlMVW+oxEmHcvUejL9tAeyf7qqkaT0kWA0E+44NSj3vTLDve
dQ==
--000000000000de4b71064d2e740e--

