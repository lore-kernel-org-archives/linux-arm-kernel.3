Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E19CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScdLUi7Tz/pPrIV0NjyW4U23VIueAMMWyx8pCW4VZCI=; b=YQ8XN5DQEuPWFt96dCbX/pERWB
	OmYACgQLiAiAwATsTqZHteSmFXCRa+dMeTf5H84lK/TI04t/2mddgvheHneaPmkd4eApSysru8Obs
	yZfX84sIbLW/Z37QdFwIiSpAe7dE1vfRLpfxmhRBc10sVAq+aTAQEx9QRKRXqLVrufEU7id8/vEz5
	7U0M2BG1S4rUfyDEm+smDz0V4S1XdV6MNL+D6UNkcFGyO3YlRaUY83Nxh6r95ZYGg74aPmOWCPRMY
	4aA/PKAAYo8g0qKfynev2tamSs2LTW1dPg/Q99gqmXjRiEs01KhLxHetplINawn2XZFl8+zmwXTcp
	Fh37EPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFzS-00000000DMR-2cpE;
	Thu, 18 Sep 2025 14:52:06 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFzQ-00000000DLJ-0YDd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=ScdLUi7Tz/pPrIV0NjyW4U23VIueAMMWyx8pCW4VZCI=;
	b=kIabRhxvNKZM0EOI0x7ezn3kFDiHT7Qm8gIvQ0BYtJpuVmeKcBUdD0GswFJM4ppsDTAfe2nGvvNzW
	 EXD8tBZpck/HdmqTgASPLT6zjPnhfW3/RUZoI4rvTNKJWHwAwbHtRCS6+DhaCeZlMw5IfwJYZIDLbv
	 yFmJKLYi1x+eMUSaqnjmy9vIa1tanmteksbq2doEgc7rmR2DgCCx8crqZVfC+RlwGFmiNWbIBl4xWb
	 9hNRV0yBO/HZHtotQkzznJ1DRPpbuM1Z29ahTt8cX/J5e94fqC11tRXXsFVnIUte9MEJLYq6n/Hq7j
	 UdYFbNO1fjxZ0AANHx3zEmpP069LWnA==
X-MSG-ID: 05ec3115-949f-11f0-9d65-00505681446f
Date: Thu, 18 Sep 2025 16:51:56 +0200
From: David Jander <david@protonic.nl>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Rebmann <jre@pengutronix.de>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <20250918165156.10e55b85@erd003.prtnl>
In-Reply-To: <af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
	<20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
	<af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075204_580905_4A845E44 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu, 18 Sep 2025 16:14:28 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +			port@4 {
> > +				reg = <4>;
> > +				ethernet = <&fec>;
> > +				label = "cpu";
> > +				phy-mode = "rgmii-id";
> > +				rx-internal-delay-ps = <2000>;
> > +				tx-internal-delay-ps = <2000>;
> > +
> > +				fixed-link {
> > +					full-duplex;
> > +					speed = <100>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&fec {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_fec>;
> > +	phy-mode = "rgmii"; /* switch inserts delay */
> > +	rx-internal-delay-ps = <0>;
> > +	tx-internal-delay-ps = <0>;
> > +	status = "okay";
> > +
> > +	fixed-link {
> > +		full-duplex;
> > +		speed = <100>;
> > +	};  
> 
> You have an RGMII interface, but you run it at 100Mbps? That might be
> worth a comment somewhere to explain why.

Yes, unfortunately the SJA1105Q does not support PAUSE frames, and the i.MX8MP
FEC isn't able to sustain 1000Mbps (only about 400ish) due to insufficient
internal bus bandwidth. It will generate PAUSE frames, but the SJA1105Q
ignores these, leading to packet loss, which is obviously worse than
restricting this link to 100Mbps. Ironically both chips are from the same
manufacturer, yet are incompatible in this regard.

Best regards,

-- 
David Jander

