Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BAECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxfW0g9X+oPT/UxlWtvFfsT3/2mtKXs3JrOxnk3I7Ek=; b=v9VzZyqJh8qQpUOGtTwBpTf7gb
	+4R03oNnC2n7TgTZDSdt4XyEh1xksxOPHBQ4OJFna8jz28KPmKRG3lPBd0W+ozx/9c/bwg3EhEI/a
	UstpJcrq1ZvmkLmmoxWSibwFsC8To7cGq+yTN35cOgAquIFJpZ6aPwxkkvU4YoWuvpH6tlTothBaX
	Ol82Jfxp5jG33E4mXzhpJloCKqTW1uKELdK+2JVkhXdy9rk4O73UzXt6HQF7vAm88orcJgyhk+Fbs
	EuX0hE03z6RPrbiW79WARaYc5NdqZjeYSN7er0LdffS0kVFwqOLcVSmPSDzCbuI+HtzydKq+xeV+j
	YFBf/xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5cA-00000008WwP-493l;
	Mon, 18 Aug 2025 19:33:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4zG-00000008QCw-1QuQ;
	Mon, 18 Aug 2025 18:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ZxfW0g9X+oPT/UxlWtvFfsT3/2mtKXs3JrOxnk3I7Ek=; b=j95NDIOa/mCgLPoh+oZgvtNCpO
	FNHgTTgvGFcOxID5a45wUS9lzXuGAh4+NlPHyOdHhegSCSPnppJC9+lMtREVWrQfR6m4whLO0sINc
	54ruiewHgQ8lSbE5EUPKvmD4qM/JlZKoR7N1kL/EExcjD4FtrZ7QniO1xc1rTb12s2Lla27EJETYt
	7B60p7L/GTLtB4R7tImLvdhHNSAsbq6B9/xBXo87o/Bq5cHVvZopaFUiExBTEba7GFfMrSRHE5f6z
	0+fDLseIsALw/nOslqEIut3gT7n3XeIQcaQitMwbKcr+wPujJdMHsgCvM3ZBlj/+cOw6kXKEIVbIb
	C+oH0gKQ==;
Received: from i53875ad4.versanet.de ([83.135.90.212] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uo4zF-0000jH-30; Mon, 18 Aug 2025 20:53:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
Date: Mon, 18 Aug 2025 20:53:37 +0200
Message-ID: <20250818185337.2584590-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250818185337.2584590-1-heiko@sntech.de>
References: <20250818185337.2584590-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115342_376694_C418553C 
X-CRM114-Status: GOOD (  12.29  )
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

The MCU's eeprom contains the unit's serial and a number of slots for
mac-addresses. As the MCU seems to be used in different devices, up to
8 mac addresses can live there and the unused slots are actually
initialized with empty mac-address strings like 00:00:00:00:05:09 .

Interestingly on the TS-433, the PCIe ethernet adapter brings its own
memory to hold its mac, and the gmac0 is supposed to get its mac from
the second mac-slot, while the first one stays empty.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 5656554ca284..224db87973b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -655,6 +655,68 @@ fan: fan-0 {
 			#cooling-cells = <2>;
 			cooling-levels = <0 64 89 128 166 204 221 238>;
 		};
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			serial-number@0 {
+				reg = <0x0 0x13>;
+			};
+
+			ext-port@22 {
+				reg = <0x22 0x2>;
+			};
+
+			mac0: mac@24 {
+				compatible = "mac-base";
+				reg = <0x24 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac1: mac@35 {
+				compatible = "mac-base";
+				reg = <0x35 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac2: mac@46 {
+				compatible = "mac-base";
+				reg = <0x46 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac3: mac@57 {
+				compatible = "mac-base";
+				reg = <0x57 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac4: mac@68 {
+				compatible = "mac-base";
+				reg = <0x68 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac5: mac@79 {
+				compatible = "mac-base";
+				reg = <0x79 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac6: mac@8a {
+				compatible = "mac-base";
+				reg = <0x8a 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			mac7: mac@9b {
+				compatible = "mac-base";
+				reg = <0x9b 0x11>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
 	};
 };
 
-- 
2.47.2


