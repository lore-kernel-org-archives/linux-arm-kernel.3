Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4713BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Wy4jvhAkYWU+75UjFdapU9F9JHAgpepN1alzmqoBOY=; b=yu0ZD1wdlu3PxXsr6AWbIQsheK
	O/8+Dm2D2cpi1wQVp/z4a0cI9cd4OwV24t9I1OuFQ/ixKbKxA+wjGkl8f1uYTvVI+c/vQHaYDJI2H
	v2RvkE4/t4RPpyGWq2ZNvS2HhvnYUUNAsdApuLTLOozq0smHmQXkzrqmMYQspTAlPd/+tqQwT4KXz
	fc1TrUzOGTdUeBJLwhFSQetplguI1ZXH6C6oNCtLaX8hAD9j2VBmetT6V4nT38GUZzzZuZB2lo2sh
	pd+NTKMTZ9cAIysoaUAq0Ec//oYAkNDAugOeACQgvwqf5C6ABKSeBBu5r3I2kKMXUbsOFyiuhglwq
	2fWUjB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQhb-0000000DkB1-37Pb;
	Mon, 11 May 2026 13:29:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQhY-0000000Dk8g-2fY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Wy4jvhAkYWU+75UjFdapU9F9JHAgpepN1alzmqoBOY=; b=MJx4Q6jsCD7srZzQ4/uJLOZhqP
	g3QW+yawqBFesGDVOM7RWS3CjQVCwgQ7sFtn6UnpSY4eCIgMa/sQhpjhQSnVJyOJvOmb3GUVtvK78
	smO7oXhwFzpwnm9oUAff0Qf5oGrDCeUYFXPqUsIEhFDQjc6CHSUbQ7hHUOe3nIP1Zpyg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMQhG-002MmR-Vk; Mon, 11 May 2026 15:29:22 +0200
Date: Mon, 11 May 2026 15:29:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Josua Mayer <josua@solid-run.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Message-ID: <557f7332-42b4-49eb-85ea-76d141a2150f@lunn.ch>
References: <20260511-imx8dxl-sr-som-v4-0-64381b3bf80d@solid-run.com>
 <20260511-imx8dxl-sr-som-v4-0-64381b3bf80d@solid-run.com>
 <20260511-imx8dxl-sr-som-v4-2-64381b3bf80d@solid-run.com>
 <20260511-imx8dxl-sr-som-v4-2-64381b3bf80d@solid-run.com>
 <20260511112438.4fxvhelf242emzft@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511112438.4fxvhelf242emzft@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062940_735022_F19F34DC 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, May 11, 2026 at 02:24:38PM +0300, Vladimir Oltean wrote:
> On Mon, May 11, 2026 at 12:11:31PM +0200, Josua Mayer wrote:
> > +&eqos {
> > +	/* delays are added by connected ethernet-switch cpu port */
> > +	phy-mode = "rgmii";

For ethernet-phy combinations i'm pretty strict, but i'm more
forgiving when switches are involved.

If rx/tx-internal-delays-ps work, that would be better, but i'm
willing to accept this, with the comment in place.

	Andrew

