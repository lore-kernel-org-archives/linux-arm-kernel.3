Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC92C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFdojKG4OcKLhpzvaDye7ddpJ8FdYJvevewDuk/eG/U=; b=PjAPZjgt+xQyCQBzGgets5oszf
	B2Kh53jAb6XMINOPsm1AAVoqlo8CYlD9qu3EhRgpKiPI7dybCCko2gOp/Iaf/pE9D8X30A0UjCDnS
	ZUNFSPll62ZPcgHnVdZ5xZZfq6Q8EQduOWkFxBJfq8rcDI9p7Zif7VB5OBmcTZ8VrlMa5W5NSYPi/
	c7enxnQldDK/lePW6aZiTzqL53HFHS9gq33H8bAeCWvKsF0Rt2SaBzkqekKCeIK5pibMXXT30hRCN
	s+/c9CnAUBm6UPj75fewZeAJCa0JJtNhzdVsmGzen+sabcmhfXPa5mVHCmFsTxjdcHQurzA0X3txC
	RhytVa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzq-0000000CTeB-0j7Q;
	Thu, 03 Jul 2025 20:57:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM0L-0000000Bqyw-2njP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1207561450;
	Thu,  3 Jul 2025 15:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B848C4CEEE;
	Thu,  3 Jul 2025 15:37:40 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 418D15FA91;
	Thu,  3 Jul 2025 23:37:38 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl
 fixes
Message-Id: <175155705824.1106539.17200783567865554543.b4-ty@csie.org>
Date: Thu, 03 Jul 2025 23:37:38 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 01 Jul 2025 22:11:19 +0200, Paul Kocialkowski wrote:
> This is a mixed-bag of minor fixes for V3s clocks and pinctrl.
> 
> The last patch is a weak attempt at accomodating using both the display
> engine and tcon along with the camera subsystem. The main issue is that
> the tcon and de need to have the same clock parent, which may not be
> the case depending on the pixel rate. Bringing the de block to the same
> clock rate as the csi block helps in some cases.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.16 in local tree, thanks!

[2/5] clk: sunxi-ng: v3s: Fix CSI SCLK clock name
      commit: f45b2949b1a235881255132a119b8cc8c3738bd5
[3/5] clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
      commit: 2b73328629396d32e41ca1f023653b07abf2b42f
[4/5] clk: sunxi-ng: v3s: Fix TCON clock parents
      commit: 01fdcbc7e5a56c9cba521e0f237cb5c3fd162432

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


