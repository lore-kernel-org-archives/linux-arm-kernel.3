Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31993C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6bIJuULWhsZxJCwa0hMVmk2iWw7cX6L/3fW6XmaZJY=; b=uUCNcqMg2SP40Ie0MvIXl0RK6M
	bC1BmjDkUnhagIX7pIk0pyV5C3tPPLWA3/Oka56iF6v3EXQq/TiLKw4gveYVHDEOvSk32IOWBEyLq
	oLo++BzKUR8TG4LjDcuNngOuAuYKE2CAd5zeWa2lBTw0fn4fsjE1lZ9Rde7QGxsbZOMnXIGIyLZQj
	MSrpNgsVsByebGv1FdN/GIth/Yilke1xrGzUwRhBcsY4evcjjqCI4V8V5rfWnmdGBBFYp573l9DDl
	J9xUpsjDiU404Bc1uqR83aXKHDPk2CkecJHrMrUaIf/btgiZr11ZXDyr6Kxq+YYt3YjP0dNybSM7Y
	tVHiQRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCFe-0000000BE3a-1IIU;
	Sun, 23 Feb 2025 13:42:34 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmCDy-0000000BDmx-1vMX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 13:40:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D908844388;
	Sun, 23 Feb 2025 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740318045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6bIJuULWhsZxJCwa0hMVmk2iWw7cX6L/3fW6XmaZJY=;
	b=oBlq8azH+BF3Jjf44h2fXFP4YWqwNaegZtOSOGTfSqIOT1AFfSfYqFmyz5BobJH+FtwYxX
	7rUdaZtPc/VvY69ZzMXGzrvYXIwY2/SSLKHiIIchfSsW1sRCgkLv2NAQuQ8bMTw2Y+g/0r
	WoTcPJ5UU2/7+qzv/EsMrNX0aohLiMbKuVMkn16JUdTb5jQwX3VQL6ZTv1dl9vl3DsdfAu
	gcIZy5TWsnQU1dUPVNKhJiwHoutc5YyMTCH3KwfwUFaSUF0tVh7/lr4Rt035QzlGD5jdgQ
	ioXiVTa6R6kIl+KSX1yjoJJYSPXoBm3rhqwgPtbU3jB1X0wM22iqVIuDVHTkUg==
Date: Sun, 23 Feb 2025 14:40:41 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, oe-kbuild-all@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 08/13] net: phy: phy_caps: Introduce
 link_caps_valid
Message-ID: <20250223144041.1bf253ca@fedora.home>
In-Reply-To: <202502231409.QTfXTqrD-lkp@intel.com>
References: <20250222142727.894124-9-maxime.chevallier@bootlin.com>
	<202502231409.QTfXTqrD-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejheeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_054051_277252_B748D828 
X-CRM114-Status: UNSURE (   7.00  )
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

On Sun, 23 Feb 2025 14:38:46 +0800
kernel test robot <lkp@intel.com> wrote:

> >> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'speed' not described in 'phy_caps_valid'
> >> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'duplex' not described in 'phy_caps_valid'
> >> drivers/net/phy/phy_caps.c:152: warning: Function parameter or struct member 'linkmodes' not described in 'phy_caps_valid'  
> 

Ah indeed, I'm missing the kdoc description here.

Meh and the commit title should be :

	net: phy: phy_caps: Introduce phy_caps_valid

I'll wait a bit for reviews and fix that in the next round.

Thanks mister robot,

Maxime


