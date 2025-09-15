Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C569CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU1UrHsYj15lKzwzTaouEr8OqAOGkZeEyY6ymtEfJL0=; b=u8Ajdx5knbjTGA4AUTUtDo6ulV
	ch1z8n90tdE05xh8UTMei7Y4xsFVNzohhfNFPMrZahyllc1BlUkGwARIdNBPhFi6ItiViYpoBP8JN
	Ucov+YyZwHbErjZORivKMsHC7DbLnsRU/davz7vLAwB4Ri1C3jfSDe4pCYSu8KMoxHxKrbePH+S2M
	a2eZEJEBHMTmIyoDNDfgK7C7R8NZo3q3KWZiUrrCqoeAO3Flif8YczQ84849Fo7l82QE8Y5GbGvXM
	AqYNyq+62fn+ylU4vVDiK+r5a98m7jU7fGaDOpthbE6koyiQZ/s0iwE1Aaqqme7+hVp6/KniGgVSO
	temtMSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6wM-00000003omS-1yJC;
	Mon, 15 Sep 2025 11:00:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6wJ-00000003olA-3ZfG;
	Mon, 15 Sep 2025 11:00:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F50C4173D;
	Mon, 15 Sep 2025 11:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2497C4CEF7;
	Mon, 15 Sep 2025 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757934007;
	bh=PerGZdKHuMGnY9aDIA1/uc0lypV/nccNhLa+jYy3h44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKj7OZ+iabb40dJ6272w4HO91BTJ7gyrHEgVNYSCzys9bsDy8XfW1Hl6NXIc3fz1l
	 9wq+oIghMgkNTzqc6xk04OIgvPgKUpOn+7rJcTlR+yqqYVV3jvbyzj/99IRJIwGkaN
	 snmbbap/HvfDKyAGKTCXn0ncjPExex0PTx3EI/Q0CMT6//P5yXECHBYZIEavvlVyjd
	 nDa1aWqX5kpsViJc8siV3AJ1O4waANIXmHXmrygu/Zajap/uqmROSSGIVsbIqHc4Fa
	 76dAylXvHlOkpuBS/jk/904PqZ1FVwmrq7A1ElRIHDIOcoTsVl/VC38PD0nUJGDJvG
	 65OAXMrzvpjZw==
Date: Mon, 15 Sep 2025 12:00:00 +0100
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v17 6/8] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20250915110000.GS224143@horms.kernel.org>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
 <20250911133929.30874-7-ansuelsmth@gmail.com>
 <20250913130137.GL224143@horms.kernel.org>
 <68c56bea.050a0220.a9dbf.b7c8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c56bea.050a0220.a9dbf.b7c8@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_040007_930874_FA336C3F 
X-CRM114-Status: GOOD (  24.80  )
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

On Sat, Sep 13, 2025 at 03:04:40PM +0200, Christian Marangi wrote:
> On Sat, Sep 13, 2025 at 02:01:37PM +0100, Simon Horman wrote:
> > On Thu, Sep 11, 2025 at 03:39:21PM +0200, Christian Marangi wrote:
> > > Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> > > switch and a NVMEM provider.
> > > 
> > > Also make use of the mdio-regmap driver and register a regmap for each
> > > internal PHY of the switch.
> > > This is needed to handle the double usage of the PHYs as both PHY and
> > > Switch accessor.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > 
> > ...
> > 
> > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > 
> > ...
> > 
> > > +static int an855_mdio_register(struct device *dev, struct an8855_core_priv *priv)
> > > +{
> > > +	struct device_node *mdio_np;
> > > +	int ret;
> > > +
> > > +	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
> > > +	if (!mdio_np)
> > > +		return -ENODEV;
> > > +
> > > +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> > > +		ret = an8855_phy_register(dev, priv, phy_np);
> > > +		if (ret)
> > > +			break;
> > > +	}
> > 
> > Hi Christian,
> > 
> > Maybe it cannot happen, but if the loop above iterates zero times,
> > then ret will be used uninitialised below.
> > 
> > Flagged by Smatch.
> >
> 
> Do you have hint of how to run smatch on this? Is there a simple arg to
> make to enable this?

Perhaps not so simple, but also not so difficult.

1. Checkout Smatch from and compile

   Smatch can be found in Git here:
   https://github.com/error27/smatch/commits/master/

2. Prepare kernel

   e.g. make allmodconfig

3. Run Smatch

   PATH="$PATH:.../smatch/bin" \
   .../smatch/smatch_scripts/kchecker drivers/mfd/airoha-an8855.o
   [ snip ]
   drivers/mfd/airoha-an8855.c:439 an855_mdio_register() error: uninitialized symbol 'ret'.

> Anyway yes it goes against schema but it's possible somehow to have a
> very broken DT node with no phy in it.

Understood, thanks.

...

