Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB6CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnbOoNf/PP6x6QMLq2pwD4WmS4hbOd+l73hGwmxBZqI=; b=aeKMEEOr+3nc1mDl7G/S1IOeBO
	d0i1Ar/xE/Jk8mHTwneANtA4oY+QMpKYeCORWGWqKpvk/8oS/uCldBQ+2U1pmlBtz42gD3jvdIv30
	r4+KJ2b+c+3GqQtsVEgcSe8+vpu+Qqv3iVLWCz4W+cnobnchmh0H9iCr6Q1SvZE78ffdjDKFBRpph
	Z52HMGAXb5pA/d6rPlSw14/xmYoEzoPeZ1VBhl6sGVt8RShljPE+SLVHjOf4M0qRnuh9L3fRuyrv6
	F1cIpIJuxjPzZJsIFENqWhUfAYhVwVyKCAs5M76j/DMXyEzvQO5ahzynEOOq6KOWAI1gBSVRBHlKO
	Tz4Ttlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLdY-00000007q8q-0hoY;
	Wed, 26 Mar 2025 07:57:20 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLaj-00000007ppX-2Pjq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:54:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E679A20483;
	Wed, 26 Mar 2025 07:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742975663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnbOoNf/PP6x6QMLq2pwD4WmS4hbOd+l73hGwmxBZqI=;
	b=MpFfP+OobExwhhTIzHvwhtfo5/6x8Z7HPjdFgnjeCVTztenYAjAgxb8pHBBXcsMRnyB1sH
	0HtU2CdT+oh2C7LQUNp5erdzSc1o3z6sLKYM49yfNsC+oLTZaltzdjgIea34REJsBXyk/v
	2YztJD4pobsFNgi8V6mlHS4mMVnzu3bsdXbc5atWNoF5rZaWmCREW26S8NqH3wPFmAoVp+
	w+O4ilYRy796echBqe9mlF8xyasWzGRPUahGE55aYPlHfuUKV475S69p+gAed2Fb7WQHPI
	g9exBCLnL5ythPqxh50GOspqtFVJRAYXeGueMJgok/NKlULDXEMA6RiCwTCOpQ==
Date: Wed, 26 Mar 2025 08:54:22 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 3/8] net: ethtool: netlink: Rename
 ethnl_default_dump_one
Message-ID: <20250326085422.3596589c@fedora.home>
In-Reply-To: <20250325141605.684fc691@kernel.org>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-4-maxime.chevallier@bootlin.com>
	<20250325141605.684fc691@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieegleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguu
 hhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_005425_746447_AE12AC9D 
X-CRM114-Status: UNSURE (   8.89  )
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

On Tue, 25 Mar 2025 14:16:05 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 24 Mar 2025 11:40:05 +0100 Maxime Chevallier wrote:
> > As we work on getting more objects out of a per-netdev DUMP, rename
> > ethnl_default_dump_one() into ethnl_default_dump_one_dev(), making it
> > explicit that this dumps everything for one netdev.  
> 
> Maybe ethnl_default_dump_dev() ?

Sure, that's better indeed :)

Maxime

