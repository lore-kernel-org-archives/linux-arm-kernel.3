Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7904E9A053
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kNhWvmxd3XRCi8QpfwtxPjr1HILDYUuG5yHJW9YES8=; b=1qHg9Ls9Xau6SkMZWsIiQNoBpf
	bzS0jV5igCjIAFZ6EX3fe0ji6FLfANJOHWBzJtlbRKz1Kzo9wBRWNlfarJ9YJ9ZgFxDfE4XitLdEO
	I8ZsdD8QAOgNBfkC6zPuP2HdycJIOK38qy2f23RBGSQrzHgkEUZI5pIeY9iHP+d5/bGfvCf0PotpQ
	htiIN/i77mj1seWjmmQzNkN5RyIFQ7XjCeAZ8yulwO5tCUDb6X4W95IWTUUWK8XkPWcNH+mQs/Zb8
	w9mun6NSTNnCnd0LvQVdLQgLqm/x6Auv2qRMnPdpIL0NN09GeisRcA3bHlHy4v400w/9wv7svOfMX
	sQIwZnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8mn-0000000BmiG-0Xdd;
	Thu, 19 Feb 2026 18:30:01 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8mj-0000000Bmgh-3jBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 18:30:00 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-823210d1d8eso750262b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771525797; x=1772130597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kNhWvmxd3XRCi8QpfwtxPjr1HILDYUuG5yHJW9YES8=;
        b=mkDBPYx9a01Rv6rilS5RpfsB9bY6K3WXIslHKD0SbqyB+ziR5AdN/bYDdhPxTPoUUc
         +1+fafIAmkJKNg5f7ehVJE43nP/5pVbl6yymQIj4yQ2iy13/gKGtrdxRjluStnqj+YQu
         i3OmBEhbdyrBgBcaS75Ta2UuD9POSsRuwDhCeAomTGCwca5QV/06A4RqXgr4uF2kByQk
         gFtU6qEFDBUzfrbS4aVvwlRHImL/45CDX49hc0+4OxaT923kDG4l3LBWL5OUzr2juw43
         m7SmHeNAItf2/F4l+0bgjiWIjBUA8HScPoXIQDm2qsSdJIQJyx0zMoiTbBXIiVPPuy5E
         zXrA==
X-Forwarded-Encrypted: i=2; AJvYcCUrEoTD9uJT1tzmKzYeJlPUNaQ+0H6fWfLzMQb25ypXJtL8d3az0lFFraVwjgEoKlZW+58EsXaA4Zk1lmI4TgFl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Vqr1ktYotJJA1nPPkXsHS+pM5cs5lkku1/R0KP4olTGHGwP/
	lic0MMROrPPvwLU6XwGGGf3dJtjRncUD3XqVx/9EhZ3YcvlUs3v4Vn/CCv+nPdTH+4hhaM5PZn6
	E6DxgbtFx1c6Wo120HlvOaL+8swlKXu+h+KWJKWjWpVjGbckp1JLe/zouBtR58sdaGYUxBZX+wd
	mjUbsTstaWv39fFAC0BG6eAUvcrsxGBVIYAf4yzP8g9fkMbG47mBo0eQNgMWLiKhGBCEWxKyRz7
	UGlZ4yA6aJ+7mZFNapDsIho8PyC4MI=
X-Gm-Gg: AZuq6aKjjWDhu3c0L9ZuUhI3Y5HbbuhIEaKcUU5QtUo0lQYDFMYr96zPXwzMGDXSMPE
	grY2CBY/sGF5y5gFxPUTDjJ8njLk5x7yvJ6WEpoEllW/OeIZNFTexWe1RouXf/hoRNd9gNqE8ff
	mOOx297J4N4S5PBO/j3DtaVIPnZJ9uyyJzk23dss8xYugE01I+ArgO1gdQNEYuJZl0ccSrBjaTn
	rb/fM/Ub9nybUmsFfD/07OwkWcyg24dTjEFrGKMDuKbWRyFVdLQjd2TaiP60a5G0VfOlwtzAflk
	AuENCIC3Hy69RjO8Ibfy3nX0N70HFDYxgVXfbQLPHAQSpvp5DDnuLdoycEner/o8Cqq1aiz6ERv
	mRstrj+T+bOLriT7W5cmpuSGg1idQHH38P0CAtGA3UmwuM5jIUo0oR+H1sLXxxYOjDwyB7No867
	yPHH8krRfUbSgILMeG8ochvoJgD4FWdlaotN1s6Aa4DUbl8IzzSZVqkmAsCg==
X-Received: by 2002:a05:6a20:d494:b0:395:949:d28a with SMTP id adf61e73a8af0-3950949eef1mr3556186637.78.1771525796805;
        Thu, 19 Feb 2026 10:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-94.dlp.protect.broadcom.com. [144.49.247.94])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-824c6b8b485sm1945123b3a.7.2026.02.19.10.29.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7942395ecc1so21988297b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 10:29:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771525795; cv=none;
        d=google.com; s=arc-20240605;
        b=Kvy9SLCgbJMe/i5AYL7WYyBUGG0Ln2ZwLYs+mD8bLWA0PBxZNv9DqIwXsplyGwhbmD
         kboqzoVc83XX7d6kikpt+45PNI/AlCLbhQIOi3z1qfoDEtoKPlV/Q3p3qWUibibh0d7I
         aVA+w3/WY02JVujMiW3ZfyrH0eKTDPfVZdSlRbM15aUB42NBRqz93q9W/M0+e4ryDShv
         WgY3pw+YbdwBfnkx1arQnHT0O5qCokv56Ytf6pmRU8NdTqOktXDy5eYG8dFd3NAZ9KLP
         4aHN65Q4Wd7MHpLjwnXBVXydS0pzFyA5al9dVzzadcxhyWfH98cPlxssGq7t9jWzZ14n
         530A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3kNhWvmxd3XRCi8QpfwtxPjr1HILDYUuG5yHJW9YES8=;
        fh=7iSYOiZgeVs/36DKu9YUmx7hqbD6iViYe7ydyj0jmVM=;
        b=OBVpOwWa0Q9fZ/uBZzq2d/nu+XWGq/wg7fk6HwmcSTicS0CUkDGh6pUWeWhMlg/DQ1
         AhV9VkqBi1Ysk2PhFvHUnVaawsV1NfU2HhIeOTS2L8zMpWVgYeQkOtOwLDbhBORmABeq
         1Wxb3vS3ZDEmz80TivUVPiGGbMxhLYUFZrOaTqBdW6YNATXE5zq0VUsWHOuDm3DHkV71
         1FVJKZTdhafFLBNm+fAl3sOuPkrprn3++2s9PkCg6VxFzcwEzm20zcGXocmbMrfGLlFf
         XSGDPTsHCWhLgkRH+EfcP/z8kyJTj4owozvICeUwGBCH+QAvLoRrjdF9ZKDV+nQfaPrQ
         5GRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771525795; x=1772130595; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kNhWvmxd3XRCi8QpfwtxPjr1HILDYUuG5yHJW9YES8=;
        b=THSCaqRbqAQB/V4DWFZzLzun2IHg9rI5HrgqNMbm87KVHEUu0lY9EZMf1V3Vue/Nzl
         pixO9t1Rrr5Y3db0fG0JfdQcommUH4wDGCmYL9n6AdsFWOUIbdEd1v4+3lUpeI+S6GUu
         s2dU2kiKAJlq/wjXOqlfTTeEFLkajHbDja31Y=
X-Forwarded-Encrypted: i=1; AJvYcCWY6Q3+sBisCDupPtqaqCRRL3Bvj/15nQBG73844fkQSz9fibXJqXZTKjLgqqAQe+FZdXDJX0OsIUYb/vBv/LHC@lists.infradead.org
X-Received: by 2002:a53:d007:0:b0:649:ccde:d6fd with SMTP id 956f58d0204a3-64c21a5caf5mr15358740d50.24.1771525795480;
        Thu, 19 Feb 2026 10:29:55 -0800 (PST)
X-Received: by 2002:a53:d007:0:b0:649:ccde:d6fd with SMTP id
 956f58d0204a3-64c21a5caf5mr15358715d50.24.1771525795043; Thu, 19 Feb 2026
 10:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-2-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-2-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 19 Feb 2026 10:29:41 -0800
X-Gm-Features: AZwV_Qj3R332MqrcZaAPw73s69Qml6HYmzmgIu24vT0_9hNFwoWouAyXnTk3WZ4
Message-ID: <CAHi4H7F0yZ0bkG7sJcPZMe833=A0a+DLed8CNRib_=PuezEaaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] ARM: dts: bcm63138: Fix DMA IRQ
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c44f32064b317de9"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_102957_939141_967D9977 
X-CRM114-Status: GOOD (  17.03  )
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

--000000000000c44f32064b317de9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:30=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> INTERRUPT_ID_PL081 is (ISR_TABLE_3_OFFSET + 23)
> which is 96+3 =3D 119, convert back to SPI interrupt
> 119-32 =3D 87.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm63138.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts=
/broadcom/bcm63138.dtsi
> index 4ec568586b14..8e41c7130406 100644
> --- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
> @@ -317,7 +317,7 @@ pl081_dma: dma-controller@d000 {
>                         // The magic B105F00D info is missing
>                         arm,primecell-periphid =3D <0x00041081>;
>                         reg =3D <0xd000 0x1000>;
> -                       interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>                         memcpy-burst-size =3D <256>;
>                         memcpy-bus-width =3D <32>;
>                         clocks =3D <&periph_clk>;
>
> --
> 2.53.0
>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000c44f32064b317de9
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
sJN8R1M+9i0SW7T69b0kgZPvvYGKTeSdoF3fJklh1tgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMjE5MTgyOTU1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAaWsmS0D7LXtyHvdkDFK5Zhjb8DwT+S42igI+
rJu7zW6ImEv5W4kuADbmNGroq/OYuw8zTc6/DTT47p8SYRTKTPRFbflGjHvWyUYZTBEa+7vRNp0x
NvHmt7J1SMaOMijY90886tmspRpvkg2cSj4ht3XLIgsBzo1F1adYaAhrCrpeTvhSXlBQDSpqn5cC
exrlNtzS7GK4D7JoDmxox/m5EmPa8LmcmYjNch6sXDdASPkjSfxtkIJ7UlgeECeUtxezyXfO5YrM
zrQaEdnBoA+Iz9noKuFfdFXsopQSDoGU0DMxvB+OT5w2KjN0cUYxG4tIttA/n6/CQNN4851AGHnp
zQ==
--000000000000c44f32064b317de9--

