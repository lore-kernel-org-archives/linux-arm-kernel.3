Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8375C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTB3zWm7oNw70pUsCc6ZoGv3uOF6aJxYArBzhguuOPM=; b=TzF2/uFEOqJr4WoEXVPBeCjQIY
	7cIBNOLV9Zd/LYm12w04kEhuDdyoSrbseIGN0LyL857AIWwnkyi/xwM4LXn/Km69nqg0DEC/pt282
	JGkVLEMb5wCGp6DosejuNxVOV2jiSD4E3V5V1ef+aEmGqKOBcOnqrKH653+1/2Z7fhvSsBWBiO8ZG
	UZ0Abx+kJKKiPNVCtpihpkJFXnATesD4RGmRO9JinQacinmuscZ4ldxG9bvYKzmIFizrG6HSgOnLi
	iIOxJmjc0pmI1QsmYWJnRMeIGn1OrDohH1DrypRImWBY9se+BaJMIA0MKRqIDDQ33CE/X0rqPF5uu
	PkzI5M/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVXEu-0000000GwVe-1sk6;
	Sat, 28 Jun 2025 15:13:12 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWs4-0000000Gu4j-3oFH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:49:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTB3zWm7oNw70pUsCc6ZoGv3uOF6aJxYArBzhguuOPM=;
	b=nR6MuKU47bJA67UcLFEOguwkqzi5gzBos23kl/TG+n7+70Qkd28gpAvRifR3rwpUsaUUte
	NK8x9Vnsklc68AFCDmCgEk8/0KWGFKRhY7w/7ZeOAgpjWAg53BO0D+zFYw/bJcgY0m3lQU
	A4luaI+6HJEywR+/Kf/WY07cArCNShjWkMaYTNGVt/mdNTHIcJg3xnREQeBQAE1beLjd84
	dbmcNX7WI5s1fCcMQ55bQLtU0ZUL+PAw5wX8NQ90ET0RaqaHeeCe+e6ksVFLusvDok5Q6H
	aw1Yc+gDwKd4EPYfF8l2YmWM6XWcIiNRUxN7OXBukPhtlaUIssjLaDgHnkLmRQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 09/10] arm64: dts: rockchip: Drop unneeded address+size-cells on px30
Date: Sat, 28 Jun 2025 16:32:43 +0200
Message-ID: <20250628144915.839338-10-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_074937_087656_1BC550AF 
X-CRM114-Status: UNSURE (   8.44  )
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

On nodes with compatible "rockchip,px30-usb2phy-grf", the #address-cells
and #size-cells are required and consequently their child nodes should
have unit addresses. That is not the case for the px30-pmugrf and
px30-grf nodes, so remove them there.

This fixes the following DTB validation warnings:

  unnecessary #address-cells/#size-cells without "ranges",
  "dma-ranges" or child "reg" property

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 5034ad8019a8..46f64cd33b9b 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -351,8 +351,6 @@ power-domain@PX30_PD_GPU {
 	pmugrf: syscon@ff010000 {
 		compatible = "rockchip,px30-pmugrf", "syscon", "simple-mfd";
 		reg = <0x0 0xff010000 0x0 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		pmu_io_domains: io-domains {
 			compatible = "rockchip,px30-pmu-io-voltage-domain";
@@ -453,8 +451,6 @@ gic: interrupt-controller@ff131000 {
 	grf: syscon@ff140000 {
 		compatible = "rockchip,px30-grf", "syscon", "simple-mfd";
 		reg = <0x0 0xff140000 0x0 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		io_domains: io-domains {
 			compatible = "rockchip,px30-io-voltage-domain";
-- 
2.50.0


