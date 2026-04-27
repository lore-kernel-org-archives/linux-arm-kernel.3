Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9BFFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE986gg6nM72Izjx5bFVwuKM9D3x70M7dapwBTjDcY4=; b=l80v9mzygkfaNBxN+kH3nbYtcT
	mZ16DE8osSW/oJ58D94blfLYYIvq5eyoN1/N9HIa/3MKnwd6QPVxYf8BuvT++5U90qMeBrevlD361
	QPxGy22+S5NGm8NrncBlvbnoxIH8wKmgo8mK8MP+twaiZfyW7mLE2Ly78pz587uXrtt5dthBm1Ak7
	jPVhKTIQqfe6xwS2IXvUhSZmPKOdg8qY75fWlpwMR1/KvyBy9oEg4UuvmuHfwAtU8DVX42bvwMPu/
	kHpoTKWQLRuYtnoA9NxMjp5jkYfa9GJRViMjU3/zbPi8IYIS+8/+PkKRwaxVVYR1uge5pUa9uEwHh
	wy8cNvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL0N-0000000GtJS-2KpA;
	Mon, 27 Apr 2026 12:24:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKzt-0000000Gt5j-0GAE;
	Mon, 27 Apr 2026 12:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uE986gg6nM72Izjx5bFVwuKM9D3x70M7dapwBTjDcY4=; b=bB+zpJOdC0HNgQrSiDejgSn50j
	iWqMaJluZTxDFGPRSsmoFr/m07oe1sTBf9PpDNwiUw6hDpqgHGlHNcUrwr+T+d4qk0DEG2W/JjUuY
	4Mj+bP2ZixSzPB4MC9DiEXfqIfnkrPp84Ts4oyhja1J5GIwfsjyEpLHIPa8OV36sCtR2pKoahYZak
	In3s0WMe1lKhfVfbPhQRLPGOuFxOq7Pv68r0wIpSreg8taKf8EQt/r+6zkyXJVd5UUz0/otWZumLD
	mZ1j7+gCPVgdnwmYkSOYWeJRg+5mhmdXQEI1+RWMTr37EGyi6gdFIRwR6byQKvzcjcFiy5OGpu0uf
	wyaDGvqQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Gray Huang <gray.huang@wesion.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com
Subject: Re: (subset) [PATCH 0/6] arm64: dts: rockchip: Add peripheral support for Khadas Edge 2L
Date: Mon, 27 Apr 2026 14:23:20 +0200
Message-ID: <177729258237.1866089.1613069864896514625.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325054614.1497147-1-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052333_135974_9659316D 
X-CRM114-Status: GOOD (  11.36  )
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


On Wed, 25 Mar 2026 13:46:08 +0800, Gray Huang wrote:
> This patch series adds support for several key peripherals to the
> Khadas Edge 2L board, which is based on the Rockchip RK3576 SoC.
> 
> These patches build upon the basic board support that was previously
> applied to the rockchip tree. This series enables essential
> functionalities including power management, wireless connectivity,
> graphics, display output, and USB support.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
      commit: 7cd8b37304be367106a02d4d902294e9bea3f45d
[3/6] arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
      commit: 6d72e0d07145449a33678624436c73da09873c43
[4/6] arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
      commit: e9ec83fbc3d46b39fe92a0cbda4795ece30717f5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

