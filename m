Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8705DCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iex3K3wmKhamz+vqqFHrkjRQrwHLXzKu/EFAlHaGQ9k=; b=guA5W3kKjeEK5o2b1ccNlM5sTp
	7nbdE1MDcO9YCKAS92pjTPXCcAAfIW5lvLmfBiOmNjYhRcQMZ5J9jBY53hvDpkxhS5Fg8D49dTo1n
	CG6peMo44d46DoDSFiIY2yc/+ZTRUgzjRauBGuxgOBpgjZDgbLi5mQigkFy1pMn3XF3bJoxTb216S
	VecnrxGXjo4d0XO3SPOpxQmCIicSHxfXsW7Zf0CcfeUPkne0e7kifvenE2F0rQzk0D8lqSo9UmQu0
	XnEu8WgyryyMtgGE+PcbthUKCvc+meOUIrLnyNqiwkUW/I7Ilk+pvwND9cDBfunpmcwnzl3Y3MLez
	nd3GSdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFSi-000000005yb-0fn9;
	Thu, 18 Sep 2025 14:18:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFSg-000000005xm-1BCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Iex3K3wmKhamz+vqqFHrkjRQrwHLXzKu/EFAlHaGQ9k=; b=eOc8+LYe25TkopazB3zILcKsJW
	uPQCUan41UW29wctSekpNjGXYZRyh0MdKje3dj/Q9rFqVnE/ePWqDfKmQmOjwPnMoiSQT9ownQ9Vz
	L2r76OKZvqQVY0gcpk+zLncycsny4MO0nC8xo+FhV4FVFsG5ExEtpEbt45pYqq0q6t+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzFSY-008phN-AK; Thu, 18 Sep 2025 16:18:06 +0200
Date: Thu, 18 Sep 2025 16:18:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	David Jander <david@protonic.nl>,
	Lucas Stach <l.stach@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <0f520191-7d9f-4800-a41e-a623b9335c9d@lunn.ch>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
 <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_071814_316431_83309732 
X-CRM114-Status: UNSURE (   7.25  )
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

>  - Onboard T1 ethernet (10BASE-T1L+PoDL, 100BASE-T1+PoDL, 1000BASE-T1)

Are these PHYs connected to the switch? It just seems odd you have a
switch with only one port connected to the outside world.

	Andrew 

