Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4535CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOZSAhMRoAi3ivFm/RUgbGXpjIfGUXs3ICM+R1IZIJE=; b=oEQVRF2GbxyhiQe/Xa0/Z5JfDh
	LWEJ+zEU10w7UeaPOWDa5p34uX4yMypPBUOWQJ6D/YuPLyvruENQ7Qg/KjA2ffgphuQ+DIcve+4pe
	op+otXU34bOPHmFF1Zp87xgV1w7GSigZohaUnPlywvKafDI4KPW3+QiM1gVSGFM/XV+m/ZzG2hIF/
	gcD9DT5rMONe6mfZEX+c+orkaAqC0GS545p26rQS6erox38ywcUbfUDLAVzmaJYJVrN3BisMaEQHb
	Q1TLyiV7tWu1TCTiaPmk9Oe8qRnvMf2LoE7IPVBPYxXuty40kfnNTilDcVkimvGlzwoPUKlNpk/IL
	jreEY4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQO-0000000H90T-3lGi;
	Tue, 14 Oct 2025 18:07:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQF-0000000H8sN-49ak;
	Tue, 14 Oct 2025 18:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TOZSAhMRoAi3ivFm/RUgbGXpjIfGUXs3ICM+R1IZIJE=; b=Z9OoWeecwoNEZkO2ZI1cvN3ctl
	AHOBscQGHPybThXJQ1AGvFyJSuYIRJtkxV9QWlhGNG82J2GsJSf2uidys1gK/9oYsIDpDGu4cQv/p
	N2spY0NZZcZSXEsx9IbkVbuCjZqvxb1mgq6PO91TT5J7KsKCUVNyKWd/cZw5ODK22KaQs8VxOaS75
	Jb8Oez7VGFEadXfI1xn4sTxqYARkJa29vtwhHE1R8a7UZZPsuoFVyvq80nZhyiD8x1YcynwueslpC
	jYjHB15kOW3sDEGkPrf6cfpoH+LQL1s+NoqjvLxHMs9R5Et9yCUSCHYeZbp8Qk+1TKR6eQUoS63rr
	wV2xiR9A==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQ9-0001Gj-RG; Tue, 14 Oct 2025 20:06:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] drm/rockchip: Add MIPI DSI support for RK3368
Date: Tue, 14 Oct 2025 20:06:33 +0200
Message-ID: <176046473165.1662867.3389597341632636891.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110656_045007_BEC2D947 
X-CRM114-Status: GOOD (  12.43  )
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


On Fri, 05 Sep 2025 10:56:24 +0800, WeiHao Li wrote:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding.
> 
> Key changes:
>  - Update dw-mipi-dsi-rockchip driver to preperly handle RK3368 dsi
>    initialization.
>  - Add missing lut_size of vop_data for RK3368.
>  - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>    which is required for enabling the 24MHz reference clock.
>  - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>    and register mappings.
>  - Add dt-bindings document.
> 
> [...]

Applied, thanks!

[5/8] arm64: dts: rockchip: Add display subsystem for RK3368
      commit: ef06b5ddee1e1288e51e8d961947d1b16156db0c
[6/8] arm64: dts: rockchip: Add D-PHY for RK3368
      commit: d62e2ad29b815509291b6a07787ed51b52e2b4d5
[7/8] arm64: dts: rockchip: Add DSI for RK3368
      commit: 5023d0cd61831acd6e88496f5f7867a18a217a74

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

