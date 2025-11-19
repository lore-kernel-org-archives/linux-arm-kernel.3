Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53D2CEE356
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzwqBJHkRrVSCZ7F1wqzZg13VGFT1hEK7bTuxNbvGCs=; b=rZT9aJCMp7Shied/aRWFk0q/NR
	qDJfqoe7ZAmPGt5EvjTIBUx5Ysh87qtLhQLuvXFah6ZgHv9zd0s1pZ+rZ8/mWvZLuJqCJdJbPN4/1
	IYoaU2AHGInnLuersVmn5wJhMbDofqiTZCDdDaZ0nJvfdUal/V5GRdf0LkgkHRLWf8/ADFlZY2sJn
	7IyaVtm2gc9lFpAiBoA7qR3j4K26U4TPGsfA9/7L2yskK9llB6XT6Aau8z4uDnkMS+jx97RH5WzOk
	lkBP/w3reNjcKgsSrNNOF0R16JAExdEGwSQiI+X9AZq8I3G6x6XgbOwYbtL15xh6A6QcQRWia4Ri1
	u1DR2y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJE-00000001Pn6-018J;
	Wed, 19 Nov 2025 02:52:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ1-00000001PdS-3lN4;
	Wed, 19 Nov 2025 02:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4286B60203;
	Wed, 19 Nov 2025 02:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 715C3C2BCB4;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=/WTbR6DFSOWhHERikzjfb8p0kwLhSc245pW9kNAqvvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OoeQcEwsnLRcMim9kaoRTvnguWb2bIkkNhhDwpUpknlO/XCJa48+N9dp0Klsz8FG7
	 yZwWv4CLfvABbSTPkGoppGRc8SPunh1Dhrxn7xks8RWfbmisDDoLV2coQSrzlQcDo5
	 ml0ArM/clhFjAkyKtDZuNdPHKeBq0xJcLAt2PCeH7RPiniiE6yr1J3538GryVb6Ss+
	 mvj03+NC2rwmBxBLSKhVaSkSYrueDA8dwUNeMyT/wUC8tFwEp4GyocnNrwI2FhFcpH
	 HRg5YsDvpRDqUn3DizfFnhW8KSXySajUUXIa8uFR4nASqtcT+Bbws6hhtoq/RC8YQK
	 3PEvmmkj5Nifg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26F9CF256D;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Nov 2025 10:52:25 +0800
Subject: [PATCH v3 4/5] arm64: dts: amlogic: s7: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-4-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520743; l=913;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=+3haljXxhzc2NOx8QvAzzjWJEf9qGwOFiodaJKirBq4=;
 b=Scbx5PsMwbJqHIstRdPKW+JbcJyfiJXaIsDvU9EyJukHChxCoOyAENPjekNGdufEF/XrwpvFy
 CTf47lJRuyLAV/VMV9XXoDPVwWSrFoiHjU1Pbe1Nz6YqpLEw9nT3kjm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add node for board info registers, which allows getting SoC family and
board revision.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index d0b63d3fc953..dd7e3de2a53d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -221,6 +221,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



