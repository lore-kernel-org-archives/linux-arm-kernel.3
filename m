Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA4EC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPyxcz+qZruqJAbTurcqgZiEIfW6EaIvOQmjH5Rvfb8=; b=ZxNh2zhxN3Y8d222ZSjiDB6DyF
	RgjdcgPRvAN4CGnq9Yjf77aHKXBq7IRTrMzRVMNGHl5mo9nNNeRHaxTi6iMQVabNSKTnOcOUjgROX
	T03Q576OBD/PMcw/ZfDVbsiIyPipa28Vgqlz2RB04TGHlSZ2tvRGC20y6Idemni7TRPjKfEvLrGeB
	SNgbBmmSrkpiD0y4lXi4RRULKORSsSD4E/GpbDu2Vt0BYU6c+HvSueoVMBvDzuSMsFvYKpft0r3zO
	IVTzBFqlcd/NcW5RI/jPVLbpwFI5GXsWVuMJ0PA3kKw/rz6/nAuB1kmI4TKIkirPzE4IcbId5wdKy
	Szwp2/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2lG-0000000BZqU-2Auj;
	Fri, 28 Feb 2025 15:58:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Uf-0000000BVdY-48IT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OPyxcz+qZruqJAbTurcqgZiEIfW6EaIvOQmjH5Rvfb8=; b=wh8fVZpJ8GicT8IR9RR6P6QQUY
	pV8hFf0nIYTO8jUHitVhT5EGH2nKkcq9n3H+v9SmJmfQ62okX6NOC0cUj5J6BfcPfEv5MhD4u6pt6
	8x1wArrm1y8uNoazZOCihetjkrcaXtmJUAau7FEmXtNFz1A5jQKw1CWbgFY097OAaps8dt/KcVzXR
	jDwuVzHSdT5TfJywPZGveTQbawu4rQNNfVu2HCIYMbpAx/1IsJ/ogAqX7P5JZIk7EYA1AzyKbdotn
	oiCfbS1e8wSatw88zTsMjLkOhH9aq3+k+EtTvwMQf3LvLqTAVd0Wu3IEjZzU94kmiA869UwCfhJXq
	2zo0xSKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57018)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1to2UV-0002H9-2g;
	Fri, 28 Feb 2025 15:41:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1to2UR-0000rP-01;
	Fri, 28 Feb 2025 15:41:27 +0000
Date: Fri, 28 Feb 2025 15:41:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v3 02/13] net: phy: Use an internal, searchable
 storage for the linkmodes
Message-ID: <Z8HZJo9GE23uq5ew@shell.armlinux.org.uk>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
 <20250228145540.2209551-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228145540.2209551-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_074142_172502_C3F8C6AF 
X-CRM114-Status: GOOD (  31.32  )
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

On Fri, Feb 28, 2025 at 03:55:27PM +0100, Maxime Chevallier wrote:
> The canonical definition for all the link modes is in linux/ethtool.h,
> which is complemented by the link_mode_params array stored in
> net/ethtool/common.h . That array contains all the metadata about each
> of these modes, including the Speed and Duplex information.
> 
> Phylib and phylink needs that information as well for internal
> management of the link, which was done by duplicating that information
> in locally-stored arrays and lookup functions. This makes it easy for
> developpers adding new modes to forget modifying phylib and phylink
> accordingly.
> 
> However, the link_mode_params array in net/ethtool/common.c is fairly
> inefficient to search through, as it isn't sorted in any manner. Phylib
> and phylink perform a lot of lookup operations, mostly to filter modes
> by speed and/or duplex.
> 
> We therefore introduce the link_caps private array in phy_caps.c, that
> indexes linkmodes in a more efficient manner. Each element associated a
> tuple <speed, duplex> to a bitfield of all the linkmodes runs at these
> speed/duplex.
> 
> We end-up with an array that's fairly short, easily addressable and that
> it optimised for the typical use-cases of phylib/phylink.
> 
> That array is initialized at the same time as phylib. As the
> link_mode_params array is part of the net stack, which phylink depends
> on, it should always be accessible from phylib.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/Makefile     |  2 +-
>  drivers/net/phy/phy-caps.h   | 44 ++++++++++++++++++++
>  drivers/net/phy/phy_caps.c   | 78 ++++++++++++++++++++++++++++++++++++
>  drivers/net/phy/phy_device.c |  2 +
>  4 files changed, 125 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/phy/phy-caps.h
>  create mode 100644 drivers/net/phy/phy_caps.c
> 
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index c8dac6e92278..7e800619162b 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for Linux PHY drivers
>  
>  libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
> -				   linkmode.o phy_link_topology.o
> +				   linkmode.o phy_link_topology.o phy_caps.o
>  mdio-bus-y			+= mdio_bus.o mdio_device.o
>  
>  ifdef CONFIG_MDIO_DEVICE
> diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
> new file mode 100644
> index 000000000000..846d483269f6
> --- /dev/null
> +++ b/drivers/net/phy/phy-caps.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * link caps internal header, for link modes <-> capabilities <-> interfaces
> + * conversions.
> + */
> +
> +#ifndef __PHY_CAPS_H
> +#define __PHY_CAPS_H
> +
> +#include <linux/ethtool.h>
> +
> +enum {
> +	LINK_CAPA_10HD = 0,
> +	LINK_CAPA_10FD,
> +	LINK_CAPA_100HD,
> +	LINK_CAPA_100FD,
> +	LINK_CAPA_1000HD,
> +	LINK_CAPA_1000FD,
> +	LINK_CAPA_2500FD,
> +	LINK_CAPA_5000FD,
> +	LINK_CAPA_10000FD,
> +	LINK_CAPA_20000FD,
> +	LINK_CAPA_25000FD,
> +	LINK_CAPA_40000FD,
> +	LINK_CAPA_50000FD,
> +	LINK_CAPA_56000FD,
> +	LINK_CAPA_100000FD,
> +	LINK_CAPA_200000FD,
> +	LINK_CAPA_400000FD,
> +	LINK_CAPA_800000FD,
> +
> +	__LINK_CAPA_LAST = LINK_CAPA_800000FD,
> +	__LINK_CAPA_MAX,
> +};
> +
> +struct link_capabilities {
> +	int speed;
> +	unsigned int duplex;
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(linkmodes);
> +};
> +
> +void phy_caps_init(void);
> +
> +#endif /* __PHY_CAPS_H */
> diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
> new file mode 100644
> index 000000000000..367ca7110ddc
> --- /dev/null
> +++ b/drivers/net/phy/phy_caps.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/ethtool.h>
> +#include <linux/linkmode.h>
> +#include <linux/phy.h>
> +
> +#include "phy-caps.h"
> +
> +static struct link_capabilities link_caps[__LINK_CAPA_MAX] __ro_after_init = {
> +	{ SPEED_10, DUPLEX_HALF, {0} }, /* LINK_CAPA_10HD */
> +	{ SPEED_10, DUPLEX_FULL, {0} }, /* LINK_CAPA_10FD */
> +	{ SPEED_100, DUPLEX_HALF, {0} }, /* LINK_CAPA_100HD */
> +	{ SPEED_100, DUPLEX_FULL, {0} }, /* LINK_CAPA_100FD */
> +	{ SPEED_1000, DUPLEX_HALF, {0} }, /* LINK_CAPA_1000HD */
> +	{ SPEED_1000, DUPLEX_FULL, {0} }, /* LINK_CAPA_1000FD */
> +	{ SPEED_2500, DUPLEX_FULL, {0} }, /* LINK_CAPA_2500FD */
> +	{ SPEED_5000, DUPLEX_FULL, {0} }, /* LINK_CAPA_5000FD */
> +	{ SPEED_10000, DUPLEX_FULL, {0} }, /* LINK_CAPA_10000FD */
> +	{ SPEED_20000, DUPLEX_FULL, {0} }, /* LINK_CAPA_20000FD */
> +	{ SPEED_25000, DUPLEX_FULL, {0} }, /* LINK_CAPA_25000FD */
> +	{ SPEED_40000, DUPLEX_FULL, {0} }, /* LINK_CAPA_40000FD */
> +	{ SPEED_50000, DUPLEX_FULL, {0} }, /* LINK_CAPA_50000FD */
> +	{ SPEED_56000, DUPLEX_FULL, {0} }, /* LINK_CAPA_56000FD */
> +	{ SPEED_100000, DUPLEX_FULL, {0} }, /* LINK_CAPA_100000FD */
> +	{ SPEED_200000, DUPLEX_FULL, {0} }, /* LINK_CAPA_200000FD */
> +	{ SPEED_400000, DUPLEX_FULL, {0} }, /* LINK_CAPA_400000FD */
> +	{ SPEED_800000, DUPLEX_FULL, {0} }, /* LINK_CAPA_800000FD */
> +};
> +
> +static int speed_duplex_to_capa(int speed, unsigned int duplex)
> +{
> +	if (duplex == DUPLEX_UNKNOWN ||
> +	    (speed > SPEED_1000 && duplex != DUPLEX_FULL))
> +		return -EINVAL;
> +
> +	switch (speed) {
> +	case SPEED_10: return duplex == DUPLEX_FULL ?
> +			      LINK_CAPA_10FD : LINK_CAPA_10HD;
> +	case SPEED_100: return duplex == DUPLEX_FULL ?
> +			       LINK_CAPA_100FD : LINK_CAPA_100HD;
> +	case SPEED_1000: return duplex == DUPLEX_FULL ?
> +				LINK_CAPA_1000FD : LINK_CAPA_1000HD;
> +	case SPEED_2500: return LINK_CAPA_2500FD;
> +	case SPEED_5000: return LINK_CAPA_5000FD;
> +	case SPEED_10000: return LINK_CAPA_10000FD;
> +	case SPEED_20000: return LINK_CAPA_20000FD;
> +	case SPEED_25000: return LINK_CAPA_25000FD;
> +	case SPEED_40000: return LINK_CAPA_40000FD;
> +	case SPEED_50000: return LINK_CAPA_50000FD;
> +	case SPEED_56000: return LINK_CAPA_56000FD;
> +	case SPEED_100000: return LINK_CAPA_100000FD;
> +	case SPEED_200000: return LINK_CAPA_200000FD;
> +	case SPEED_400000: return LINK_CAPA_400000FD;
> +	case SPEED_800000: return LINK_CAPA_800000FD;

I think one of the issues you mentioned is about the need to update
several places as new linkmodes are added.

One of the side effects of adding new linkmodes is that they generally
come with faster speeds, so this is a place that needs to be updated
along with the table above.

I'm not sure whether this makes that problem better or worse - if a
new linkmode is added with a SPEED_*, the author of such a change has
to be on the ball to update these, and I'm not sure that'll happen.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

