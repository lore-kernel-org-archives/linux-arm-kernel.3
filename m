Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AFFC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Sjk8UbkFl75U05K1C7gJgwCbYYL1I/3mfV385asJZ4=; b=ndbXCxq5+K719sT10LcmTQ7Csl
	b/h0fV7pkn2W/1g4L3olUSscEdSDLDS3SVBq/AySaRgauYrIrKxpdsVH4lNbHFiX7w6x4VCFkF3Ez
	ZrJ3+9vclKZ68OShGU2k7cnNAVCHrWUx8Kn+Wp8VP7yDoPBIaSlOsQ6+NUz6RlRV/qGr19XW2dpU1
	T3cAdB/dkXopNqjxcUYXjBbs4DC+55aW7UOv8RAUuXaSJwlBatQ+YkbazTTqQBahJW/Z2pwO3ABCo
	YTPZt7kc7o//JMClBSZeusVtJXMBIoPvJqvFieUeHkgf8mj1uKkg24Zw9T/C5b3FzdtRp1hBORfyM
	q+PB1EgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2PV-00000009c72-2H0T;
	Mon, 19 May 2025 15:28:13 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1aS-00000009SfX-2eQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747665323; x=1748270123; i=wahrenst@gmx.net;
	bh=8Sjk8UbkFl75U05K1C7gJgwCbYYL1I/3mfV385asJZ4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lAxGAtsQIDapXlb7gb/MF0Vi1fea/7BGVilihBhF+2NwFMJY4eo88AKOqDTFo/Hk
	 dP39x0QV3NHCOsukrKqr0TjIYBbZ2ObNmu0QL78iq/UbG961ss2foSW3PHWiIjAPv
	 RBglbA4YHswLEI6PvNo05QZfTbSjeql4s5vuT73RiaQs6I8yOTGQfMsJLanEvTPYo
	 wCpg0vZjseJB1wiXh2DqkTsSDfqAoLzdk6IBaNdEhsfbHYhjdDT8P2I0r0nYwjns+
	 4dxsywVz9FLRRv0MLPcvhR+Hy5u44OimKsuMo1Q4tPyMFgeztBr0DyHsL54A0WPGM
	 IQkomwrch9ruxA9vcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1ub3qO1YSN-00JN0Z; Mon, 19
 May 2025 16:35:23 +0200
Message-ID: <bba21f5c-9644-4563-976a-a4cfdaf2546c@gmx.net>
Date: Mon, 19 May 2025 16:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
To: Haibo Chen <haibo.chen@nxp.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
 <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
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
In-Reply-To: <20250519-gpio-dts-v2-2-b9e77173e9c5@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xRopVuOluzaIao9DcNOu5qBU5CR6Od7NJWDYzDSVGYmS9W+1ihV
 YS0QJ7ggQBu1uYJooSHkeRfxIYjwCJ1nQomB4UQp64Hx8GUm+aCyfiA96bt70PcvlFL5Pe9
 RZ4ILKgpY/3vdMTvUtRKoQenjPL7qAiSQend9h0fRevLmsa2Xggk3jRj/PeTpdzY0M/7QGm
 rkRUfKl4eU9HJoqSG+S3w==
UI-OutboundReport: notjunk:1;M01:P0:TMWryvrMpl0=;+WNCdpc8PAmqmI86I9da6zs/dPt
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073528_981051_6F6A2253 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Haibo,

Am 19.05.25 um 08:03 schrieb Haibo Chen:
> Add optional ngpios and gpio-reserved-ranges property
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
could you please move the binding changes before the DTS changes, to=20
avoid temporary DT build warnings.

Thanks
> ---
>   Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Do=
cumentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index 4fb32e9aec0a341a50088f3e4352ed4d36f649d3..5b98228466c6414be681c494=
17bbdd82f2c45756 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -70,6 +70,12 @@ properties:
>       minItems: 1
>       maxItems: 4
>  =20
> +  gpio-reserved-ranges: true
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
>   patternProperties:
>     "^.+-hog(-[0-9]+)?$":
>       type: object
>


