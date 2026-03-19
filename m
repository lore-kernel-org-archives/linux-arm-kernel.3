Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16821090242
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+RW68aVkI9iLNvIqRQgkb95WN+LSHBz85KEiW1L0vU=; b=Zy/6A8vkcP2pzJ/8wHNKhOYCiG
	0rkC8ORE7sHj3nEUqPjFIsG/xu9t+q41DDpzTEAW5yF/x9SM232R0dFSz2GucG1p9ffRxj8mPe6qF
	dMdBSMi6zzMoyZ9zdygLH6Tr11FGn3rT3kq2ggL9d73q3fYXmT4sJF1geL2mkMyHJ22nt3+EM56hg
	UEEab5LjJBeiIaxs1J8VtZ7LpssjKqtioyF0ZIiOGk7WSy2WwgiZyXrJLgrlZi/yd4CaQE6xefMOw
	5Q37DgB3HeD6fET69Ou9dTLxZIj7n439bBHb6qTfken2f/41wKM2M4dHuZF+zEs2eWrRRRv6ULIH3
	pUwSgf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FXS-0000000Avs9-3lOx;
	Thu, 19 Mar 2026 15:43:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FXP-0000000Avrk-3ih2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k+RW68aVkI9iLNvIqRQgkb95WN+LSHBz85KEiW1L0vU=; b=fH/Ts+OqzrlIgE4J7Pm11SorfU
	Zcj6b6UkIugNxQHPWpeB2LgEtpbDGDwOqPR8NfsowHL5k0xS0FTxQJVNhR/hQDcxViB+hqfRcFKHE
	okGcxegOflerZjqnYLRQCC+E0Bg6NQiY0aVAZrSwTPEtgpDhfdM/1R7PEq0VyM+h1r1c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w3FXA-00CPBt-KF; Thu, 19 Mar 2026 16:43:40 +0100
Date: Thu, 19 Mar 2026 16:43:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_084356_172522_DA71E82D 
X-CRM114-Status: UNSURE (   7.18  )
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

> +&eqos {
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;

Is that a valid property for "snps,dwmac-mdio"?

~/linux/drivers/net/ethernet/stmicro/stmmac$ grep  clock-frequency *
~/linux/drivers/net/ethernet/stmicro/stmmac$ 

	Andrew

