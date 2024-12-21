Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1128E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 00:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hNE5UPhjkn8ZeTUEZHQdnVXgIQRoq9UgMw3fpSXcg0=; b=NngV1QGXTRuzZsSw/HUCVQUWa/
	WC+OMpoDmU00F71oI6iRxBflkRToFQklbGe1ko1EW6mEag31sttHPuNXEuIngIws1zXhGmwb2Uvyi
	jGyU9dqNrFOJIGlmuJk0NZrBzNtLLmCn2famAuMSP8Ei6859QZPWgqFlCnaVw6W0/IiCkNcKODJwU
	LkBb16ATb0fsT16jI+60BowtnEP0dc8eJU/ae48Owjd+4WSWUlkBNBFrGRYYD84gPlaQrcdmJfzba
	8qc14a0Z9MYRe05HfA1v2xxclJdNjdk0kznsodponva+r7+jxsoyZVCZ9EOula/b/putK2C7kuAZf
	z643NZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOn7S-00000006JJq-1qG1;
	Sat, 21 Dec 2024 00:13:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOn6E-00000006J8H-38rd;
	Sat, 21 Dec 2024 00:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B79A5C574B;
	Sat, 21 Dec 2024 00:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E88C4CECD;
	Sat, 21 Dec 2024 00:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734739925;
	bh=4IBe0phg97iferrFFovvNAS31kkLvAbMZCEDxAilTek=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=slkTgCBUb/3hQLRGtRweV3EBCE97GAv8DWccN37yHomXTh0UlvF7FR3rDyTpGN1qN
	 goTMuGW2hHG8gmIKSMMJ/540xe39MPew7gsmiQuiZsqLQHNQnvjcF4F6X2cLubL6wA
	 II0imeeHWxC1UtRLVtAcVGuShvdF2UJCq9Sj79IrLnFgiNjs4MxEyYWBlqMHIZ1qgA
	 7IUT1jRa9Z8U/etpIT8j+FpO8tH1VKk0PKgF8XrABfuQEevqnZHKbLKWqN3A3wuigs
	 fDPRTe0cjuo3B4sHuF5jEi9YWqvAsVM9INuQYAXXdOn8v6MIhlVF+wzS5j5161oARn
	 r91Z0aYHEDRXw==
Message-ID: <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Dec 2024 16:12:03 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_161206_879386_DA217372 
X-CRM114-Status: GOOD (  17.80  )
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

Quoting Jerome Brunet (2024-12-20 09:17:43)
> Remove the big clk_regmap tables that are used to populate the regmap
> field of clk_regmap clocks at runtime. Instead of using tables, use devres
> to allow the clocks to get the necessary regmap.
>=20
> A simpler solution would have been to use dev_get_regmap() but this would
> not work with syscon based controllers.

Why not have two init functions, one that uses the syscon approach from
the parent device? Is the typical path to not use a syscon anyway?

>=20
> This rework save a bit memory and the result is less of a maintenance
> burden.
>=20
> Unfortunately meson8b is left out for now since it is an early clock
> driver that does not have proper device support for now.

We should add a clk_hw_get_of_node() function that returns
hw->core->of_node. Then there can be a similar function that looks at
the of_node of a clk registered with of_clk_hw_register() and tries to
find the regmap either with
syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
node for the clk.

TL;DR: Don't use devres.

>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/a1-peripherals.c | 165 +-------------
>  drivers/clk/meson/a1-pll.c         |  18 +-
>  drivers/clk/meson/axg-aoclk.c      |  22 --
>  drivers/clk/meson/axg-audio.c      | 435 +------------------------------=
------
>  drivers/clk/meson/axg.c            | 131 -----------
>  drivers/clk/meson/c3-peripherals.c | 212 +-----------------
>  drivers/clk/meson/c3-pll.c         |  34 +--
>  drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
>  drivers/clk/meson/clk-dualdiv.c    |   2 +
>  drivers/clk/meson/clk-mpll.c       |   6 +
>  drivers/clk/meson/clk-phase.c      |  11 +
>  drivers/clk/meson/clk-pll.c        |   7 +
>  drivers/clk/meson/clk-regmap.c     |  88 ++++++++
>  drivers/clk/meson/clk-regmap.h     |   7 +
>  drivers/clk/meson/g12a-aoclk.c     |  34 ---
>  drivers/clk/meson/g12a.c           | 261 ----------------------
>  drivers/clk/meson/gxbb-aoclk.c     |  19 --
>  drivers/clk/meson/gxbb.c           | 393 -------------------------------=
--
>  drivers/clk/meson/meson-aoclk.c    |   7 +-
>  drivers/clk/meson/meson-aoclk.h    |   2 -
>  drivers/clk/meson/meson-eeclk.c    |   6 +-
>  drivers/clk/meson/meson-eeclk.h    |   2 -
>  drivers/clk/meson/meson8-ddr.c     |  11 +-
>  drivers/clk/meson/s4-peripherals.c | 231 +-------------------
>  drivers/clk/meson/s4-pll.c         |  33 +--
>  drivers/clk/meson/sclk-div.c       |   5 +
>  drivers/clk/meson/vclk.c           |   2 +
>  drivers/clk/meson/vid-pll-div.c    |   1 +
>  28 files changed, 165 insertions(+), 1981 deletions(-)

It would be more focused if you split the patch into two. One that
installs the init clk_op and implements the logic to hook up the regmap
and one that removes the arrays that are no longer used.

