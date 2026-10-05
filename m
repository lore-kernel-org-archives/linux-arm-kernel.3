Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B429CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWSjVCVfhYPrZE0ETR+lrH3OHG2RwgKAy0qCp+LBWOw=; b=n0qTZgLY1BwNRWihfRowABQH1X
	9Sh2SDU9yCFh6iKaHfLFubNfHLlRBtazyVZx1W+bAsZe58uBJSUoTTKwyAgWJvit7QSSJMuNPeVO/
	7IXC/wNMLryjG8j0T6KTVTyG2WODsOpS/JuYsoRO5LDFcdUyEELjb+0a6O+u3n+vU0BlvqOvim95g
	Bmt/SHnMziDYTHWCzWH/TN5TgPdmmN7y9R7dVVLxfmE851AKihFdNLPsZSqB0qenj49Xf68UWmpVI
	hboC6dQx4466BFTuQhwsKa7kif1WAi2ppQTxZXMb6AQVLr9tploq1jadPXEryw0BDEwXo4WOG8Gph
	FwXe5OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn82-0000000Gylc-2MUw;
	Mon, 05 Oct 2026 18:09:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDn7x-0000000Gyky-16ie;
	Mon, 05 Oct 2026 18:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KWSjVCVfhYPrZE0ETR+lrH3OHG2RwgKAy0qCp+LBWOw=; b=wh8lZYdIq/+MLr9OmtxrVg5feF
	wI8VSnydL3P+HMY/5BjwvsD2lnnS06rSgU2W8euhhCDVFrefnQ5PCU32v/O7zKxhLGsOt2R6qFyxh
	LwRR5LelPnF25xPtDCvLom2b2ER2TWO0iUs08pyds84ppCK7xdd2KEzTnTM34xe4nT9DVQAdFJkLA
	gMqrn4CzaLBO+4naoyBcls4HYaJ6wiUkERUaXynfy8M6hRPA5FMdGM5rVR9NNB4e3JWF2XLJqlKyB
	jFb2VWcrHXvg4e/81tr2Hl1rjA08pjLEgByzNAMA0U3qSfrxPBv/IvsQXd/Tr//wBAWhOOf5jImut
	+joamz0g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI CSI-2 DPHYs
Date: Mon,  5 Oct 2026 20:09:18 +0200
Message-ID: <179122375594.3298998.10291240183600049512.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_110929_641681_C73A0529 
X-CRM114-Status: GOOD (  11.00  )
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


On Tue, 15 Sep 2026 12:42:45 +0200, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
> supported using the existing phy-rockchip-inno-csidphy driver.
> 
> This patch series adds support for this variant.
> 
> As you may have guessed, this is part of the efforts to bring the
> support for the RK3576 camera pipeline (VICAP) mainline.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      commit: 21792937b01b9c36c9a1c4d039f3e1883856157c
[4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
      commit: e68360ded44be19051df2cb7e121ba7afd52035e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

