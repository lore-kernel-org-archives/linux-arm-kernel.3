Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DFC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldeR0B4GHt3b5GmwgKmYffkbyfoBxCcoI2N1ceTEtE0=; b=FRr+oVq6aZcQng85mB+85J6VCm
	uyu5vd4Zf/BPCMjrdTqWVm2gg0M/VKmZKmkJiipBFZlndI/licpyadgtrN0Fi4dacpsRIaoHqPUyl
	RbQA+Qx8VjqRJlqqGOkrE6EVxS74E501Ycyu3ucLtDafr1cq+dt7MowBcwXECQzWPU8zLYfhGIsiC
	u7tDP9K+zSdRr34WU8UK4iWbfEdXo3VrwMB0Hl1sLBpSNh4qg5dFTIMGqopFvCRb7dNs6HYbSuGHQ
	h95uFZ3DZSJcJoVjrSDQZ53LYOfn2LTdBtLG2LtJin+jVMIZsGbyPEqcdPvVN4Bp9Gb1MKoAVrXTy
	9uS6p4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TLW-00000006l0p-0FhK;
	Tue, 15 Sep 2026 13:37:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TLS-00000006kyp-2lbC;
	Tue, 15 Sep 2026 13:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ldeR0B4GHt3b5GmwgKmYffkbyfoBxCcoI2N1ceTEtE0=; b=ifzJbiZ4sUYioCzujeRclD++2W
	raXXLxleGWSeduKUqRUmGxuy3tTqcS8Qniii5CeOs1hL0kjzRBxp6kMarv4OfAnmmhkeOZeBUKAW3
	MPQ+9Ptv/l4M5gFB2z6TPoAmk90ppF9gkMmh3m/Ixtpll1VP9lZKlJhc+HBpFCgDwi7RRseAvQAGa
	gmOPUlCwwuS7EQfDLMepixFqlRy/8bfcda/AKSF9gAMXDWHdEnJ4ctDEHADVPXIMBYAv6GPizIX1d
	ycdqxxV0hVVvWHrRquQQVhnny32EqSoOo3IEet5eNFvLFZnokuGEgRM+mPSO0vCkNgIiw5jqAhOed
	vHNXrz1g==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 0/3] DSI Controller improvements for Rockchip platforms
Date: Tue, 15 Sep 2026 15:36:47 +0200
Message-ID: <3800544.yaVYbkx8dN@diego>
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_063710_760663_6A9C5758 
X-CRM114-Status: GOOD (  12.45  )
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

Am Montag, 14. September 2026, 03:33:28 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> This series is dedicated to enhancing the DSI controller and PHY timing
> interaction, refining the lane rate calculation, and addressing the
> associated hardware limitations.


Took me a bit to finally test all the different variants for a display
that shows strange behaviour. Sorry this gets a bit longer.


The display in question is the ltk050h3148w [0], display in portrait
orientation.

Ever since commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use
pixel clock rate to calculate lbcc") [1] and the subsequent fix in commit
93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for
burst mode") [2], that display has its output shifted about 20 pixels to
the right, with the line then continuing on the next display line.

We have this display running on all the Theobroma-System modules, so there
is a lot of variant data :-) .

Your series actually fixed the PX30 part of that shifted output, but for
the RK3399 the results are sort of mixed:


What was confusing me was that in the Rockchip vendor kernel, _all_ DSI
variants use the standard px30 phy settings? The whole original lookup
table seems to be gone? And that replicating that setting actually fixes
the shifted output on RK3399 too?


RK3399:
	original:
		shifted
		mode-clock 59400, target_mbps 450

	patches 1+2:
		shifted
		mode-clock 59400, target_mbps 450

	patch 3:
		blank disiplay
		mode-clock 59400, target_mbps 400

	use static px30 phy with patch3:
		image is compressed in height and displayed two times one below the other
		image is _not_ shifted anymore (so left+right alignment are correct)
		mode-clock 59400, target_mbps 400
=09
	use static px30 phy without patch3:
		image is _not_ shifted anymore
		output is correct
		mode-clock 59400, target_mbps 450


PX30:
	original
		shifted
		mode-clock 59556, target_mbps 450

	patches 1+2:
		output is correct
		image is _not_ shifted anymore (so left+right alignment are correct)
		mode-clock 59556, target_mbps 450

	patch 3:
		output is still correct
		mode-clock 59556, target_mbps 400

RK3588 (DSI2) for reference:
	output is correct
	mode-clock 59756, lane_mbps 398


Do you have any insight, what could go wrong here?

I'll apply patches 1+2 as they're correct, but will keep patch3 out
for now.

Also Sashiko seems to still be unhappy with patch3.


Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c#n299
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dac87d23694f44af44a98d21dd77016f2756b6b1b
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D93e82bb4de0196c4caeca1d8a6eef67863981d8f




