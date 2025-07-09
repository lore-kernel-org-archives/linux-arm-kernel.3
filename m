Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CDBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTVh1WN93XCvTuk0OPEkSnqV7heNJq4Hxm9NqR8us4c=; b=s1qjV+9IaCVXtP
	iWodPrWZoykIEgVjg6e7ePU3+apQ422hAGz/UpvIgDgWS7TtU+cgb+I7OrMWoU3BIATohI7Ful1kr
	Rxs/mXeYdnHP+ASTeRXBMAWsoUemYIkbm0cQl8jybkMvYzNJaU0hLiJDDE4/sz4FIo3WWIK6qqz6Z
	Bh0O+IkrHmMhDTlHzwqhmu1f7ocCzatd1iguWMLsCzfrO+g4Iz3qdXZ549O+Cp7F7MgJIa+YJSGpA
	TS7TnAjcuue2trErwDE0juAdUhaByPXYEkFu9zB7m3VLIzr4729MHfenNPkT7OPMuqQK3SloudswU
	vm9OnyLJCnSj8lZRiLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJ5w-000000072uZ-2GqV;
	Wed, 09 Jul 2025 00:55:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJ3Z-000000072od-1oh5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 913585C57BD;
	Wed,  9 Jul 2025 00:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63786C4CEED;
	Wed,  9 Jul 2025 00:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752022384;
	bh=hPz+8vn5trBDH79QuCKDMawOQmLVVBkPPcvkIwXcSN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jCAUoneNx+tGEXZ4FP7Y+2H9vCEBq3Fedx3TswkqfUWKU9gcRg/LajCdLwcvO+z5G
	 5qs4hnqdhM8YmEJH0vXuZmm+hshQd1zqlNmhWdh2TknzIOzewNkuzHci5w5NqfJORN
	 C8gnLfScdD1UOlqlalpk1+FbXpbori4X4kP07uDII4fgxv2K/XtGyJtkPirkufY+N4
	 60T5F4QYYgBAlYZNsdc4IcdvjFBammd6+UWgTUTRkufo1urDhhq9e4+9obk1ghYrvf
	 fw1mKEvbyo3NPG4BLYnajSFW19+ydnJrztgeCPmvdwjoCwZ76V3cL+1a6HzdxS2AB6
	 2i+DS4XzhPcng==
Date: Tue, 8 Jul 2025 17:53:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 03/11] net: ti: prueth: Adds PRUETH HW and
 SW configuration
Message-ID: <20250708175301.599c82b8@kernel.org>
In-Reply-To: <20250702140633.1612269-4-parvathi@couthit.com>
References: <20250702140633.1612269-1-parvathi@couthit.com>
	<20250702140633.1612269-4-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_175305_520197_86C610CF 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed,  2 Jul 2025 19:36:25 +0530 Parvathi Pudi wrote:
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index aed5cdc402b5..f52858da89d4 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
> +		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
> +		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
> +		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
> +		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);

> +	/* Min frame length should be set to 64 to allow receive of standard
> +	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
> +	 * Actual size written to register is size - 1 per TRM. This also
> +	 * includes CRC/FCS.
> +	 */
> +	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);

Please use FIELD_PREP() instead of defining separate _MASK and _SHIFT
values.

> +	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
> +	 * Actual size written to register is size - 1 as per TRM.
> +	 * Since driver support run time change of protocol, driver
> +	 * must overwrite the values based on Ethernet type.
> +	 */
> +	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);

> +struct prueth_queue_desc {
> +	u16 rd_ptr;
> +	u16 wr_ptr;
> +	u8 busy_s;
> +	u8 status;
> +	u8 max_fill_level;
> +	u8 overflow_cnt;
> +} __packed;

Please don't use __packed if the struct will be packed anyway based on
C packing rules.

