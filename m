Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1608FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWAnLAcd4Ax9L2XjpW/XTk1Vc6xaPxRyyPPHRuN7d+0=; b=dGd8yqV66GB2RoWw7mZD7IfRce
	KxAFFtPXNuT7KWN6DLkjly0fxkBLFzbZoBM4xQDnTrF0DAcvU+rgttFxxMPm+4Mdg7xYQIgUVsABl
	jYoAMTicSJLlEmSVVzglx4U1b3fl43F7xBgrlv8yct44Ja7BnajwEnU6VmPX1oNDfS+uJt/bQk0KQ
	O1GJbxugrntiwqOF+EbvTPmRoV8Krt6wsABoPRy2VogE+PIqqyM/JIUylWpv4lkgVIMxHgRFmWQPZ
	owZZfy2Cz7cOREdY96N+5VdWwR6Kw76Zvm/axQ3QfTAcHFJcTivvcCROpXdvTn8YVjlJKJ1qxTAnR
	tTbKu9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE8R-00000003B2A-1fzY;
	Wed, 26 Feb 2025 09:55:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnE6A-00000003ASe-3kyC;
	Wed, 26 Feb 2025 09:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AWAnLAcd4Ax9L2XjpW/XTk1Vc6xaPxRyyPPHRuN7d+0=; b=OPGZ5Uw8vm2+odS8tBnxh6bn5y
	bMKasJwtYxa0VWmFmqzAohjow9oPWH5b8OMTZQvCa9wo09JRu6bE/sDd73lDgAh47se8VFabVThHr
	ZEiE8aZTIDBA0m1Wve/02buldgj1FI8v2SRhJYXiIzAoIf97cT4DyazORIRNjwBOF5DDRK9WBnV6K
	Y4qMJE77GtOgbxK8usYH4b2LD27i8CGjtu97MKuJ0UoVx1PTybavKFR98wAiyQwrFulF1ibmMLeIc
	iMKwl7NTa38QBqSY5ibw8JS1Knpd3qKga8UVNrgiF8xTXt8mdyUx154pmR0LA3lBt6bYao0tocNRe
	ymF8xUhQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51782)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnE63-0003om-0c;
	Wed, 26 Feb 2025 09:52:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnE5y-0006xe-26;
	Wed, 26 Feb 2025 09:52:50 +0000
Date: Wed, 26 Feb 2025 09:52:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
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
Message-ID: <Z77kcqzmCqdT6lE0@shell.armlinux.org.uk>
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
X-CRM114-CacheID: sfid-20250226_015302_944655_2CBE43CA 
X-CRM114-Status: GOOD (  19.37  )
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

1. Wouldn't it be a good idea to include the loading time in the patch
   description or a comment in the patch?

2. What about the time it takes for request_firmware() uses the sysfs
   fallback, which essentially passes the firmware request to userspace
   to deal with? That can block for an indeterminate amount of time.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

