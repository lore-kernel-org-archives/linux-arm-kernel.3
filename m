Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24567C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kw7jYMPeu1JcgtQn3KTicUAd7itFZgmljraU1S3nD1U=; b=DTk2Qb4c9c/aWdHEPQ3HIZFsEu
	2K346FXbWv/0HGyLRnZ6MmlMm1wv/YcuXfwLxNUnGXVIyYsINaiKrWMZ0ifCPfw+vwypEg6tLfkEL
	79zPFGEhmt+8fBu8t3x5DJ+Sm2JOXQG3sMJMN4hj5+WqZhy17X/rdCSujNClq2+9CXD/4W9RUkN53
	3s9gMKEI1agUxWaGU0yMbKD5MuGSiLqs3Jth2IIPzSotSqUyYZLjF2C1wpvRrQ/0e1KjlyTjH3x12
	l7RRNjAcV/XRt3/l1ue+zsRZoLx+1jNrQ4suiSUNMwl218hX7Wi892WxbQYcs8yNZfXpN4eMWZjwf
	zu/W7JQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3zf-00000004nKY-3YwA;
	Tue, 08 Jul 2025 08:48:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3n1-00000004lMb-2I9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B05AA5365E;
	Tue,  8 Jul 2025 08:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCD4C4CEED;
	Tue,  8 Jul 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963698;
	bh=2Jz1qIaKUbxfjh+EnpAbS6pNmd5Pwbb3QUeKA2lWqes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNZazJ7SNy74UDkThqwB6ngXolMFPE4YQIak1LVtjrjLOQqhZb2lyIL1zDfvKyss5
	 8zZaVhRWqqvYx6+BZRknWfKOrFiHmj4bG/6KptMbcaVq9xYFQdYnBKHaNmi6ZGqq8T
	 hNuoO5w5SgW+IA3hmVWLxWWIcAJ9DUGHwE7K0omaO5srh0oo2XRu97/L6QAtTR3O2k
	 se5093I87pD3BnlIR+HKXRXOGs+/QOvjwyrtT5BEdokep7OAgEfxgIWtCgDhWnozKK
	 6Zv97ge9pV/StWeXK6qM3J0Y8B5x1c4SSaXHCiqcmli1VOmcen9XVrKtgzKpSYTcqr
	 AVghupSINM7Zw==
Date: Tue, 8 Jul 2025 10:34:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taishi Shimizu <s.taishi14142@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Rafal Milecki <zajec5@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 2/2] ARM: dts: BCM5301X: Add support for Buffalo
 WXR-1750DHP
Message-ID: <20250708-elite-indigo-wombat-faa74f@krzk-bin>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
 <20250625154315.114139-2-s.taishi14142@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625154315.114139-2-s.taishi14142@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013459_654710_D1BC2B92 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Jun 26, 2025 at 12:43:15AM +0900, Taishi Shimizu wrote:
> +
> +#include "bcm4708.dtsi"
> +#include "bcm5301x-nand-cs0-bch8.dtsi"
> +
> +/ {
> +	compatible = "buffalo,wxr-1750dhp", "brcm,bcm4708";
> +	model = "Buffalo WXR-1750DHP";
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200";

Please use stdout path property.

> +	};
> +
> +	memory@0 {
> +		reg = <0x00000000 0x08000000>,
> +		      <0x88000000 0x08000000>;
> +		device_type = "memory";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-aoss {
> +			label = "AOSS";
> +			linux,code = <KEY_WPS_BUTTON>;
> +			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		/* GPIO 8 and 9 are a tri-state switch button with
> +		 * ROUTER / AP / WB.
> +		 */
> +		button-bridge {
> +			label = "WB";
> +			linux,code = <BTN_2>;
> +			linux,input-type = <EV_SW>;
> +			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		/* GPIO 3 is a switch button with AUTO / MANUAL. */
> +		button-manual {
> +			label = "MANUAL";
> +			linux,code = <BTN_0>;
> +			linux,input-type = <EV_SW>;
> +			gpios = <&chipcommon 3 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		button-restart {
> +			label = "Reset";
> +			linux,code = <KEY_RESTART>;
> +			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-router {
> +			label = "ROUTER";
> +			linux,code = <BTN_1>;
> +			linux,input-type = <EV_SW>;
> +			gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-power0 {
> +			label = "bcm53xx:white:power";

You should use rather color and function properties.

> +			linux,default-trigger = "default-on";
> +			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
> +		};

Best regards,
Krzysztof


