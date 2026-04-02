Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A885111224B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjrBtbFS7FjcMHL3/0M7T1q/SrOspR4kcrN5D40YrEA=; b=QZo1/B1g5G/y4if0TalX8wPvxU
	vZ4jBBRbHGjKT6BqPM+pY2AnU4bZYQey8wS1pr2kzGgl+GUcE4lkBfrxG50an8104ALHmxP1wb0fw
	ym5g9SEfOQ4k2KDlCO/lVxZ58P0pJF0L5ncRgBKIbpb0XBFm+Z7y9/QuEpTnmMeU3VOoYWnzg0Un7
	MfvMiyDhI11DfmG/Eyso7iFateWv3eSAH7Ra+zG4XR4YFQLpVL2YTj5TJoRkNKIXVKGxCV7nnftsx
	/YtLRLBDki96KT0CEExdZdfwuFdAdeBgFirlkIdUyAFQUBZfB3f736/kItllsEnMqWQ0rw55uWYWF
	Bkx9w8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w878E-0000000GZFe-2d22;
	Thu, 02 Apr 2026 01:46:02 +0000
Received: from mail-ua1-x961.google.com ([2607:f8b0:4864:20::961])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8788-0000000GZEj-0TLB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:46:00 +0000
Received: by mail-ua1-x961.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so116586241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 18:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094354; x=1775699154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjrBtbFS7FjcMHL3/0M7T1q/SrOspR4kcrN5D40YrEA=;
        b=QakoO/Y02ZGbSg8b8onqFFElQJEsp5V0fSOBcYTnDPEj5tWh3lA3gSSkvXVBJEhKpe
         zbox7sXQH4QlJ7+gnzkUP9213qlTo8vGD5DaupKjdOyKx5DGJaQ4CkaYNh0zlvCv2Ovt
         gMR7UQw+TaJAg83albpGU3oV3UYtc2koFtKKNi4XuGPrdU9WZ3wPj3g7ektVLF+FrHKD
         njNqCvniq+hNY+tB8/4A6HDw+KW7y9Cv+fe4YSTOTgePh70sNuguB5A5ZFUPscqNhSbi
         0NiXeNW/EXId82VsQfL9mGyAP6eLK4PPbFR+WllM1pimsmj0SqQmikX6+UA86uCEKnLu
         ujlw==
X-Gm-Message-State: AOJu0YxLtSHKzHAIAI9i9JEXdGOL6JRqQ7QpzGBdeUB9ta4uCH7FyibC
	ito0qh1GKGrA0/PobhOX0tBIivGX9jSbNLgqZ6AhtgpxrJnrK5f8YPRKDcVIFmsF1n1l0NdNZAQ
	j5x2Tlmb59jHNiAu8DT6szEXP/JPpghTNcl9WQctYrtxFqtXYYqAVA8bXnsoEfV4CDtH7/ApjrN
	PsqfOdlH8iiXnIuDzbbGr0pWzZg0ZXOpr6Ue+2jT/l0U4yXhd3h1T0/8EmP9VLca9VYUwpFCW0O
	Pm1CRixfO1kG+Hb/Z60TCN9uwjhjVc=
X-Gm-Gg: ATEYQzz4Yxlmcp632RR52tqjZYp8/pAHIp0GWkH1cwLdnSZhpzcTCyOsjRilnndQ/Ly
	TLJgjojl3Ng01fZ3d/9WiCMwElMMVwie/yzyN6GTmPPS9Hg4MJevirKw58BoZw8XhQSW7B9FOVY
	9GlVEAUaW8WuWQONpLRMjyv5Z0DfkCN5SjF9sIga/2oEyZbkFaWjHSvAMOYphHnDNcZ86i6OuCd
	i07TMg2P0pdwGHWHajdPnUWnf9ipSTNwS8uXEH7j+T9LjPHZoTvWrxjBEOCkhXewlXXDBQ0pbgS
	6L8cd5Xid+xlQSsNMtuWT7hfXuhKKrNQY1Tvk9KNAnrDS7eoDdQMFaHf7npAhuCz3kaT6Vx5H7d
	FN0dBi76ETRHLsMZkEZSe5F4a0IhOzrA6R9MuL/wjRx5ydFl3gBL6VvgwOW2v7IA9FeHDab6Yqa
	ekeX5WL2M+N4Av/mxhj0the5z8DedIXtLu9R5XqeDj8RlW7qn6B7S1pggQD2rI
X-Received: by 2002:a05:6102:3711:b0:5f5:3244:20f with SMTP id ada2fe7eead31-60567f6d632mr2195575137.21.1775094353651;
        Wed, 01 Apr 2026 18:45:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-60582da8d39sm111010137.4.2026.04.01.18.45.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2026 18:45:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6501528b1caso835025d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 18:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775094353; cv=none;
        d=google.com; s=arc-20240605;
        b=c/QnLijw17/ohxO4atWa5I3xDh6Lm83FYaM9Ui0iUqalnlE4u9IXGaQfWfCbyUTeTP
         LMyMD9AjqZbKTGRgXoOMbdeBBFNWi6M10Z0LFna6LZoM0hjBIo27woGT9yXOL2p2lgw7
         AtXF6gm1gevzLvldHPGQ37G3MFPI8YIrvbhd2x6WkZS0C8Pc9pIUkguwyI2eUqxR1/Hb
         kD93SpihkdMOEQh3cEwcTFLrjMy21KxbaJiQ0bo+OAEzFJCfN0XBT5r/69cMNTkrrfFc
         NykqEyfW/q7x1cQx47fDy//WPL4PFDgG8aUe9DgGCHteKms9IqwNaHK9TLvUKHYcr1JH
         IpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjrBtbFS7FjcMHL3/0M7T1q/SrOspR4kcrN5D40YrEA=;
        fh=knCgEDLRuYLqYKs6EGQgYsZPKFxfgs4SDrZ/NMfE+Yk=;
        b=VjgOTWQ8VJUa87+rNdKg8TuBFROpO75h+FX2JnYirci036u1fU0FqjgBpDMuxcPh/K
         jagJt2XEHOPnC94dVX6ktN9WMRfJKKdp8j3DXNAoYKm6gT8nZqL9Rtnx1Ozkj7gdXo2T
         UyEOz0MmjdHuPecYkolszhxlux6ugUYf4FG+UeWGFx0rR0z+Kg2vQ2fOQLg4pfRz4T71
         zbWSBl5CaGIZ94HdQ8kYRVrv3Sv9zkLIOYcbDJZR4YXT5yC7h48k2EIWe55OnYF5rS1H
         lt7ZXCUWZfvi4cksoQ4LrvpYoiOaMo47vK7pCdkuBa26mkGgUDVWJL9eHBoEVwpMx4tS
         tYkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775094353; x=1775699153; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjrBtbFS7FjcMHL3/0M7T1q/SrOspR4kcrN5D40YrEA=;
        b=Utoav3cn/Hy33QA6q3pv8txxdOaRFBsWOUBOBgKkFhuejSVZmk4vCmAPT4fqunNN8k
         oIbtKNcAqON2BnAjfcMHaN9iyb0No++ZDvvNzi1XEcmkM3PlWhy2fjbXp8x3TvfxtoOC
         J4TR3ByxqAlLdSQsUAMelHlZPV+kzcLz1Mwc0=
X-Received: by 2002:a05:690e:480f:b0:64a:edf2:e769 with SMTP id 956f58d0204a3-6502fda6ebamr4678939d50.10.1775094353117;
        Wed, 01 Apr 2026 18:45:53 -0700 (PDT)
X-Received: by 2002:a05:690e:480f:b0:64a:edf2:e769 with SMTP id
 956f58d0204a3-6502fda6ebamr4678923d50.10.1775094352501; Wed, 01 Apr 2026
 18:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250922202438.496433-1-william.zhang@broadcom.com>
 <CAHi4H7EC9+7yBofXE=AabeHtHFsrzOQA9kAq4of8Eu0CG2dfnA@mail.gmail.com> <bb48f874-b80f-41ef-a1a3-81f2e0a7de65@app.fastmail.com>
In-Reply-To: <bb48f874-b80f-41ef-a1a3-81f2e0a7de65@app.fastmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 1 Apr 2026 18:45:41 -0700
X-Gm-Features: AQROBzA1jNlI9maeqgonfWWFzbepk8mBdyXdUKXEo2_YpZ_51C8Q8ybf3hOOIBE
Message-ID: <CAHi4H7GEO9dCjufPBrUDVi7-gazL09fQeuLzL_WXBbw8n+yAHw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: module: fix unwind section relocation out of
 range error
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Song Liu <song@kernel.org>, 
	linus.walleij@linaro.org, florian.fainelli@broadcom.com, 
	anand.gore@broadcom.com, 
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, kursad.oney@broadcom.com, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Petr Pavlu <petr.pavlu@suse.com>, Russell King <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000060579c064e705c30"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_184556_236360_4216ADD1 
X-CRM114-Status: GOOD (  10.59  )
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

--00000000000060579c064e705c30
Content-Type: text/plain; charset="UTF-8"

Hi,

>
> Please put it in Russell's patch tracker.
>
> https://www.arm.linux.org.uk/developer/patches/
>

Uploaded.  Thanks!

--00000000000060579c064e705c30
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
qBU18fYssGM9qX6irfw3Hrp6y5OyN0Uqw9eU+DlMta0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNDAyMDE0NTUzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAHHWZ+1nzSUN5HKo8EMl21jzg3rtqHSUK7j8o
iRzD8RN4dVFVJ5F/HW52EvoUJy4GQJCI/MKaBhaLit6yeMOt43PrapuXAe8MRVVHIDZ0jV/OgFgW
zLtb/gmkr2uRARPP1Oc0Zui6eL1HgEVvRIfH5ICmmdOcxYFLAwxRADqTGdXS1Uufc99jJWrLrErW
a0lMvpTu2ChyPYSp6eds/OGRyH6UXRznGE60LqInG1jkoNRyCjPmWHGU4BYMNz9R7DRIi/5lL8yq
La52J2BE1+izlEp2LdGfGQWVqXRk31pPAawaeUfNJZ6Y39JqEFkzvoAjPOdfVNSt6qE9+oEics9g
Rg==
--00000000000060579c064e705c30--

