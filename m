Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033A4C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyXAV2W+9WeUgVtJKmGxJKoFTEPe3bQ/W+GJ1vmEbr0=; b=xOmiwIV6bzUfTsz6FmFtelywuh
	SepoUtmGQQag0lti84EL8PLf2PCFc0xTS3RPQG9DOHGhizS+Jq64hA+cwKlshbyVbmtg5A0aRG7OB
	BehSeAdQjNYQ98diGQNkmybFXOyMlihtw1m7q4slBxGMheV6N+ybqHgVbD7yh2DxlI62Dw85pPUIG
	B1y3IxeoSLQFoDrSzlDRGdrGelL9AvzF4M8qrQy97RdzypxPyukHOK55/cTZUP18d6PndwP1Lpd0K
	BietCoX++6g6q6j5vxVbBf5qlBEYPJibHcbhXhIoYy4wgjEu959ZYEZB45FfeOHxP7oJ+sBvUj/ZG
	hvtM4GDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvm-0000000Bjje-3mjd;
	Mon, 10 Aug 2026 12:16:38 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvV-0000000Bj7S-06gj;
	Mon, 10 Aug 2026 12:16:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58964C0518;
	Mon, 10 Aug 2026 15:16:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364178; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jyXAV2W+9WeUgVtJKmGxJKoFTEPe3bQ/W+GJ1vmEbr0=;
	b=LB68WSLB067autQFFTfw9lgzVXbCwzWc761plBR1sHe3XnwXuVCep6nY8u/9Pm5IoK6sX8
	oyL3K1K6ywdU9lA/8a/vzaLnwnAVLV9jUFmiMLS+8HNAOb3BBxnkFh4Do/GJAXkkGcjjOf
	x/z6BhRy82c2vnLmm1ALIcg1z7DIRizpU5XD1eD9W+z0wrJMvTz7ov6OtW2QB3fd4GG67Z
	rcVzXGK2U+UyuGbXLuC6cpiEpeNDDXVBEgevjhuc/UrjIKIjtLvcYV7am+BE8LNlNK7/Aq
	1N8lwb0qM3Vy+qgDAz5hysEHHSAUUMAcFPaTlgWQ6kRwO46cbzqXX5M/es0S3A==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH 17/25] dt-bindings: spi: rockchip: Add RV1106 compatible
Date: Mon, 10 Aug 2026 15:11:08 +0300
Message-ID: <20260810121121.210040-18-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051621_279849_C4DFA060 
X-CRM114-Status: GOOD (  10.33  )
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

The RV1106 SPI controller is compatible with the one found on RK3066,
so add the "rockchip,rv1106-spi" compatible to the list of variants
that fall back to "rockchip,rk3066-spi".

The RV1106 SPI controller also has an additional external slave clock
input (sclk_in), so extend clocks/clock-names with a third,
description/const entry for it.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index ce6762c92fda..159111d143f2 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -40,6 +40,7 @@ properties:
               - rockchip,rk3568-spi
               - rockchip,rk3576-spi
               - rockchip,rk3588-spi
+              - rockchip,rv1106-spi
               - rockchip,rv1126-spi
           - const: rockchip,rk3066-spi
 
@@ -50,14 +51,18 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: transfer-clock
       - description: peripheral clock
+      - description: slave clock
 
   clock-names:
+    minItems: 2
     items:
       - const: spiclk
       - const: apb_pclk
+      - const: sclk_in
 
   dmas:
     items:
-- 
2.47.3


