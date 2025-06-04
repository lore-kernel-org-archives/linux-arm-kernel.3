Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4526C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waKYFNIYf4LrJ42FOyiZV+jusnWxW7j8zewA7/spaT0=; b=BzgIG9XqRCBXewiwv+jGf0nXkr
	DMr47FSjWlLQFtGSSsm6M0YqIBB8V2WOQHWQbYM5Ecaaaq6QbbNA7DcTVoAGap0P4KeWq8GMvGd3k
	rq8dm3zehyeGIEAGJofywVGqkI1GGKedYrzYJ13WpqG90XUMRYEbXg3yCyiPqaGgZhRiQv+0mwDOs
	WJw/8dASjO7lyh748y7+h5+Gat7hLj2CxO5SHqVUU2pmWmrEscTZZvGpusO3sCwYMaYD2NFwIxguH
	UFAa3QNGm2MIPLT43sIQeKHYhbP4oa1CpTdMNay/5KmqLPKqihzrS/bJoo37TYWF64opgd8VBqxM6
	tb7dZxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMn3g-0000000DJ1K-3AXg;
	Wed, 04 Jun 2025 12:17:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmnq-0000000DGgo-06HV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 12:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=waKYFNIYf4LrJ42FOyiZV+jusnWxW7j8zewA7/spaT0=; b=xRjnYFbiM4mwUIe/PxOIVrTZj5
	asr9kZnkbk7H9VDjzpjU3n4TP0fwjdA+YMIKqSrPV2h+yxSf1LTP8bP4bYSjYqqGr4bRzEsQC2pUS
	4mXAMtQGi6d9mkurCGQxZgaXBKRO2tS+PEmY1dVNLm3gTIo1cggd2NJtv4uo/P++Pn94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMmnf-00Eg4w-Ap; Wed, 04 Jun 2025 14:00:55 +0200
Date: Wed, 4 Jun 2025 14:00:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
 <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_050106_062127_5A320ED3 
X-CRM114-Status: GOOD (  10.40  )
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


61;8001;1cOn Wed, Jun 04, 2025 at 09:37:39AM +0200, Stefano Radaelli wrote:
> Hi Andrew,
> 
> I double-checked with our hardware team, and it turns out that all required
> RGMII delays are already handled by the hardware on the SOM (trace
> tuning + PHY config).

What do you mean by PHY config?

The four RGMII modes you can use with phy-mode are purely about the
PCB. If you have the PHY strapped to add delays, what does not count
for PCB, and if you are not careful, future software could reconfigure
it.

	Andrew

