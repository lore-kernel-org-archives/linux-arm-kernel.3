Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E6FCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=ju3xv7T78uYzpDrH4OGs/IiXql
	iKCk39u+t5d6qGpG380UcpwTnxBNaeO5Uo603AIjvD2o/MqC+nz6+OSaLEB8HDRHpCHe6yAZrIJfO
	cUDJBcqOeBsT4AeaH9uvHn3MgMpZ4/cSkPh4gblySAXsRgi4WHvahOOlBlxouF969e/gVoedMyJVV
	PHL17cnQWjrtbVFXEV9qBeS8Qc+lFSDncNC58a/C6t9AKKPhTWSyPqdwDTpPP5qcuFpzuG7g2kl6+
	HTiml80vAsuze/oSWcquW/Jsb9IcNdP4AgDWHreozzkqba/mtf7iYZAaGOxQWCVXRKXRLVrwJYeWR
	JWlE/+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrIT-00000005gkc-3xYG;
	Wed, 30 Sep 2026 10:12:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrIS-00000005gk0-0RkV;
	Wed, 30 Sep 2026 10:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=dApBVEqQ3Zj/y8iVK+Ak9kZrvm
	7uhqTNvm4GP2v86I+gKeaIw+WSSP+knR2eHTB83CEM29XGBIaYiRfLQgnf5Mb4y979km0f+y54NUy
	Lkfas+H5XC5HebCxmVI6enCYsKMswafOxTlVYNfXXQ8mEsIOaCOm0oLKZPqirNrDy8WgD7BreZPFk
	e88PjHYCQAIHYN8oeM88vJi0BzAuPCVD+0nwjbLn7Kde8SLhzwS+AuNBfeVtGlJ4+qwjFUnI999Xm
	F8q9iJAbe4qk5GOkbNDjDvAI+z86rYZyC3XC/Qm/a0DlhVdCteTmIi5r8Wg2DO5NWJk3DRqmlnbcZ
	qzqXGmsw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrIO-00000003cvk-25Md;
	Wed, 30 Sep 2026 10:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=e2EiqEtrZ1QVkcER2vy49AcVi3JCtBleuVlk1SuHSqo=; b=R7PSEE70K/QFTnGHB9WIW4gzJc
	1ylFt7T+MWYG5qEfkLdhthKgNWTrT0nMsJQ79ejoq6nXfOfR4GVRmY+EeEVUoZvG1iPZ1D17prYHL
	0RXzRYXPYHt3EtkXtzTzpWKTrW+EMq0gKFLJaDDtzPL/h3RRwNowfSnX7h3l4DVifWlXY6I4uf1A7
	1JEG90bi/jOCwWqixhWUnR743rng4WyQwfovKgU9x20lDMqrtqCLBCepb23bfEcSa52gqMHn2pLqe
	mDE2tnd1KVAsFMIOZjOBNjEKl8qxry72aGveQPMyTUdx7bOEmXmUkCryFovVt2jDg8GcmHtQT8jTb
	liz/qjGQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v5 17/21] phy: Add common Innosilicon HDMI PHY helpers
Date: Wed, 30 Sep 2026 12:11:50 +0200
Message-ID: <5147655.PYKUYFuaPT@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103241eucas1p27d80c31d14062ea876a2c16ddbd71e3a@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-17-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111216_772933_74F3C2D1 
X-CRM114-Status: GOOD (  10.69  )
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

Am Dienstag, 29. September 2026, 12:31:14 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
> where the PHY register block sits in the register space and in which
> pixel clocks they support, but the pre-PLL programming sequence and the
> layout of its registers are the same.
>=20
> Add a small library holding that shared part: the pre-PLL configuration
> table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
> and the pre-PLL register programming. Callers pass a regmap, a register
> offset for the PHY block, and their own pixel clock table.
>=20
> No driver uses it yet; the users are converted separately.
>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



