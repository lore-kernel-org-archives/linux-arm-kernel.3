Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A79CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SMRd8ui2RVo/n8+14kS4qbTwd0kopPKwrO7VA9ykZA=; b=YFZG7e/J5IiqTSL/PgRV1j6jh/
	qGPJaeq8wXOeCJdSgRFKZdJkD4GeyeExfANxC9zuHk7Ow0fMd5AviFy/BxLN49jdUgLlbp86MNO45
	5M1Xnk5iPZAsKhtfC7mB0b6DhxxFJ45kzndNVHPeTLp1HoDC1vMsD4FIuZH/CotMv+nXVh/slC+cj
	xjWNQe4MuvDf3FWaugTJGSfUdjsfD1WKngv7wc/d+hHYf/A3ZPJo4R7KyRGVPUmo+PatoigHgm4l5
	mhN+QGEx0zSrJCFCOpQsuyuZEuFzCH8srW76IUroUe/kwBDIlY62vyzLhFT/3uJKxiPjg4YfDy+nP
	Jhp+vjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHU-0000000EaW4-0cBP;
	Tue, 02 Sep 2025 00:53:52 +0000
Received: from mail-io1-xd64.google.com ([2607:f8b0:4864:20::d64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utD5Z-0000000E82s-3t5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 22:33:27 +0000
Received: by mail-io1-xd64.google.com with SMTP id ca18e2360f4ac-88735894d29so47193539f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766005; x=1757370805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9SMRd8ui2RVo/n8+14kS4qbTwd0kopPKwrO7VA9ykZA=;
        b=D1atSwk4cTyRBCIhnxqZAMvl8LjzqyQO+oyewNxE9vHTYTj+jUu4ak3O5VuOOAUN18
         VeqAApnU5hnXexbi08nokvlvJ9zixZLmIVdcYYLqaq4YFanoihzGLbXr1inOKl7FkX1a
         9TzVgidvAlxTJ0wFIxUCOYJNtyu/Z/lpiY71cXLqxD6SmZktVWKXEj/BRrWQ9Oi0BclT
         xj106MTrb7jQ4vLGeP423E8mZ5VmMp/oGfgZ1p2klSSuPB68fnaB7TP67hDW7O6ip/2W
         ZvG3yNtUmXKcNb4/NXbdOXLALZTh5Bl2/zfZzu0xYdD/xhI8GExzE3bzQRShCm/+0JxD
         G+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXZLvNJXYvTjhDMeaisg0uo7leAEy7xNnvPPFS0rnKhY8CVWNz02IUeD81H48GOGQpd2GwzpPU9LN0G0fOqMd99@lists.infradead.org
X-Gm-Message-State: AOJu0YxQSsqwE4vTdQxXXIKjMK98/9xCXh4wkiaUoX4gI59U/8QElvHg
	HPglWNHmAQRah59cMxDQ2buVJH5CKjn1ocqbk5JZyMKtFKEVe0vwSyKc17ybGztUery0gZUKzRo
	7zWtpTalqD17+8tWtYmnpErdSaT0SqhvXWlMVQ0GZ15lBlhVbfU8CDrc7d+Wkt88m8rb6r+Y8tW
	3G1voYvKOoj4dnMEYngV8FZ8XHR1/io3MGky/wcxjzBQrYIrEYYZK3exXysg4uams2cZoHnUYfj
	rKszhZLs7OvUatv2dY4EjPeLt+owTE=
X-Gm-Gg: ASbGncvZCesNaXtS8DHiMxkU9Z/ZVi4ucfYMtiQGBf+mW8MYiXP/2+5OyFyLpGLsusH
	W/u0l/l+8EximkQrJ60EUqvU4lvSrSdNBiolyKNQlda6iKxHHU1cl8Vo5JJMJR3tXqXnFooJIVr
	d/rzHgki0yPwsy+nTiJbbZVATTp0xe7CMr9BYu/R2oyJ63+GhYxBdqBMYPoykd7Rrl5f7jnmxof
	jI7wVpu4xcFnxpaOTm5Syhq1I6cWxAxRNiO2ys3VMFeVZ+Q6aEeAl8G3KD/3YIyTyChj9rAsc5u
	2e/5X0IyRz1o6WJlO1FGiDXNJwQa0WkM507KbvLSF4YCkjiZl4qGFHTfLTQjkFyI4gK5YtT7k+M
	PvMGzA7+uv+hs8EGVAsY4HMPMxylZwziY7lkBue/eXcv6+nB9mtD9wIf9uAF3hBXoQZY5mBVd1z
	Nl
X-Google-Smtp-Source: AGHT+IFGgUXaIEW0miDcgEZanvfJiMLSbzaQZ5cTbbXgPzItm+hzPEP6Po26rqD/DV4itjd2TBuS6QU+tuLz
X-Received: by 2002:a05:6602:3f51:b0:886:c53c:92dc with SMTP id ca18e2360f4ac-8871f4e2dabmr1391362039f.19.1756766004712;
        Mon, 01 Sep 2025 15:33:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-50d8f2d6badsm414543173.35.2025.09.01.15.33.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 15:33:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7238c540fdcso13310077b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 15:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756766003; x=1757370803; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9SMRd8ui2RVo/n8+14kS4qbTwd0kopPKwrO7VA9ykZA=;
        b=DdyzsT+37hCEcsXIecbz3OXatcMAdzC/H1nYbjDNQBVKWALeppyouY3Vom5lf1yOkr
         Jo3aOXyFGGt6iIA3t/G7Db/SFvMVoayz3I9tGD4lnmhM5D+M3MiGj98Cax12kUNe696P
         dLhB4YFXXusFMZeUdqgbnOVkUdyLYWMTOx/3M=
X-Forwarded-Encrypted: i=1; AJvYcCX1ESO6fd3DCy9JyZ+E+SybQgjjlDeQca075C5CIZJHrW4F179kyWrXXlhzfLyQKneucsbQcqkXOyNeGwcQJDMG@lists.infradead.org
X-Received: by 2002:a05:690c:3602:b0:71f:b6d2:f8f2 with SMTP id 00721157ae682-722761340abmr103625337b3.0.1756766003457;
        Mon, 01 Sep 2025 15:33:23 -0700 (PDT)
X-Received: by 2002:a05:690c:3602:b0:71f:b6d2:f8f2 with SMTP id
 00721157ae682-722761340abmr103625257b3.0.1756766003076; Mon, 01 Sep 2025
 15:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org> <20250901-bcmbca-i2c-dts-v1-8-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-8-ad81f60d4276@linaro.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 1 Sep 2025 15:33:11 -0700
X-Gm-Features: Ac12FXyhsVuvyT05bXsYsdB1G2qxqQwnIZ_OiY28IaHoBs2SdHfjuLpQ0Y8S9yY
Message-ID: <CAHi4H7Eidi_8V1AvWuAZ58iTLkZFtNqmL44nBtnazMCM-viHkQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] ARM: dts: bcm63148: Add STB I2C block
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009ee989063dc4f587"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_153325_970071_F78E2D17 
X-CRM114-Status: GOOD (  16.88  )
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

--0000000000009ee989063dc4f587
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dtsi interrupt number 83.

On Mon, Sep 1, 2025 at 5:50=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The BCM63148 has a STB I2C block.
>
> The peripheral range needs to be extended to accommodate
> it. The Boot LUT is at offset + 0x10000 so extend it to
> cover at least that too, 128 KB.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63148.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63148.dtsi
> index d94da16ab799c0ab25946e9cf24ae25812e85817..76c418030fbef3352e8266b67=
9541c9129338eae 100644
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
> +                       compatible =3D "brcm,brcmstb-i2c";
> +                       reg =3D <0xbe00 0x60>;
> +                       interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
>         };
>  };
>
> --
> 2.50.1
>

--0000000000009ee989063dc4f587
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQYwYJKoZIhvcNAQcCoIIQVDCCEFACAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3HMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU8wggQ3oAMCAQICDDG6HZcbcVdEvVYk4TANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTMxNDVaFw0yNTA5MTAxMTMxNDVaMIGQ
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFjAUBgNVBAMTDVdpbGxpYW0gWmhhbmcxKTAnBgkqhkiG9w0B
CQEWGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAyKF+RmY29Wvfmfe3L8J4rZNmBIvRmrWKI5td5L0vlpPMCEzUkVhBdL2N9cDP0rPScvWL
CX/9cI1a2BUy/6/ZT5j9PhcUn6A3kwKFGukLY2itfKaDrP3ANVJGhBXPVJ6sx55GF41PkiL2EMnY
7LJGNpl9WHYrw8VqtRediPyXq8M6ZWGPZWxygsE6y1pOkEk9qLpvXTb2Epxk2JWcQFZQCDWVULue
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICHjGJJgg0TO2v/ekPkNLhJy2aBz
FMIVLAcf3vnYkevXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDkwMTIyMzMyM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAFeOjjDkDkUn7OmiuGW4k3vJ9l79Uu0D8PLid7FJ7DmWMVrHCSVREe2XCrhZ0xup
LF2qOWVHJju8dKRbG/y5fGaG6dLy0msVz6ZE3+QQ4yGgvhMnuuhNBJxV/uogfea/+ky2KTdH0EZh
8Y6qfKovsveMDzZJWTWHdGshcLDFskuW1Jf+N8BY/lLz3qsF0nG+XED9MJ6R8PejnMdXn35e6aik
JydQd4wRb5ABSH878De/ozkyB1cJGfw6Pu921ZE7RTWNQ/eiFuNRyi6rMhTfcuUO1yWBzfa0aHxD
7iN5CwFvDgQa4ueDsUBiVWdQRzwPkj/IRsHad5AitIScaopnehE=
--0000000000009ee989063dc4f587--

