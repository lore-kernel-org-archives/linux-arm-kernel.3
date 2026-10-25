Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A941606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GmQ92hiu;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WU5PGFw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xeNgIBdTUN+2MjEMWBP45WMMIWNMy1vzAYoyYzCYunM=; b=GmQ92hiuUEwDZELU+f0PFgD02d
	pBdGTGoF1491KeYcIifzzFLk2R/D+j7bWcdmMrWqCMN6HViVd+qgJglxraZ3x1N21X9wCaVNtC5A8
	3Of7iw5EJrIKT1Y3RHbR31Tb7BdNfZgRPaTQO6ue1NHb6KwjYNeI5ctEeNd1vQY56HkVIgPGbFqwa
	eK2LG2S3W7LhNaM6XHjcZP1t7R+Q9lDKcIWTHb5ZB0fQq+jeVvBrwu8v5NB1MSYJQHyrENVOSM650
	wBRFeYx2OyfgZ24Nk42z7pizpxp8P0R8yyyXQK+vsYXPKDgvtYfJJMwkOUXiriOIsG/uB/3lc0KdJ
	AZe4UubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2Xy-00000001HFb-3yWd;
	Sun, 25 Oct 2026 18:02:18 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL2Xv-00000001HFE-1ptP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 18:02:17 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1657674a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 11:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951333; x=1793556133;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeNgIBdTUN+2MjEMWBP45WMMIWNMy1vzAYoyYzCYunM=;
        b=TYWAAbbEqYM9uNpxsaSAims+7+rH/QFSE1EELx5KFNcjOW4oysoh330SJTtQBzz9YQ
         6rILRW9YMjdihqDeGMSKx1Hv60VxeJPnfpIrHqMi0yHYIkh1WoH4eeg22eLpy+xzaiq9
         Q8FIQsRFj8jAScqPKTxq/NMoTQqS/wCvIQujCTSCJp8l3y+q9FN7OrXWqTP91bEmAn1E
         KDWa62AekMXKOi/rD5pVQV/5S0I/9lAXvc0AdC06YFY8fIk5AyVflosFmzxtD2F5AO4o
         YUNa4kjjMII5m9J5kialj5zX6d8+h32HEsLTk9E4U98fYz3TE0CJ8XrqrHmmuF7SwQ0Q
         bQ7w==
X-Forwarded-Encrypted: i=1; AKwUvBykyCj4IqOR76TUPCfdfxC4lDGL5iO2P2L4cY+MME/Nx7h2fYbBeHczhowslvc7YQQrEcc68f0i88cuyiqBLDPs@lists.infradead.org
X-Gm-Message-State: AFq9FYJW/nt9cRIJlb4veZeRUE5KfBp/Evxqt7yI3KzAAgbMFGD7bjDk
	zNB7kgWhPA5+t+hzByvuHrh3ZGDreEpfUYZWBSJTxTOwS78IqnYnI/cM1PiPlmrtJbH72vZ6Q2o
	A8y6SPWzCCcSls+4IDBZ1OMV/109vm/c5WEzUoAqVbMhpcmHRsnPhfa2xWeXoFzBq4zoNyEPvCv
	PdH72JyQTYXH+m7947oyE3Hy3vCpQMIugw1mflNaadM2XC7wHLlHEHIYBRJ0b2ojS8B8C9Q3PsZ
	mWxYsOGlMlcxun5oQyoT0HY3OGKYFI=
X-Gm-Gg: AYBFou3MtJL9p5FSgJcerCDV1n9mYg5vLfCnRIZidtkCTB0dPofwXvxPEAe+eOVuLG9
	b/Kwgut7e2+Pvmw0rmgp5VZEAOALKhPB4jMtPtVdIe7rt809LHwRj3Gd33x102Cj9ZHxinjKxSU
	BsSo5JMlMjKjgoPe5g1wUugVnDCPMXat5KiMI8qbW3uuEd9IRvRrEnHjF9jK7KS8vf3LKZuPDjU
	OS4muVLQB855ujgBzF63tz6aYp5VGDVHFrSo+rSh2izKMjoJJlco7kM74vWbh6pX+FmvWmEP2tp
	BxLmFighfVAqwi4kmm7uCLun7h8EcnsjCcfiqUSAkbSjL1au4A3WhTpJBBa5y8AbbHw4HisBGdz
	pOPxTthIWv+hVeMaM0Q4ovDx6NQwRSn8Sm5KQVnWBwrAjPbFKH8jhiuZNP5y6jIm1BFqmQXsv5n
	6xMtA32pbmVwgfW4flGaLi4gRDNltabH+uHjKC
X-Received: by 2002:a17:90b:4b82:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3adeafaeb96mr3730217a91.30.1792951333266;
        Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebab0050sm4539870a91.0.2026.10.25.11.02.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Oct 2026 11:02:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0cfe694c3so34066137b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792951331; x=1793556131; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeNgIBdTUN+2MjEMWBP45WMMIWNMy1vzAYoyYzCYunM=;
        b=WU5PGFw3AmgKwk3onMSkWSFknWaOQOVZZygpz1X31sqUe3HZhfbDwVlji2JKm3GbL5
         Pcfy0Gia3uRmD8TvdWsQs+3/EbwAQqDA8feBXRZdWar9ue+wvLoNcOvAznwg0nPKm2Tn
         XQddpR8mjsA8Upiwf754sD2mPI23C0b94y0G4=
X-Forwarded-Encrypted: i=1; AKwUvBwXOTX1lQUBqXcU4EnUCZHJqHdHk1JRRCeiEEmlPSQ0Jh25t1f1eC9qF1ApMu0t43WWhPfENleffanNIRhBWpK5@lists.infradead.org
X-Received: by 2002:a05:690c:a049:b0:8a8:6fac:21af with SMTP id 00721157ae682-8b166bb1b72mr32998387b3.12.1792951331514;
        Sun, 25 Oct 2026 11:02:11 -0700 (PDT)
X-Received: by 2002:a05:690c:a049:b0:8a8:6fac:21af with SMTP id
 00721157ae682-8b166bb1b72mr32998247b3.12.1792951331097; Sun, 25 Oct 2026
 11:02:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 25 Oct 2026 11:01:58 -0700
X-Gm-Features: AclHuK8rfjsuUuTtax2EzpPwPBT_HGupltjSO26Jb5KPBze3R8Wiep0HEr-GBOk
Message-ID: <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003dc6ea065eae03f6"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_110215_509532_338D4AF1 
X-CRM114-Status: GOOD (  24.50  )
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

--0000000000003dc6ea065eae03f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:15=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Starting Linux from CFE does not install a PSCI
> implementation either. The working PSCI interface in newer GenXOS
> firmware belongs to a different boot stack.
>
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Set the CPUs' enable-method to
> brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
> mailbox in CPU1's cpu-release-addr property. Set CPU0's required release
> address to zero since it is already online. Keep both CPU nodes enabled
> and leave the SoC's PSCI defaults available to other boards.
>
> Also remove no-map from the secondary-boot reservation. Its overlap
> with ARM's initial page tables otherwise causes the reservation to be
> rejected, leaving CFE's holding pen unprotected.
>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 18 ++++++++++++=
+++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arc=
h/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> index a3616fb7b3a8..23145440e7bc 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> @@ -34,7 +34,7 @@ reserved-memory {
>                 ranges;
>
>                 secondary-boot@0 {
> -                       no-map;
> +                       /* Includes the kernel's initial page tables. */
>                         reg =3D <0x00000000 0x00008000>;
>                 };
>                 pmc3-firmware@8000 {
> @@ -56,6 +56,22 @@ button-restart {
>         };
>  };
>
> +/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
> +&{/psci} {
> +       status =3D "disabled";
> +};
> +
> +&CA7_0 {
> +       enable-method =3D "brcm,bca-smp";
> +       /* Dummy release address since CPU0 is already online */
> +       cpu-release-addr =3D <0x00000000>;
Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example.
I guess it is better to use the same here to keep consistent, although
what value doe not really matter.

> +};
> +
> +&CA7_1 {
> +       enable-method =3D "brcm,bca-smp";
> +       cpu-release-addr =3D <0xff800568>;
> +};
> +
>  &gpio0 {
>         status =3D "okay";
>  };
>
> --
> 2.56.0
>

--0000000000003dc6ea065eae03f6
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
tmCWNYNIduEXBVtzyVimFhr7elXjL8z3Gek0dXVrsK0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI1MTgwMjExWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEALYnHLeCUJeCTJXjGWSEIVUzIAtdEIsmKlqK9
tQjP92tlO/69eDcKJnXCblEMRVnSQ6I51bFY7SmgiqkISJcCXEd1x59XyiO9yfTcYHNpb26E0h4S
gGP576+ZPfzCyJ1qIKPTWxjhZ5X5PPY3geuF8IiQty5tVKlRR0gx69CaM4yXsUXCpuu+nVVt3Oiw
DEZS70dUQh3zmu3PXY5kYJI1AYJiYfcWu8HE8tkDLmgVVZBoDMTuGIWN3aXbUDJNJb2NXhxTjOYo
jCJV3e81pkK5SGSlM2J9Z0QCGqTOQuYkg4/f8/9XsR+VqOshxt9oRPheZ+4qUHcrunBdL0HPkR3E
qg==
--0000000000003dc6ea065eae03f6--

