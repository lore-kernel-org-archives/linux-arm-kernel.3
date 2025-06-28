Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCF2C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcZ9/WIUXJawb7HTqIDXc1gWp4/me01Czhwwc+oVp+Q=; b=UD2KlRCT7L6oYbvh/cpI5iLWh1
	OwQX09fNrOcrWLsIbZcriJQPXH+L4WR7VSfRRE9Ida/3+Y2NuOy94KY3ob5XxstWH7xzZOvajjkKk
	G2+I632N3jllNts2d6zeQYwkD3o5U4znFXDiPrM9reB04HlanUx+MU176Ld1CrPEh9N8jHZqPj7QV
	zUCDU24fa7ja2ysR7fbkUL9BNocPpfRTM8Cw0LrsAibYjweCetebYPGLZ1pJ4GuR+ZwpnuJKfcGgt
	bHt4OslVNJcble60XHCxP41TI9uU6rwyDjizFLx4zOaNO/1j415RdNssWTzqSWgyUBHu2WiNzeEv5
	K1/07Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJvT-0000000G74K-2e9X;
	Sat, 28 Jun 2025 01:00:15 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJtA-0000000G6w2-0Ge3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 00:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072266; bh=57q1XTo9fskI3i3LRIZIGt9aWzBFNP8fj6KqbV6kdO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sqyXtFpN3eSkRFEtmv8vnpqiOcADUPU4b8VCu8pnT2OcrR32qudi+k6PyqJAlIyab
	 OGQz64BWpA1KV8zA9b6Ws9icCYe6HstLmKcn9Vgxh2WnFssl8GpJ+BQxQDt0AmHv+k
	 ytloKFip09LlPwvrYWD7MBk4AQTQGsXCA/H2a/yUJRmbyDRma/QHjmq0kf0mv9H8S/
	 AKmsJqLInIp7supSMr/BAc+FmugXyo3lyu1s2GqqA3RPG4eUw2aeJmdbKnFtptfRdg
	 zwlIjwtXfhnnjFvyNXp17qhOVy6VW/GuUKPLFPXHSWsJ5j2eDKJ3N9TibNWyh9Yn22
	 H69Y5TUW/U3PA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5BA6A3C4FE4;
	Sat, 28 Jun 2025 00:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072266; bh=57q1XTo9fskI3i3LRIZIGt9aWzBFNP8fj6KqbV6kdO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sqyXtFpN3eSkRFEtmv8vnpqiOcADUPU4b8VCu8pnT2OcrR32qudi+k6PyqJAlIyab
	 OGQz64BWpA1KV8zA9b6Ws9icCYe6HstLmKcn9Vgxh2WnFssl8GpJ+BQxQDt0AmHv+k
	 ytloKFip09LlPwvrYWD7MBk4AQTQGsXCA/H2a/yUJRmbyDRma/QHjmq0kf0mv9H8S/
	 AKmsJqLInIp7supSMr/BAc+FmugXyo3lyu1s2GqqA3RPG4eUw2aeJmdbKnFtptfRdg
	 zwlIjwtXfhnnjFvyNXp17qhOVy6VW/GuUKPLFPXHSWsJ5j2eDKJ3N9TibNWyh9Yn22
	 H69Y5TUW/U3PA==
Message-ID: <a15cbc55-f0ba-4c15-af27-44b05285bc16@mleia.com>
Date: Sat, 28 Jun 2025 03:57:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250625214357.2620682-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250625214357.2620682-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_005746_395375_387E3A1C 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20250628_005746_395375_387E3A1C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_005746_395375_387E3A1C 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Frank.

On 6/26/25 00:43, Frank Li wrote:
> Convert lpc32xx-udc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lp32xx.dtsi.
> - remove usb-transceiver@2c at examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thank you a lot for doing this massive conversion work of NXP LPC
device tree bindings, I would appreciate, if you put me to CC for
all such changes.

While you do one-to-one conversion, you do bring a lot of errors,
because the .txt descriptions are broken.

Please always reference to arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
and arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi, that's the correct
version of NXP LPC DT bindings, otherwise something important
can be missed by occasion.

<snip>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    usbd@31020000 {
> +        compatible = "nxp,lpc3220-udc";
> +        reg = <0x31020000 0x300>;
> +        interrupt-parent = <&mic>;

interrupt-parent = <sic1>;

> +        interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;

Should subscribe 32 and correct the type:

interrupts = <29 4>, <30 4>, <28 4>, <26 8>;

> +        clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
> +        transceiver = <&isp1301>;
> +    };

-- 
Best wishes,
Vladimir

