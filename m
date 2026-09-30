Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB31CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=aS82aCD9uDvuxNXCkJ7kFt84mj
	UrHtpddtKhLYRb+pVpBYygoN1SnpcAGilFqssnQP+31j/DMM5Az/hTerY10PUkJ9S2qs20r1LOPna
	gChQGYaJwPc+Hkh1tmrZ9MuLtkCfhB31e4liOG0s8JkmGF1p+kIvV5cQRjmoPdvPXKIb5gztlmhcS
	kJhrdXlTng9xPvDM5dSXsHihSRMxoXgzJBRJ+NFUSdHYZdwGJ2J/FaYCIQKOAcEZ8uMktYZEADagb
	+U7UB/8y7QS80nKout0Vr4sN0K64pV+HEXntYnADAhVZyNZDs8Ph+MYv3Ys7buixzZE/PPT1fDaaY
	TUv2p8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLU-00000005hcK-0Zbw;
	Wed, 30 Sep 2026 10:15:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrLC-00000005hTN-48id;
	Wed, 30 Sep 2026 10:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=PFyDfeMpH3GUhceUzHw8U6vjAh
	+pbimKosYpwiYpvqRSM8M8KN56UH2sqmTDbnFapdjJVHOp1fqBOnur+Lq4UUVq+KoUuvepT7ROP8l
	W+ETNPOdDvQGYoEJRltDdow6dAxHod9nEPbkT5oHk620Dvoklk6LCrWULUK5pFAQQI/Y3Wwqo1K4t
	DY8rk8c75iARF1onE5Mrz50GrmP6TWheIvLczRGHW2ndTxeJL6Nqi80JM1sKbRZe7UPprm47ssp82
	JrJ3dKTNZkTEDiqE8GpJ5GCQoFHRLTKq+a99oe7T1w88Uc/RboWIz5Vcko5fJlxps2Peq9bgQeRu4
	SeCqz2Dg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrKw-00000003dEA-44f0;
	Wed, 30 Sep 2026 10:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YnX8T7gNfbhjxb0T3bPJtC5F74MskXCpLp0g/w+uC24=; b=aZGZGfJGrtsB20BtlHvOPFQKSe
	AZVuyaf4pho61ToIbowX2dFtcUR1oOw8x7uPdS14NJadzDDQ2RLI69MhxozNFa1H4KsLGCx8j55Q3
	dMhTWz1qQTyilGbZZPovjP9NLeuLpRHDeI/8xmfvrD85DXGbXfChVP30VXyK0J6q3aA/gpMWZeLj5
	fHO6cXX6d32eZ8cyOVsKMB0/6LBq9lD19lVRLXTT9RebJUybRmZV0Tf/SCokesG1QZsavYz4AqY43
	MgRXkJdKSjJ9IUdwOzH2f9FhaEksRgk6PswKV+l7pnz/7VyAAO3LlNHjkC4gSXpdwgEPUgFaR+Bm+
	oPVV8jjg==;
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
Subject: Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common Innosilicon PHY
 helpers
Date: Wed, 30 Sep 2026 12:14:31 +0200
Message-ID: <7069377.kQq0lBPeGt@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111507_291030_6CC28679 
X-CRM114-Status: GOOD (  13.46  )
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

Am Dienstag, 29. September 2026, 12:31:15 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Michal Wilczynski:
> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
> determine_rate implementations are the generic Innosilicon ones, so drop
> the local copies and use the shared helpers instead.
>=20
> The RK3228 pre-PLL sits at different register addresses, so it keeps its
> own register level code and only shares the table lookup.
>=20
> The now unused RK3328 pre-PLL register macros go with it, as does the
> local pre-PLL config lookup wrapper; both call sites already have the
> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
>=20
> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
> shared helper logs it too, and reports the actual VCO frequency
> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
>=20
> The register writes, their order and the values written are unchanged.
> No functional change intended.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Only thing I cannot really make up my mind about, is if this and the
previous patch should be merged ("move common code from rockchip
variant to shared helper").

As I said, can't really decide what would be the better solution ;-) .


Heiko



