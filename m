Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48882C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMGzIJ6a/SjyP3jq2ylC0v7lVpVlSTcN9VZFPohtskE=; b=v5yz7Ct84dl9pbTUmchWNDDNI2
	UJtZ3D15mlNo2sLyI9FTuJtKa4OhPyX6n/YtQgkotQzuJ+FU4KiBByTbEw2dZBKoQne0SgnN1efam
	IQcjFr7vLU3Fzmfbxb7E3ZvTRDiO6W33D2EW1ywTZBWbNDbVsTA4gGUj0pLOmidcg1G40HeBmyWYR
	kSUJvQ4/LqYiyGUuv4yZlfUJnS22CBclsTwBB1xwRscIJw62YQbWxd/psU6yjYPb0avt1qZkXVidK
	X814pvxB6zQ4EsEIgLlxMoDxrwEHswoS01OCKXlAe1Kvp3yj/AFuZpJ7M1GODiuh5L5akXI8ap+fr
	70Z6S94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATRw-0000000Fjwy-4ANd;
	Thu, 01 May 2025 12:55:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATBU-0000000Fi6K-2OHW;
	Thu, 01 May 2025 12:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TMGzIJ6a/SjyP3jq2ylC0v7lVpVlSTcN9VZFPohtskE=; b=zt4dSXgrVISFWJwXdPVT9vChf2
	lz5BPnDLeDaKPUiNU8qeOeCi0QQVViW7CcQHmefHNLggfwmfIreADmL7bMHG9anLK5GnL6+yKufmr
	XmSSHCMPeN5uiUjkXyAM48vyBoq4vhIc9VFYyGtcMMBkvz/aZ3BkkF2aCGciEz/wr6lD6YvFlKeuz
	toQlnSSZ/oMWzmoM9ldc/v38QRd/zsCW0Ln9VAhapQPXI8Cz/v7P4G2k7az+LX1syCwFvEt0A+gfa
	sR68RMdRcWlp7KTyUqCufKQ1WT0MHz8lEOK2a4kx81hJbkYZtwR8N6fIvFBDBcUU26T3I/A6PGRdF
	ZT5qrTpA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATBL-0001C8-5z; Thu, 01 May 2025 14:38:27 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 02/11] clk: rockchip: introduce auxiliary GRFs
Date: Thu, 01 May 2025 14:38:25 +0200
Message-ID: <2240109.Mh6RI2rZIc@diego>
In-Reply-To: <20250410-rk3576-sai-v2-2-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
 <20250410-rk3576-sai-v2-2-c64608346be3@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_053836_606844_2A7A3A77 
X-CRM114-Status: GOOD (  23.45  )
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

Hi Nicolas,

Am Donnerstag, 10. April 2025, 21:39:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Nicolas Frattaroli:
> The MUXGRF clock branch type depends on having access to some sort of
> GRF as a regmap to be registered. So far, we could easily get away with
> only ever having one GRF stowed away in the context.
>=20
> However, newer Rockchip SoCs, such as the RK3576, have several GRFs
> which are relevant for clock purposes. It already depends on the pmu0
> GRF for MUXGRF reasons, but could get away with not refactoring this
> because it didn't need the sysgrf at all, so could overwrite the pointer
> in the clock provider to the pmu0 grf regmap handle.
>=20
> In preparation for needing to finally access more than one GRF per SoC,
> let's untangle this. Introduce an auxiliary GRF hashmap, and a GRF type
> enum. The hasmap is keyed by the enum, and clock branches now have a
> struct member to store the value of that enum, which defaults to the
> system GRF.
>=20
> The SoC-specific _clk_init function can then insert pointers to GRF
> regmaps into the hashmap based on the grf type.
>=20
> During clock branch registration, we then pick the right GRF for each
> branch from the hashmap if something other than the sys GRF is
> requested.
>=20
> The reason for doing it with this grf type indirection in the clock
> branches is so that we don't need to define the MUXGRF branches in a
> separate step, just to have a direct pointer to a regmap available
> already.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

like the concept and also implementation :-) .

> ---
>  drivers/clk/rockchip/clk-rk3328.c |  6 +++---
>  drivers/clk/rockchip/clk-rk3568.c |  2 +-
>  drivers/clk/rockchip/clk-rk3576.c | 32 ++++++++++++++++++++++----------

the only "hair in the soup" are some missing socs ;-) .

As you're changing the MUXGRF type, you should adapt all socs using it
please. Missing rk3288 and rv1126 it seems - ARM32, which may have helped
these slipping through.


Heiko



