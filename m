Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927C1D2F35C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUe3p68Mm3OsOBcMm6RQixsXLcR6aOMZwt8Wi464jhM=; b=0DB0DX9Mz50NpoCHpLk8KWUgQD
	WZKB9tHUc518djA5rX2GHv5mDE6od2uMuJmKDWOhPNFO6JDv58OxsMgILFvuUqyrX6ginzRwPo6qG
	A0s+11x22V70Diojlo7BrRHsHD8hUxRisM6z+kThmZra+O6UA/K7cmbHElTrDefxwgZ8se0XMSsGB
	vv9DY8eOcE2I8Q3sY2Y+eb1XOv4XTqB+4xK8d+IJMZf3rt3HGAlQ6nIx2G+4xMUMhnX0wbwQAgQWR
	CJmDscjia2DSNlifg+u1uq51W2ptdvIIONGJMWBkNMsPp+myRUzsSF4Agkc+v4K9RxwiLjIIeYkH5
	a5XeNVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk9K-00000007deD-0EX8;
	Tue, 13 Jan 2026 19:33:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk9H-00000007ddu-2mPa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 19:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QUe3p68Mm3OsOBcMm6RQixsXLcR6aOMZwt8Wi464jhM=; b=GF0+M2AYoE8pxPe1eEUG/Kxo0j
	4fQhaFccuxjV/Xu4bg2335tzPKnalaLTaM0wA7dYLuywGYAEC/q0+9yOEAlGGp9INbHj+sHopEjiF
	/x1GLMTM/1tO+/lsdRWAjkkN86ATvSkEzIzRgZ93MoJSRc8VKciAj1FaNqI4Fv8jA7+M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfk8z-002gHg-Gg; Tue, 13 Jan 2026 20:33:33 +0100
Date: Tue, 13 Jan 2026 20:33:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <d9926d5e-7cdd-4c3c-9d9c-86418ceb4933@lunn.ch>
References: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
 <20260113-ventura2_initial_dts-v3-2-2dbfda6a5b47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-ventura2_initial_dts-v3-2-2dbfda6a5b47@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_113351_721053_762B38F5 
X-CRM114-Status: UNSURE (   8.77  )
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

> +&i2c6 {
> +	status = "okay";
> +
> +	// Marvell 88E6393X EEPROM
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};

Are you don't multi-master with this EEPROM?

> +	io_expander0: gpio@20 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names =
> +		"RST_POE_BMC_N", "POE_DISABLE_BMC_N_R",
> +		"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
> +		"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
> +		"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
> +		"PRSNT_POE_SIG_N", "IRQ_POE_BMC_N_R",
> +		"PWRGD_P3V3_ISO_POE_BMC_R", "88E6393X_INT_N_R",

You have the switches interrupt connected to a GPIO expander?  That
seems a bit odd when you say it is running as a dumb, unmanaged
switch.

	Andrew

