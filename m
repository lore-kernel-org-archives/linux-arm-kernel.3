Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA45CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqLtvN8NDsM8+HqcXXWyZ6s63353++hlV04CzTz0M9o=; b=MAqGZ7IP5+uKYohZA1647BZV93
	JwOVA6CkM0uZH4KFHLF1/d+f/67cWbB6VgbmBKCaqLfJl6blHbeUes3FubcSWjgdd6M2cxhcmbcph
	ceGZ6wRqdb2ylWOEceATJQmzQuG+waa+BNT3WbStopirajW/W/Mw636i5TQmgE+SzmeR7KB3qZy10
	v5mGbsfbZVrTItQSKYI3OoPkc1abQfWRnlJ5KkYwH+R0Lg+BBbsdl/TgmxbM29V12vzDRfqop1Qzq
	3H0A9Vts+WQO0A1nB+TnIJcihk3pv+pLwKlkSD6LXxUC8gy0Ci9BGZnxkAHRpeOoxpYl2aHwGcsQJ
	marqTjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oe-0000000Cssw-49tA;
	Mon, 01 Sep 2025 14:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3O8-0000000CFYN-1nbs;
	Mon, 01 Sep 2025 12:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96F8D403B9;
	Mon,  1 Sep 2025 12:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C32FC4CEF0;
	Mon,  1 Sep 2025 12:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756728715;
	bh=qBCtOBJT2cV+mYRDVrXbHxe214BFli2AJqzlHAFeHmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgM4H5HrKPqzEWKaSZZ7G5TFgQ07XB5abKuclMAVTDyb72U8Mej25CusONsJTcqUA
	 D8HD6YysFa4BLj7g866Hk/j8mfg7NLIcRq0I57I4DBx+xCOH4xiVd3hwq4Ken3omiY
	 7P4hMwDYQ2lOEB7aFsWcQ+d7Sb82DMMfmmNCaffJJOTEepv71yzjo3FsRsD6TmfaQV
	 cT0/PVLi/7Iqh5DsfIOmEYvalaeUnHIjpNQVefdV6+GUxOV/0QZkbt0TC2+34r0eMt
	 u1fxeyrUs6OGR/HoSCu4I9xWptMRoncdQ2+GqxTpRL9Kx02riRJi1DhTi0bT0DQetk
	 hxABn07H4QR+w==
Date: Mon, 1 Sep 2025 17:41:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com
Subject: Re: [PATCH v3 10/12] phy: exynos: Add PCIe PHY support for FSD SoC
Message-ID: <aLWNhv0eLj7LRrvM@vaman>
References: <20250811154638.95732-1-shradha.t@samsung.com>
 <CGME20250811154738epcas5p1d1202f799c4d950c5d5e7f45e39a51e7@epcas5p1.samsung.com>
 <20250811154638.95732-11-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811154638.95732-11-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_051156_515081_391DE00D 
X-CRM114-Status: UNSURE (   9.18  )
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

On 11-08-25, 21:16, Shradha Todi wrote:
> Add PCIe PHY support for Tesla FSD SoC.

Can you pls add a bit more description of what you are adding, helps to
understand the change

> +/* FSD: PCIe PCS registers */
> +#define FSD_PCIE_PCS_BRF_0		0x0004
> +#define FSD_PCIE_PCS_BRF_1		0x0804
> +#define FSD_PCIE_PCS_CLK		0x0180
> +
> +/* FSD: PCIe SYSREG registers */
> +#define FSD_PCIE_SYSREG_PHY_0_CON			0x042c
> +#define FSD_PCIE_SYSREG_PHY_0_CON_MASK			0x03ff
> +#define FSD_PCIE_SYSREG_PHY_0_REF_SEL			(0x2 << 0)

Use GENMASK() please here and elsewhere

> +static int fsd_pcie_phy0_reset(struct phy *phy)
> +{
> +	struct exynos_pcie_phy *phy_ctrl = phy_get_drvdata(phy);
> +
> +	writel(0x1, phy_ctrl->pcs_base + FSD_PCIE_PCS_CLK);
> +
> +	regmap_update_bits(phy_ctrl->fsysreg, FSD_PCIE_SYSREG_PHY_0_CON,
> +			FSD_PCIE_SYSREG_PHY_0_CON_MASK, 0x0);
> +	regmap_update_bits(phy_ctrl->fsysreg, FSD_PCIE_SYSREG_PHY_0_CON,
> +		FSD_PCIE_SYSREG_PHY_0_AUX_EN, FSD_PCIE_SYSREG_PHY_0_AUX_EN);
> +	regmap_update_bits(phy_ctrl->fsysreg, FSD_PCIE_SYSREG_PHY_0_CON,
> +		FSD_PCIE_SYSREG_PHY_0_REF_SEL_MASK, FSD_PCIE_SYSREG_PHY_0_REF_SEL);
> +	regmap_update_bits(phy_ctrl->fsysreg, FSD_PCIE_SYSREG_PHY_0_CON,
> +		FSD_PCIE_SYSREG_PHY_0_INIT_RSTN, FSD_PCIE_SYSREG_PHY_0_INIT_RSTN);

pls conform to coding style for these

> +
> +	return 0;

why return a value when this wont ever return anything else than 0?

> +
> +	writel(0x2, pbase + FSD_PCIE_PHY_CMN_RESET);
> +
> +	writel(0x00, phy_ctrl->pcs_base + FSD_PCIE_PCS_BRF_0);
> +	writel(0x00, phy_ctrl->pcs_base + FSD_PCIE_PCS_BRF_1);
> +	writel(0x00, pbase + FSD_PCIE_PHY_AGG_BIF_RESET);
> +	writel(0x00, pbase + FSD_PCIE_PHY_AGG_BIF_CLOCK);
> +
> +	fsd_pcie_phy_writel(phy_ctrl, FSD_PCIE_PHY_TRSV_REG07B_LN_N, 0x20);
> +	fsd_pcie_phy_writel(phy_ctrl, FSD_PCIE_PHY_TRSV_REG052_LN_N, 0x00);
> +	writel(0xaa, pbase + FSD_PCIE_PHY_TRSV_CMN_REG01E);
> +	writel(0x28, pbase + FSD_PCIE_PHY_TRSV_CMN_REG02D);
> +	writel(0x28, pbase + FSD_PCIE_PHY_TRSV_CMN_REG031);
> +	writel(0x21, pbase + FSD_PCIE_PHY_TRSV_CMN_REG036);
> +	writel(0x12, pbase + FSD_PCIE_PHY_TRSV_CMN_REG05F);
> +	writel(0x23, pbase + FSD_PCIE_PHY_TRSV_CMN_REG060);
> +	writel(0x0, pbase + FSD_PCIE_PHY_TRSV_CMN_REG061);
> +	writel(0x0, pbase + FSD_PCIE_PHY_TRSV_CMN_REG062);
> +	writel(0x15, pbase + FSD_PCIE_PHY_TRSV_CMN_REG03);

Magic numbers?
-- 
~Vinod

