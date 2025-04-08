Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904B5C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABDY6poh0HThAHrjisqjJxeh621Yt7h0FayEtDXs8a4=; b=3XldFCWmEZ816atZ691bvkRlcj
	BqmBwSReGmYi+Tgwy1arVJSAKqCfSyp2lpDB4hzb5m8qJ08VtJ9aI17UPOxmfGSmIOA2Dwl3XMC+0
	1yyzT9AsYy5kxPkS+ul83/pic3OI68bEc506lRcvmNmdtMd0X17TOww54oFiXV2Vuexf1RXeAYmaJ
	/VqUMN4LBQUSor63yNfvh7bisFZFTieL25MouN1G70VhtkD3HFyeG5Z3Y1S/iRAVOPHpKWnHBtEUb
	oTqJiPyCIf0vQTSvtt5mAhHIob8PqeIs75YpQjIF63nW/59chvf4sdKIKzUWWiuBXnoGyYPHsU5Nu
	TLxb1qOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Ag9-00000004Xc2-1NiM;
	Tue, 08 Apr 2025 15:15:57 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AeK-00000004X0M-215l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:14:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9081E44304;
	Tue,  8 Apr 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744125238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABDY6poh0HThAHrjisqjJxeh621Yt7h0FayEtDXs8a4=;
	b=e0UNBGodg2EZ86zi6OaGzuuF6bdNAYXjeXAwUVqzhoUgJk2DB2OMM6UbxH+GaL6AF+S6TE
	WkhDhb3vRWVzj8KS2Vo3uRT9UIX6UrANzHhaZRDIsbJjlyA9j5yw6aIO07XYDvRx3OD9Or
	++LdKi+50MW2olNWpkpYdKOgu5xHjzLp7FoMmdqO6uRWLkJtd4DE88vXIZKS8nFNgH1eo3
	cow28PW5jz2i+yrtMIr3ZuGX1iHJFoPmPLgeNBgvsMGdsnS53/bJEG5ob1SoFUe4v5Jplj
	pwubq7Ej8hXCwX4zDyec0KJ0k9PEgTFo7RNt8rel/Ra1V7jxu6MZmM4zscARAg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 17:13:54 +0200
Message-Id: <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Peter Rosin"
 <peda@axentia.se>, "Derek Kiernan" <derek.kiernan@amd.com>, "Dragan Cvetic"
 <dragan.cvetic@amd.com>, "Arnd Bergmann" <arnd@arndb.de>, "Rob Herring"
 <robh@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Mark Brown" <broonie@kernel.org>, "Len
 Brown" <lenb@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Wolfram Sang" <wsa@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-acpi@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "Andrew Lunn"
 <andrew@lunn.ch>
X-Mailer: aerc
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
In-Reply-To: <20250408162603.02d6c3a1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcurfgvthgriiiiohhnihdfuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhgfeijeduheejtdduteffleeggeejieffiedvteefjeefudekvdeggfeihfeivdenucffohhmrghinheplhhptgdrvghvvghnthhspdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_081405_238254_B3DCD877 
X-CRM114-Status: UNSURE (   9.81  )
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

Andrew, Herv=C3=A9,

On Tue Apr 8, 2025 at 4:26 PM CEST, Herve Codina wrote:

>> What exactly does this DTSO file represent?
>
> The dsto represents de board connected to the PCI slot and identified
> by its PCI vendor/device IDs.

If I may extend on that by providing what I believe is a more
accurate/precise definition.

The DTSO doesn't represent the board, rather it describes the HW
topology of the devices inside the PCI endpoint. Indeed, the PCI
endpoint is a full-blown SoC with lots of different HW blocks that
already have drivers in the kernel (because the same chip can be used
with Linux running on an ARM core embedded in the SoC, rather than
access as a PCI endpoint). So the DTSO describes the full topology of
the HW blocks inside this complex PCI endpoint, just like the DTS
describes the full topology of the HW blocks inside an SoC.

Please see:

  https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2=
023%20Non-discoverable%20devices%20in%20PCI.pdf

And most notably slide 6.

Best regards,

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com


