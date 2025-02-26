Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E37AC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ozf+7Q+exXjohkxtJs5vNdrBo5Sdnc0Ag2Lz0YxhzU=; b=vo/mKyaXMjjaF7EvjoVK3hTz/p
	zcXcXSijc/IpGLSNpcDY4tjLEwAy9aPexyviSQD11BE78mJluoz5w7VBnrZr1TVhbDqzJKOEj9TPp
	Ll0qfaBIOwQ0HjnValQFcyFcRV3nVsnnwxa20rPMDUbkfkdnCgKA3tucuk+EBN805fOwCknsU/ECu
	L2e8Cz3cJ/pDJE5Oc2OqN5Sk67uxE53ICf19YhepZhEIafcXkr1sMLhesRNcCEOWOZ8ZzQLx9+rpY
	JNyoZFYBPn14xfQMKA30/U7fV+QfCyd4meNvAk4RnVY/8IP/AJ5XMm2uH5yamWCIcEJ7XOEeRbvCP
	wVSAcrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEj-00000004FCa-0uEq;
	Wed, 26 Feb 2025 15:22:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQz-00000003sG1-2Lb6;
	Wed, 26 Feb 2025 13:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4Ozf+7Q+exXjohkxtJs5vNdrBo5Sdnc0Ag2Lz0YxhzU=; b=eV9qskFPoKZwRN+6N9JVTjm8Q3
	FxkH4U7nFEa/cppjdADbfqmE5BAWWrEBgfpAn2clA45USjUaq+7Zj7y57DZMJ1NdZHm4ZsnnXhusu
	eHeZE0k0jV8c9girbgPy0GgkwvO3vJbemnADb8tV3EqrwD91w+qUgZWPC5bCwn5Rt5OOEH1p/Xxfj
	+gQSDljgywYEBC6cE5/rxrEzWHH2mRGjGQvH+AOGfoYqz55k1+vuTTYK0MNe3v+I5BrmNLFQKA2K0
	yr2SVts4CZMDs0D9zAo9jCwTTr11aO6D5iMGrP54fFPwTj0ZNvu/ni61/oZTMpJfZAyiEIvdxSG8z
	QNP3OjLg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQw-0000000FPiQ-0uoK;
	Wed, 26 Feb 2025 13:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4Ozf+7Q+exXjohkxtJs5vNdrBo5Sdnc0Ag2Lz0YxhzU=; b=M+EF2Q0a0WRuAPx96YN4gdGAGD
	cJUEFVSoVUXpcau6Rel+vg9J8OcLm3W6FCG3VX49WlwcmMK+wDwM5029xr9hVdseTQlMBv03A/9c6
	Ra8Y8UvoFAx2/26RJRc/TNFA4IE7Sv4X42AgVaTgv8D9VZm6l33vh2vPiIqBo8ug1Skg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnHQW-000GS9-6o; Wed, 26 Feb 2025 14:26:16 +0100
Date: Wed, 26 Feb 2025 14:26:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: phy: mediatek: Add 2.5Gphy firmware
 dt-bindings and dts node
Message-ID: <8bc68f1a-5abd-478c-9b9d-2c8baa6bb36a@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
 <a15cfd5d-7c1a-45b2-af14-aa4e8761111f@lunn.ch>
 <Z7X5Dta3oUgmhnmk@makrotopia.org>
 <ff96f5d38e089fdd76294265f33d7230c573ba69.camel@mediatek.com>
 <176f8fe1-f4cf-4bbd-9aea-5f407cef8ac5@lunn.ch>
 <c5728ec30db963c97b6e292b51e73e2c075d1757.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5728ec30db963c97b6e292b51e73e2c075d1757.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_132642_282597_316AAF59 
X-CRM114-Status: GOOD (  16.00  )
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

> So I guess I can do the following according to the previous discussion:
> 1) Reserve a memory region in mt7988.dtsi
> reserved-memory {
> 	#address-cells = <2>;
> 	#size-celss = <2>;
> 	ranges;
> 
> 	/* 0x0f0100000~0x0f1f0024 are specific for built-in 2.5Gphy.
> 	 * In this range, it includes "PMB_FW_BASE"(0x0f100000)
> 	 * and "MCU_CSR_BASE"(0x0f0f0000)
> 	 */
> 	i2p5g: i2p5g@0f100000 {
> 		reg = <0 0x0f010000 0 0x1e0024>;
> 		no-map;
> 	};
> };

Do you even need these? I assume this is in the IO space, not DRAM. So
the kernel is not going to use it by default. That is why you need to
specifically ioremap() it.

> 2) Since PHYs don't use compatibles, hardcode address in mtk-2p5ge.c:
> /* MTK_ prefix means that the macro is used for both MT7988 & MT7987*/
> #define MTK_2P5GPHY_PMB_FW_BASE		(0x0f100000)
> #define MT7988_2P5GE_PMB_FW_LEN		(0x20000)
> #define MT7987_2P5GE_PMB_FW_LEN		(0x18000)
> #define MTK_2P5GPHY_MCU_CSR_BASE	(0x0f0f0000)
> #define MTK_2P5GPHY_MCU_CSR_LEN		(0x20)
> 
> /* On MT7987, we separate firmware bin to 2 files and total size
>  * is decreased from 128KB(mediatek/mt7988/i2p5ge-phy-pmb.bin) to
>  * 96KB(mediatek/mt7987/i2p5ge-phy-pmb.bin)+
>  * 28KB(mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin)
>  * And i2p5ge-phy-DSPBitTb.bin will be loaded to
>  * MT7987_2P5GE_XBZ_PMA_RX_BASE
>  */
> #define MT7987_2P5GE_XBZ_PMA_RX_BASE	(0x0f080000)
> #define MT7987_2P5GE_XBZ_PMA_RX_LEN	(0x5228)
> #define MT7987_2P5GE_DSPBITTB_SIZE	(0x7000)
> 
> /* MT7987 requires these base addresses to manipulate some
>  * registers before loading firmware.
>  */
> #define MT7987_2P5GE_APB_BASE		(0x11c30000)
> #define MT7987_2P5GE_APB_LEN		(0x9c)
> #define MT7987_2P5GE_PMD_REG_BASE	(0x0f010000)
> #define MT7987_2P5GE_PMD_REG_LEN	(0x210)
> #define MT7987_2P5GE_XBZ_PCS_REG_BASE	(0x0f030000)
> #define MT7987_2P5GE_XBZ_PCS_REG_LEN	(0x844)

Should the PCS registers actually be in the PCS driver, not the PHY
driver? Hard to say until we know what these registers actually are.

> #define MT7987_2P5GE_CHIP_SCU_BASE	(0x0f0cf800)
> #define MT7987_2P5GE_CHIP_SCU_LEN	(0x12c)
> 
> static int mt7988_2p5ge_phy_load_fw(struct phy_device *phydev)
> {
> 	struct mtk_i2p5ge_phy_priv *priv = phydev->priv;
> 	void __iomem *mcu_csr_base, *pmb_addr;
> 	struct device *dev = &phydev->mdio.dev;
> 	const struct firmware *fw;
> 	int ret, i;
> 	u32 reg;
> 
> 	if (priv->fw_loaded)
> 		return 0;
> 
> 	pmb_addr = ioremap(MTK_2P5GPHY_PMB_FW_BASE,
> 			   MT7988_2P5GE_PMB_FW_LEN);
> 	if (!pmb_addr)
> 		return -ENOMEM;
> 	mcu_csr_base = ioremap(MTK_2P5GPHY_MCU_CSR_BASE,
> 			       MTK_2P5GPHY_MCU_CSR_LEN);
> 	if (!mcu_csr_base) {
> 		ret = -ENOMEM;
> 		goto free_pmb;
> 	}
> ...
> free:
> 	iounmap(mcu_csr_base);
> free_pmb:
> 	iounmap(pmb_addr);
> ...
> }

This looks O.K. It is basically what we did before device tree was
used.

	Andrew

