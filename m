Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7EC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79u0OVf8LkWKmm3Wdou6FM0hujmZjDHVeYn1Q2NENsw=; b=0nm642hbajAt3BW9glK4dbJuqk
	4TRZi7/PbAn/MCYnuTMK1GQRXjdtTyx9es9uqcHBXkdiqBNgKDEEQaLT1QFQ0VcA4h2WCiXKEdZsM
	mIiWrozm5tMQL+89sBRz2LBMXoZ9xrfRCmxOp7Omo5RbZLNXY1aS/cep7ZD9IdjMGC1H7rWakdGSC
	Zf4aJR98sToehPlgWbpSJ0YTq6H6e3RPHRyLuJa/2x6Stxou7wLW1vVSjJzZTSanAvWC+5pPL3psq
	D68ItTPrukF0EQOZZvAQAfc3zoi8VRy0uLec1aQqwD3ds1aQBVncdPzCWguNFHbK0xYnyrt02R/HT
	tUot/wYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBrPK-00000006oEU-0Euo;
	Mon, 05 May 2025 08:42:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr9u-00000006mSX-3JNC;
	Mon, 05 May 2025 08:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=79u0OVf8LkWKmm3Wdou6FM0hujmZjDHVeYn1Q2NENsw=; b=EqsgzOBIrGjPuFoBjKNtkB308w
	VTwCJi+SJq3zdiiMnB0g/cGN/OfXfz5oX/LxhKDV5Aqw6BGKKn/omiK9PJtN6WdV0rhjCj+gAatKr
	xSiyKBYAagXWW4JtDEWQf55eutefx2YZ5YLRuA6tSsJv6+C1pEzMk+bgCzc0hTfVXmKfz0OoTbN7f
	+0r5DekvMq0MYaohIUjW9LY0b3qwI+V2i2/nvzDvJ232eeDzPtqWrHGF1cJd25OpbsbVRYedbyNOL
	cFk9IVPb6nbOsGrDEm+n87CAg0vkwSLZCRPdirkOIkn0Izc2B+crQtTpEtezTcm/G4wm+Cy7xC2ap
	s712kSyQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9g-0001Ho-BB; Mon, 05 May 2025 10:26:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Mon,  5 May 2025 10:26:15 +0200
Message-ID: <174643357077.1204535.10688043941921762631.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_012642_825461_227340C3 
X-CRM114-Status: GOOD (  13.16  )
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


On Tue, 22 Apr 2025 15:04:39 +0800, Andy Yan wrote:
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
> 
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
> 
> [...]

Applied, thanks!

[5/7] ARM: dts: rockchip: Add ref clk for hdmi
      commit: cdc602ad064009470b1c40af51d4a8cd804eaaf9
[6/7] Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
      commit: dd6c77864aa69ba1079998c590b552e35649d51b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

