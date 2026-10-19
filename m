Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEC7CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qp3WrYM/raWXUiCMxqKdJM5s3bOMYKHwjEfwLUzTVwM=; b=KFSpOF1wgM1MlO0vSKqs36ITyZ
	Nglc4PmBfFkOhkOETqkZOGf0TPQKbp4sRmIdvzhZpq7o4mI1KTc7H5Tv4+K0gqH79ei7pIkBBzs7v
	Qgx3iXSgBMQe3y1//om/4Ym97HaNPZhXlDa+ZjOClCzZU5GwXx2KezubAuXKAeI/wkf6FZXF1uOnU
	wJGX4SefJ4UGMpUF/g9bWKPkaZ4o4BKA4X0KXoU5beNLIwMfk3KwTyJxCgKcAmBiKFsr5m1/PTNoD
	8Ffa+jQ7kWumplTcsJ1Rmi6+Shy+Szq0cB0t4/wChEUg66kT6s4iV3/dgQnYfq4pb27EAXY9OM0ch
	azHjZBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgGX-00000006esE-3WyY;
	Mon, 19 Oct 2026 05:50:33 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgGU-00000006ern-1qVI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 05:50:31 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so726291a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 22:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389029; x=1792993829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp3WrYM/raWXUiCMxqKdJM5s3bOMYKHwjEfwLUzTVwM=;
        b=kp8pw07DnVve/l03dflrX/AIAZ8W37qU7gcIFyYOh/FL1StgLB7Mf6d0TjtuSlQN5A
         iLdwg2Vwwg++H/ogek8+O734/FrrS7o4PcXyu8jOy4W43bBeUNwjn8FrvfyViVa5Tqcu
         RkXotDopckL7G6ecUNov2lAgeQmHIt1Vzz+SdPpjNO+dpaTTvo6aOK9ctMjlrNUeF5Ic
         Pfu4+HmPIG4ar4RppmQ4pb+8fDLdhSBoZk7tWyMzGY9u7f+txKh5TKb6cajHDjgc7AB4
         +oMU2h+owhCIhHiuDi6SEjsRO3RFPuhNaJttPNc0XYE3DNEEG1ZRz5sLkBO2vDbp5RrJ
         60PA==
X-Forwarded-Encrypted: i=1; AKwUvBxks2/Ma9dN2Ucs9YmG8rU1ClOdQGn0ykdMkv+vBcfn/pA7n+GPBWZly+USVUJJMOD8xXcGPU5gjJKXKjs3Yc8s@lists.infradead.org
X-Gm-Message-State: AFq9FYJcYrWiQCS6reNvXHvKuAd1AtvpA+mBavNetFOW/e1wlPVIkKSe
	RsafaK8B7EWtsmpSY4iGgTUlQME6M5pK1vN+qQqR6fW5c6J9BqfWDX3QnORpZYN4UHFG0mSwBMw
	qWYlYgQZieqgQ0WFy6bdoj49FujY35+Fav31DGxiikyq1eka8eLEr0A5CN4XRtpzZoPjUQ5eNmA
	kwUk9V/JEukXMtHrOa2rEAZBA1zZTPRNwmivSgubD1UEb6GgRXU74am4/+AMilhJ8QNW0lHEUJ1
	uxgTerfoswF48dzs5LulOumpWCF6kw=
X-Gm-Gg: AYBFou1oCtUWHlmJpRUPZolGS8ZuwzHz0271vhgjgxeXc3izIKDV84cvSifqhEM0irJ
	WENWhu7dWD74CTVXNF5llrRzbqiGfA09DNxhh+FYkQq9YhWnzigsqvDNxKfw72NjR5HfceWhVLQ
	kX29DlFsFsheB4eWq+f5PVefTi9abGw1ya3mP7RFIv14MY+0QfMu429ZOJuCWc5mlfxrYnCIJbb
	M4gqu2tCtv9sRaxvmOEoDYWY6rnMSH/Ext+QVX4f2GjtLU8Mqb6BFnbl5B2OWFznjQepj8fjoQY
	nEqq6UfcA/gyKx6l9Q/BBZwM4Oz1kRDLloppLTdQOgR6GrHc3O8noBLIjL0d888hmt0Olhmun3n
	wmcCDAAtNLrcwIA8efDreZul2MDmX+2MMvhI7GzP3coa6cKWzOAxZ+a3uJckJSdfxBlO42h9t8U
	Ekk3EfpPHFOIexN8UjU8GnLgfkPk+/Tjg6LsKCrXo=
X-Received: by 2002:a17:90b:4fc8:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3acef4e49c8mr5192561a91.45.1792389029109;
        Sun, 18 Oct 2026 22:50:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3acbe676751sm7058818a91.6.2026.10.18.22.50.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:50:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so20344467b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 22:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792389028; x=1792993828; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp3WrYM/raWXUiCMxqKdJM5s3bOMYKHwjEfwLUzTVwM=;
        b=WnqNquQLHC+EQ4gJUh278paiQHbwyp7QdNos2nHHsnB3/AD1Z9PBYhAE2CxUTiwEKj
         eQZRIMJ9fFVbI+pFCaTQRytp8NmTmnldQP+bQRIhl/EMrFpknmUv98Kag/hU37Knz+Ob
         z6sN4kg1BsEjTjXCnICSbWewzzD/VCjq+r6Ik=
X-Forwarded-Encrypted: i=1; AKwUvBzAOS3qkLlGO7nFSURY653RA3sY+X3XNKBVqDH5UGwQr8YOccP74ZtgtiHFb/Qjwqf4/Z0ZTlKatugnPJ0XX/ib@lists.infradead.org
X-Received: by 2002:a05:690c:e652:20b0:8b0:e479:6872 with SMTP id 00721157ae682-8b0f2141a92mr17464297b3.17.1792389027962;
        Sun, 18 Oct 2026 22:50:27 -0700 (PDT)
X-Received: by 2002:a05:690c:e652:20b0:8b0:e479:6872 with SMTP id
 00721157ae682-8b0f2141a92mr17464237b3.17.1792389027603; Sun, 18 Oct 2026
 22:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
 <20261017-genexis-xg6846-smp-v7-3-rc1-v2-3-bf6b4b374b6e@kernel.org>
In-Reply-To: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-3-bf6b4b374b6e@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 18 Oct 2026 22:50:15 -0700
X-Gm-Features: AclHuK_AxqoqkS9ua00ouk5-FM2VhKTN_3Uc802AZQ2dnY-tAweA0pfCXTomozU
Message-ID: <CAHi4H7GG06=9sP5v0XKVZHCgtrYsuGKBErPMFO2R2GktEgRxig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005488df065e2b1751"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_225030_488725_E59E0D6F 
X-CRM114-Status: GOOD (  20.78  )
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

--0000000000005488df065e2b1751
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Oct 17, 2026 at 12:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Chain-loading mainline U-Boot and starting Linux with
> "go" does not install a PSCI implementation either. The working PSCI
> interface in newer GenXOS firmware belongs to a different boot stack.
>
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Remove the CPU PSCI enable-method
> properties and use the board-specific CFE SMP operations. Describe the
> CFE mailbox in CPU1's cpu-release-addr property. Keep both CPU nodes
> enabled and leave the SoC's PSCI defaults available to other boards.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 14 ++++++++++++=
++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arc=
h/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> index 6cb221dca0ac..1b85e382c70c 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
> @@ -56,6 +56,20 @@ button-restart {
>         };
>  };
>
> +/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
> +&{/psci} {
> +       status =3D "disabled";
> +};
> +
> +&CA7_0 {
> +       /delete-property/ enable-method;
I sugguest to override the psci enable-method with
     enable-method =3D "brcm,bca-smp"
for this generic bca armv7 smp method.  And you can add this smp method
handler in board_bcmbca.c (which you already have the main implementation) =
to
make it work for all future bcmbca v7 devices that do not use psci through
this dts setting.
> +};
> +
> +&CA7_1 {
> +       /delete-property/ enable-method;
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

--0000000000005488df065e2b1751
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
FhnNMKcweXJh1UhrXjAjEhoAVXl8TNyjd1WJ441IhkEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDE5MDU1MDI4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAV1XXNyX2yTMiINESEF6rLKstmyOp7J3NB0GO
J9e2+NKW23Pib7Ybd7lkubarWGw6EThdyWSAK8jnI9FmaxVfCnXYnAZvg1h+A1FpTOs1tkdMiF0c
jCT9G6+gMUzWuUbCszTJczd1qouZt3+dJ1Hjd+S98Bazgm2vsGGZoDlfnFTDwlOjwN7fuwz1olOH
kog/+RPo3ALI8ndupP4G0nw6apYM0uNcL82SdJUHo783pa7RU52QunjqcG/VKo+Smfp0wZi67fQP
4A1wCs90HTBr5Ns3ynhf2Up4zWDxrOndhV6n7CUFD73mLF/aF8Msr+/MoBYW1t/gcMeceITzLO9V
MA==
--0000000000005488df065e2b1751--

