Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D64D58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lKibSiaGto2/xLCXJNRfo8lYxMCoZ0ZsNgmqb7Kzbys=; b=uSbt8pqXr6Jbj8JfEwTh5NPVbR
	QbcrykeaKeXHP0pRPoq13MeW5989gBbZyKBhdOgqcHd9tKlabD6tf3MLN6rfrewatPbJHMlTqWkH5
	ut3ZjT8PZ2eo/8AggjY2nAe3b3uAcN61rkWGqJpK00zf79G4hnauHVhBtSxAqMS6JxAgWjnBhZ3Y0
	B34tkKL7yJ0n32KqWTNumO0cP76a4IHKlhJnSokHPPiVp4xZ3Ba9hT1B3X0YAiPy+5yf9fBJfSN0H
	Oapmnbt2Etcr3p8yOGVu5ztqrUIhdim7NNfC1Wc5JMaUKIYJPPsY5JtEP3j7uKQeOrEGX6FEZeFAt
	r2NQG3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nHz-000000002sj-2PIN;
	Mon, 23 Mar 2026 21:58:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nHw-000000002sI-4BAw;
	Mon, 23 Mar 2026 21:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=lKibSiaGto2/xLCXJNRfo8lYxMCoZ0ZsNgmqb7Kzbys=; b=fYnCXAOY8tEejWvoaP03EBSdXk
	Ih63aNmwLCAvfAx12lE8ySuBFghzfiDa0ujd5Q+Splhfb8oHZraD3qqK/xiYKiXxEXxqHFeKPmgiA
	wa9R64Dh6sXQKUUQZ4Ls6p1gb9ZhyyDbiJ0rrzW+nLAV8sBikWZAsEnVEY+Fe/3aqbvMXG4wy+Ly1
	zd0KIX0mi4Msx05CmgIQWyxXqYMbJWLpUauof2nRPhOBXObZlu9foUf+mnh584PYAItbp4rpRko5y
	tTw9V6HwgaG+cp5M8W2xfp+7JZljbfdE1hTdTrPyKWgaKVZ9Fp9H6cA1HyUv8KpMPtK934NxDBZhE
	D/F4aSHg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] Rockchip dts fixes for 7.0 #1
Date: Mon, 23 Mar 2026 22:58:16 +0100
Message-ID: <5057236.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_145821_063780_A7C47EB3 
X-CRM114-Status: UNSURE (   7.64  )
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

Hi SoC maintainers,

As requested by Krzysztof, here is a more condensed PR.

Changes in v2 are that I dropped fixes for dt-schema errors and fixes
for commits introduced not closesly to the current release. These have
been moved to the current branches.

The Pinebook regression fix actually also is for a commit from august
last year, but fixes an actively tracked regression, so maybe carries
a bit more weight.


Please pull

Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1-v2

for you to fetch changes up to 29d1f56c4f3001b7f547123e0a307c009ac717f8:

  Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro" (2026-02-22 23:28:06 +0100)

----------------------------------------------------------------
Revert to fix a regression that breaks Wifi support for a large part
of Pinebook Pro users (multiple Wifi chipsets).

----------------------------------------------------------------
Heiko Stuebner (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"

 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ------------------
 1 file changed, 18 deletions(-)




