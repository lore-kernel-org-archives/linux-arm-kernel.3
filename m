Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3464BC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoqq1t7wo5rd6IE4QW2AeY1PA9dd7LzEhkBVOmAfXAQ=; b=qSScwz57gZSvYQtGJvbaTOZKRm
	F9sHbvAlFSuOpCDKVttuzEhrzK3p3ugHugfFMZYFeZoTKF272vAhXgD0T/Mes0TbFpXvBYqUnFPpe
	rpq+vofsj+FPGTd9ryg6iV3NcVctq6Lq1ykuDSyGGov9o8zQIWBoH8h4VlI1jiKLz+553jaQZblsu
	9rF6u2ltH+V8T4JgSF6iSQ6ktY4QP+PkKBZXN/wBTBxWZuoBsbAKyHVKYagey/GiRrWsJ5xjChrvH
	u8LsoFkKphtR5WaiK0Sj1H0A+FH8xxQv8sxXb7MZXMXkA4GdUVvu5zsT+7wj3QVJ5Zm+CmxcI0VFz
	Urx0zMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPNk-0000000AP0S-0X84;
	Thu, 30 Jul 2026 11:57:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPNh-0000000AOz4-2MUY;
	Thu, 30 Jul 2026 11:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uoqq1t7wo5rd6IE4QW2AeY1PA9dd7LzEhkBVOmAfXAQ=; b=IJ9KA5kaKVbh9kAGoIuAs0737n
	9KwbWbh80SbvMTcZZeuiWrY0drRB52Sgl//jlu2Sq+NI5ELjBO21p78aAq+1Pr58IU/KB8Q6eOtFj
	yxp2ra/AEeBbAiPZBvSb2KdgPQN5fSN26n08OXX+KjgKyLb0cG/YJqxuSyBCCBWrYRhBrrqwJJLEA
	deYS0ROJtc6Yma+esHRqKQUuV2qbTQgATAUCFgM94YQJik1RQjeu3LtA9HexaCd3xfkyl9myj0WtQ
	9ggGAkSFC8czPcuutPi0cb9P1Tn//427Bip3RojIlPsQwJxR58QPCRsXmlFK3dklWgzegwMUiHbTy
	WTCwYcUA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v10 00/11] Add eDP support for RK3576
Date: Thu, 30 Jul 2026 13:56:17 +0200
Message-ID: <2154821.UkFFEUeh36@diego>
In-Reply-To: <20260601065100.1103873-1-damon.ding@rock-chips.com>
References: <20260601065100.1103873-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_045657_660548_0C9E6E0A 
X-CRM114-Status: UNSURE (   8.62  )
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

Am Montag, 1. Juni 2026, 08:50:49 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Damon Ding:
> Patch 1-5 are to add missing clock "hclk" for RK3588 eDP nodes.
> Patch 6 is to use automatic cleanup to fix OF node reference leak
>         reported by Sashiko.
> Patch 7-8 are to add the RK3576 eDP node.
> Patch 9-11 are to support the RK3576 Analogix DP controller.

Not sure what happened, but I don't see an applied mail about the DTS
patches (3+4+8) in my own mail archive, nor on lore.

Nevertheless I did apply them to my dts64 branch [0]  on july the 24th as
[03/11] ede2ee37f0a445cacbf24760f53befa10f64994a
[04/11] 09820811c549ee2c408defe36b210b13c7a85fcf
[08/11] a41687b89005f50909e59130a4c0b08e82996739


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/log/?h=3Dv7.3-armsoc/dts64



