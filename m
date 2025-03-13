Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C3DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK4f3dZBX11nTStRxhEpXUGBPzmaq6P/NqP3tDErr5w=; b=jLNokDyjtH5FnFaqZq4xLqvRMn
	7MBuLHeID62d5qHhNl8uPgCUDmpy2PZ26TEg9LAn+u70JN0DMHR3pyoFVsoiD8WtdkdSSEEUKdk4W
	t1YYV8WlJwKzyjxzmistighSRYAE/idN9Ybhs86WSXaMJA3p08jvqwJ+S9cYDtPqh7MHFiBZnZvc6
	Adknd4Bf2YkBwmQURh+1Tw55BDCPKpPZ00uArmFdBE1ikWB8UVPPuTj31u0jnpiDlK0lIlzhBLY8l
	PxJPSs7eL+3U4XQSwjR6EuTinNS0HOsG4rrUcCacfkrq3ap0JfNeiidrkoKFq+n8zgO5gfvi5ulgi
	LHhPnB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseDT-0000000Aaw3-12WX;
	Thu, 13 Mar 2025 08:46:59 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseAY-0000000AaVH-46S4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:44:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAQ-0000KT-Qn; Thu, 13 Mar 2025 09:43:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAP-005VQo-17;
	Thu, 13 Mar 2025 09:43:49 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAP-0003az-0x;
	Thu, 13 Mar 2025 09:43:49 +0100
Message-ID: <5824eaa53054cfd9886c6ba745bd5cd8914c26c0.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: fix double id on rk3562-cru reset
 ids
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kever.yang@rock-chips.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel test robot
	 <lkp@intel.com>
Date: Thu, 13 Mar 2025 09:43:49 +0100
In-Reply-To: <20250312215923.275625-1-heiko@sntech.de>
References: <20250312215923.275625-1-heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014359_039815_0B87CECA 
X-CRM114-Status: GOOD (  10.88  )
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

On Mi, 2025-03-12 at 22:59 +0100, Heiko Stuebner wrote:
> Id 173 was accidentially used two times for SRST_P_DDR_HWLP and
> SRST_P_DDR_PHY. This makes both resets ambiguous and also causes build
> warnings like:
>=20
> drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overwri=
tten [-Werror=3Doverride-init]
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for '=
rk3562_register_offset[173]')
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> To fix that issue give SRST_P_DDR_PHY a new and now unique id.
>=20
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503121743.0zcDf6nE-lkp@i=
ntel.com/
> Fixes: dd113c4fefc8 ("dt-bindings: clock: Add RK3562 cru")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> The original patch did go with the reset of the clock controller code
> into the clock tree, so this patch should of course also go that way.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

