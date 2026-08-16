Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE35AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Z+kPSmsB7rQaR0LkAkEYzUoOZvOc60lKGr4z1NusVs=; b=qrb03QWrv6v+NgA7RR2lY3LfPV
	EnCaxDCtYOejPsPsF+NVTGL6Vu02UTN/S9nAa5tzbGvxcA33IRn8RMpQkTVdESlaHMnWxJxgtoYVo
	/Boww/srmqvLnhzqE0GCH//wQi0/2QJyDxI/38QYFlaM1/MuB/6TyRkxq5DLVisHI6JRFuK1Fqgy0
	WYlrmsh3YSpCRf0ZWV3Jco1RpVb4D400FAZaHmhPHHAmCpiwjOtXHN7LNUf8bfCmBbaLGo75tAwDV
	Rpk3jsG1VVCK5oEwcYnh6WVSno2Sh8dyFDXyf2gPm+hovs0dMJFgW1mSS/oY5OBf9QOlyOWn7y6QW
	sFg6WLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhaV-000000054oS-2U14;
	Sun, 16 Aug 2026 20:36:11 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhaS-000000054ny-3dCv;
	Sun, 16 Aug 2026 20:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1786912557; x=1787517357; i=wahrenst@gmx.net;
	bh=4Z+kPSmsB7rQaR0LkAkEYzUoOZvOc60lKGr4z1NusVs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JWCkdfL74AkNlLjjJCOCzkki03z4p+ANoukrjo0SdI3QqC+jhR88YPr2DY3Ryyao
	 339NolqbTU5GcqpwyX19AxDLY53YqK34AJApqnOfQi9YaUOzHLPETJhmmoTe/ee8m
	 faLv0uqznLb8FDWaihGnPIN2dyjCPxUA+CsSOv8LJfd+E53wSmAkYjKF7foaSoIfB
	 xr5/ksShk6zZeGSssUVBDZ/3rYLGYOOkRCJjjQJ34rLET/dp3SgmGBqo14MQlrH7S
	 j0Pqkqug/jKuQ3vXAfiMLNwpnBK/FtopjGoSBpnsamEMnQDrSmkd+FRDKM2M4psEN
	 6ha35PuQrtYKyzcgCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXhK-1xHCU326YE-00UbXn; Sun, 16
 Aug 2026 22:35:57 +0200
Message-ID: <87f2ee85-e53b-4154-ad5e-60a00b2bdf39@gmx.net>
Date: Sun, 16 Aug 2026 22:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qC/mBbUnVev17g1kNFkKIAZrHsgTwMNst/nFJnL0zbKjCS/VawN
 J1P7OlPfwCSYfQNJ1TBZkc91aq8wD99QF4V4dh2XC7OOSlL6AxcJVRDdACct0R8PzbedENu
 NaSt+fa+NMoxOG5fC1FTMo2OnX6jXcORhtNb6wEqqApoQs1b8xFa2RbiajkLjx0HsoJ50Hh
 OUGr1JrcNRvGPcHLoH1hA==
UI-OutboundReport: notjunk:1;M01:P0:mpbwnKgEcwY=;fw0KO+K1nA25K+eoarwzzOrLgvF 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 G309up8duU1PTQtoWaf5i+XtVWrs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_133609_201010_313F8947 
X-CRM114-Status: GOOD (  12.29  )
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

Am 16.08.26 um 16:05 schrieb Ma=C3=ADra Canal:
> The PM block exposes a reset line for the V3D block, which the vc4 drive=
r
> uses to reset the GPU when recovering from a hang instead of forcing its
> power domain down. Wire it up in the shared V3D node, covering BCM2835,
> BCM2836 and BCM2837.
>
> BCM2711 already describes the same reset line for its V3D node.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/b=
oot/dts/broadcom/bcm2835-common.dtsi
> index 1e76b290510d..39eea8ce1058 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>   			compatible =3D "brcm,bcm2835-v3d";
>   			reg =3D <0x7ec00000 0x1000>;
>   			interrupts =3D <1 10>;
> +			resets =3D <&pm BCM2835_RESET_V3D>;
>   		};
>  =20
>   	};
>


