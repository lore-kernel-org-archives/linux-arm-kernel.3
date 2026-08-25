Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E883C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywl9rM+RyCaxh1imXNV0yvvFlJD6cSPcxQEJ3SAkPxc=; b=19Vxp0ix0Dd0v6JpjiFf9uUdWQ
	Llshe3LRa0/SfsjTlB28xn99pq4ji/jAO8ma4XlXcel2ltnYM7emD1KOTRzTupWb+zwpZKzk/MQ+L
	9uSYhWN1tJohUp6IZGsEvTtzCcXzUhePtkqpV51YfjBrJ6jk8jm5YQUH7bcesscauQlop/K+7TSKQ
	jn4/61cEylBOK7bODhNQFRvW+2+EW8uq4dZyeKYm2w3wTvk6yWd0dRUgm2VhkUYFN797kIjlAY+W6
	CJ+9lxs81bU1Pa8yRx2h/X5YnLOobY1FkwtObUxCgEwmYOY1XYCWmbzpyuEaNhKIBHXsWYbzCb5tM
	GR115v9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyx14-00000001P3B-0DW0;
	Tue, 25 Aug 2026 19:41:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyx11-00000001P2X-2bCc;
	Tue, 25 Aug 2026 19:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ywl9rM+RyCaxh1imXNV0yvvFlJD6cSPcxQEJ3SAkPxc=; b=BRTed0I46j4vwIEyN5+5QfhmW8
	aPx8l00iMijXWRqy60MR/o/dIcsaVQQ07VFWJtNrZiTVmm78i5bY9QtRHX3zHcf/jyL2PJD1XdS/2
	448B4e45kudXTLjxrBuABsPyf3Ifxg94WFZc3OJ2bdLB0PIGOQof94qtOYGrQOxdWN3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wyx0c-001QCU-M3; Tue, 25 Aug 2026 21:40:34 +0200
Date: Tue, 25 Aug 2026 21:40:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	naseefkm@gmail.com, joey@tinyisr.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast
 Ethernet SoC PHYs
Message-ID: <177dc347-4cf9-48ca-97fe-b0f3cd46d8e3@lunn.ch>
References: <20260825180421.1804729-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825180421.1804729-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_124059_682771_43777811 
X-CRM114-Status: GOOD (  18.76  )
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

> Also provide support for the older EN7512 Fast Ethernet SoC PHYs found
> in EN751221 chips with do not have the MCM switch. That is chips which
> do not have a "G" in the name. As these PHYs bear the ID 03a2.9412
> which collides with MTK_GPHY_ID_MT7530 gigabit PHY, do not match them
> and instead rely on the user to override the PHY ID in the device tree
> if they wish to use this driver.

Is there a way to tell them apart using other registers?

> +static int en751221_fephy_r50(struct phy_device *phydev)
> +{
> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct compensation ctab = get_ctab(phydev);
> +	int zcal_sz = ARRAY_SIZE(zcal_to_r50ohm);
> +	u8 rg_zcal_ctrl = ECONET_R50_ZCAL_DEFAULT;

Please swap these two lines.

> +	for (;;) {

It is unusual to do loops like this. Can it be turned into a do while
loop? And without looking deep into it, it is not clear if this is
endless if the hardware stops responding.

> +static int en751221_fephy_tx_offset(struct phy_device *phydev)
> +{
> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct compensation ctab = get_ctab(phydev);
> +	int initial_comp_out;
> +	int polarity = 0;
> +	int offset = ECONET_TXOS_DEFAULT;
> +	u16 offset_bin;
> +	int comp_out;
> +	int ret = 0;

Another reverse christmas tree issue. Please check all your functions.

> +static int en751221_fephy_config_init(struct phy_device *phydev)
> +{
> +	struct econet_socphy_shared *shared = phy_package_get_priv(phydev);
> +	u16 l0r26_temp;
> +	int ret;
> +	int i;
> +
> +	if (!shared->phydev_p0) {
> +		phydev_err(phydev, "Port zero must be configured\n");
> +		return -EOPNOTSUPP;
> +	}

What is the issue here? Why must port 0 be first?

> +
> +	for (i = 0; i < 5; i++) {
> +		ret = en751221_fephy_r50(phydev);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < 5; i++) {
> +		ret = en751221_fephy_tx_offset(phydev);
> +		if (!ret)
> +			break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < 5; i++) {
> +		ret = en751221_fephy_tx_amp(phydev);
> +		if (!ret)
> +			break;
> +	}

Why 5 ?


    Andrew

---
pw-bot: cr

