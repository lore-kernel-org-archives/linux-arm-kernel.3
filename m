Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62168D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSu5VRx/T0r2Y1TQNYxUEQDwIAks1NmmDqtGiwK+coE=; b=rX2W0jGK/Z1qJ/Da1BHmdJK4Xe
	ZboAqNdmGjyIC0r4X1rCcfv/AU4kKuhavh8LY2K9ZR3nvvITxcuDdybNNKxriew6zPt2HnuHqCcYN
	SKZWhTX6qlhWtQSmBrR5bI97uYZqwkhHXXf5VmsXA1BfE5z691s4PVJ99Rd1ZjR9LO219TASaSiAR
	PpkITAeRMa+WEv6YObC7uQIcbGH8VRyra4JMsuxxNqaI0qWg1YiUz7jmDwDZVbjz3VMZmWLblpgIe
	PztQLWcMjuJIYlOASxvKylfkCblXxhGEjUgWC+dR4nguQqpLJlV21SkyeIT9VqFhd2E8YFa5hIN3Y
	4JMV8LKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAput-00000003NZs-0hoB;
	Tue, 12 Nov 2024 12:22:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApW2-00000003JPb-1dAa;
	Tue, 12 Nov 2024 11:57:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431695fa98bso43848205e9.3;
        Tue, 12 Nov 2024 03:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731412619; x=1732017419; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gSu5VRx/T0r2Y1TQNYxUEQDwIAks1NmmDqtGiwK+coE=;
        b=U6KSe48jnHxDt4TqTa4fNNyCf5VFU7SxOPZIxHhjaZ7liBIfOMSSUfCVW1TpOf02k7
         JQdqkYNPcQp4Tax0qMMLeMeZKPhuckbOgEiNwQee8QH98AYXwFZBDPSyhDKZ9QWYI1Rp
         33tiLifT8qA2sMHTumC0qNtnEegU0w6IHMz2O3kSeTjHHtzRg36jDakZwQePMQRE6876
         WBVrcZEJJLcDvyMO8FJqtztReLF7w/C4jhcwKj7Zcr4oKaOQr9mY4y7i1WJWplus4oNT
         4WNf4TT00FQppiUXXIBokdjkhTtC5efIPQKSPYOJIxWnG5kaSqYp55Q89uF+LGAYIOpA
         uyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412619; x=1732017419;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSu5VRx/T0r2Y1TQNYxUEQDwIAks1NmmDqtGiwK+coE=;
        b=HjK8BvAh5d1DsFac4McgVkj0ES/dbuBbL8c6MdZUxBt2lFm+BLa5T5kZuhc3XOJGmD
         kPfHQZ6Yo22rZy9UxWxYHlizkDyuwGVVY6mepJ8OhIZtGVW2mDkcWXiBI+CczkNs4lRm
         gaDQbuq+O2KjBrYKb2RI99GaYiXT+u9fTcpitobrHnlEi1lKbNbRkDtU7sGi/pALoz78
         W0D+pVBiDQJHwo0Sa3tFqwAXqVEVP3LvnmFeZOuXlyowrtroAUb5QWCDZQ0fmgb0hTJJ
         qm16Lkwpr2ahOTi6Kj3URV+S6w/x7eQHz5fa4sNWOsiqQTugUVQnVUS2J4BnHZp7yrUQ
         IUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtGLAklSr1XUgG6Q4ufYi0+tzOyFuOac2fEhBU1hTFJ7yP/VAUJEA4zndZ6N5sf+j/9Rx8n8NTz+S5HMLQn5nG@lists.infradead.org
X-Gm-Message-State: AOJu0YwRKDZ4OhH434zXTBNd3nieQipfJ6ecGu2BFn7J1j4ogrdVyYBa
	/ycZ5iV7ISHAFj43S8dcTE6xVyikSDJADuYRZ59kdMli1FanDpkJf6hmaw==
X-Google-Smtp-Source: AGHT+IElsmspuC7y92QmrSRjeRp6WqdcehDOD3Uw/GDj15rvF4LUjZ5UI8+zxBjPZPJSfOK8ith9ow==
X-Received: by 2002:a05:6000:1f8c:b0:37d:4a80:c395 with SMTP id ffacd0b85a97d-381f186b313mr12410123f8f.21.1731412619186;
        Tue, 12 Nov 2024 03:56:59 -0800 (PST)
Received: from adam-laptop-hp.localnet ([2a0a:ef40:d5b:4001:e118:be36:46b9:41b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97cfefsm15121948f8f.26.2024.11.12.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 03:56:58 -0800 (PST)
From: Adam Pigg <adam@piggz.co.uk>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, stable@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdd_gpu voltage constraints on
 PinePhone Pro
Date: Tue, 12 Nov 2024 11:56:52 +0000
Message-ID: <2815923.lGaqSPkdTl@adam-laptop-hp>
In-Reply-To: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
References: <0718feb8e95344a0b615f61e6d909f6e105e3bf9.1731264205.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2630842.XAFRqVoOGU";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_035702_468931_1D49940F 
X-CRM114-Status: GOOD (  26.85  )
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

--nextPart2630842.XAFRqVoOGU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Adam Pigg <adam@piggz.co.uk>
To: linux-rockchip@lists.infradead.org
Date: Tue, 12 Nov 2024 11:56:52 +0000
Message-ID: <2815923.lGaqSPkdTl@adam-laptop-hp>
MIME-Version: 1.0

On Sunday 10 November 2024 18:44:31 Greenwich Mean Time Dragan Simic wrote:
> The regulator-{min,max}-microvolt values for the vdd_gpu regulator in the
> PinePhone Pro device dts file are too restrictive, which prevents the
> highest GPU OPP from being used, slowing the GPU down unnecessarily.  Let's
> fix that by making the regulator-{min,max}-microvolt values less strict,
> using the voltage range that the Silergy SYR838 chip used for the vdd_gpu
> regulator is actually capable of producing. [1][2]
> 
> This also eliminates the following error messages from the kernel log:
> 
>   core: _opp_supported_by_regulators: OPP minuV: 1100000 maxuV: 1150000, not
> supported by regulator panfrost ff9a0000.gpu: _opp_add: OPP not supported
> by regulators (800000000)
> 
> These changes to the regulator-{min,max}-microvolt values make the PinePhone
> Pro device dts consistent with the dts files for other Rockchip
> RK3399-based boards and devices.  It's possible to be more strict here, by
> specifying the regulator-{min,max}-microvolt values that don't go outside
> of what the GPU actually may use, as the consumer of the vdd_gpu regulator,
> but those changes are left for a later directory-wide regulator cleanup.
> 
Ive tested this on my PPP and can provide the following outputs.

On a device without the patch:
# cat /sys/class/devfreq/ff9a0000.gpu/trans_stat
From  :   To
: 200000000 297000000 400000000 500000000 600000000   time(ms)
200000000:         0         0         0         0     12203   5387782
297000000:      8208         0         0         0      2973   2337382
400000000:       784      6283         0         0       439   1859857
500000000:        67       287      1093         0       284    389599
600000000:      3145      4611      6413      1730         0   1748889
Total transition : 48520

And with the patch:
[root@PinePhonePro defaultuser]# cat /sys/class/devfreq/ff9a0000.gpu/trans_stat 
     From  :   To
           : 200000000 297000000 400000000 500000000 600000000 800000000   
time(ms)
  200000000:         0         0         0         0         0       364    
188911
  297000000:       120         0         0         0         0       234     
31652
  400000000:        77       182         0         0         0        82     
32287
  500000000:        10        57        56         0         0        57     
13376
  600000000:        21        14        35        31         0        22      
9463
  800000000:       137       101       250       148       123         0     
97310
Total transition : 2121
[root@PinePhonePro defaultuser]# uptime
 11:56:24 up  3:34,  1 users,  load average: 2.77, 2.24, 1.70

I havnt noticed any issues, though I havnt done anything more in-depth than 
run the compositor and play a youtube video in the browser

> [1]
> https://files.pine64.org/doc/PinePhonePro/PinephonePro-Schematic-V1.0-20211
> 127.pdf [2]
> https://www.t-firefly.com/download/Firefly-RK3399/docs/Chip%20Specification
> s/DC-DC_SYR837_838.pdf
> 
> Fixes: 78a21c7d5952 ("arm64: dts: rockchip: Add initial support for Pine64
> PinePhone Pro") Cc: stable@vger.kernel.org
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
Tested-By: Adam Pigg <adam@piggz.co.uk>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts index
> 1a44582a49fb..956d64f5b271 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -410,8 +410,8 @@ vdd_gpu: regulator@41 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&vsel2_pin>;
>  		regulator-name = "vdd_gpu";
> -		regulator-min-microvolt = <875000>;
> -		regulator-max-microvolt = <975000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-max-microvolt = <1500000>;
>  		regulator-ramp-delay = <1000>;
>  		regulator-always-on;
>  		regulator-boot-on;
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--nextPart2630842.XAFRqVoOGU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEr1aGel3+a3VM67n3d+rfHu07OYAFAmczQoQACgkQd+rfHu07
OYADkAf+LXSLL2XQi2NHVwvmnLvT1HH5gVHM/L+nTrbxrNJs6efCnE35HYlo4ye1
kw9pN+BfWTGHuAOE3yRgIgXZXY9J/OEKcKpKpRNO6SYPiVnjm8F3ct8LAPXaPU53
tQNF4VXtffgWoDgFDMbDd+kAWd6zPVyR3BuDFy9iMKYvFTKLka2JMHIz25wb+l94
Vx6WDGlq0LTvslHsX1BTbIH82jzJrM07ohtQmeuZTsBPnV6jxpHDp3KaPAqtDoml
6NtxipN/scNJXRAzq5lvyp1rHmTYTvjtvjJmuRrOnEYjyk6+Q2/ySxFVNw4+RhMG
HheiovMko5kHxT1bvbFOJXjsKL23mA==
=MG/w
-----END PGP SIGNATURE-----

--nextPart2630842.XAFRqVoOGU--




