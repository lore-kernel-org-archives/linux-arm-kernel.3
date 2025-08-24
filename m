Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89414CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOem+vEqJqafrAcs6wtW5hQ5ZvnSbrk7rrVOvmTnaJI=; b=FaJSbOWHTZEE0Mdz9rfr0trg7t
	hrHG72kkG186PvCknhRF82/Dl0Ks7ZOtmg3NPFlyuH5v4HFJPSgMIE3Yya9/X623J4y2zB0FOOCEh
	Th/xgPIHPufOALzYtz9GKzI+7ftw2qZd6PsDoQxA3uSG2zNe464dXbGjOYzNiT+H/GJB2D/repk8a
	sZTJSmE7m0qdOocY7Ul3YAn1LxEg18BAmTVinTT7C6AC5vVXp3O1IpDDLQlGAv/bNAMR6eBWupkzs
	sg22z1NYfIudEzPZ12Aq1KUPnD/ciYDYJAjkLf+18AypicyiB+SOk8TVQXHWbxFpwuZpaduhsUmuA
	GlUXCT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8a8-0000000633I-2EVr;
	Sun, 24 Aug 2025 11:08:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8NF-000000061aL-1V0M;
	Sun, 24 Aug 2025 10:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XOem+vEqJqafrAcs6wtW5hQ5ZvnSbrk7rrVOvmTnaJI=; b=vQOOiaOOwb83O/FrOxf9jbGkcH
	hyXvtIz0JqlFrz6zasOL3PlJqtBdjLo0pzpJdDNpTOfx2OynNMbR8s0jmtdhC0MuH/Sc8pv57P0ED
	8gIK2RYYvo4s/zuU89ZtgCol7AJQyETm9cTbczc7r0Qe3MyeDq4P88pdeu6rbDIHT3rpVvRJD1a+P
	SM5kuK327VabKqVCEA/CpHOc++3BGbgNMh9/ADeVZSLCEJZ/jkfuyM5QO8fTP0esaNNGN6obP7saa
	ieqbcPzW94cc4pb85cytUE4/ZZXM8W06uAD7PZA1wlvaze6x1OLoJCyYpUpWzI9WWqyeZ+yjSCmUh
	z7Mh+wDQ==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N6-0005H4-73; Sun, 24 Aug 2025 12:54:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Date: Sun, 24 Aug 2025 12:54:40 +0200
Message-ID: <175603280227.3445205.12980590537074643035.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250818100009.170202-1-amadeus@jmu.edu.cn>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035457_393024_FF4C7717 
X-CRM114-Status: GOOD (  10.98  )
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


On Mon, 18 Aug 2025 18:00:05 +0800, Chukun Pan wrote:
> The HINLINK H66K and H68K are development boards with the Rockchip
> RK3568 SoC. These boards are all SoM plus expansion board structures.
> 
> Both boards can be booted from eMMC or SD-card using the
> U-Boot 2025.07 generic-rk3568 target.
> 
> The SoM board has CPU, RAM, eMMC and RK809 PMIC.
> There is no schematic for this part.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: vendor-prefixes: Add HINLINK
      commit: 7d11b8c260ea68ce8f420ad467b04b21ea34b011
[2/4] dt-bindings: arm: rockchip: Add HINLINK H66K / H68K
      commit: 4bef07b79ab1ef7d963eaa2c37948030e418d538
[3/4] arm64: dts: rockchip: Add HINLINK H68K
      commit: 86a504b82f8d0e34f99ab9607712e7942c919fa3
[4/4] arm64: dts: rockchip: Add HINLINK H66K
      commit: bb9ef44f05c9558d58e3c9da141e93af1aa11c1f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

