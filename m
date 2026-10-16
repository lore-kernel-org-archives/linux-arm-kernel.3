Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B910CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 05:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAwqLLDPX6E3P/u+2XslblxYo+levmfsclu4pXuAN40=; b=KVZPQBaHww0bf0wslgGXHXJZbu
	GeMP/GCzEfJdJ35idGfHTHv0cpGpQbQh87xZ43C7nSxbI1yzKPVnJZSUNTyQJZh9JUWSOllcS6eKK
	dPA2ixzh+IDmZKCb2D3HKFDiqMZD6iU1l5L/6VNhS9D5lsvvCrjW9QQVm907OJ6jMH4F7whOS0dgl
	tQJ7+9FT0X3nrh14YzzTgEILzjIoa0Ft5oLFQcfetxYuQtXCm0SXy7My1SJJeSz9eYiVnMqxRZqV/
	lQZdEI8P36z0jQpJJM2JRtRw4FM+jixPGv512t2yIM7Z0F1zXgma91duiUv+E05+b3qElLsaVoOQs
	AJTaT0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaac-000000022DE-1tZZ;
	Fri, 16 Oct 2026 05:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaaU-000000022AS-3z9r;
	Fri, 16 Oct 2026 05:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E377601FA;
	Fri, 16 Oct 2026 05:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F05DAC2BCFD;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792128877;
	bh=6m8Ojyo9TbI7mj4V/7EpCvY/aUscvJAlabnYrJd4b4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oiH5yQq6irJQzvLhxtPFPBZp60Z2kcKvQI/PUmvcV/tKbVW+9mIpv+TBsa2SKiChy
	 GpN4F+8wEsl1upQ4c3hP2RrWutOfAyGdWVIhMSoRFiYUkuHnDxqhCqhJh2CideiuK9
	 FdSWUMLiKLnksRDwlNuz1952+y5U65VPWljYvUEA3mwk4na8T92G9ZlZZoRWIdmMaL
	 442bTBl+6W6hxsVri/33h8qsP+wofaS3J8ap3ghFQaw/9JDcJxScc1AG7zXK6rS9cO
	 OybPRDaLhMMARf8My1ChcQ1egRzaq9ZecDG0LGGGyNsB1RDqMBdVFSCe0uFKSLk/ul
	 7kqZ1AMmNUYAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0209CC6B2D;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 16 Oct 2026 08:34:34 +0300
Subject: [PATCH 2/2] arm64: dts: rockchip: Describe the unused RK808
 outputs on Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
References: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
In-Reply-To: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=q+lERKCDnOjng4lQyfplDkXO0aaernq5BCDtZUzNjMI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkXt2ffMj9gPDm6g7HyEbORruy0LcsZ/xyd/oBlpX55w
 gGj8zcKO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBE7u5j+Ct2695OU5Uyfe9Y
 yxYbu7tTUrZdfOOlebPqg7zL2sc5mw4x/K+wOrNTMFNSSmNZlMPuXv5q9qX37bQF0i7nvfOVlz+
 whwMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The Helios64 schematic lists RK808 LDO_REG1, LDO_REG2, LDO_REG5,
LDO_REG7 and SWITCH_REG2 as unused (sheet 2). Each output has only a
0.1 uF capacitor and goes nowhere else (sheet 6).

Describe them with the names from the schematic and no constraints, so
the regulator core switches them off as unused.

Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index cf247d6c6212..35e92e1c8ff8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -436,6 +436,14 @@ regulator-state-mem {
 				};
 			};
 
+			vcc1v8_dvp: LDO_REG1 {
+				regulator-name = "vcc1v8_dvp";
+			};
+
+			vcc3v0_touch: LDO_REG2 {
+				regulator-name = "vcc3v0_touch";
+			};
+
 			vcc1v8_s3: LDO_REG3 {
 				regulator-name = "vcc1v8_s3";
 				regulator-always-on;
@@ -462,6 +470,10 @@ regulator-state-mem {
 				};
 			};
 
+			vcca3v0_codec: LDO_REG5 {
+				regulator-name = "vcca3v0_codec";
+			};
+
 			vcc1v5_s3: LDO_REG6 {
 				regulator-name = "vcc1v5_s3";
 				regulator-always-on;
@@ -475,6 +487,10 @@ regulator-state-mem {
 				};
 			};
 
+			vcca1v8_codec: LDO_REG7 {
+				regulator-name = "vcca1v8_codec";
+			};
+
 			vcc3v0_s3: LDO_REG8 {
 				regulator-name = "vcc3v0_s3";
 				regulator-always-on;
@@ -497,6 +513,10 @@ regulator-state-mem {
 					regulator-off-in-suspend;
 				};
 			};
+
+			vcc3v3_s0: SWITCH_REG2 {
+				regulator-name = "vcc3v3_s0";
+			};
 		};
 	};
 

-- 
2.43.0



