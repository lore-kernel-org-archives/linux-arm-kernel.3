Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KP1bDDnZ;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EBhIiLfp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wfy/Dgi5fjGlLZsGc2oTyiKBVR7PRiRybA7mxzlJisk=; b=KP1bDDnZz1K0WYUnHFq64YTUZ/
	6Xvcsev4awM5ErgOWwJ/bFAJ3rCiwQe/c6QNa1u4jMT20igCFYLJjEVqNuujKHfSndP+Qc+Md7M38
	hm7e+WZas+8ZnZ41nHsSA1Fvy/nSMuY6rnCGcuhKv2/boUqeuXTcTHo4lUQYux01eq8Lkgj0T2Mlm
	ragomyTiPVDArEQgDPiKETjQEAqXgHhuqlSSDQudzYfHAMBQKc4a6UkEoOAfUN5v8osbAI4MEBvAT
	3Ohktywp5FaRZPmj8RL9zCPXmGb/KEKO4Krb/kZmrzszlcL3XbmzV3U8C5NA7OTe0g1bgR8dqj3Bd
	rJOH5T1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTF7-0000000HPmn-2uh1;
	Sat, 24 Oct 2026 04:20:29 +0000
Received: from mail-qk1-x764.google.com ([2607:f8b0:4864:20::764])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTF0-0000000HPl3-2IXs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 04:20:24 +0000
Received: by mail-qk1-x764.google.com with SMTP id af79cd13be357-93f3c8958d5so147596985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815621; x=1793420421;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wfy/Dgi5fjGlLZsGc2oTyiKBVR7PRiRybA7mxzlJisk=;
        b=RgYZ6jW/fcTtz7QcM6ufE9kewv6GNjo70ugjXaQeQOWoDW/9fjrMukF1UyV9ikDpiX
         5BUzj2FlgqCsMzKXXZ53+WlNstdCrAyd0ahVT0meU1Qd7yrRKsdqNc+87X4ujlO6mbS3
         ApRmzykg+ExQJ147aCcdKrjY9OXsB/srVmsBI8dG6X5LExV/WTD+iRefoLs0eyF4aSQh
         efKfVNzGKjkvI+/ftjHxkoZOXq+7elLhfnjgOwZ9ns1Isc73+S9DHx8USc7PQBYOzwgi
         NWoHref5Z8fL8jUBk7+nGQ3D2METQXJaoWI+gFlncFXf10jTvNi8aUoL1ETlPsSJJtOT
         IHgw==
X-Forwarded-Encrypted: i=1; AKwUvBwrg5wWmNX5DPHkOOckuf9Gyhw5sG/Bf41KROLBVn5xbiTSDrW4XDFAhTfGi01Ekkkx2zUA8ULxYxX0wbF5uuQE@lists.infradead.org
X-Gm-Message-State: AFq9FYKfwfH0P8maZFhZzRSU2ZkQ9Lme7gtJOSkwvhW1osiRdl7dXw7A
	9YcWVjS6HRdza0DayjUO+IfSWcjr03uHCHnDvD77JzB4lKFryZ9LWe84HlWGKpyz7Mi8gyHlfk+
	7hDtQqv0GCnctv9uWugq+f4P7mFN8/sS/As8XLaAVDWvKBpSCb/PoXhcHDiQ9vp9xBnwE6In5W7
	Ya0NGQ5vlMyvK41NF+BIY+hJnOsCEnmD7wf1EOJ+RkHVxWuGEZQp8wKxF/V+9hFAZh9WvVyPhPy
	5zRdKX6njGYK+oq0bk64Ex0t7JxWX4=
X-Gm-Gg: AYBFou3yfO3G3smrXFGVEz5BAiMx1QDmM1QSOsdquKy9oIA4uU0ENI//nJ09xb03B6d
	orDnkub07V+tIpmWPsW2FvRg7K8i3k8WU0I96WUsiyI9M0fTqOkSwUST6INX7J+P/0K7B9ami1d
	YcyQ5AvFTYY5zAKpEMVH8dCVzRoJqCHcQBhR7OwqmPV94C2w5S48DKX4SrwFxxgW7G2fLjptmNh
	fNaUgZUKuxHZ20Ra9vTdF55drtx25tQFCL94HHuOunzHV7BzzoBR6Px3ysOTPoQaegmjpyeri+M
	1Zi/Xk1Fr+P93DZhSRnVjU2+7Ku2xnVbLB3eky8NWENh6l4wvomyOrd3fOHkHnEWWQbFGSASeSJ
	OH3KxkRXCMet14M8yd+ktm62EpnsRzG3Q3FS2BQmoTcaHlOWm/XHo47eulqshRoLzHzVPtVu1g3
	zef3ZXDYEQ4SpHNXxzboWKPR/fPCybAX97fbK5aNI=
X-Received: by 2002:a05:620a:f06:b0:93e:4c1e:cbbd with SMTP id af79cd13be357-940ef91310bmr150466485a.53.1792815621043;
        Fri, 23 Oct 2026 21:20:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f0a75ea7sm13520885a.16.2026.10.23.21.20.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 21:20:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cd41e7aaso24513327b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792815620; x=1793420420; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wfy/Dgi5fjGlLZsGc2oTyiKBVR7PRiRybA7mxzlJisk=;
        b=EBhIiLfpDQlLT6ZrcZYPWlu+ZQRfBHdPXSujer8y3n7j00JPzHoTMFnLy+zhdiAnMd
         Q++ZPhMMwFeukr7ssVPYfZWSRxfByweaBZwE/ge6Jo46htcFLQxHY1+9CCzzUuQpRElJ
         U6FaxpIxCqk0qHt9j9yZLuc6R2F4OQgXmVm9c=
X-Forwarded-Encrypted: i=1; AKwUvBzwu69c9aVn6Bqh8htDUgEqgHBrPwFEVnRyi8upxSFYde+Cv/MLgwi8E+bR9dyiDskaIlVQbuE6J/e0zu/6lmtw@lists.infradead.org
X-Received: by 2002:a05:690c:c18b:b0:8b0:dabe:cf3e with SMTP id 00721157ae682-8b166c3b836mr6714237b3.49.1792815620250;
        Fri, 23 Oct 2026 21:20:20 -0700 (PDT)
X-Received: by 2002:a05:690c:c18b:b0:8b0:dabe:cf3e with SMTP id
 00721157ae682-8b166c3b836mr6714107b3.49.1792815619878; Fri, 23 Oct 2026
 21:20:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org> <20261022141541.GA1009304-robh@kernel.org>
In-Reply-To: <20261022141541.GA1009304-robh@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 23 Oct 2026 21:20:06 -0700
X-Gm-Features: AclHuK-jY5nZlp7VXKmAqElNTjaLuAOJrGGwfzJe2sRdomHsXRx_zZwJG5LEvdg
Message-ID: <CAHi4H7FpJJs0FqfCV=7bT26J642JTMgJ860hsDezKRET7q9TeQ@mail.gmail.com>
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
	boundary="000000000000351c53065e8e6a7e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_212022_729528_1E41B21F 
X-CRM114-Status: GOOD (  25.69  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000351c53065e8e6a7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 7:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Oct 21, 2026 at 05:09:52PM +0200, Linus Walleij wrote:
> > BCMBCA systems booted through CFE can release a secondary CPU by
> > writing its ARM-state entry address to a 32-bit MMIO mailbox and
> > sending a wakeup interrupt.
> >
> > Document brcm,bca-smp and its single-cell cpu-release-addr property.
> > The boot CPU does not need a mailbox; secondary CPUs do. Add a
> > Cortex-A7 example showing both CPU nodes.
> >
> > Suggested-by: William Zhang <william.zhang@broadcom.com>
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Document=
ation/devicetree/bindings/arm/cpus.yaml
> > index 5be89c584026..6771b85f757b 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -255,6 +255,7 @@ properties:
> >            - amlogic,meson8b-smp
> >            - arm,realview-smp
> >            - aspeed,ast2600-smp
> > +          - brcm,bca-smp
> >            - brcm,bcm11351-cpu-method
> >            - brcm,bcm23550
> >            - brcm,bcm2836-smp
> > @@ -471,6 +472,20 @@ allOf:
> >      then:
> >        required:
> >          - secondary-boot-reg
> > +  - if:
> > +      properties:
> > +        enable-method:
> > +          const: brcm,bca-smp
> > +      required:
> > +        - enable-method
> > +    then:
> > +      properties:
> > +        cpu-release-addr:
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          description:
> > +            Physical address of the 32-bit MMIO mailbox read by CFE af=
ter
> > +            a wakeup interrupt. Required on secondary CPUs. The kernel
> > +            writes the ARM-state entry address before sending the inte=
rrupt.
>
> required:
>   - cpu-release-addr
>
> ??? But cpu0 doesn't have an address. Is there really no address or you
> just omitted because you don't really need it. Should still be there in
> the latter case IMO.
>
> Alternatively, add the enable-method value to the existing section that
> does this. Also, there might be other cases that are a 32-bit address
> and need this same constraint.
>
Cpu0 does not need release because it is the boot up CPU.  But there
is no harm to add it to be consistent.
All the BCA v7 chips only use 32 bit address for MMIO register.
Otheriwse,
Reviewed-by: William Zhang <william.zhang@broadcom.com>

> >    - if:
> >        properties:
> >          enable-method:
> > @@ -712,4 +727,25 @@ examples:
> >          cpu-release-addr =3D <0 0x20000000>;
> >        };
> >      };
> > +  - |
> > +    // Example 5 (Broadcom BCMBCA with CFE):
> > +    cpus {
> > +      #size-cells =3D <0>;
> > +      #address-cells =3D <1>;
> > +
> > +      cpu@0 {
> > +        device_type =3D "cpu";
> > +        compatible =3D "arm,cortex-a7";
> > +        reg =3D <0>;
> > +        enable-method =3D "brcm,bca-smp";
> > +      };
> > +
> > +      cpu@1 {
> > +        device_type =3D "cpu";
> > +        compatible =3D "arm,cortex-a7";
> > +        reg =3D <1>;
> > +        enable-method =3D "brcm,bca-smp";
> > +        cpu-release-addr =3D <0xff800568>;
> > +      };
> > +    };
> >  ...
> >
> > --
> > 2.56.0
> >

--000000000000351c53065e8e6a7e
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
yE1uKKhIB+1cliMBryxLaNqQHWo1xv870+ijNmDpHAcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI0MDQyMDIwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAFASKg4I1vOxjgervq+gnt4jNFUNpmfM29PIo
cGwHQQbxZ+Pj4Ic7nnp5cwEgKGbzidc1ViqczAKYCyniOiJ9KWMZdZrmnX2cK1pW4IVZ3NDCoZD1
kiGy6vDqmqZrfRYLgULNwv0scnGg7DprQPJOc12XUUgM/zAVArazjfNWONexFiLtG7JwnZtrUah0
YVyWR/yrdj8gWwROSJGnToC4o8+5+AOcpCmBoUJ7koiC14kyvMjqVScuH+zDx886CxXfPkGWLc0F
uNXMor1GbCeqVqgVgl/y9Zu5+vujBJZ6ZEtGjk7uld4Nfou8hvw21PEiVNMUGVxom96IPmlLK9we
uQ==
--000000000000351c53065e8e6a7e--

