Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DC7CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT7EyJhqaGT1c/vVbat3yyZR0Yh/jcDyJmsQcPvAhhs=; b=IjTyXZxv2QpCLUtP/a3XPsoB6b
	BhT9tSXEbUaVPAPRvBD4bqnN39t1KOzCDvjMun5+TfkWWPGg/uEhVZ9e3SOYFdZ6yOza7xvdugB8e
	je2231vkFE7+ZU9jNoOa7juH/vUggrnMoReZRXJmiTeXMouYr9+L346fEw3OWMZoyMg4kjP0KEZdv
	QaFRhUIGGmqRrEDVxh3os8IHNCDEuQP3PKhobOCPaIW0fqHZKpB+zBvpToFRH/k4h52bVTErInVoC
	vSQ2WffG7U019YirEhqewY90H9LTuoaFSC04jl7xx1odz3VQ67e3x9PFexWdjKCAX91Fhw4hwSEF5
	p0azBTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGC4-00000000GW0-3rOA;
	Thu, 18 Sep 2025 15:05:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGC2-00000000GUv-44rU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gT7EyJhqaGT1c/vVbat3yyZR0Yh/jcDyJmsQcPvAhhs=; b=2Mg6dsQRTBgEVP1SD38awP1HMR
	VvKK0efTP0JUtG5xvhbIVACkueM+2moVFWtAlmpRQfbaX166ZQBeUMz63JIUb4QIolAa6aTlcBmdP
	E50ZUVM0uxw1NFBK57Eg0qCdzKXOiyM4dwi4vS3tzX+voRwq5MUK3j+7fA8h8V9Vy8QA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzGBr-008q5n-Ct; Thu, 18 Sep 2025 17:04:55 +0200
Date: Thu, 18 Sep 2025 17:04:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Jander <david@protonic.nl>
Cc: Jonas Rebmann <jre@pengutronix.de>, Vladimir Oltean <olteanv@gmail.com>,
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
	Lucas Stach <l.stach@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <7f1d9289-4102-4db9-a2bb-ff270e8871b7@lunn.ch>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
 <20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
 <af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
 <20250918165156.10e55b85@erd003.prtnl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918165156.10e55b85@erd003.prtnl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080507_011260_FA42BBB9 
X-CRM114-Status: UNSURE (   9.55  )
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

> Yes, unfortunately the SJA1105Q does not support PAUSE frames, and the i.MX8MP
> FEC isn't able to sustain 1000Mbps (only about 400ish) due to insufficient
> internal bus bandwidth. It will generate PAUSE frames, but the SJA1105Q
> ignores these, leading to packet loss, which is obviously worse than
> restricting this link to 100Mbps. Ironically both chips are from the same
> manufacturer, yet are incompatible in this regard.

Thanks for the explanation. Maybe add a comment that the bandwidth is
limited due to the lack of flow control resulting in packet loss in
the FEC.

Anything which looks odd deserves a comment, otherwise somebody will
question it....

	Andrew

