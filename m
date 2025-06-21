Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1847C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 21:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jC+faa0vhHMt058jQXuTWiq9PmawBgRcm0zmjbebN8=; b=cCcBUrYmtvL+QKBvc7XOfmwy00
	wscnlBMZI8EjF3njXVHC39RrQHwSMh5yr/YUerabaz84RoCgWZtC4dQU1jAYwYOMNHjIut3ke8t45
	3WKvhD7H9Ghpiq5hOdO9EGlAZvlVw8Rgoeij4CuVmYlM1iEw5bcFTGKUelNOznFDKI06b+mXp09t3
	uJE55P4MqBI2dl+CyybDl8zTDbwKE7Vg+MKbV4QPjqeAx/5zGzB/fnDZzbgUXS8N7d8eJ1C7nQGFB
	uiJoMPD8vM8qDGcrCNJyfPw94B1ZJm6dxkrKuPj1A1KFHYuPq6BQ6iSeJ2zVEoeOCBuhPsoaTJ/2m
	wc0lFEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5U0-00000000IZD-3dL7;
	Sat, 21 Jun 2025 21:10:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5Ri-00000000IPR-1XHV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 21:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E67A5C40C0;
	Sat, 21 Jun 2025 21:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D496C4CEE7;
	Sat, 21 Jun 2025 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750540097;
	bh=2jC+faa0vhHMt058jQXuTWiq9PmawBgRcm0zmjbebN8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ar1XRdtkpcsbBkiUxMPVbOG+KuufUZlkTWTVIDh6iJVyxwgahujACItMxBAcozJUh
	 X5OnRF4MPfjYPk3gPAugfVP40baW4nWQFeuS2ZwnDo55omIY/ycOccE5URisHN+Ukk
	 hHzFHLoEQzGVq9OVQBYwfLy4aStLo4FkJSRF9O6KKZfgl9m3R/86ae0gkE8GBbOFxC
	 KiXLhG51Z5q3zKBHXTc6kTOaoRliC2GgxJhZUtMNx7P1AQkE6jhzhm8DpxVNyMldlN
	 9aem64MCx/0AgybRvWns0UUBlWuUdA+GwQhiM98TcDNkNps4qEdPz/kQ696wEkeEQc
	 fQraBS9h7BWxQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250613134817.681832-20-herve.codina@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-20-herve.codina@bootlin.com>
Subject: Re: [PATCH v3 19/28] clk: lan966x: Add MCHP_LAN966X_PCI dependency
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Fabio Estevam <festevam@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Herve Codina <herve.codina@bootlin.com>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin <peda@axentia.se>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Sat, 21 Jun 2025 14:08:16 -0700
Message-ID: <175054009650.4372.6942087426361808940@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_140818_445115_00E09F7E 
X-CRM114-Status: UNSURE (   9.23  )
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

Quoting Herve Codina (2025-06-13 06:47:59)
> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
>=20
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

