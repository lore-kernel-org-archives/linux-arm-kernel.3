Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885D4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM3uGwa2TkuaGuX4am1wfBWG36uO2RNmi9YCTv2nIa0=; b=whaJy0JkDKOduu1xWpUjW35GAr
	ACr7105CbTK44/vU13MfcH0cAZd8gOE7iQcFi1V5yW67jG1GNZq0k9gymeFylUDM6obyGC6QmUKCW
	8NniqskwU4fnmQ7EcpV3lhE+BCrGCUypOKrtNMK2TOLKtcg+T2sK1qy7+7TqZ0WXzpfNsiNFk2qzk
	4EZ3jpkIkTycWABb7UR/FI17RamIHBTnwcS4s7/uDU2k9XDGs5CvFJnVwI4nxlbfg/VR9Rzd46ed+
	3YD4vu+Mshg8vaP0j8lPN7gnVXHphRyjWLfndpVJ/ivmBgNxBgaI4Zf7zO2Li+f4VrLR0kA5HfoU6
	46nR+qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSai-00000002k5P-1iIs;
	Fri, 22 Aug 2025 14:18:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWw-00000001boz-2H4v;
	Fri, 22 Aug 2025 05:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=IM3uGwa2TkuaGuX4am1wfBWG36uO2RNmi9YCTv2nIa0=; b=jNzX1ryzZTXMTVj5LfZbieeuSo
	zCyFfdKdh9tmT2EeufRdrpX+YCiumZcH9LVngEfTugdBDKRFSZsleKrV3MRlcbqFzwrzUy5k4w0/X
	5u4pgNRayAtlzj2j6wchMv55Ja8co+uPTZSyuUWNxb/sWrhfnl8JfiVlCcwT6xVNZf8lf069D+iYp
	OMNQmsE96Ecu5XLVmdEAtvMwi8TAIqHU7HJ3uYf6OpNtqspEOmRfPbtlevyLq8DAnSFPP+/oh0JE9
	PSmkXPfNL2Ki33PxcUGn2FeRKDHhfeQBir+qRxF+sziCJBFjAGjl1I8K2TMKofZrvCf9RIfbc14ee
	/TVvv4Hw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWs-00000000qYM-2cOb;
	Fri, 22 Aug 2025 05:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F62644D36;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35F65C19424;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755841289;
	bh=q26G8rY/yZxO41j2xn0EyyR4ny+JDENIwRMkvg4w+oE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YWPqCCbce2TXBlmjKsaYLv09yUF129Nd3IXQr9GOs3zg1mGrnywVqjqmT7OB2ydq+
	 r7Q72X9Ss4nRax5iTWUQD9LrBoquxLQZ9pjNCKIPp1h/1Zrjrutr8UcJ9RojefRVLO
	 155qejoBXjstryIOYR62R1+xQHQJX0o/sPAHRRYOTbt5usLENwhU7ugHn38SGWrx0K
	 hZBhZksOY8eGNqi4WDUNR6amMLkvwz5t6J3GypHaafwUY0ikZ7Db98f1GCJyWrhaRF
	 G996J9/C/s/Znvr16OMb57fHCCBIL5zxY/SsZqcKIJkLZIg+EuK9zJ7/UFGbvSvQIB
	 QEzsgOw4D06yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5B4CA0EFF;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 22 Aug 2025 13:39:59 +0800
Subject: [PATCH 5/5] arm64: dts: amlogic: s7d: add power domain controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-pm-s6-s7-s7d-v1-5-82e3f3aff327@amlogic.com>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755841286; l=1126;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=F3DI1ogP18md6om9oJnkr6Qx94X86wm1hH073PtNhiw=;
 b=UTBvqx5lDN8I3xs1OuAWV2aGNtBoLnpVVnLb1uKQWs+18TabxePARl+cb3YJVjQdWDHm//7l6
 g8zqxGWO9CbAeMCbeVw3FBbyXciArP6U74hOtKEYt1E4rSVLRVDtg9o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_064135_187847_AA5B3999 
X-CRM114-Status: UNSURE (   9.04  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "hongyu.chen1" <hongyu.chen1@amlogic.com>

Add power domain controller node for Amlogic S7D SoC.

Signed-off-by: hongyu.chen1 <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index c4d260d5bb58..f1c2e91ec6c5 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/power/amlogic,s7d-pwrc.h>
 
 / {
 	cpus {
@@ -43,6 +44,15 @@ cpu3: cpu@300 {
 
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,s7d-pwrc";
+			#power-domain-cells = <1>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.37.1



