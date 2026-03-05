Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5ACF30951
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u827sJWQwU3javZmJbO1M5tiwo6JeGPU3XiLOVja7Ag=; b=S5a3ag9m7vLQwkAJkeQv+XuAVL
	kPQin2D3gpEyZgd9tK7csotOQCH6hH3XZux7rtYg+0SGo5H+SM8eTeRQwjCLOyP1/rpntVL/0jT5K
	oFBD0bKAUvf5FG8zi8xD2VgYNKNWCQTkSJivA6JorbJqu5X4Hkxh0Ll5b92N5T52aTP8TNNtzxqSa
	5IWq4TlgaCHZChVeCy6NlG+MM1Zo2X1yqcQIdNHhIjPBQIceBCXkqBO9jbfLRWLBOHlsUBmlbrVkq
	ZdDq3+InjAF7I840BaFuXSsYvry2PvLlXzMOQPfd/UHB1uNd3mKuJIBAKr1+pul0ehWuVUM9sz86h
	SFO8Zfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7U2-00000001jMj-2Uat;
	Thu, 05 Mar 2026 12:07:14 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7Tz-00000001jLg-2A7y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:07:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1772712419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u827sJWQwU3javZmJbO1M5tiwo6JeGPU3XiLOVja7Ag=;
	b=EsUqP7AnCln9wX3WGvVEodNcCvRH7F7m0zb7KGngCHgVNhGfgE8E7KIR/gu10BlMFILXqG
	QjI92XosiaYSdPzKsJE6uYPMFJYQSl1KROCmjUchbKHcAP5/PZ7JGp+LoD1KWFn+ORNa8p
	Ziy6ItjkptLXCd85iQtDv/pWoqFghdr6uj92rDHYvdWba1HdqoHVZyXh+y3Io74vLa7Utg
	Qgar9fKlUhvY53qPWczKbgaawQeDDYz5S/3tzZ17iVzJK61Wgz1djUMdGkSYUyzwkaLavo
	FV1vJjAidlucNYxUwvTOzeU7kSbrKuhGurCyMdOzk3pXrUwfI6r024EpNukpjg==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Samuel Holland <samuel@sholland.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Maximilian Weigand <mweigand@mweigand.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Enable GPU on rk3566-pinenote
Date: Thu,  5 Mar 2026 13:05:40 +0100
Message-ID: <20260305120620.173600-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_040711_696639_BA81C26F 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Samuel Holland <samuel@sholland.org>

The GPU is most useful when used together with the EBC on the PineNote,
which is not yet described. But there's no reason not to define the GPU
already as the hardware is present and could be used without the EBC.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 551d551a113b..071cbdc3f6d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -234,6 +234,11 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu_npu>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.53.0


