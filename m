Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F7CEA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzBWU5lPTgaIQwywPaNh1ueqepBz9byfm3c/htVgcPM=; b=cPxz/E3nqDM04WqxnYnzF7fgmf
	+qC0Am5ASgyaLMHxT+hApWQmrbUiSpTM1tCP92UoTumiUBqKWAys4/lcX+V3BCbYs5HETs1vRtn/d
	6ykJvDmwJXqq7rosqUghq0hpmgRhL5pIs8p5GiPoVdA5BEvtmlczV8Z3qpGNjEir/JJbrqyBcr0vQ
	19Ovw8E/AApHr7JaYUZn0d70g0ii9lkBnzmJaytZDKHUWZGIOxM6Dbp8YBd7/52ZWm92yMkwueabs
	Q5lmKnF9RRjpeJ9dri9X21yf/SsPwHqUd1v+NenDsT0+9WUT7KPpJipK2nFZHFkJcMVCbEBu2v8V4
	I0g2/C4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoma-0000000APOk-11oV;
	Thu, 09 Apr 2026 12:46:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAomY-0000000APOJ-18oU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LzBWU5lPTgaIQwywPaNh1ueqepBz9byfm3c/htVgcPM=; b=EYWgZCsGZu1QCHFNahcoR94fBw
	CmCWfpDniiWFgHRTQXcYrGVkgixrT4c9d/cv5V8wUxYO7pfeHwLi6Yf5nKpn8CO9ZmrW+TfU+SAok
	J8wsI5mHiPLjhCX4h3A4Y3ijTnSC8TUf3yyNo8R6cZ8u5RCD1YA0KB1itpFhDOIthNjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wAomQ-00FQtj-Lq; Thu, 09 Apr 2026 14:46:42 +0200
Date: Thu, 9 Apr 2026 14:46:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Message-ID: <8efbafe3-0a8a-4005-960c-e8fe62cee719@lunn.ch>
References: <20260409-imx8dxl-sr-som-v2-0-83ff20629ba0@solid-run.com>
 <20260409-imx8dxl-sr-som-v2-3-83ff20629ba0@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-imx8dxl-sr-som-v2-3-83ff20629ba0@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_054650_317167_45030185 
X-CRM114-Status: UNSURE (   8.10  )
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
> +	/* delays are added by connected ethernet-switch cpu port */
> +	phy-mode = "rgmii";
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
> +		reg = <0>;
> +		reset-gpios = <&lsio_gpio4 3 GPIO_ACTIVE_LOW>;
> +		spi-max-frequency = <4000000>;
> +
> +		ethernet-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* 100Base-TX on connector J26 */
> +			port@1 {
> +				reg = <0x1>;
> +				label = "lan1";
> +				phy-handle = <&switch_port1_base_tx_phy>;
> +				phy-mode = "internal";
> +				status = "okay";
> +			};
> +
> +			/* CPU */
> +			port@2 {
> +				reg = <0x2>;
> +				ethernet = <&eqos>;
> +				label = "cpu";
> +				phy-mode = "rgmii-id";
> +				rx-internal-delay-ps = <2000>;
> +				tx-internal-delay-ps = <2000>;
> +				status = "okay";
> +
> +				fixed-link {
> +					full-duplex;
> +					speed = <1000>;
> +				};
> +			};
> +
> +			/* sgmii on addon board connector J21 */
> +			port@3 {
> +				reg = <0x3>;
> +				label = "lan3";
> +				status = "disabled";
> +			};
> +
> +			/* sgmii on addon board connector J21 */
> +			port@4 {
> +				reg = <0x4>;
> +				label = "lan4";
> +				status = "disabled";
> +			};
> +
> +			/* 100base-t1 on addon board connector J21 */
> +			port@5 {
> +				reg = <0x5>;
> +				label = "trx1";
> +				phy-handle = <&switch_port5_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "disabled";
> +			};
> +
> +			/* 100base-t1 on addon board connector J21 */
> +			port@6 {
> +				reg = <0x6>;
> +				label = "trx2";
> +				phy-handle = <&switch_port6_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "disabled";
> +			};
> +
> +			/* 100base-t1 on addon board connector J21 */
> +			port@7 {
> +				reg = <0x7>;
> +				label = "trx3";
> +				phy-handle = <&switch_port7_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "disabled";
> +			};
> +
> +			/* 100base-t1 on addon board connector J21 */
> +			port@8 {
> +				reg = <0x8>;
> +				label = "trx4";
> +				phy-handle = <&switch_port8_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "disabled";
> +			};
> +
> +			/* 100base-t1 on addon board connector J21 */
> +			port@9 {
> +				reg = <0x9>;
> +				label = "trx5";
> +				phy-handle = <&switch_port9_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "disabled";
> +			};
> +
> +			/* 100Base-T1 on connector J26 */
> +			port@a {
> +				reg = <0xa>;
> +				label = "trx6";
> +				phy-handle = <&switch_port10_base_t1_phy>;
> +				phy-mode = "internal";
> +				status = "okay";
> +			};
> +		};
> +
> +		mdios {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			mdio@0 {
> +				compatible = "nxp,sja1110-base-t1-mdio";
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* 100base-t1 on addon board connector J21 */
> +				switch_port5_base_t1_phy: ethernet-phy@1 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x1>;
> +					status = "disabled";
> +				};
> +
> +				/* 100base-t1 on addon board connector J21 */
> +				switch_port6_base_t1_phy: ethernet-phy@2 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x2>;
> +					status = "disabled";
> +				};
> +
> +				/* 100base-t1 on addon board connector J21 */
> +				switch_port7_base_t1_phy: ethernet-phy@3 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x3>;
> +					status = "disabled";
> +				};
> +
> +				/* 100base-t1 on addon board connector J21 */
> +				switch_port8_base_t1_phy: ethernet-phy@4 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x4>;
> +					status = "disabled";
> +				};
> +
> +				/* 100base-t1 on addon board connector J21 */
> +				switch_port9_base_t1_phy: ethernet-phy@5 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x5>;
> +					status = "disabled";
> +				};
> +
> +				/* 100Base-T1 on connector J26 */
> +				switch_port10_base_t1_phy: ethernet-phy@6 {
> +					compatible = "ethernet-phy-ieee802.3-c45";
> +					reg = <0x6>;
> +				};
> +			};
> +
> +			mdio@1 {
> +				compatible = "nxp,sja1110-base-tx-mdio";
> +				reg = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* 100Base-TX on connector J26 */
> +				switch_port1_base_tx_phy: ethernet-phy@1 {
> +					reg = <0x1>;
> +				};
> +			};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

