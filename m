Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284E107BCEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=888cROttyB4Mj3b/fjU2ay+60B251y1m25xcSu13rsg=; b=Flqwi2uSacNFIVLFbSLvGPCkP4
	p1qCKcrsEPXGpxrn9hOuZEFEgETsGmHkObFqpgUnucGvzBasG35D7fV6MRYRITFa0O8f+WnQQVT5C
	6+/qRRRrB87OcD/wp42KriCaAJvNLP4Az3Msvf/YWNP1xCVYM+JF+SoWURBCRs/hKmhQZ64fH1q+s
	fXFmn0Sxnj7xbn7w7IOjszQ99lkdZLd/0mebhZAm4zTEHIw8TATsduXAU9KSiUU/5PoYzxhJoF7nN
	09QHabXDRZ4DzFyaUnEg+EWcS2jNs9d3notiauFRdDf2K1Lc6V7tKiDF/551vdfThECUUxG5XaGrH
	/bYfhlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Bhw-00000001Itp-0MzZ;
	Fri, 13 Mar 2026 23:14:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Bht-00000001ItS-1oPp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 23:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=888cROttyB4Mj3b/fjU2ay+60B251y1m25xcSu13rsg=; b=xXc7051f1MEEuQmjSkevTHfm/f
	RVZsc7Fd5Ygud2adC6JbbtX3Gmvt5co0Ax3Y5gXAyQdtdCV9avbke7TyZ5nzj/rOnizztf1BZkKOe
	OteMcqZE3GJC2GRj5jGTPbyGoN8HLOWvwtfziTMe8ZnCn7oIuYFIr781jB7sd3kj+qIzWIeobG8vW
	ggrGLs77qR9CY4gcyPhv3qmtzowjlqJ5D4TPPjivUbOYGYDmFdV+a3RmfIsk5GQeb7S40aXnkbNPX
	yrVGyWKdQEJYUm8Q8lhA1pLjo00eiAdN2HNX580Dha9HC7SaJGDsydNDvEH2+z37o8datC3XxZfy3
	sBJkoPRA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54294)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1BhZ-000000001bH-1R66;
	Fri, 13 Mar 2026 23:13:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1BhR-000000000Bt-4A74;
	Fri, 13 Mar 2026 23:13:46 +0000
Date: Fri, 13 Mar 2026 23:13:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "\\Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
	me@ziyao.cc, siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	matthew.gerlach@altera.com, chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org, florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v7 2/5] net: stmmac: Add DW25GMAC support in
 stmmac core driver
Message-ID: <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-3-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313222206.778760-3-jitendra.vegiraju@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_161413_474495_DF5499DA 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Mar 13, 2026 at 03:22:03PM -0700, \Jitendra Vegiraju wrote:
> @@ -42,13 +42,18 @@
>  #define DWXGMAC_CORE_2_20	0x22
>  #define DWXLGMAC_CORE_2_00	0x20
>  
> +#define DW25GMAC_CORE_3_20	0x32
> +#define DW25GMAC_CORE_4_00	0x40
> +

Do these live in the same versioning numberspace as DWXGMAC and
DWXLGMAC?

> +int dw25gmac_setup(struct stmmac_priv *priv)
> +{
> +	struct mac_device_info *mac = priv->hw;
> +
> +	dev_info(priv->device, "\tDW25GMAC\n");
> +
> +	priv->dev->priv_flags |= IFF_UNICAST_FLT;
> +	mac->pcsr = priv->ioaddr;
> +	mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
> +	mac->unicast_filter_entries = priv->plat->unicast_filter_entries;
> +	mac->mcast_bits_log2 = 0;
> +
> +	if (mac->multicast_filter_bins)
> +		mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);

The above seems to be common amongst the other two setup functions.
Maybe there should be a helper for this?

> +
> +	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +			 MAC_1000FD | MAC_2500FD | MAC_5000FD |
> +			 MAC_10000FD | MAC_25000FD;
> +	mac->link.duplex = 0;
> +	mac->link.speed10 = XGMAC_CONFIG_SS_10_MII;
> +	mac->link.speed100 = XGMAC_CONFIG_SS_100_MII;
> +	mac->link.speed1000 = XGMAC_CONFIG_SS_1000_GMII;
> +	mac->link.speed2500 = XGMAC_CONFIG_SS_2500_GMII;
> +	mac->link.xgmii.speed2500 = XGMAC_CONFIG_SS_2500;
> +	mac->link.xgmii.speed5000 = XGMAC_CONFIG_SS_5000;
> +	mac->link.xgmii.speed10000 = XGMAC_CONFIG_SS_10000;
> +	mac->link.xgmii.speed25000 = XGMAC_CONFIG_SS_25000;
> +	mac->link.speed_mask = XGMAC_CONFIG_SS_MASK;

Is there any point populating link.speed10 and link.speed100 ?
You're telling phylink that 10/100M speeds aren't supported in
link.caps, so these speeds won't ever be used.

> +
> +	mac->mii.addr = XGMAC_MDIO_ADDR;
> +	mac->mii.data = XGMAC_MDIO_DATA;
> +	mac->mii.addr_mask = GENMASK(20, 16);
> +	mac->mii.reg_mask = GENMASK(15, 0);
> +	mac->mii.clk_csr_mask = GENMASK(21, 19);

This will be the third instance of this particular mii data setup.
Please consider adding a function to do this setup.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

