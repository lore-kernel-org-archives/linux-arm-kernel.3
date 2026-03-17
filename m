Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216EFB5E97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usl/fK8gxvCxMglb5T4eUiRCfevRhmOiVpFUAC8uJmU=; b=O3obFW4P8P3LkVGA/DZSWu25Dn
	KT6Pgn8TYgYQkEn35lx4PAd+I8RbpyuRmMcr3BkkQuJvzLp2y+u60sLkgCjQz5cvNeVsRE9sdduQ+
	9DUUcx5rNLUZdLulYNPl31YXwKmvm/nlX5eW9BdHzJvazdPLUzd4iMPlCFZYra9dBIH6BGlPloxby
	uyJGAv+Ly/iGm+OyQZms/EyZUuxZVUXSPk2sQxEDZrDflL7xar7TyLBrN4NQPM+61ql3/5Jqf2HH7
	5YXZZlXsToNkcRllbI+fGG0/lhTcFOvPcUA9o7K+AXNJS9qcoRfomCt3bg5jvRUvsSC77QLP40swt
	Xjz/zTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JL2-00000005Buk-27pd;
	Tue, 17 Mar 2026 01:35:16 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JL0-00000005BuN-01BT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:35:15 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2b042533de1so15341255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711313; x=1774316113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usl/fK8gxvCxMglb5T4eUiRCfevRhmOiVpFUAC8uJmU=;
        b=VZixrmBtCVlNIp9XDY1szoPCZWfGOICvG3V9iwkN6Iwv/akYMKPo8fUak/mqOMn2ox
         5eOCjaa6+IwZkrkVaDPK6uphnv8KyoTlYtA5+GEkTQfoPGcnBzRkyhx+BGo2Nl18Fn09
         Klr7a1Il2F2BAvv7GWWfysSLDLMHjc8+QfXwjq1FGRoYDWAY5Ih2utWStOY2wpbc2qPn
         4xKS+z7jSvzGDwlPXgWaMUQzAkvsPurutRcGnlX1hCKez3/mkQhyumMjOfaVlcZ2Ft86
         GTTFB3ZCp/w+KgKNo3iLTMPAl2EGIydG7qsMAxaS9sTsyHLM/3UvJSyFs6qmQW5Hys2n
         avIg==
X-Forwarded-Encrypted: i=2; AJvYcCV/JSUxvY4bSIu9AKQL5XnoypBiNF8IvDYACMqXnYJbJCmsBz2jNJ/ptW/CGEK+XCecf71t/x/mBGOAVfoPKNbi@lists.infradead.org
X-Gm-Message-State: AOJu0YxWkEjKoQ1vQhaqdN07Gyfwlql63FiJnI4MEmXByV78otyPFEzS
	IxagGCQQ9QlmDqltTlR9UiWY5lsWrq0sPEuqBbSYTrKZRO/Vz+0qN3UcEr6rkGOjy6Lx+PbGiZW
	hyo4fnIdac5L19rl3snn8POvxZgbnLjAUwWOz+e9vSP0jjLF+1TRozLMisov8mRKb6/V9iL6AQ0
	lf5ks1lQLtdOsaK2z758TNdQE7WOu4haEXJPlLDhi/MdV1kyL7aC1tEPKOTNQWWidliAN4SPPzT
	uw9NaZQWSRl0gF0oeohqg9h2mGp1Sg=
X-Gm-Gg: ATEYQzwnsxG4ymEbxsCM26cbt+y+pUGsn8iFrdiLfz/Iq7WMttHN/XuZ76oYSX5iQkp
	NewqlQNp3gp+Cr1r4DA9/kTSHI9Oypzq8ZumLnjqgiHK7kiWBjKtOMRIlzGc0H4GPMBVb7O35/i
	pKBXIYAGO52AygUyslLLa4CD/3AkVldGSocR8vcxSwq4DIxKKxlCGxcjLiUVvf+PreOjZFoMCIQ
	GsTbEAjd7He09s4EE9oNy6R9/mMtHsoSix/owP7NWIJ46lXk3SZ8BTOJUHOgHj0XwlSK6/SDnWv
	0P1sE3ktzsuuwL5sKlWtoJyuK1AzqhrDa1GuZz2mJCYPuwBOlOAeP9nbHC5zetjhgOwy6FAzWhm
	UVfAMKpRCe86JjUDxG9hAYCzVuITwG5ZXuGj3Bp0K0EMAYfGcQTZ8ea8qXHKh98BJt8393FjvMt
	AODWZ7wjj87WEd/MWQSnADc3Z+IwrQZjZ9YQckDAca93gvkyAqcrmpZsmwaQ==
X-Received: by 2002:a17:903:3d0d:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b049e69b7cmr86482695ad.37.1773711312708;
        Mon, 16 Mar 2026 18:35:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b063e72228sm1486525ad.11.2026.03.16.18.35.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:35:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-790afc07667so108075467b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773711311; cv=none;
        d=google.com; s=arc-20240605;
        b=PUNSET0g3a72bArHe5RXItKJKsnDhptipiWYwsx3AqtMC9CSs3GTCsGBS5vyUVivPE
         SF7yZCV2B1bvB+MBTNKdXICpXxaMiZFd+Hgvyt5Uq7pu3GkS40XnjwuruR8hXobeng2f
         obt0EVcjhkI2vlX8RAoRMN4GMOfg+BUmXRX8wjGzIq6A60P+zKdAWVpBbw+WHrn3dxLw
         TpsJXDygZ3iJHUQJ9RmO/3XUri6e1xs0TjcxS/+ufG1VwXO06hMRipnrQDHqZUNubzvj
         OJ6A002bra4BSiUT/QNcfroSYSfeoWgalVzubpX7BiwxmbfHNDUoRFm3Js5UIp5FfB9X
         TyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=usl/fK8gxvCxMglb5T4eUiRCfevRhmOiVpFUAC8uJmU=;
        fh=52lRyS/TktVBQAbWhGHXA2JaqyUBEI6obXA7eHlz7bI=;
        b=XWKZt0JxByU+dpxYv4FFzxnM90RLVYhZedYo5Qw4VqgveK1b1cQu+axEbprECNcWwl
         ZtOMWvrnjnxGIZ2iPxi4QzBKkNhJlVuoG2Wbq2/x2Q7oIkt8ECW2CZuctBfLkJEtlttf
         wEwi+hEh6kArzO/HXxnrwYOGulYYE6j9CGIdSWx8T9n+RijPKaE8YdRWjkmCK3H1ES/T
         e3hXbg04SdEgSK2icYIhN89OOdz0frvms5GO9Y21ko5isfZanUIDU+93w6NpYMi4KJ9o
         MNbSJ+GRLXKwuWxItedUqCQ/J9ttGt+P838I+lIRDoEPBZtdjNQkh0sVJotm4UJmcHGs
         i32g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773711311; x=1774316111; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=usl/fK8gxvCxMglb5T4eUiRCfevRhmOiVpFUAC8uJmU=;
        b=Ro2AdsrSbGrSS5JXx9TQRjnHdpsxBbbPNUwTPKR4SuvJBf81gZUfjq733E0KjoEToY
         ebLzycihHD9OmoNdB8/ftBvYz0cQxPg1VnnxZ8Iowzwhr0mgWbYwQTokt0qC+YTBVr10
         j1H7Ra1pWJBC7sZEDc+S2KADwrHpo0GdK0UdE=
X-Forwarded-Encrypted: i=1; AJvYcCWDywfPa7i6OBcjKDSfboguoq1C56+d52BQ/pFYwdglbC+urngmU8L4bROhi7YrohLpemDpJiV4FeqNhRN1kvhi@lists.infradead.org
X-Received: by 2002:a05:690c:6186:b0:79a:55f5:a3e5 with SMTP id 00721157ae682-79a55f5ef2bmr40803717b3.17.1773711311151;
        Mon, 16 Mar 2026 18:35:11 -0700 (PDT)
X-Received: by 2002:a05:690c:6186:b0:79a:55f5:a3e5 with SMTP id
 00721157ae682-79a55f5ef2bmr40803467b3.17.1773711310692; Mon, 16 Mar 2026
 18:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-4-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-4-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 16 Mar 2026 18:34:59 -0700
X-Gm-Features: AaiRm52EMxwOqkczEOjCQH7I9Eu1Wvrw4g1q_WPO8dOzdieVrF2QaJ4AIibVCSY
Message-ID: <CAHi4H7HwpJLkm_1GdWX2Tm4NqYc0uEs=yFqPEZAC+8hsbfNaKA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] ARM: dts: bcm6855: Add I2C bus blocks
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a7d622064d2e5840"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_183514_081867_767C77DA 
X-CRM114-Status: GOOD (  18.01  )
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

--000000000000a7d622064d2e5840
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The BCM6855 has two brcmper I2C blocks, the second one in
> the PERF1 area at 0xff85a800, this is covered by the
> current bus range.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6855.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/=
broadcom/bcm6855.dtsi
> index a88c3f0fbcb0..b3c4cd24ce53 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
> @@ -240,6 +240,15 @@ nandcs: nand@0 {
>                         };
>                 };
>
> +               i2c0: i2c@2100 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0x2100 0x60>;
> +                       interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 leds: led-controller@3000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
> @@ -278,5 +287,14 @@ uart1: serial@13000 {
>                         clock-names =3D "uartclk", "apb_pclk";
>                         status =3D "disabled";
>                 };
> +
> +               i2c1: i2c@5a800 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0x5a800 0x60>;
> +                       interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
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

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000a7d622064d2e5840
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
klfNO7bdKWloQipVvDDydARDUObxni77i4EXWKzVlxwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzE3MDEzNTExWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAYjnyXxB+jrKa8NG3mrWShBUpnTRlssMAdwM3
YDTMgpMjieCJbuqT0+7yk9AfU6c7b+iwaiz0LIHYeLIJlhdLlmjrdH3pDqcZiUPiYZxNCiV0A5h/
8Hg5kMAKIO8x2klKhDKnFB14oyEu7Xey7xTno1wOzDiyawJAajC4RxnLx4bYFHdiRo+dRnquDBf2
a3jU40w00tu6O2v9fJoWmplhXfXQuXbkd9VLqNA3MAnIuiexd+4+VZbU4J/59DyeiuDh33M4KXOC
q7GMoRTll9Vfwom62mR4yVtLDMBU8O1CSlVI0dcfsYEb7F7IgWbVY5XwPzGh3JR5nRbvwUzax0Ly
sg==
--000000000000a7d622064d2e5840--

