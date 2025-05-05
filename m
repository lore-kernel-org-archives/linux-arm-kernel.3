Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C1C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l/heqGk/UTexwAtKZZUGycS/exQ3H0HSuobkgefF30=; b=pEGD7v8xRUuHS+eWGf2OWw5Sol
	0jeV80aZUBmwgYVEMSyCyxaBLTnTQyw78D7Df3A58/Dd+j6/YlP1G1i+gyp1mS7lzN0rLK4XT80r1
	yMRg1az/yZFnsQL/tEtMvKs7T3XemCbs2j+sHhZeRKTURoi2Jp3xeLzfVj6gbo0MC6YnrxKVI/EXW
	DiVnSywiwjREpcuK5v1YRE78sj8GoG1kU1+TWZY8fD8zJDlkdGKninOD0HLw3kIi/+6Yb7DniMM6G
	OdEWHrJ5FjuBj7rkitHJGMTeG8GbcestnHu7r20lAXBtDaNa3/MLRhH4+4bg098GuDRzYNcIw7QKz
	PtHCo33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yu-00000008dmb-0S1U;
	Mon, 05 May 2025 21:41:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Wt-00000008dFh-0URD;
	Mon, 05 May 2025 21:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6l/heqGk/UTexwAtKZZUGycS/exQ3H0HSuobkgefF30=; b=FeGwC3ybr75HKO+AnpNeCgzn/7
	btsDdrILnjyQaO/niTyoI+k6DOd+zI2DjMDahPHyW1S+qJWTNi0H2Lsuz350DFJhPV9SdniI/GYLF
	Xd6/nOyeAHNNPzl+xoOAk+ZZTV+7OO0R2i1m72KUSi3QcD3F/rhDfIWZANPyKk6VVRcAkk7JlkBcA
	b5WQw9/xIH8e2CoRXD5XxQLqt9/LuYMAhN3ueSCZO5msI9Ov/3FC7AkVruNvjUz91YSu4TMHdDYAM
	qU04+Mv/pU7+PdBUpTZ8J1GsDPHp6bp1sqi3O0R5XmJVeZPWsK+JK+IFeQoNNWGoc8JmzVDc3iyQ0
	N1V1vSxg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uC3Wk-00006o-S3; Mon, 05 May 2025 23:39:06 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>,
 Yao Zi <ziyao@disroot.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v4 2/5] clk: rockchip: Support MMC clocks in GRF region
Date: Mon, 05 May 2025 23:39:05 +0200
Message-ID: <2737556.Isy0gbHreE@diego>
In-Reply-To: <20250417143647.43860-3-ziyao@disroot.org>
References: <20250417143647.43860-1-ziyao@disroot.org>
 <20250417143647.43860-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143915_155862_F0CF2B95 
X-CRM114-Status: GOOD (  16.20  )
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

Hi,

Am Donnerstag, 17. April 2025, 16:36:44 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Yao Zi:
> Registers of MMC drive/sample clocks in Rockchip RV1106 and RK3528
> locate in GRF regions. Adjust MMC clock code to support register
> operations through regmap. Also add a helper to ease registration of GRF
> clocks.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index cbf93ea119a9..ce2f3323d84e 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -590,6 +590,7 @@ void rockchip_clk_register_branches(struct rockchip_c=
lk_provider *ctx,
>  				list->name,
>  				list->parent_names, list->num_parents,
>  				ctx->reg_base + list->muxdiv_offset,
> +				NULL, 0,
>  				list->div_shift
>  			);
>  			break;
> @@ -619,6 +620,11 @@ void rockchip_clk_register_branches(struct rockchip_=
clk_provider *ctx,
>  			break;
>  		case branch_linked_gate:
>  			/* must be registered late, fall-through for error message */
> +		case branch_mmc_grf:
> +			/*
> +			 * must be registered through rockchip_clk_register_grf_branches,
> +			 * fall-through for error message
> +			 */
>  			break;

please don't create separate structures for specific clock-types.
Being able to "just define" clock branches is helpful and starting
to require separate blocks just causes issues down the road.

=46or handling multiple GRF sources, I just merged Nicolas' patches for
handling auxiliary GRFs [0] and GRF-gate clock type [1] .

So ideally, please base off from there.

Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D70a114daf2077472e58b3cac23ba8998e35352f4
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3De277168cabe9fd99e647f5dad0bc846d5d6b0093



