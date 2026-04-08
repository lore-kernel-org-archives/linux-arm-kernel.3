Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830410F9968
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAZm2qiLjq3ox5SRNUov0iZclXfp4xGDo+iZ3cySymI=; b=XFFhKR2iSlBtqs4xTV95EXd7th
	Kq7UJYnPOB+GJXTHdBphQO7xmLQcfKbYOuW5inxKiBaOtgPeMgoBPNgzrpShHfLeGu3UCjQE0bSFw
	JQY/eQ8GsfMHNQ7OFuThznGvcj41NiWA/VVlTWDUyNotdrOOt8ZidU+JqvqVAYLSSyVGbTivClwi/
	lFdLSEkwXO/uMR5oV9BnVfbmzYA9uPtq0SUDbfHXAns8wLQaoVtJev9I6yzkoYp/PG7BahLnTtJEO
	Lt5osqTpPzT31bDQPzcej0Q6jhtFFJYkB3yiJNGEHaQ4gsBrvjd8T2HpbnBd4mrxi6qRxLOPq3YJm
	rwkjN2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZGu-00000009MaE-41xh;
	Wed, 08 Apr 2026 20:13:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZGs-00000009MYr-0wsv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 20:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PAZm2qiLjq3ox5SRNUov0iZclXfp4xGDo+iZ3cySymI=; b=bYOl87ges7J2CytCd1HJET3+o0
	QFXXoxbU7HXqkC304jLeO8cIIW/3s0Min3+36iif/4Ap4uM3pLXRJ+lxseW+JoQfLdrqlmIh+yex1
	1mY831qz88zH3LeL1l4/7+vL2q+3rtb0BD9H3s8Io1wn5jQBOf+IjxcaSOPD2fauD3F8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wAZGd-00FKxK-HF; Wed, 08 Apr 2026 22:12:51 +0200
Date: Wed, 8 Apr 2026 22:12:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Message-ID: <3024c143-520e-49ea-af17-33344ebf7149@lunn.ch>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_131306_267441_FFFE2C6F 
X-CRM114-Status: UNSURE (   8.66  )
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

> +&eqos {
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&eqos_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	fixed-link {
> +		full-duplex;
> +		speed = <1000>;
> +	};
> +};

> +	ethernet-switch@0 {
> +		compatible = "nxp,sja1110a";

....

> +
> +			/* to CPU */
> +			port@2 {
> +				reg = <0x2>;
> +				ethernet = <&eqos>;
> +				label = "cpu";
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;

The eqos is using rgmii-id, this port is using rmgii-id, and you set
the delays to 2000ns. How is this not resulting in 4000ns delays?

    Andrew

