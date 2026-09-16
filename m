Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0802C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xdh/rXV7bbuANGaKBhva3Gg+xdIjMLL6po8X8eKgzG4=; b=SyjqmpoFZkL2sDdpW7w9c3bUYe
	0SY5u+l6c+zn9T5In0Bo/Ad8T+dAU0LT0BNpw1NwuFtKURoUfK3B5j/MbsXfawUPZLVyyLVewY7V7
	1oLzbbi5c1/SbQzhXiOiR1e7ZhQtLfxcz6uSSsm2fgO5fzqORjRuQFgjkINCujRObBBkp/pryrZ6E
	ywrvCPGAzILvnNG4lga7IIp/VB049tREb0GtGYthCbpllA/12IkPWLqBu5whtoKvjY3YvpPMVYVB3
	qjlOd4b+FDwYRzLUYleSrFpoM2PULfq767kwJjUTN6U3uXVRlTRKJBaJ+DY7VVsjgLD2rj3Y4cfIY
	axS/wSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jiz-00000008YSi-1PfJ;
	Wed, 16 Sep 2026 07:06:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jiw-00000008YS9-2YWh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:06:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76512C5CD56;
	Wed, 16 Sep 2026 07:07:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 914D060337;
	Wed, 16 Sep 2026 07:06:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AF7411C7AFE7;
	Wed, 16 Sep 2026 09:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789542386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Xdh/rXV7bbuANGaKBhva3Gg+xdIjMLL6po8X8eKgzG4=;
	b=k7z+XNlIuaYHraCbogiD+ix+6XoA3JKCCceTzetFGhcpZfV/VIiWvuejEU62SuE7Wrv0cP
	UZGcyF59FZIYc02pcJZQMoZ6F2Av8EmAChXoRRKMaZJ//bWRezhYBo+YCxVE1Yqch14Xb9
	+u7xTZsw0KpWTjqjQHCCPM7dg7KPkWNGUUkrAxbUic6ax9LDsKn3S6F1NIfwE+p7CjkdlT
	rBoNwsgzXLaHL5Zq4l9XxFLHLXjXt93Gc8PpjS0OsvIK58iQyMQBIj7ONyLh8vXSpRLKs9
	n2/DJxHgqmAYFyp9a7YhuUz67YdCTM6YR3qMxuLUwQ4BK+peYnLUlIUFZRk1RA==
Message-ID: <3196ccec-7cf3-434b-b7bb-dec64fe29583@bootlin.com>
Date: Wed, 16 Sep 2026 09:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: Alastair D'Silva <alastair@d-silva.org>,
 James Hilliard <james.hilliard1@gmail.com>, wens@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
 <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
 <2ac659ffa08eeddc6654827f5a8fbd7fe374a128.camel@d-silva.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <2ac659ffa08eeddc6654827f5a8fbd7fe374a128.camel@d-silva.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_000630_819128_D65E8B96 
X-CRM114-Status: GOOD (  13.17  )
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

Hi,
On 9/16/26 08:49, Alastair D'Silva wrote:

> There is one subtle timing issue worth highlighting from our Armbian
> testing on the Mellow Fly-C5 (H618):
> 
> In James's dwmac patch, setting soc_has_internal_phy = false causes
> sun8i_dwmac_probe() to fall through to sun8i_dwmac_reset(priv). The
> Synopsys EMAC DMA soft reset (EMAC_BASIC_CTL1 bit 0) requires a running
> RMII clock from the PHY to clear.
> 
> While this reset succeeds when the PHY driver is built-in and probes
> synchronously, if CONFIG_XPOWERS_ACX00_PHY is built as a module (=m)
> or if the PHY probe defers (-EPROBE_DEFER on regulator/clock/nvmem),
> the PHY is unpowered and not clocking when sun8i_dwmac_probe() runs.
> 
> This causes sun8i_dwmac_reset() to time out after 100ms ("EMAC reset
> timeout"), failing MAC driver probe. In our testing, deferring the MAC
> reset until sun8i_dwmac_init() (which runs upon ndo_open after phylink
> has attached and the PHY is active) avoided this probe failure.

I'm OK with going with James' version, however this seems like a valid
point that needs to be figured out.

James, can you add Alastair in CC of your next iterations, and Alastair
it would be great if you could give James's patches a test when he
submits them :)

There's more stuff in the dwmac part for Alastair's version, some
-EPROBEFER handling for clocks, the reset thing as well as the MUX
part, for which use-cases is all of that required ?

If that's something that needs to land with proper EMAC1 support, maybe
this could be split out from Alastair's work (in individual patches
please), and integrated in James's series ?

Maxime


