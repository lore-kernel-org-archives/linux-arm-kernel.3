Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6253BCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZ7ADGFgnAwZfafO2JUodzSZZilfqJT8n7SBJm89wNk=; b=hBvBUieGalzjBTIp9+JggioQ3N
	vhiN9sGls6+oaOftoQOMhjVZ9o7m6g9WKQ5Vi93A4JpGlv4oGMOiuKJy4AgU9OiUeIYjEiH93BsMI
	GCQ6mZ53HTlKEfxbgyxKAm2C5hmXJLawcheOfArmcjHuTnirVOsALtBbVai1y//Tk5tSlh9h0mZ/W
	Le8FQFiUw3Xo65QJeCurbvfTtlt1xUXBDm/eYC5HFznPs9T6wq4YsbiuxyTT5hVJ23FkzErdYU1iW
	cftsYV26q9oz0UYieee+WVwltO1TqA8Ur5oTSubvhV85nFIc4/wCDspKCxO8x/3RLoPLiVJlqZRIf
	CfYIj/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yW-00000008rs2-10va;
	Tue, 09 Sep 2025 17:17:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxoD-00000007BxX-1lmN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zZ7ADGFgnAwZfafO2JUodzSZZilfqJT8n7SBJm89wNk=; b=mk/wvg0a0yuXY15yC0ROqz+TqB
	k4U+7c4HappQzKDL+GFKJnlYiJdz52zZornV8UKrlHoCIBxwrdWfpaN3kDhwjBZk5xvdgX2BwvoqM
	E7ChTwu4dZEnmMJs+tkoU/ELVMcuQmkhDyhpxMfREYrlh9kt3JTmwv2JMqwzTNZEoO5Zxt7a9+Tqi
	97kuig3Bdpn9UxLyp8MhEf7LBk8auxlgPqxL7lf50lhIj1+SxzjYCKoCI4pHlET81p+fMEr8HnEXR
	In4dXmZ2F8P0jiCtEtcyYzFFZVb0EHonkPmaazx9lt/491sHVhPzDZcTNrrOAHRsHbI+HxcEZUdMv
	4CYrjC4g==;
Received: from i53875b3d.versanet.de ([83.135.91.61] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvxnv-0001FU-6Y; Tue, 09 Sep 2025 14:50:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebin Francis <sebin.francis@ti.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@oss.nxp.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] pmdomain: rockchip: Fix regulator dependency with
 GENPD_FLAG_NO_STAY_ON
Date: Tue, 09 Sep 2025 14:50:34 +0200
Message-ID: <3633992.V25eIC5XRa@diego>
In-Reply-To: <20250909111130.132976-3-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <20250909111130.132976-3-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_055053_460556_CA370285 
X-CRM114-Status: GOOD (  13.34  )
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

Am Dienstag, 9. September 2025, 13:11:21 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Ulf Hansson:
> The deferred regulator retrieval for Rockchip PM domains are causing some
> weird dependencies. More precisely, if the power-domain is powered-on from
> the HW perspective, its corresponding regulator must not be powered-off v=
ia
> regulator_init_complete(), which is a late_initcall_sync.
>=20
> Even on platforms that don't have the domain-supply regulator specified f=
or
> the power-domain provider, may suffer from these problems.
>=20
> More precisely, things just happen to work before, because
> genpd_power_off_unused() (also a late_initcall_sync) managed to power-off
> the PM domain before regulator_init_complete() powered-off the regulator.
>=20
> Ideally this fragile dependency must be fixed properly for the Rockchip PM
> domains, but until then, let's fallback to the previous behaviour by using
> the GENPD_FLAG_NO_STAY_ON flag.
>=20
> Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-=
c4a0c9daeb00@collabora.com/
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

NPU on rk3588 now again correctly gets its supplying regulator and
running said npu does not end up in a kernel panic :-)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Heiko Stuebner <heiko@sntech.de>



