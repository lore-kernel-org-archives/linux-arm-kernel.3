Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5359C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWyIPfbKGN6ElRg+2eJC1JBl8Q1lwxPgt6OPkmoGqmQ=; b=z6QFRc/KEEH9zov1GHfDAiYZQ9
	SAT93ansduVwYbqxFydzaMTQrgrZysGx9aVbZ/SqaaBCKe/eeN5SxmqPVdbgZEVGtsOCjVJgLdvcZ
	Wx/bkJD8m1Z5FWAZrooHqjhqFY++hMTUvxccCBoAAzbSGMeoQAWnwSeP/3pAdqNi2enwFu5a7IQ6L
	s8AJ9hnd5FY3xPOTXlGPs8qgWy7382NRYZFMwlOEMq5s83uTUEalRpiXxOZyIQqQBTQFvEVSvqQ7z
	qx6NP0JeHQNlZYclIuxf1VaAxaOfLLyaQEqi4s53bqb3ynArsj/Db+Z92VHQM0G9GplgLX9Dy5NQB
	TZdTfQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByu6-000000082L7-0udm;
	Mon, 05 May 2025 16:42:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByef-00000007ypO-1os2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QWyIPfbKGN6ElRg+2eJC1JBl8Q1lwxPgt6OPkmoGqmQ=; b=RE31I3cyW0mz2FPDHHVzAG1o8i
	luuxU+UMhj6rjeMh8qgLY19WO9Rm7EEb+oHli+X8wWex2vmKvkGZcoYr841sopZHutbBUukxKJzVv
	wwhHElTDP+ZmaDlQeFAZDIaucZhGZV+NEZJbc2HiG8ay3LPmmxlmC9FR7XbZ3/h9i3Oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uByeV-00Bc3T-En; Mon, 05 May 2025 18:26:47 +0200
Date: Mon, 5 May 2025 18:26:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?B=F6rge_Str=FCmpfel?= <boerge.struempfel@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ARM: dts: stm32: add initial support for
 stm32mp157-ultra-fly-sbc board
Message-ID: <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505115827.29593-5-goran.radni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_092657_469813_5095648A 
X-CRM114-Status: UNSURE (   7.29  )
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

> +&ethernet0 {
> +	status = "okay";
> +	pinctrl-0 = <&ethernet0_ux_rgmii_pins_a>;
> +	pinctrl-1 = <&ethernet0_ux_rgmii_pins_sleep_a>;
> +	pinctrl-names = "default", "sleep";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;

max-speed is probably pointless, rgmii cannot do more than 1G.

> +	phy-handle = <&phy1>;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: ethernet-phy@1 {
> +			reg = <1>;
> +			interrupt-parent = <&gpiod>;
> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;

PHY interrupts are 99% time level, not edge.

	Andrew

