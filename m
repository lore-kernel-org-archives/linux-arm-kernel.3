Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661EC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLAzhKsUxTEy3WyscyUgfZmNUubzBcet9DIGHn5TpLk=; b=GhhLRhfZ0A3HAqq60YwwGbH3IU
	C99fqPGgSdZt5O85ZRT+6UwieAIbAGTaBm7IMRkN25hc9d52LvgcNtZQUhsQ9ESRhUzTUcUBrHz90
	tt6eciEhZ9/tEkqNcHpP1nP105vcMoMbUZ3MPhVmSwMJRnlZqTLZRkVuAvnnqITdIIThqpIumSO91
	tuHuqy6MzkPvNklmMoZSqLS1K52hJHO8//ep8Db544YBrFmj8wOaH7oSzylbQF8LeBa86OyPNpTvR
	+2hF/w4II+6N+28OXqn9O3tCXlf+8yy4wPgr8v0kEafbLM9A+F/64OtLY9cub1pu4sXZWmZHYIpAK
	O/tu6cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65OS-00000003SZB-1oRx;
	Mon, 14 Sep 2026 12:02:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65OK-00000003SW7-2ERY;
	Mon, 14 Sep 2026 12:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qLAzhKsUxTEy3WyscyUgfZmNUubzBcet9DIGHn5TpLk=; b=ZvJZ95SYEZtKTM7NEoQamHsc3E
	OdZBf+waXyIqMh0C2l5M5AwvCFH6uXy2aMeqaoxBD5QG73h7K52el9XRbpwPFxqm8Ti5ZPYnedc0M
	6dPLWhySq2TwlZ1V/+G3YH97x0Xk4ASIQCanu8qvMx0777/o3QmKstnVwasuEQyWLJV2hSaHL6w1v
	Mwtx2r9a0QiF+ay+DXr10LPcEm0+mmfN7SmSDSfu/xLGDstT4n01a+cwN6Judp/aDnXHXJ78dS4CK
	e7+7qiFrphWiRKhKctev6NhCFfxn6Zu8R0JcruCXxrw1XrEyNQPB5yIwKnkCVqRz3aQSfx3AiNIzx
	p2jjl+Bg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x65OH-00000005Zug-2I8x;
	Mon, 14 Sep 2026 12:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=qLAzhKsUxTEy3WyscyUgfZmNUubzBcet9DIGHn5TpLk=; b=L8
	K44j2NVTUPMiCH9VjA+7dm9CoQuf6fxcIFjIgMb5n22ygkq+eWaOP0PMdTbt44rwpVShsQfAoisCd
	s5TLASYsJeKdL6yE8S7HQntQSemzEn7fk7w1Xo+XsMJu5an06kkv8LhKesJW6L0/27NVmxqhFPJvG
	n6MjgswPA8P9dNg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x65Nk-0054Xh-Tz; Mon, 14 Sep 2026 14:01:56 +0200
Date: Mon, 14 Sep 2026 14:01:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v3 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <a6e1bb7f-e395-434e-8e9b-992141969d74@lunn.ch>
References: <20260911120646.4123877-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911120646.4123877-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_130229_657588_129D8E69 
X-CRM114-Status: UNSURE (   9.53  )
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

> + * The EcoNet EN751221 "G" multi-chip module MT7530 requires additional PHY
> + * configuration.
> + */
> +static int en751221_mcm_phy_config_init(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_soft_reset(phydev);
> +	if (ret)
> +		return ret;
> +
> +	/* Master/Slave negotiation does not work reliably */
> +	ret = phy_write(phydev, MII_CTRL1000, ADVERTISE_1000FULL |
> +			CTL1000_ENABLE_MASTER | CTL1000_PREFER_MASTER |
> +			CTL1000_AS_MASTER);

Is it sufficiently broken that we should stop the user changing it?

     ethtool     -s     devname    [speed N]    [lanes N]    [duplex half|full]
            [port tp|aui|bnc|mii] [mdix auto|on|off]  [autoneg on|off]  [adver‐
            tise N[/M]  |  advertise mode  on|off  ...]  [phyad N] [xcvr inter‐
            nal|external]        [wol N[/M]         | wol p|u|m|b|a|g|s|f|d...]
            [sopass xx:yy:zz:aa:bb:cc]      [master-slave preferred-master|pre‐
            ferred-slave|forced-master|forced-slave]   [msglvl   N[/M] |    ms‐
            glvl type on|off ...]

You don't appear to have a config_aneg, so genphy_config_aneg() will
be used, which calls genphy_setup_master_slave. 

   Andrew

