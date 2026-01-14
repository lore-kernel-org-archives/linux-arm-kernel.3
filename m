Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ACED30CFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngszkxum/tZvtKinEoxwk/p/9svR2Xe08KvZi4FkbPc=; b=doi6oD1IQO/RJZfynT4qTFwM1D
	1fpC6geZdZ1HNffG6CoW207rz8hnydxHXJxOQZ8wlKuRfmuQEvNEdNDPOb6UN6rSJKLi+xeoWwTc7
	JglYEPLdDWx/bTkfvb1umymbsZngVJst6/I1mAXnFV6qNEDkh7ktgAwrAqWATonhObR56x7T1M974
	22c3qdpYhjork7yLmEE9WE0pjeNX4UsDmZR6ktFd941c25DV90XoTH154e2t3OulCBQfhJu3bYybD
	QeZhlpI26iTtmu1rdC9a3SOS/rUznedDtHft1AeB01BjapjmTj0h+WjsxQ7ketiidi+g/G3lzzkvf
	VCdqK6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ql-00000009rzQ-1Cmv;
	Wed, 14 Jan 2026 16:09:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Qj-00000009ryu-3Hvo;
	Wed, 14 Jan 2026 16:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C89E56000A;
	Wed, 14 Jan 2026 16:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECE9C4CEF7;
	Wed, 14 Jan 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768406948;
	bh=RcWDWr8WdqPhjE1J0vAZphz5xlYpd8I6Uc8jAUxHLV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNON+7sMgvAO846vVwuFiwEchPZY5sEB8s+BwIKxwK+FoldG+9Rc0SfCB6XBlDrOQ
	 yWaA24WCZwBS+INft/dKuws0m8eFL0s8/oYvLas3DIgWLeqWtdacie+fz/FB/ZdB5c
	 OIs9f0++VWq3LLygegd0fBNBqD9dh0hRa13NAdrHsbG/IWuyGyDCDMb7ex/oeks0/D
	 B5zgWE+alovSasC99A+EGt7qShwFFdVF2lpCYcFbqJFoW2jDNc/aSiMjFObRN7WPTY
	 GG6vBsj/RugTAlB5zN7qSHBbmCNr2hZcoJEUfrm4CNfcCb/pK0jw+iikU40Jr/snS2
	 jpJbm5gt6kegA==
Date: Wed, 14 Jan 2026 21:39:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Message-ID: <aWe_oNDOqHnQo0X2@vaman>
References: <20251224111807.2925675-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224111807.2925675-1-xu.yang_2@nxp.com>
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

On 24-12-25, 19:18, Xu Yang wrote:

What is the with the CamelCase on the patch title! We dont do that
please

> This is to resolve the problem of wakeup system by USB3 device insertion
> if HSIOMIX on, in that case, the USB3 device detects RX term on so the
> USB3 device doesn't downgrade to high-speed, we can't expect CONN wakeup
> (for USB3) happen because the 24MHz OSC is required ON to trigger it.
> Because the device works at Super-speed so DP/DM wakeup can't happen
> either. Then the entire systen can't be waken up by such device attach
> event.
> 
> With this override bit we can force the RX term off when enters system
> suspend, and disable the override after system resume. Therefore, the
> USB3 device will always downgrade to High-speed, then DP/DM wakeup can
> always happen. It will correctly switch to Super-speed later when the
> host reset it after the system resume back.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - rephase the message
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 92c5c233bad9..e991a480b882 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -51,6 +51,7 @@
>  #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
>  
>  #define PHY_CTRL6			0x18
> +#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>  
> @@ -630,6 +631,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  static int imx8mq_phy_power_on(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
>  	int ret;
>  
>  	ret = regulator_enable(imx_phy->vbus);
> @@ -646,12 +648,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  		return ret;
>  	}
>  
> -	return ret;
> +	/* Disable rx term override */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	return 0;
>  }
>  
>  static int imx8mq_phy_power_off(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* Override rx term to be 0 */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
>  
>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
> -- 
> 2.34.1

-- 
~Vinod

