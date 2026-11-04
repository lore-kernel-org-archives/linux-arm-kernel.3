Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f4ys/dNh;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EAY0QrDe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tmCz1ZxVHPyXWDBEiesdHt9L/YDPm2udXe9aOVacb5U=; b=f4ys/dNhq0+G/lc9Z9B6sUQ4LF
	bz9nsOKOmyeVq/qhKX8F0ZREyYf/XIqIO4T1y3/Tt44yzGVHWlS7Tgu1zwL0XpokoqR+9GubIWADv
	rRQSsrXYk0KyH3a1sVLEXRtRUOMsUom0pvEhpjOWvTNt1jEbNQ6Ajsl4BijHp1JnGXaSXJxJVYYHd
	ByKtBr9H3wNpDFRD/6RY0irjZCrRbjQROCw603adI/aDvvttV0hIeQuzU4iEISphxn8BxgZSdwA18
	51rYowj6vtqyNT1g7c7ifLqjLqrmq3pOgLZYRWWGlcSyalvsTnvcwKpGiNonLWDYKvfATnM7MlMEq
	RJkpinUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgEz-00000006VvJ-2SRm;
	Wed, 04 Nov 2026 19:01:45 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgEw-00000006Vut-2teA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:01:44 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-8b31ca7e0bcso9296527b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818901; x=1794423701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmCz1ZxVHPyXWDBEiesdHt9L/YDPm2udXe9aOVacb5U=;
        b=EQPNRm4NB8bASJmyElETzp+MffLBIAemFsXMNE7Ok3EAirBdzvv29+N4Qb89vEeDpX
         /VLPtpZLf+C2RLqa0Kt2p/Sfrxhiz05btldV9eIrW9PImSrMC4tRu2+ACCCi3M5eUUUM
         J2eJgbmMRXtg4xjinDTYg3fV+MwrNcvrsYG5gUfUKOmoOUatWLQy7s85U37qA772uGoQ
         T0IWwbkdREHiZfI/ZQ6DItHkj6+MCSsoArD5MuS9Ok/BsZFgVbnAK7WsUj+ToDcoV1w2
         PsRfYyXBdv+Ed/1mmCsPzOJyRiSSyXjrOpnRy90pxjWyPnEI/v9hXP5QItoO4Oadaleo
         VBTA==
X-Forwarded-Encrypted: i=1; AKwUvBzRLpQyYTeOvVYpm3zDxauP0vVaTXJfgBh/25vSA41qu4bh6T4foGlX2ctJ6oZuloa0wwMbhQqMaMdQnBTzTitK@lists.infradead.org
X-Gm-Message-State: APuU4Z8/OhbGecT7L0GylRdv3FbfMqBJBIrLiYBokWU5U32ZAtxmEpnf
	bmKAEsM8ONqD5DAobms1ZEhCaev3KDaQqqbjRMTYx4M4SMPk4i+eWl9E4NBLwKnuRCJzGUX9Syb
	kMvmHLH4E68PuoFBeM2V59LnmYJdYU9/JXwnYLhnml25dMZB6UhpbNUlKNwO86UOIJyak8fhc3Q
	nIRuafUOGWeymhjcC9GMgZrv9U0heGQH3uwcFIkhLh9/3LfWo1hwU3SEN1B0D1DeI2bj1nOSmgn
	G2ieTfmZVgjJ/zae4r/PxyDhscjK0E=
X-Gm-Gg: AYBFou0wOqZri3pdLpbU+eVo39afMiAjvGRlqJ+K/FG8/HnyMHP0kwZjVguESbzmDJS
	LHx0UbJF57oXH4pm63fkZBDpO6A7lHL7puj1DOSkWyxIFsBgmLno+TJUOvDXEV3mY5HsgOZHlqw
	yeXEMo5l4yi8ctr7sqIj/cdkv3Q6hP7KAY1NEr2a0hV2OoHvyrdyClNHFK1hJXhkFRWM3n/Cmkh
	w8PbVdZwmPyfZafy8l5w2GW88c9fCKgMTLzGP5OU+Fq/wJbdgmI1LKLUlvkg3ASXc0ENF3+OWOy
	fZBs5YQkhyfKuCqjxc8zmc9omduMSm8fJEJMe/OGylz0457YZ3+32WXiz6a7pSiJ7Ol77PBUxs4
	s2tqcjMUJsXmXpHleFqwUaOAVzwfXx1XF/LbjFmW1zYXbfyMDlmiyggzboXIjAzewDNzsL7qPum
	FFogluZ1wU62uarYq5IlrkkZznEaQqDbgp/Iw0
X-Received: by 2002:a05:690e:4146:b0:67c:4b5:d5dc with SMTP id 956f58d0204a3-67c04b5dcadmr41501d50.0.1793818900543;
        Wed, 04 Nov 2026 11:01:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67bee112a61sm39752d50.11.2026.11.04.11.01.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:01:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d36c1db7so18078167b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793818899; x=1794423699; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmCz1ZxVHPyXWDBEiesdHt9L/YDPm2udXe9aOVacb5U=;
        b=EAY0QrDeXFKKQ9XIdGYsc8natwn3ItYpTIzkOLNiVfRn169poSszLDIG/Hwx/vyqKN
         Ln9rGtmb5Y/dDyaEzLDZKG58nDwXMi1OBPfd27xfpC32/YGFn2cJzO4KDqgzGXlkEQvi
         QQUunoyBnjp2v+nqEzF5RhKC2T6hj9x3ftKDk=
X-Forwarded-Encrypted: i=1; AKwUvBwD/SwJSUb8kBjoVDjMoQWspPNKz/tQzFnVLH3tblwglhDoojQkx6O8LBoZfgt5anG3UsaNW6GypG4M4P6N1yIg@lists.infradead.org
X-Received: by 2002:a05:690c:6d82:b0:8ae:e69d:913a with SMTP id 00721157ae682-8b2b65baff1mr123091857b3.1.1793818899099;
        Wed, 04 Nov 2026 11:01:39 -0800 (PST)
X-Received: by 2002:a05:690c:6d82:b0:8ae:e69d:913a with SMTP id
 00721157ae682-8b2b65baff1mr123091607b3.1.1793818898525; Wed, 04 Nov 2026
 11:01:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
 <20261022141541.GA1009304-robh@kernel.org> <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
 <20261103213814.GB3951195-robh@kernel.org>
In-Reply-To: <20261103213814.GB3951195-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 4 Nov 2026 11:01:25 -0800
X-Gm-Features: AclHuK_t1PkesIBFFZ5rU-0ER8j9XNytwrYakRXMF1fnM5Er_BWHgdbnLrKAx0o
Message-ID: <CAHi4H7FX+BGEeVtb0EfjhYpQB5GTi2OHwjZC1+3RcR_d0kSsaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable method
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004ebdf6065f780290"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_110142_798250_1D85CBD5 
X-CRM114-Status: GOOD (  37.46  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000004ebdf6065f780290
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 23, 2026 at 09:20:06PM -0700, William Zhang wrote:
> > On Thu, Oct 22, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > > > BCMBCA systems booted through CFE can release a secondary CPU by
> > > > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > > > sending a wakeup interrupt.
> > > >
> > > > Document brcm,bca-smp and its single-cell cpu-release-addr property=
.
> > > > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > > > Cortex-A7 example showing both CPU nodes.
> > > >
> > > > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++=
++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 5be89c584026..6771b85f757b 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -255,6 +255,7 @@ properties:
> > > >            - amlogic,meson8b-smp
> > > >            - arm,realview-smp
> > > >            - aspeed,ast2600-smp
> > > > +          - brcm,bca-smp
> > > >            - brcm,bcm11351-cpu-method
> > > >            - brcm,bcm23550
> > > >            - brcm,bcm2836-smp
> > > > @@ -471,6 +472,20 @@ allOf:
> > > >      then:
> > > >        required:
> > > >          - secondary-boot-reg
> > > > +  - if:
> > > > +      properties:
> > > > +        enable-method:
> > > > +          const: brcm,bca-smp
> > > > +      required:
> > > > +        - enable-method
> > > > +    then:
> > > > +      properties:
> > > > +        cpu-release-addr:
> > > > +          $ref: /schemas/types.yaml#/definitions/uint32
> > > > +          description:
> > > > +            Physical address of the 32-bit MMIO mailbox read by CF=
E after
> > > > +            a wakeup interrupt. Required on secondary CPUs. The ke=
rnel
> > > > +            writes the ARM-state entry address before sending the =
interrupt.
> > >
> > > required:
> > >   - cpu-release-addr
> > >
> > > ??? But cpu0 doesn't have an address. Is there really no address or y=
ou
> > > just omitted because you don't really need it. Should still be there =
in
> > > the latter case IMO.
> > >
> > > Alternatively, add the enable-method value to the existing section th=
at
> > > does this. Also, there might be other cases that are a 32-bit address
> > > and need this same constraint.
> > >
> > Cpu0 does not need release because it is the boot up CPU.
>
> I get that. Is that convention or h/w restriction? I seem to recall the
> arm32 kernel might require cpu0 booting, but I think other arches do
> not. What if you support power gating or hot unplug of CPU0? Then you'd
> need the address.
>
For hotplug,  I remember the address will be provided by kernel using
the kernel's cpu entry point,
not the same release address provided by the bootloader.

> >  But there
> > is no harm to add it to be consistent.
>
> If there is an release address for cpu0, then yes, you should have the
> property. If there is not and you just have to make up something to be
> consistent, then you should not have the property.
Then I think we should not add the release address for cpu0 as it is
not really applicable.

>
>
> Rob

--0000000000004ebdf6065f780290
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
oBnhpWKo7Gg24h3mkD7kISerZUESH1RZyYnMo9mCKL4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTA0MTkwMTM5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAq0XYilO9kcadjRTi3G8lTjNky5e+QgAL6k9H
b6tbbpQF0mKMJutFf42A537oBOuiqhQn2zvKUkr3Y6h2WjFFkDZMrgRtP8oAeYNx2GcHjnptu4TZ
g2LMQI1FzaZAnArd2ILZpL4mvXIJSZHXabGYNllFnkFmKy4qELN4dFNjzQA72XdD0xryMwGCzZD0
3SIaPNFimHhNSZiUo9OFam9F758jjm4ur3p4NAgutIrnxr6dl5XsT8ZO7COzUPQFv7RUqjM8XxOi
Mt9XPubX+aaLS8a3vbtl5UrV0l9ZRMOYzmG73R4EHa8azxvwqThVsgWWqr/c0h96PnrZsyWOD9ya
Kw==
--0000000000004ebdf6065f780290--

