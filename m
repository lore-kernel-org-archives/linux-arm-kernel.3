Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54616CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xim6qWFGZ+WXmsN/CH8emkwIniPHErnqJeZArc8D40Q=; b=oBcp79ksuuazy8UxelgNO2WQ1j
	cWwlLyl7+OtbSS3dcCwItYqvL1JoY7qcVjgoIJy7Z7mq6WkBoeTDsQrasYo0eVdSrcgl2yJJiXzw2
	o35gqWA9UWTwYZQwU7ZSlbPsUES9LFjoH5v6Mm0WBCK+mWa97hJUWkhh69xA+0qJ+6dfCtMdfhGVF
	iuEopfMiodOWLfmeeJ1mup1FVvdz5sh13Z7ScfGp4jtN8lBl6SMrySgpcuipi86xP3msT9j59KeOu
	V3FTLmIdQO+WMC/nWakaFRUgFsMYwwjidtEFufQR6DNBnBfAJGlyiKA+4aR5sykRJy1WbMm6Hqk8W
	hpKB/rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dv3-00000006lxR-2GVH;
	Fri, 17 Oct 2025 06:26:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dv1-00000006lvy-1eAM;
	Fri, 17 Oct 2025 06:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682385;
	bh=Xim6qWFGZ+WXmsN/CH8emkwIniPHErnqJeZArc8D40Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k15RyFdyVoJeYb08mMxu9adUujB7QSVw0G8fEYvyrO1hC267ta5tTk7xCiorfMzFY
	 dcaqex8C4Z/PhhZbi/JLLMBLfbHE4sg+dE8wShuqba2NgcTLaL/LisqwJ4qBj84rYP
	 ILfzVe5i4ngO6+IFyR6aj+1FiHo2d1OVgetdauhjzGJZj60QekvzgKyD8T/0X6yqFA
	 ciQK0hoEQTN3K3XPo02a5DmhUlAhRcpoR2xO2CUGfUQszFmaWu8tV3NdoCFO8xah4l
	 XJsNP2GCSaOrHjLJwB8oNVjnU6+k5yO5U52I/inTnecgBf7vDqohqdobpbimsbuRh5
	 eaq60xEt/THHw==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 539D56477A;
	Fri, 17 Oct 2025 14:26:20 +0800 (AWST)
Message-ID: <23813eab1406130dfdb6b63615fe1c1b4b634e29.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd	
 <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Linus
 Walleij	 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich	 <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Joel Stanley
 <joel@jms.id.au>,  Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>,  Daire McNamara <daire.mcnamara@microchip.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I	 <kishon@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Florian Fainelli	 <f.fainelli@gmail.com>, Tony
 Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, 	linux-phy@lists.infradead.org
Date: Fri, 17 Oct 2025 16:56:19 +1030
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
References: <20251015232015.846282-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_232627_624933_706A0DE5 
X-CRM114-Status: UNSURE (   9.90  )
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

On Wed, 2025-10-15 at 18:16 -0500, Rob Herring (Arm) wrote:
> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../arm/altera/socfpga-clk-manager.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0.../bindings/clock/nvidia,tegra124-car.yaml=C2=A0=C2=A0 |=C2=A0 8 +=
+++----
> =C2=A0.../bindings/clock/nvidia,tegra20-car.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +++---
> =C2=A0.../devicetree/bindings/gpio/gpio-mxs.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0 9 +++++----
> =C2=A0.../bindings/gpio/snps,dw-apb-gpio.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0.../bindings/iio/temperature/adi,ltc2983.yaml | 20 +++++++++-------=
---
> =C2=A0.../mailbox/qcom,apcs-kpss-global.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 16 +++++++--------
> =C2=A0.../mailbox/xlnx,zynqmp-ipi-mailbox.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../devicetree/bindings/mfd/aspeed-lpc.yaml=C2=A0=C2=A0 |=C2=A0 4 +=
+--

For aspeed-lpc.yaml:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

