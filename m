Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81997C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbADdHqSyemEAUvSgp0Vxsp615wRz96ttPoTQeE5LAo=; b=LCCb7p2LnZDmzucPRDuV05tfl9
	bHw6mhwFdqN3N4ZBcY06DSTi4x3HMkF7UatA8mFZE/vsK8Gt55rP4nsSURms/xFaLBeWhVTtv5d0I
	XelZ4qhCA1MuD4mMRadwVZZCjhqsOP0+zNoMP8z08vDC20tSuaZE11Z87XI+T+nVdLfZNyoTmcTJX
	spoLWJRpL6gBpfxNGdbtorWI85XxEa4cUVjZ50LOcc9uKgBLYnJn6pmUok85XZS8LebECXlqquIeO
	9ta2JuF1PXKKT6Ak68K5fGntlmcfCve47/gxafrGEvVivmUdW7WBqXvtZ/TOrePHkMy+Th/Wal3Sn
	xlxqK2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSu0-00000008LbH-40ls;
	Mon, 26 May 2025 08:09:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSrr-00000008L8b-2sAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 08:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bbADdHqSyemEAUvSgp0Vxsp615wRz96ttPoTQeE5LAo=; b=ahmp7gVKJThDo8tM/ki0syfuDO
	JQtPY1b6f/MhHhhkDOr6epdnAs23WIReEi4cS/jX2seK6jRV8D64egdPDbzu0ATYjmqV3uvgtyRuM
	L28cPXQKHj4swBTuaFPS4vj1udkP0rrgNjalXHH8NVUfvoMPGGM4HxxAGptJvPlWeZJjCRu+CyH86
	EGQDPvyoL7F1xXhi7G5cjdYnVCEex3JGS43fnm0UThcxWdZIqHy41Ry7ItnoTGLzrL621TA2cFa/4
	wtDHSNK4r/xGSPQRieqC6Kranr7QD6YD0UPQjI9sjJWWQazCRZJjGd21XRaeXvljqFD+emrVJbpwY
	0tGoJdlQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50816)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uJSpH-0006VC-1T;
	Mon, 26 May 2025 09:04:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uJSp6-0000Fz-1l;
	Mon, 26 May 2025 09:04:40 +0100
Date: Mon, 26 May 2025 09:04:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
Message-ID: <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526002924.2567843-2-james.hilliard1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_010731_722399_C5BBBEAD 
X-CRM114-Status: GOOD (  11.38  )
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

On Sun, May 25, 2025 at 06:29:22PM -0600, James Hilliard wrote:
> +	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
> +		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
> +		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
> +		if (index < 0) {
> +			dev_err(dev, "PHY name not found in device tree\n");
> +			return -EINVAL;
> +		}
> +
> +		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
> +		if (!plat_dat->phy_node) {
> +			dev_err(dev, "Failed to get PHY node from phys property\n");
> +			return -EINVAL;
> +		}
> +	}

1. You are re-using the drivers/phy binding for ethernet PHYs driven by
   phylib here.
2. You need to update
   Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
   in a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

