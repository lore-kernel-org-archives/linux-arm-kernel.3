Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D24CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 21:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ez8fFYJHo+p/fvCYM7xHQav/uAoCjVVTgRtYyWWnalo=; b=2Sxy/1E5RRsE5LZN4TeFflySyF
	B+gU7cNdbB9oAGlWjvrtfbU6CE+XnKVVakEz2kBUqVxKGy8dTyuaXHU2zI+f95X266On9TS0XUioW
	E3eARcYXxSmd3vOqIdweuIRM3m019imW42FV1E9JAWiEysqI4OnyE0FrGv20T+zVTWBRYxtfNaNte
	RrOyslHmleMa92vXbPsdPHNzmfAvJ860WJd5Z74SSvzB8rgCmqzI78vtrnQ8ld5nRvSQVPdiZ9Z6M
	lrJQ3p6sf1eoDVNgSIAD600xpy0QsxZ8ZWdYDlIjPTBmKIi2MNFnqiQ0Fy9woj+2RZURdwFvp1w33
	rqiJmcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRz9M-00000002yNj-28Ks;
	Tue, 26 May 2026 21:17:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRz9J-00000002yMv-3FS7;
	Tue, 26 May 2026 21:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=ez8fFYJHo+p/fvCYM7xHQav/uAoCjVVTgRtYyWWnalo=; b=x3+eEEiFUkMbB1GyVj297RuTLm
	sKDuJrenO565G2tj1/XhcIn1GLNitaTXRIAp2O+VOLMnI1Sjbx5PFH6G31gO7jjoN6kAfUnBx1+OR
	n/h022bMwUTv8XZQTy6jL2VRuoTMWVJEd+LYLA+V8xqmS+Dp4m7CrMOGd91YCflt/vum1xA6e7FQr
	1wErswHFTC7m5Z8LPkmygreBbEQko4QR2yHQz5k7BcpWuNLZQFichghPAJIUg68Q0kIZSYy+kHuao
	z++7ACFmxvW53cEVZ9zjxg19S/538K3UJ5gutcNcD0cS83KeVS4BG+9/6Jlob0WxyaNMyxudOTh0q
	p50zMWjw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.2 #1
Date: Tue, 26 May 2026 23:17:09 +0200
Message-ID: <14415443.zAa99ISigo@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_141717_919677_E07E5783 
X-CRM114-Status: UNSURE (   8.78  )
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

Hi soc maintainers,

please find below Rockchip ARM32 DT changes for the merge-window for 7.2 .


Please pull.
Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.2-rockchip-dts32

for you to fetch changes up to 98461edf564a35ee00a97a64f5463eaece586546:

  ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware (2026-05-05 19:26:18 +0200)

----------------------------------------------------------------
Cleanups for RK3288-based ChromeOS platform.

----------------------------------------------------------------
Brian Norris (1):
      ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware

Fabio Estevam (1):
      ARM: dts: rockchip: Remove invalid properies from rk3288-veyron-analog-audio

 arch/arm/boot/dts/rockchip/rk3288-veyron-analog-audio.dtsi | 2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi              | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)




