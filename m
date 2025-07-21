Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ADC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjfdYQb3vt4V04Bv05JSqxbXWW9WZpsFUMkpdXWCeng=; b=tiXVnZ8cMcXhI12RZ1XzuFSlx6
	V+VED3wQKjKJFmSs/tgNtlaAbxwGB3ulRZWwZVfHj2OFCb3psqgXsZvf6bIgv3tevOr/fKRZJ8LrT
	10c4dKsBiq2uRRvS/a9nv/qkmT6PIVkO54q6xmWiNDGY99EX6YNq+NGARz8qezvWMRcByeGz1WKfT
	2FRfsUPelEyM6RESpAAvcQjyUog1QVaBa15p28MKY4oEFeTMJkBjiwOpV+jeFjjsixvh9G5Td8hqE
	CGPNnb99mffwcA2xRcqL7auhEsUes/O6MxnkYqo8F1HQS/+38U92NT+6u1Z7rZHAPN0blJh/ypePz
	tqJKUhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlF6-0000000GXja-1tAM;
	Mon, 21 Jul 2025 07:47:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlC6-0000000GXAW-40AU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A64E5C58CD;
	Mon, 21 Jul 2025 07:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404E2C4CEED;
	Mon, 21 Jul 2025 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753083857;
	bh=R3ilKXNADnBxk5zEfxWQZZyeUwHHSGqEttZLXNnSuxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APLGWMJrwvS91kLS73mJMH4GYeW811wsHpGCxgfuwPIubxyQgLnm+tNBzP+04q5LW
	 wJxcYwBN20r5udleMW2IyvT7izI1OW1JqCMH1iC3X+nINtUv2fx06utvXLZJum4v3h
	 eUlJujOwnDFapKvET+PMg5aUgPg9amZtWcJFNwFnV5WLGnq7jDZIZedAT03fpRlOfJ
	 PBD3167foKCn/gjsphntTyWeV6z/nqX4AFttM7+eeBNNNhal42vi7UDnClVGF0kK5J
	 wZNz8j2JC8srj6FW6YrwwFCDwgoWscSVbNnw20eYSojpJeGyHUDCgXmoin66JxfSUB
	 wEn22tKqsJwSg==
Date: Mon, 21 Jul 2025 09:44:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200  UT3.0b platform BMC
Message-ID: <20250721-hulking-violet-mastodon-16e87a@kuoka>
References: <20250718231118.3330855-1-donalds@nvidia.com>
 <20250718231118.3330855-3-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718231118.3330855-3-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_004419_076635_37E90CB1 
X-CRM114-Status: GOOD (  10.90  )
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

On Fri, Jul 18, 2025 at 04:11:18PM -0700, Donald Shannon wrote:
> +
> +/ {
> +	model = "AST2600 GB200 UT3.0b BMC";
> +	compatible = "nvidia,gb200-ut30b", "aspeed,ast2600";
> +
> +	aliases {
> +		serial2 = &uart3;
> +		serial4 = &uart5;
> +		i2c16   = &imux16;
> +		i2c17   = &imux17;
> +		i2c18   = &imux18;
> +		i2c19   = &imux19;
> +		i2c20   = &imux20;
> +		i2c21   = &imux21;
> +		i2c22   = &imux22;
> +		i2c23   = &imux23;
> +		i2c24   = &imux24;
> +		i2c25   = &imux25;
> +		i2c26   = &imux26;
> +		i2c27   = &imux27;
> +		i2c28   = &imux28;
> +		i2c29   = &imux29;
> +		i2c30   = &imux30;
> +		i2c31   = &imux31;
> +		i2c32   = &imux32;
> +		i2c33   = &imux33;
> +		i2c34   = &imux34;
> +		i2c35   = &imux35;
> +		i2c36   = &imux36;
> +		i2c37   = &imux37;
> +		i2c38   = &imux38;
> +		i2c39   = &imux39;
> +		i2c40	= &e1si2c0;
> +		i2c41	= &e1si2c1;
> +		i2c42	= &e1si2c2;
> +		i2c43	= &e1si2c3;
> +		i2c48	= &i2c17mux0;
> +		i2c49	= &i2c17mux1;
> +		i2c50	= &i2c17mux2;
> +		i2c51	= &i2c17mux3;
> +		i2c52	= &i2c25mux0;
> +		i2c53	= &i2c25mux1;
> +		i2c54	= &i2c25mux2;
> +		i2c55	= &i2c25mux3;
> +		i2c56	= &i2c29mux0;
> +		i2c57	= &i2c29mux1;
> +		i2c58	= &i2c29mux2;
> +		i2c59	= &i2c29mux3;
> +	};
> +
> +	buttons {
> +		button-power {
> +			label = "power-btn";

How is this supposed to work? How does anything bind here?

> +			gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
> +		};
> +		button-uid {
> +			label = "uid-btn";
> +			gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led-0 {
> +			label = "uid_led";
> +			gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
> +		};
> +		led-1 {
> +			label = "fault_led";
> +			gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
> +		};
> +		led-2 {
> +			label = "power_led";
> +			gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reg_3v3_stby: regulator-3v3-standby {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3v3-standby";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: framebuffer@9f000000 {
> +			no-map;
> +			reg = <0x9f000000 0x01000000>; /* 16M */
> +		};
> +
> +		ramoops@a0000000 {
> +			compatible = "ramoops";
> +			reg = <0xa0000000 0x100000>; /* 1MB */
> +			record-size = <0x10000>; /* 64KB */
> +			max-reason = <2>; /* KMSG_DUMP_OOPS */
> +		};
> +
> +		gfx_memory: framebuffer {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +		};
> +
> +		video_engine_memory: jpegbuffer {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x02000000>;	/* 32M */
> +			alignment = <0x01000000>;
> +		};
> +	};
> +};
> +
> +// Enable Primary flash on FMC for bring up activity
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +		status = "okay";

Why do you need it? Anything disabled it?

Best regards,
Krzysztof


