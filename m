Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26299C636C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6aXQXpI+hIYWNJc19FQH/iLzUzzb2eomDnK90HQ/As=; b=QOsszTW1dRMG42U6ZXwHy/ejVs
	2FlmHhMfRny5I5rQPnbJiLechipQIOgazhplp/pS8dfHLpXEfzTCRY4lV1BQ9NwkyI9TByHn5ZyA6
	dbAP3glKxdnlxBlYykNSC51Y8ST7YY3P7F3mn+I90tkm4ldzJ+EyE1GIBYtsJgNa3h9U1WmtMUa3n
	+Eh+v0emsJWd8cEacifSVAaLKCN8AiWC5CoksDvg+0Pbva3cHC2MrpsUygDF87EqRMhZ7ddl3u4kU
	mQsTo4JSrrKxQceSzcmhHAcKi8yv8Ti9A3UlwNQbjjWWVm+t0IJE3Vhiz6XCvBa3PoGvaIER/+lwh
	kBTNgYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI7P-0000000H0Lv-2Aoo;
	Sun, 22 Feb 2026 22:40:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI77-0000000H05h-3Ptn;
	Sun, 22 Feb 2026 22:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t6aXQXpI+hIYWNJc19FQH/iLzUzzb2eomDnK90HQ/As=; b=BNaj6p4CR2WaCYApfywLfTaW4S
	dDJKMNweDwgouidS8kWrzMJcqrtRa8J7pZZEtMtR+jzjLYEf6IVHsQIdGwgbOpir2pEJbccg9XQNs
	usGgsg0x1cZyxbf9Un177Cn7HiVkH6Gt5FHYOm6b6/bSygzCL7MEZGnbudK1aadEiVv0eqAM14Ycw
	rmLAFqZV3XBWo4Y3oFCb/TaGVPxkX/hX4Fv4V8ycMl4BPogmTn22gZ1+RTcZC8+vaqbLDgdm9Da7+
	jMsuMIhf97N0a6aCdUgsucH7dHTmSfuABV2jpS9bdzwJOG7nK3+3SXBGrwfE4Mkt0tAQe77uJ913l
	2HSScSyA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI74-00000004DbR-1xhN;
	Sun, 22 Feb 2026 22:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t6aXQXpI+hIYWNJc19FQH/iLzUzzb2eomDnK90HQ/As=; b=ABegtPgLMfWzF/O2dxbd08oCG1
	OUidPXyqteouqHDzW+i0cTKhoQoeLbCykwEb2iZrP0RpJJgGaMYG+9S+FUlkyuTeoAbnOhfAUVwSr
	h97scWnztvIrnWo/Wi1z62DjAp2OoJPuCRHVXeoDsABsBxOXNjd8C9yKCp4vAnvNWlpvmNAvkveJG
	ezl8OPLal7svSL7aZpyVd/l9TSNpDQp9QZzFn+veJ7Il5vWgNYUGc/q1GIqI8nXJAAoglN8FpPQgC
	xgotDkSJrfPZvDkjTItHgvQsqITADOiUaRcQ/zqCEOO6ul9R5E0Pkm3U/hK19j6DBzyr0yoPzkw4h
	Shu06cFw==;
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v3 0/5] Add DisplayPort support for rk3576
Date: Sun, 22 Feb 2026 23:39:02 +0100
Message-ID: <177179992291.1861430.1386382709600780109.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_223942_793844_F7CCB528 
X-CRM114-Status: GOOD (  12.66  )
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


On Fri, 06 Feb 2026 09:04:10 +0800, Andy Yan wrote:
> The DisplayPort found on RK3576 is very similar to that of RK3588,
> but work in dual pixel mode and support for MST.
> 
> This patch series aims to add basic display output, not include audio
> and MST, which will be the work for the next stage.
> 
> Tested with 2 lane standard DP port and USB-C Alt mode output now.
> For those who want to give it a try, I have a reference branch here[0].
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: rockchip: Add DisplayPort dt node for rk3576
      commit: 753ed4fa4e815669a025e08f5101ce0d91f46c8a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

