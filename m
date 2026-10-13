Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D370CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaZ8xRmuQ+Il2zB6Ox9/aUcTtUubZsAch+lNoQEkwK4=; b=mCnrxGgSTOLZqJIJ8EUFDJvUZG
	T+MOd6bCDy7mh/saQD4RzYbCKLf21H63ugfdkUmglQpKhCYgPQs3s+xSy/lTpvF9cKJ4O/miJdiri
	aGfwvnxRV151tryHy0khfly40ec4EbipwA9GJiUL6XLqn2bjavgukizFoAw5RhU8kRoZCOhNqmVL/
	o7c8EfoNbuXznu0Fqlwu7UkABVHY4WysWAeCpv9AKZoOWvqjwFfhE7mPPsRN2aFcz/zLKZXzrFzzS
	H7tmVAXx57Ar3d8tANYbHoDxZmr37syizh2mvUPlQEExhV/8Uux91dun7HtGdz0ruE0KRPzJQ3AeQ
	3r6D/ofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgkc-0000000DmWy-47BM;
	Tue, 13 Oct 2026 17:57:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgkb-0000000DmW9-0KK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LaZ8xRmuQ+Il2zB6Ox9/aUcTtUubZsAch+lNoQEkwK4=; b=Ua
	x6WXIPj73rFNbD3up5Bt6ov4dXdf3GJhWPk4HdY/VQFa5KP/+FsxIsPaATSBLNBNfic0Ox/8AV7Ve
	Q1WdXRlUldK8xGfb7FxavPMLc4pOFHXdJ4HOzqvoNpSaiRhfVgCBBaKN8zAkjE8lPDeULGlWtEQTf
	CflTt5ldJkiw2ro=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGgkO-00AZV3-6V; Tue, 13 Oct 2026 19:57:08 +0200
Date: Tue, 13 Oct 2026 19:57:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?S=E9bastien?= Royen <sebastien.royen@armadeus.com>,
	Julien Boibessot <julien.boibessot@armadeus.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: apf6: fix Ethernet support
Message-ID: <9dc52d6e-2f43-4451-925f-16f138aeca19@lunn.ch>
References: <20261013-apf6-fix-ethernet-v1-1-9530efe1d23e@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013-apf6-fix-ethernet-v1-1-9530efe1d23e@armadeus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105721_138108_5C9C9E4C 
X-CRM114-Status: UNSURE (   9.93  )
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

On Tue, Oct 13, 2026 at 06:07:24PM +0200, Sébastien Szymanski wrote:
> Commit f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros
> AR8031 and AR8035 PHYs") removed a PHY fixup that setted the clock.
> Make the Ethernet interface work again by doing as advised in the
> commit's log, set the clock in the device tree.
> 
> Fixes: f5d9aa79dfdf ("ARM: imx6q: remove clk-out fixup for the Atheros AR8031 and AR8035 PHYs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

