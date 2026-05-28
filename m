Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699ECD6E4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixfForG7oMvzAbzLH72G8wKr/srkHqm+fzizmUHFeuI=; b=CQoz2zMWEzdgIOuC1yNqie2Sbh
	qmxq5J7pe3FuCVhB+rFoJxl3qoiuvkEvBtjllpdiyOXxgObNgpgA5XTE8MJ8OQSsnlueCQa9UJ0TU
	+l/FMMtffW/n3f1nMlS6eerVwMyFiNnMS+qA7vUd0mBypnIC9ZfGl9hmaDJREbLs08tmtiYgg2EMr
	tqtDaQbP1nIplO7Nio1TjqeO6PARmJOtmjiUKNX7A2B3i+/6Ph/45/IlIvDmtYNQsZfKMGcTNZU4W
	wZolamEXhbLbiB14IRU+u4hISqUgSUw1C3dE/xYdoaZyysMCoQvVZcL+ZUbq9JA8X6PCuWt07Kh5g
	CkCwex1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFq-00000005kDj-0jwW;
	Thu, 28 May 2026 12:54:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSaFd-00000005k8R-2C67
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:54:20 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC498FA;
	Thu, 28 May 2026 14:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972835;
	bh=KHvUizxv+fBGrkbW5KiV7JhkpjD6vu4PMZ6dowiSQD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OxHZZ23M+SvKO63RONIlhB1bgzdaq9lPVDhunjmIurNLAglwC/kWwm1Jpe3+ZulN3
	 QY/YLedpn3LuatKLql9RxDJ3GhE6vDXMgbsVs2RFYwPXJ6GN3rcgXCpbcSgRQ+9VxZ
	 bIoYN9xjTi8dE1sIfQcgHYrmGEO0OKfT2gTjIOB0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 28 May 2026 15:53:44 +0300
Subject: [PATCH 3/6] arm64: dts: ti: k3-am62-main: Rename
 'oldi-io-controller' to 'dss-oldi-io-ctrl'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-ti-main-conf-v1-3-a54ac5c8d081@ideasonboard.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
In-Reply-To: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KHvUizxv+fBGrkbW5KiV7JhkpjD6vu4PMZ6dowiSQD4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrxmc7Y3gpZbi8j7z4j73LZ7+3h9uBy5cw0u
 0LL8CBkvliJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg68QAKCRD6PaqMvJYe
 9YqlD/43cQmYfbBQpG4jL1RTyDN+DaDw/LTL0xcKQC5vvTOf4h0qr2p9X+CvCeGV98l1iHXvV1Q
 6cirPsFt6GmeBBQSjqWYqcrpf9nCpa3zEqdS2G2JiuPo5CkqyTXwEWRpi7EzmdGcuxtZqQJSOR3
 iClnOGqkaKy0sUHNReAcL9l1OHbG5M7L/3vqk90m1QKhnjHdrF6/u4vx7k02aK/+B26ahDGBw//
 F8bXNXi7yuh6g5UYYNhnZK6c+KOzlyhoquIgubtN5Vt7CU/cm2hw+3pmh77S1Mmm5QV2/xCZCB+
 4BaPKlWxcbmki/Qji+q8fC5Ov1M5hOcJEHX6bWHv8YWQ7I1SwklNR7EW/dETbTWFuYYQtwmEX4c
 15Q9nGYQTzBIgD0N8409ogZ/+znWgtHIx3/NVnaLwpxApVhuwHK6TAIkpm4HfGsSwLIPU0OxLsO
 qhvlOewhR3hrymvWPO3Jtmq3mSoaNqQ06muvvR26MTCUPhKdGqwSPi1cXN1gIkl9Tm1eg4k9hW0
 aEXWO2kYuDjzQ7NaKFB7qQJxA5PboM8AA71oMD3Bx6J9XXfaDisPBDP29qKZTn9H33tsExYnc+i
 zi6ncfr/kVpNaeV5Orbuoks0fLmIIvIXknq2VpW2qqOJb1FBiTqQj8zyv7jFKJ2Hra8KqRiM9Il
 hitYEScVbMwrDqg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_055417_724324_126332CB 
X-CRM114-Status: UNSURE (   9.45  )
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

In k3-am62-main.dtsi the OLDI IO controller node is named
'oldi-io-controller' but every other dtsi file has it as
'dss-oldi-io-ctrl'. Rename it to 'dss-oldi-io-ctrl' so we can more
easily use a common system controller binding in a future patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 228f8c3e8bf6..ffc71ab623e0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -77,7 +77,7 @@ audio_refclk1: clock@82e4 {
 			#clock-cells = <0>;
 		};
 
-		dss_oldi_io_ctrl: oldi-io-controller@8600 {
+		dss_oldi_io_ctrl: dss-oldi-io-ctrl@8600 {
 			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
 			reg = <0x8600 0x200>;
 		};

-- 
2.43.0


