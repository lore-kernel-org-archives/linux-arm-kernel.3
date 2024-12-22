Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0iBQ2C/yy3N4qyUcRep2kLno1voOeDy/O3HvjHsB9U=; b=rbNQXkQNeBiKP7L33hWnISFB7e
	UiyeVfyPC20DB6xtaUbSbFimHBIU83CXRJU11DZHW0J+ONBHv6Xx3g6Acyf1fu/hqhoqX0PYrD4xa
	jVfFG+UJrTS6U73mbS7wI4uu6lwKHqwCJq5MMQ1AJuq4uLcYEtS2BHFIjWzLQhhREEAsaQ73Z+1um
	4eYyidsWrPG8fBC11sZPUnNPkMJ+6Rpbq0wcgJ04SphaA4ZhVE47A0VxJUhVcBTOEQtdRxVFK2y/s
	JVT9zG04LIA8yIw3w+Ov6AC5bZ/QcaOYmGkCRfNo5mAdKO5UhFWxdqrXXLg0fQEYJWfLHT6si3jgX
	Pnnz862A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPR7X-00000008inq-3FWy;
	Sun, 22 Dec 2024 18:56:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPR6L-00000008igJ-2fb8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 18:54:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tPR6A-0004rL-4k; Sun, 22 Dec 2024 19:54:42 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tPR64-004k5l-1z;
	Sun, 22 Dec 2024 19:54:37 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tPR65-00ENlm-0r;
	Sun, 22 Dec 2024 19:54:37 +0100
Date: Sun, 22 Dec 2024 19:54:37 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <Z2hgbdeTXjqWKa14@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
 <Z2g3b_t3KwMFozR8@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2g3b_t3KwMFozR8@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_105453_840887_A973F6FC 
X-CRM114-Status: GOOD (  19.24  )
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

On Sun, Dec 22, 2024 at 04:59:43PM +0100, Oleksij Rempel wrote:
> ### Proposed Port Description Schema
> 
> Here’s how I imagine the port description could look to address these issues:
> 
> #### **Device Tree Example**
> /* Ports should be in the root of DT */
> ports {
>     /* Twisted-Pair Example */
>     port0: ethernet-port@0 {
>         reg = <0>; /* Port index */
>         label = "ETH0"; /* Physical label on the device */
>         connector = "RJ45"; /* Connector type */
>         supported-modes = <10BaseT 100BaseTX>; /* Supported modes */
> 
>         pairs {
>             pair@0 {
>                 name = "A"; /* Pair A */
>                 pins = <1 2>; /* Connector pins */
>                 phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin mapping */
>                 pse-mapping = <PSE_OUT0_P PSE_OUT0_N>; /* PSE pin mapping */
>             };
>             pair@1 {
>                 name = "B"; /* Pair B */
>                 pins = <3 6>;
>                 phy-mapping = <PHY_RX0_P PHY_RX0_N>;
>                 pse-mapping = <PSE_OUT1_P PSE_OUT1_N>;
>             };
>         };
> 
>         pse = <&pse1>; /* Reference to attached PSE controller */
> 
>         leds {
>             link = <&led0>; /* Link status LED */
>             activity = <&led1>; /* Activity LED */
>         };
>     };

Here is updated version:

ports {
    /* 1000BaseT Port with Ethernet and simple PoE */
    port0: ethernet-port@0 {
        reg = <0>; /* Port index */
        label = "ETH0"; /* Physical label on the device */
        connector = "RJ45"; /* Connector type */
        supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */

        transformer {
            model = "ABC123"; /* Transformer model number */
            manufacturer = "TransformerCo"; /* Manufacturer name */

            pairs {
                pair@0 {
                    name = "A"; /* Pair A */
                    pins = <1 2>; /* Connector pins */
                    phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin mapping */
                    center-tap = "CT0"; /* Central tap identifier */
                    pse-negative = <PSE_GND>; /* CT0 connected to GND */
                };
                pair@1 {
                    name = "B"; /* Pair B */
                    pins = <3 6>; /* Connector pins */
                    phy-mapping = <PHY_RX0_P PHY_RX0_N>;
                    center-tap = "CT1"; /* Central tap identifier */
                    pse-positive = <PSE_OUT0>; /* CT1 connected to PSE_OUT0 */
                };
                pair@2 {
                    name = "C"; /* Pair C */
                    pins = <4 5>; /* Connector pins */
                    phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY connection only */
                    center-tap = "CT2"; /* Central tap identifier */
                    /* No power connection to CT2 */
                };
                pair@3 {
                    name = "D"; /* Pair D */
                    pins = <7 8>; /* Connector pins */
                    phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY connection only */
                    center-tap = "CT3"; /* Central tap identifier */
                    /* No power connection to CT3 */
                };
            };
        };

        pse = <&pse1>; /* Reference to the attached PSE controller */

        leds {
            ethernet-leds {
                link = <&eth_led0>; /* Link status LED */
                activity = <&eth_led1>; /* Activity LED */
                speed = <&eth_led2>; /* Speed indication LED */
            };

            poe-leds {
                power = <&poe_led0>; /* PoE power status LED */
                fault = <&poe_led1>; /* PoE fault indication LED */
                budget = <&poe_led2>; /* PoE budget usage LED */
            };
        };
    };
};

A port with fully configurable PoE support:

ports {
    /* 1000BaseT Port with Fully Configurable PoE */
    port0: ethernet-port@0 {
        reg = <0>; /* Port index */
        label = "ETH0"; /* Physical label on the device */
        connector = "RJ45"; /* Connector type */
        supported-modes = <10BaseT 100BaseTX 1000BaseT>; /* Supported modes */
        shielding = "grounded"; /* Indicates the connector is shielded */
	/* 
	  grounded: Shield is connected to chassis or earth ground.
	  floating: Shield is not electrically connected.
	  capacitive: Shield is connected to ground via a capacitor.
	  signal: Shield is connected to the signal ground.
         */


        transformer {
            model = "ABC123"; /* Transformer model number */
            manufacturer = "TransformerCo"; /* Manufacturer name */

            pairs {
                pair@0 {
                    name = "A"; /* Pair A */
                    pins = <1 2>; /* Connector pins */
                    phy-mapping = <PHY_TX0_P PHY_TX0_N>; /* PHY pin mapping */
                    center-tap = "CT0"; /* Central tap identifier */
                    /* if pse-positive and pse-negative are present - polarity is configurable */
                    pse-positive = <PSE_OUT0_0>; /* PSE-controlled positive pin -> CT0 */
                    pse-negative = <PSE_OUT0_1>; /* PSE-controlled negative pin -> CT0 */
                };
                pair@1 {
                    name = "B"; /* Pair B */
                    pins = <3 6>; /* Connector pins */
                    phy-mapping = <PHY_RX0_P PHY_RX0_N>;
                    center-tap = "CT1"; /* Central tap identifier */
                    pse-positive = <PSE_OUT1_0>;
                    pse-negative = <PSE_OUT1_1>;
                };
                pair@2 {
                    name = "C"; /* Pair C */
                    pins = <4 5>; /* Connector pins */
                    phy-mapping = <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY connection only */
                    center-tap = "CT2"; /* Central tap identifier */
                    pse-positive = <PSE_OUT2_0>;
                    pse-negative = <PSE_OUT2_1>;
                };
                pair@3 {
                    name = "D"; /* Pair D */
                    pins = <7 8>; /* Connector pins */
                    phy-mapping = <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY connection only */
                    center-tap = "CT3"; /* Central tap identifier */
                    pse-positive = <PSE_OUT3_0>;
                    pse-negative = <PSE_OUT3_1>;
                };
            };
        };

        pse = <&pse1>; /* Reference to the attached PSE controller */

        thermal {
            temp-sensor = <&tsensor0>; /* Reference to temperature sensor */
            /* or */
            thermal-zone = <&thermal_zone0>; /* Reference to thermal zone */
        }

	fuses {
	    overcurrent-fuse {
	        type = "resettable"; /* Resettable polyfuse */
	        max-current = <1000>; /* Maximum current in milliamps */
	        location = "data-pairs"; /* Fuse protects data pairs */
	    };

	    overvoltage-fuse {
	        type = "tvs-diode"; /* TVS diode for surge protection */
	        clamp-voltage = <60>; /* Clamping voltage in volts */
	        location = "poe-pairs"; /* Fuse protects PoE pairs */
	    };
	};

        leds {
            ethernet-leds {
                link = <&eth_led0>; /* Link status LED */
                activity = <&eth_led1>; /* Activity LED */
                speed = <&eth_led2>; /* Speed indication LED */
            };

            poe-leds {
                power = <&poe_led0>; /* PoE power status LED */
                fault = <&poe_led1>; /* PoE fault indication LED */
                budget = <&poe_led2>; /* PoE budget usage LED */
            };
        };
    };
};

In case of PoDL, we will have something like this:

pair@0 {
    name = "A"; /* Single pair for 10BaseT1L */
    pins = <1 2>; /* Connector pins */
    phy-mapping = <PHY_TXRX0_P PHY_TXRX0_N>; /* PHY pin mapping */
    podl-mapping = <PODL_OUT0_P PODL_OUT0_N>; /* PoDL mapping: Positive and negative outputs */
};


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

