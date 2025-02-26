Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm7hO41JOQlTWPC9THQAbEe0/tlBt69JLz+IlowK45s=; b=LHhptEPSL+EfQNFcH9owEShWV7
	ewSGbgVdnrsFR4o5ApoiLVFr7jfIZ5krLegibBUptEjVFmUNrNwzU8Qq5A3AHicW8+v42n/GnwRJB
	XGkmgv2fdxNEVPZXzU6Foe9i7Vmd6Wox+k8nX3UdJGSzl5OPm2v3cNAKLIaoJsy1s1BOEfyA+ewr2
	9e8AX/5cDJ6/BZJRZMVWtRp+PspzG2zoxzuImtqWwXwuve7HF8hQpxmb5+izHsTy/9Ia1BAc+XqOi
	ihXFmMIDaulyyR+fHpJUn5bhwWTxdnPjqrXSRRzjbJT/+Z6qycV0DkoJPlM2oI3C0V87qNbz/3EI1
	eq+ym5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEn-00000004FGr-2UkF;
	Wed, 26 Feb 2025 15:22:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHX6-00000003wYs-2Y5z;
	Wed, 26 Feb 2025 13:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tm7hO41JOQlTWPC9THQAbEe0/tlBt69JLz+IlowK45s=; b=E/Z1C+k/NoPj7THng4u33LCJ9M
	CVTP7fWEBhNNW+qgDu6gUCX78/n7wQ1kBucpZbPr0HrUD15MmPak2J7m9YMr3nZBvELtsoxw0lL/N
	f5dgYy1+GIsBJe8jwsjKCGwUr8ihSLnoZxcR+4p/bQwY5xWSC8WGrgJaj/szwr6G+ZdUH4INwKsX7
	6HlafCUl+cY78I5OSRpfE0XGJKjI89rKJRcGXe3Ti/Qc8hxdOZXrF/AyXA9VEAEj1+U4H1gbKjXtl
	ZQq7j2tdJypMfUTC4Orc7MsN7KvpSbQ9cnly54I1Q8qCCFohCN03n7dKbvSfTXkvk94LsFw6taBRI
	R5PraF/g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHX3-00000003bAL-0NOU;
	Wed, 26 Feb 2025 13:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=tm7hO41JOQlTWPC9THQAbEe0/tlBt69JLz+IlowK45s=; b=Sf
	7PASKbSARFMMzrBB16abt6ui8Mz+VjlV/9TgFn5nQ1/ot9dLG9/IiBhRy5tNn/0KlqJI5eAepClnp
	Ng+aVxSzmSK4iFHL4U0LW6d83GKunPs6JIsR1TNWKk8teFU99kFRf75MZ+Zu1e0AIqsAToa0d4UCu
	TnLTqsRbvcmPaZY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tnHWm-000Ggy-NL; Wed, 26 Feb 2025 14:32:44 +0100
Date: Wed, 26 Feb 2025 14:32:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Message-ID: <73080f10-5077-4165-9fe8-e2ccca497feb@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
 <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
 <5fae9c69a09320b0b24f25a178137bd0256a72d8.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fae9c69a09320b0b24f25a178137bd0256a72d8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_133301_219712_5D91158A 
X-CRM114-Status: GOOD (  17.73  )
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

On Wed, Feb 26, 2025 at 06:48:34AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Wed, 2025-02-19 at 09:33 +0000, Russell King (Oracle) wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Wed, Feb 19, 2025 at 04:39:10PM +0800, Sky Huang wrote:
> > > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > > +{
> > > +     struct pinctrl *pinctrl;
> > > +     int ret;
> > > +
> > > +     /* Check if PHY interface type is compatible */
> > > +     if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> > > +             return -ENODEV;
> > > +
> > > +     ret = mt798x_2p5ge_phy_load_fw(phydev);
> > > +     if (ret < 0)
> > > +             return ret;
> > 
> > Firmware should not be loaded in the .config_init method. The above
> > call will block while holding the RTNL which will prevent all other
> > network configuration until the firmware has been loaded or the load
> > fails.
> > 
> > Thanks.
> > 
> > --
> > RMK's Patch system:
> > https://urldefense.com/v3/__https://www.armlinux.org.uk/developer/patches/__;!!CTRNKA9wMg0ARbw!iV-1ViPFsUV-lLj7aIycan8nery6sQO3t6mkpdlb_GW8hswhxc4ejJozxqkU3s2WzxSizs4kfdC77yr7HGGRIuU$
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> Hi Russell,
> mt798x_p5ge_phy_load_fw() will only load firmware once after driver is
> probed through priv->fw_loaded. And actually, firmware loading
> procedure only takes about 11ms. This was discussed earlier in:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240520113456.21675-6-SkyLake.Huang@mediatek.com/#25856462
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240520113456.21675-6-SkyLake.Huang@mediatek.com/#25857174

Ideally, all PHY drivers should look like each other. That makes
maintenance simpler. Currently, air_en8811h.c, aquantia_main.c, and
qt2025.rs load firmware in there probe function. Is there a good
reason this driver needs to be different?

       Andrew

