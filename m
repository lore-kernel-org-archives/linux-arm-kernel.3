Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A70CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=; b=lw5D4BR7hB29esHUwxaaeSy/Ra
	Gkq70sRfiQ/ToJRC8p6gzg/5fFzviO0lHpTm7nS0CJCkG5jaCXcEd9Xg7oQ6dzJY5M1ZbsYFGvLd1
	UBz68+tCXvdE16XcDHIsQD4CVjr2TT1WKsAljynjBTtsb/mEgNUM4cVcZ1QS5ePy1hHll7RccFwfQ
	bZ9MPWuV6UiAgEJ+i2+BeTrq3nmdYhuiW/LPGTNthj9hJccvW+LGLab6WO+9vqM6k/khkthQhnAy9
	1PSGy2Qn5bTpTpEk4Nwuhrqqa0cvbRm7Djm1Fn1Nn2obxGvHQ/I5asM7eUpUzS0/YpcMJJXWEARw+
	RhW7wTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHR8-0000000DKtA-2HqW;
	Wed, 10 Sep 2025 09:48:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHR7-0000000DKs4-0L37;
	Wed, 10 Sep 2025 09:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=; b=cTmbZnWOpEuU243Pzi4bOthD4l
	e9wxwJQRfa8humxwp/Mg7Y9xks/TWT0/KmpTdMrnq8JYPaYFswD+JlftE+EXnH3hn/8q3hfyTxOo/
	wYgKSD3VXwXSaCfM7JT7ebYDv54OJMV23NlahxGxBG2C2zPmmGfg53Vl0ElxZfcr7EMYiHY8XQSg9
	k8WupMVSHpiCAaW3An0iDCM2JHrppUbLYWTh9i12dOI9f6XRuTg+WN9zNcZ5au1w9tiJLZAh1VDAB
	jydZeKW93Rzeao/O1fDUl6dUk8LHZJZXyq+i5ESaFwYw0hTUodMQjCpyImsB39FnQgyZgd5RW/WL7
	ZmdglyvQ==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHR3-00000005opF-1iSE;
	Wed, 10 Sep 2025 09:48:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so4972721f8f.3;
        Wed, 10 Sep 2025 02:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757497695; x=1758102495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=;
        b=FZgc2su8VtUAw8Z9e0y+JljafE06iDu0SXPCbTZ4+4VzhJKtkFtoENLrlcQcpLejkz
         AuQD0JeojnSFcrfbQ4diTFS3n3Qj1LDzjfnEToY8Ksb8AzXxP+QNpb9lSARXNtMw9U3n
         SjSElHjJSD5PdRHizrwdstMQc327lG0IyyYY/kPWaixVqzO6KLk+Wm9oew1up7sNOVvm
         GRBNMrlsi91k038mMMftkzzButCA6DVuG+ZZsF8F6eufLeP8AssR1bMlTOuRc/uBvbxS
         t2bt52BErn3pxnzht+yagEao6Zcb+U7nBEwmETkP94MvDu5S7eCs1rkTo4K3ItRaQBkV
         hJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497695; x=1758102495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvWzS942sl9K7TdJhE3IIiPtyTBcuDx5QSL2bbxUBbU=;
        b=VgCo23AuZs1fW8NzrLZSrrNcM7wSrva4HETkK1a17D1CrFkMdGn3Qvq5gywSwjS2do
         ZmjwaD4YumQv2fEQ9+hEtCt/O6rizjN2Yku2chUYkUrhCnpXmzfAGCY8M3o3buESBnf5
         ljVqeBx29sOI6VX0rwmD+bw/S9yUOy33Py15PW2O4rohjOXbFP/bKs/F147sZdtH20Tf
         JQ28r1Af5wYFHQ9h2+AR0tID639W9w1yXpzaT7K8bBcazCnhry69Lbq6xXb3usCaGkzG
         1qDuzsRHuvpXQbwvw9icxay0O423m2MgFXTnUpXvN6PzsPYHonGxUsdJAzgPBrODXjVV
         ccvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdJaqEYes67iWy5V4JEFSKt9gO6Pp3vjxtzmprpr/Q6vRa80N93mefPpVvyGOeLRrMHWjIeaz+xpzYcgH92YE=@lists.infradead.org, AJvYcCWTWGLX56PRs5p9rUi71egTYI+TlH7F0MjoQcTbEcJ/uuhVwPmts0K7aDDmYASzYgemdqqe0mfCFa0Gbwdc+mGh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa6oEcxFAj8LsmS11E4MJccZ6h2X8YL9DLd27F/zrHXV5l93oS
	ujUpKqWrkGGnFRPUIEgaFspx1GIngq8huFUGFW1PkeCaFZKA3BeIhF1D
X-Gm-Gg: ASbGnctll2S+enj6jLMy/CYjhzjWg27jJVoDNiqmwS3SCKw7E9a943sGN9hsCS2flZn
	RZM26eJdubjfL4bBnFxZS9NkB+GtHsu7IO16VZlgNBwPBA/Q7VAhL5c688lkix65OacKp81g/br
	FG8MLBluvhCr2KsgWYzzVYaOGQQT0yvIgqfG4vSuz/gOhddwm9eyi7Av1TWSu4VeYVtsaf4exqy
	hWu0wRjN2N1qj3p6FgBEgQHIMqv3WgsYfihWtB0EdcDw7t07LVb0EPuadOUKCsFTe9rZq1R8YdX
	ogqYqfDhDttWrOdyJL/mi1wtDbioU0MZJAlX2lea9FNhOY8dew+b0aaG1Md+AS57lc5dBUa7+gZ
	Ehjdiv5K0pfNjecLUtVTqITi3TJy+gqDVWYEEiI1fpr5xUaQXAzo7DZ4Zswis4Bt1oPXoGDYF
X-Google-Smtp-Source: AGHT+IGE36lJKKNg+ppA7YOvf2X4FE/fbTStcAqoVMnOyK3dvNvS9vqCBo0pUphTN7bH8X2XtqXmcQ==
X-Received: by 2002:a05:6000:3103:b0:3d7:618b:2939 with SMTP id ffacd0b85a97d-3e643ff59a9mr14353030f8f.38.1757497694801;
        Wed, 10 Sep 2025 02:48:14 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df82247basm21584115e9.18.2025.09.10.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:48:13 -0700 (PDT)
Message-ID: <6b781d80-a991-44de-b066-390914af1e0d@gmail.com>
Date: Wed, 10 Sep 2025 11:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support
 for blue and red LEDs
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-3-40f11377fb55@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-3-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_104817_572513_BADCD19F 
X-CRM114-Status: GOOD (  15.05  )
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



On 05/09/2025 13:52, Julien Massot wrote:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index fd596e2298285361ad7c2fb828feec598d75a73e..0ea36e7c960fc0b2607833d743c5e2e806864600 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>   #include <dt-bindings/spmi/spmi.h>
> @@ -73,6 +74,26 @@ button-volume-up {
>   		};
>   	};
>   
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-0 = <&gpio_leds_pins>;
> +		pinctrl-names = "default";
> +
> +		/*
> +		 * This board has a RGB LED, of which only R and B
> +		 * are controllable.
> +		 */
> +		rgb-blue {

Please fix the DT warnings and submit again.

Matthias

> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
>   	wifi_vreg: regulator-wifi-3v3-en {
>   		compatible = "regulator-fixed";
>   		regulator-name = "wifi_3v3_en";
> @@ -647,6 +668,14 @@ pins {
>   		};
>   	};
>   
> +	gpio_leds_pins: gpio-leds-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>,
> +				 <PINMUX_GPIO7__FUNC_GPIO7>;
> +			output-low;
> +		};
> +	};
> +
>   	i2c2_pins: i2c2-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
> 


