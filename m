Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B0C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CsxSqwIllapJ8LuBOULZiZ9puOmcXb0kK/lST1rS3uI=; b=llPk0brHQNaIlL1xqWUCeHjYYq
	kAMz+8AzBDuLdtysp5m3kNPbb6Wz7/FTKdINPi5yltx7haOPnssMoFFAb/WyDp4LP8NUl9rz4eF8C
	6m1HRXLIimqoVMTO6e1rYCyMNPK9Bqz85BejPkXQlQPOMyHgckHi69l4Rw9o2IbNKF1niQptzzDER
	MZaQXdylyz7RN0e0WFuVTDlOQQy2nqYnWmlXBBX6/OR76gQ8GPDGFL0X4GhBUNLYHi7LoAjtd0Ze9
	ilCVirwJSoh7UbZBn8dnsty65XbpvwrVzdl1q0UeuQHVumcNg0Mkmv8EUziQr7N91rxnu5/4hbAhL
	+IdvsrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfDC-00000002qjW-2ErF;
	Mon, 24 Mar 2025 10:39:18 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twf84-00000002qCu-3o2m;
	Mon, 24 Mar 2025 10:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=CsxSq
	wIllapJ8LuBOULZiZ9puOmcXb0kK/lST1rS3uI=; b=KlYHZBq7R/W2BQ7zdJVkV
	WUzZkIu6+L5n1kfRPJM2QD5nNS68FYaF7EFfZ14B+liGtLfSfhvmIkKrbNzr4vlC
	nTa3hHaTE65m8EAyVZTg+Nq9zRyocLrP5rfM0PfCZRQ2v7tdUEc49Oy7e7jMnsww
	cnHiYLOS2BFbo9MCO/N1Dc=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3TEH9NOFnDTbjAg--.63654S2;
	Mon, 24 Mar 2025 18:33:37 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: display: rockchip,inno-hdmi: Fix ref clk Document of RK3036 compatible
Date: Mon, 24 Mar 2025 18:33:27 +0800
Message-ID: <20250324103332.159682-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgA3TEH9NOFnDTbjAg--.63654S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45GrW5ur4xJFyrWF45Wrg_yoW8WF43pa
	93Cw1kXr1Ikr1UXw1ktr18CrZYya4kAa1Ykry2q3W8Gr1j9ayDKa1agr1DZay3Ar47Aa9F
	vF47GFy8A34SvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_3ktUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g0aXmfhMHZKxwABsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_033401_327639_0700889B 
X-CRM114-Status: UNSURE (   7.50  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be enabled
first before normal DDC communication can be carried out.

Therefore, both RK3036 and RK3128 HDMI require two identical clocks.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 5b87b0f1963e1..9d1e7f894ea54 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -23,13 +23,11 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
     items:
       - description: The HDMI controller main clock
       - description: The HDMI PHY reference clock
 
   clock-names:
-    minItems: 1
     items:
       - const: pclk
       - const: ref
@@ -87,11 +85,6 @@ allOf:
             const: rockchip,rk3128-inno-hdmi
 
     then:
-      properties:
-        clocks:
-          minItems: 2
-        clock-names:
-          minItems: 2
       required:
         - power-domains
 
@@ -106,8 +99,8 @@ examples:
       compatible = "rockchip,rk3036-inno-hdmi";
       reg = <0x20034000 0x4000>;
       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-      clocks = <&cru  PCLK_HDMI>;
-      clock-names = "pclk";
+      clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+      clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
       #sound-dai-cells = <0>;
-- 
2.43.0


