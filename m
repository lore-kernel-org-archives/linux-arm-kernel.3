Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03102CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDLW4VhSFFMcljmS6Qay8m+rBIpXePJpi+Rxa8moJs8=; b=Uy1Tlcf18wuh3bJvev3JWoZvuj
	aAwu16AG6MCVELK9f5M1KYsrjUtmeJu+hQbMFVjg4audgY9OhVBkxuCTTQ48jCrbMArMQR3kzIz/a
	/OLoYhEUEG+IKVwihI8hYGJUaO0efz4zicYZ9MIxxbJ4GOCSm42zC8eySfZyO4R2Nlf0dR0QZdRRQ
	EeRrLfUVbBTc5sR0p+0Nr/3wg5VE/ISg5ChLv+cLEBckluvFH4HqDXanicqDdqtxfa7akQqM6nQrG
	3z3Z+0Dk1Nhg+0Ac1kiQK3cD0OBRUzGS81jz7/i5sbAzFvCbp+67RolGU0VNcXcTWWMxODskDVtnp
	IMi9FhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNj-0000000Fg8J-2MCX;
	Tue, 28 Oct 2025 09:52:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzs-2W1d;
	Tue, 28 Oct 2025 09:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE11F48D08;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B087BC19425;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=cqU+XTI3Ndty3aUBGJIBF2UDdBqJf3bOi+0Mrt4qwlg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lF2BBvbzMqylrxnrL9MWsz4XhkiSUt+1c8QHfcvh00cRlRDBfZkq4zsPUGyhIPjw3
	 gEofrz52i6xHJapZ1r8eRA4AlMPRsBdqcn4dgs8cAmG/OhAXFT2x0qkl0zmTMlWqF3
	 OzDja2lKWJZKumVavPZoHFoq7iD6FVQASTI5NtOIXng85GrV8G9oL792MEYEFJMN4/
	 QzTYkKHUCjXyBTUq8hn6OgbGxtM2KTqqswgcEJEI23kH2Iv3b00NZLeW2oYs1gFDD4
	 oaVXmKdO6pI7A4DbFmOHyiwwqjJSpe58Fn05pi3yf8CxgjV1k11oeMdqoXzXZdJ0rt
	 PMzjjBNbQk14g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5034CCD1BF;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 28 Oct 2025 17:52:32 +0800
Subject: [PATCH v4 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-a5-clk-v4-6-e62ca0aae243@amlogic.com>
References: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
In-Reply-To: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=1430;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=/Yr112v7w9bKoVucDd0LbqAxSPlWQH4QEG5NVVuwlK8=;
 b=DthrWwzWNgN0aSbFCcCr3xN6xvgvMKdfIOCGZQbM9bzguyli+VJVQvXkxhUIqQi2VoL39tkDq
 WXz5pkrokz+DgPHImRiEy9gQxlyCxzZHkDQuw+RE2K7wTSPTPQZvEPH
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025236_779526_7CDD1DFB 
X-CRM114-Status: UNSURE (   8.39  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add scmi-clk device node information for the Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..a6625508893d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -7,6 +7,8 @@
 #include "amlogic-a5-reset.h"
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
+#include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
+
 / {
 	cpus {
 		#address-cells = <2>;
@@ -49,6 +51,34 @@ pwrc: power-controller {
 			#power-domain-cells = <1>;
 		};
 	};
+
+	sram0: sram@f702a000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xf702a000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0xf702a000 0x100>;
+
+		scmi_buf0: scmi-sram-section@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000C1>;
+			shmem = <&scmi_buf0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
 };
 
 &apb {

-- 
2.42.0



