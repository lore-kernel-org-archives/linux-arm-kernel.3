Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A9FCA0FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3EvGsYPSdUdmdUvkl5MeS24W2C/G0WFbApxFo5/qOc=; b=FJC/YdCMnVdCGmpafIY5kurCks
	cjXcNgUC9BKeGVRsfLmfFq5RddZcbRu/qnOp7WL7kNxnUkbeI0psWUrR1soNJG3QbrscZtYhlKvON
	kmciuAlphHpJxQ4rRhah8ArzhPObewQ25HVDDiV14N9uGCeUxcW4ej/Px3uYjdhIzNlKPFHPmATYN
	WTiGd9NzEkRA/Cx+O5woaEYI5RIAAXJGHOnr9L+omMU8dfh2/TT/bYSyARuvxyM14aS1PG17Ml24C
	2L8XGo/k+nrb44/yAhZMstBtHDBQtdn1sPRdg+dPcDnatjK9opkGGmFPbaie3PRVBT9/da5WdB5W9
	pa3Q1EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urN9a-0000000GoW2-0ufZ;
	Wed, 27 Aug 2025 20:53:58 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLf7-0000000Gaul-3WrP;
	Wed, 27 Aug 2025 19:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1756322303; x=1756927103; i=wahrenst@gmx.net;
	bh=p3EvGsYPSdUdmdUvkl5MeS24W2C/G0WFbApxFo5/qOc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lmwOYKh+jaeslL9BQl/2uQyPz+sBPCNHDGk/hwpAzE/cmDc/hncT6+7CmeMIqwjH
	 995lw0rcWetNpdvdhhXAqXqKZYjYlhKkTAND4MEXykVdN4npk2hZfLjsu5r3O/QN4
	 XBe//YltRu4W9GOF+mYCs3LrrDoaNYjtNPIklr3Qv4c9ur2MhAuCJhztuRfBLJtcE
	 X81Vf/nPXUfvNWDnXA2SR5Gnm+25RLbrb6e5lTXgqV5TrZmY9kSwfSRjOhd1xm0XY
	 /MYMC4NQmFKM7DhNtLfFINnVP+fQecI6iSR1iRTQ9aDkpaazqB6jFqfAKLYCjDV1w
	 UT3aqrLiuPUq4V8azA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1uudRb0zwK-005RGB; Wed, 27
 Aug 2025 21:18:23 +0200
Message-ID: <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
Date: Wed, 27 Aug 2025 21:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gTcoHCCObZRkqK/JpRFi0rryokVUd+KN8KXxriapbHC2RDIBV+j
 +ppKyOSjwlZEH1oVjzRPCVXSRWYrLoxD1G6fF1ToLYfTc8wMjtyLQKxrGTZ1zT80K8UAj5K
 t47YfjgwErJoRKA5lxHtelq+cR3asKtfvfG93h/83yBKCV7Xxu06OsHqNTbeLoJVfX0ZgJG
 L98L6qgTl2u9cPozPY08Q==
UI-OutboundReport: notjunk:1;M01:P0:nh196u5nQ+4=;R+t4t7R8lar4fn+yFD2oshBNQjP 0C2AF8RTXguostWpBvUDmSav/MOPAwxbJuqUPdPfDCUd957YT06fb9TdpycHuIB1+fq5wBult K9mFlUgihXuysC33kEf4dbeVNpRyypU95qj0o8yAbXy4SNmFluTOUBaJZQMdQuyJNXhLYMpYy 4f5bYI5RM3szs6hVZ6qlK8nVnTn7HxE75RcKdCGQOKvUwEIS1aFW3B0UL3xQ46dLCGlNBcDLn 14ONb/o+6smuN5IRDpEEtCA1aU0Nd4DztWRz3Al61Lvx6hPfAHdYDj4fZPFa3rMqBaHxwGWDw wrDzRbw9NkZor2wSfsrbDniHW73JbZUIiGduDLM0NYOpA7EA88VVWvQeAmCxjymsEQrMiRmTN QEOvCMmc8ZDCaXyODj794ZAD+i5P/JlleiF88+rKQTDsrBieAFKJynGOcVWDza/vRJlwEf2Lg dPNU92ruYh3cgTCv96kDgfIobHV34dqyznSRm4MHapWMlBrm31cJuFMyqPBb+ygcFshGSzOL5 +d4XOngdnb03cMMlYQwWB3Oz+2BJt0nass37GVSv5DR/0RvfaRzqjaCeGDSmEDCSQNYbkq/dP bnzvCKo5rWohTG5SE9pbTkh2AjTtPOsoDuWBHkdIV5atFe3jGAmqDYjUF9EUcACuCe0f55OQ5 ACuMC56seyYlZ6Jd3IYgcWYJmrZCR/FO1MDK0n0q0Uup2FaElLGcLTlYC3OO4shN5D9vrODQ8 yUpyA6osiBVp6uzjBVNORcAiTZLPYz1+EqenTyO0fFpN72XptfI/rHnnnt91DRc2TfxlD6GB4 h94f1zsN0OChGSZrzAVh22+P6Lmo2gFXSzmZm4f0lHxX9sirZukTtwUtB6VNlO9UhRgIt/8iZ 1lpCr3QhlHtjLV9hpDmrEXLuVS/ih1xXkUzp5rtkaJA72LuEXiEae+2b2AUCMm1XTjeICkbN1 n8QeXUbHehyHHmxAOlGavlgdMPCAeYuKBSTa64o4E5rpUYfQ1KfgTiYw4CV+1FUmKeAp9RBSv QaTgLYPFrjSbGnfGhqLiwY07doypgM3AbLt/p6Bzvyp/5/GrYAvwpiEBXpGj1Yo4UsAYdDbfo 1Is8QIABGH58xlcmpPeOlMkAGKUpjqZY5ImT+cGWInp0YLC3C9YSALScRdsnSz1tyKyYC/FeK /2UUvtOWlTp42GuX+/iGdmeKkvXvQZCPYgP1ab7xexoXVHIA35CpHcZEExLuzzAsUHIvIQvMn OpsDLATiSaJ/FwrVaXHz3SLPcBQD/9ssw4WmaXXibo8nSaR7h7fHYYXfCU+HiSyq239DskZLU h7xzZOYXQiEOnfzZaDgrKyFzKr4kbyyHYrmoszO/f7Th6NmDHoAhBeZoFUKhU3MmlbfX25cbB TP7IhEjMQdsDtULLRwVmMiXkA/5JV9d1dGqx9nsGOZzgUsmkP7NQHBjZZrAHQcecFi+EJ3xCt QjNuLbGocN804bfSLdH9b7GFoNqIVssbVpJlDVrHR7k/KN0uf0RaQf8HPF5ECcGKVVrqUrV2Y sTa8idsYVwLWEZBfND88Dl8X4bwyX22XFMfnT22gYMuO/kzCHp8ANs0EmOz/+wugdmxvByKRP k+G0jYXax3G0+jwBf/vVcXwsZV4p4g5b53+0ErxuCxRW+RodMJOB+B7GxERWMZBzabHLM6CNy vzh75XA2m4XB0VA2DUOxI+dcmJeX6EiZzTeAV9MAr6zpjxgftHaJrUCSxJ4CzQ+RuWlXP1Iq5 FfH5gaK53VA1/3gsol1yMbw7z+Umq6lQONKnT3zuV9FjJlgai3kWCPNI4xNpbyWAg4tmLld4r ULhsmeeWs1lAJbQJYg06gOqhk+G4YkO6XKxNgI+nlt/nVKZ3lsEWM/2XL2TZK6uhun8glROzR kJHHAsWHaoxDG165GPeWeYOckaQZ2y47LqJIRFd2ZzjfhRdWvGU1plUIiYt/x5S2Mjxlsrib/ y0jN7uYWyN6BD/xDK2jJ5EkUzdl+0NYftPDD/Hk2UTBOPmJvprQYy1u+JWOivVbVHTZmnJSJB 8WQxujX81Y1H+MFCsPTtlgd4ONlgnBiG1xXPgjXnTy++mFxWo9I/q6+GZceJMCYWj595wT/65 E/LH4z2VJDYTmYieIKtEQcV9dzcNeCdj1zxeB2iTucPH0WgouPZE8BHLxdc0q9Ckfi4lhMsH8 2ZhyQHx+RE2qQYxGaZBylqzcsX0GdY4O48ySozC/TbEVWCOJ/ocUUDJ5QfsNyIeGV/wGM1WU/ a9+mH5O2iIU/sSWnMOSq1+O2vwZ0sJVeHo4kCMTv13uQ45/9q7Yt4NN5whGj7Dhiv4Qo4sCLG v+/fac0nXvpgj6FonTGPP15nD4x/ULcTo9Un4gIXqjDu7NurNPDRORR4ODlKZ2LXPWbRPzusF mZZ089h58/GZKK8QMVMcm74WapBqMS1eaP60S+d9vjTgIvAT6h12Ti6PmM2eAxCe3XfMSuA4h V9klZKaM2WukA0BBFNahFWpPPD2DNe7oBD9LafcXD3BT/GXxozYL0uyR9u7wV/6LCpJHr3iBL pm+NQ2dSM2UvcSHUuR7IVCq4AwIcLbWmNI2zl+0RyErcsD5FJTWzcYBd7VjM9D6MLqbezFMWT OUSweKM54u/jTYHPPGQvzgMtjKttZz6ULnAlh9z0ajttcLC6rbPiMcIzK8WbN/tJk41AoeUJz PZeOdZ26jgnbxVKeJZcFOkFPfp41qdOoJ8PJD//SCF/K7n4obv0V7E8gdLrhGt27nPacQtaBv p0tUT6OD7PhyKWjkidZPf5wU64b7U8mpX9jGna2sJuP08RBMwsefD8NGuEDubfGS6rmU+VEAu 8XCNgVqBjmTVypqZAXinAKYrI1qulR5wlDjxV7YP5/qqNLF07+qlHBtkiVDiXfk/7tq6e+GLm e3cVsNg/vINDeXbtTFLixNBrgb7t3CRCWT4lF3Evm44DAuJRoIn4LikFhZ9hmDOSuaHBnZyNc Y2X/Ewtjf9QFPV03ubyWVUeqvgw2f19WJs3D7036+pt/k9xry9b1SSj3/2xhGcI2PVGLcPVjo TaN+laEZc3vdEIR8Z8RFX4dAPccBkcSZpXRIUEb6C9Vml8FnGXcmuGbJiHqq/AkeMFv6GKtE8 jdApYrfAV1l1G8ha6gvcuN7f3AKF+We0mASuBS2rHuq7ZmuxTnLNZmweIFnbPPoG82wBaeMYY 6fjavLFWG8ooToLMc8K3IODysC/zHUdNYc5OU1fb+Hrl8HE++ILC681EX0wyD4i0h00Go5R0Q Bvme3zvKS6YyfQgtQGFSMwxx4PZwpuSQhQnbV81Yfq+MldsJg21nxB9MTndWT3oYTSIOQghV7 95ScJi9HoLSZLUPkOwrW5BLPoGJ4sAlIm+ytvLmh+Be6L7wsVoBfMW920lAWcWjBg2hP0AIs2 dYD7Lo6KTg5hZRls8csiDGSHCLAm/nlNPnj7bU/y9DvwLKZLBGH7ziPn3UMJv5a3axf9LhBVN APiB2nSauN5HoWBZuk4fT0InDQXxg8tEW7Hhzl85DRJLQJsq3ywv/JwAwhIsTEfVzjYDadnBy Y8Zn1hPSWyjb1vQBcj2PxQlU0oMdtjdiejGzjt2xkhbtaBrSDspIbhMHDyKoZY+pqmhW88pwQ WF5ov2nqHyY0fdQ1E3FcU4Z1xpCkzKrisf7ESmcB9eLAWXVt9C92MuObi/odlVGXNjNdTKkwj mM480V5luInpYMY/fQ72QSwIM5seWY76yTTvyTUN9V4II+mPouRkEx/+BFiW8DxU3a6m1e0BV iv35dgLOh/R2aYux8eUq5bnQky1+9mKlJaEniF4pGj0XZZSZSuO2VxvIR3kRH/85rhvCoKKyz +6bnsb1rXHjbEVJWx1ISbtmcvoLe7hNCxKltHVvBFyGsmuNnhniu6V6KaiOf3luasM2O7YbD0
 K9DIq65uVkNSBPEC7ybUaHrzG5HkjJ7zKxfzPZKtTJ6+OXF7fovR6XPT1vXbDNRm8LFyJ17rQ ws4Z4svkDXfwZFMe08oEWNIVKjGjH7eR2t0iFw5jAUCusYCbitBWyLY6LXVOxH6VbTxTui3eU xBUt/dLqw+kqL1gtdyTlVvOqEdBPGq1mPu2O0Nt1/f3xNLVuTAGUr1u/1MkOOUMh12IVhXO+H WhyEUtu7KGDOZQditj2bJjkiLaw+2sUIe0Gji9U+2wdNqvODaYMyNTL76JKvvJNrKGD3BhWMt GuxQBM23yP8PWcOKJSwhk6FgY3s310abDp9/Dgg2uAtNrg89wZAencvRixm5y0w9sKFnANSPF gCu75938EgGPF883e7El2iWqrkjTPSgskjxfVfDX0/VOAq73nvv9LNnXpvCqsqkoV+jxjV2pt 5yBppB1ztor0MrPN+3yFwJn8cDYZEB3Y2+5b1OwANZjJpnn0rfz+ybGBH8Nk4p+YMiK6mstkw 22sj5qpoG72M9evRKduQJbhGFo4FAwn8UXX0Dzj6EffVNZMWbtr+vfEWhEnUjzAIE6OiC3zeg wH2btMrMlCLe8Pw2mzmc7MePbHr72kZ2YzdksG3V7+0Kr/mLzPFothwkUfrLNbrmud0dcQ+jx jhwxmASVda6Zl7ptY16IwsezrN3apeRVaWbqnQhOMhF/MVCcJkJTn2PrKOea1xfVHY+BBITpI LhtqGmWHQjpsI24GTGhdTS44/0SoxnHEvfE2uvAWmqBV1QiaPAHKiCP8Ulas/iEpci48qzFyz g+pSLnr8BEccb3nBF58nAN9m0gDf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_121826_179589_89B0E844 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

Hi Jai,

Am 27.08.25 um 08:24 schrieb Jai Luthra:
> The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> that is already upstream. So drop it from staging.
AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2=20
bcm2835-unicam. Personally i'm fine with this, but this must be clear in=
=20
the commit message.Did you already talked to distributions like Redhat &=
=20
OpenSuSE about this step?
> This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> the MMAL API (this driver is one of them).
AFAIU this drops the only one user of VCHIQ MMAL. So please explain, why=
=20
we still need this API and how this should be tested?

Best regards

