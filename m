Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4723C982EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uTEQ6/SJWC+9RFdhyKd5rc1b4mGQLlqNmQc/E6Nlo0=; b=E1O+euepufgnyTH4g0NEzwms4P
	99n0ZqlpZ6gVxy5IoF+5sxFBWFBn9aSyzIQi7my+9FuaQaOJ54bnH70KYvqHrPTmPMObqk73lKLH+
	caR0nor4BFoB+iJN72ExErQmJXrYAhYrpAqKFvlBK1rDtNmOhYfPXJKU5utFzOrd4YpLiU7WfHL+9
	kyQE1AcSiatkcOTv142fISjkIR1vmeUZmAw2KoibFk+BoXMdLiMj3CGdgmCu6IruJynZHeGzSQetn
	fYjW7KeX47L4RP5kreHa90sj4lIRcCejUy//BT9DZM1Zmj+Vf6QE3GZtdpSITmn1lVmjNWNYgp3zb
	PFxADGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Eje-0000000HFeK-1uiE;
	Sun, 20 Sep 2026 10:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPC-1KRA;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D13F144801;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABBD3C2BD05;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QXZqdjcTUPGbG2CO60FeN1vEQq1lisHu40g5oInrQm4/l1ohb5pAnAcvEEd/dEda8
	 4+6R0rQA2NUw7J28JuVwNcDZSW5+ySY3i45J/ezUwEFprrzHHAcOU2lQCDaIHvx+5c
	 VOMQvUkYmgIOWMfRfIOKnZzetOcqX7UXhvUrdUmIeLNYF0FnUL/znmNHneiGc99KLF
	 Ba6uWZmhYttl4R+AN7tYm+IGmMHEleyMF3nWRWvEpotr0wsAv/fOotkobsWsopWfcE
	 j0jJbFiL9pf4kKVza6R4EXx3UxTlfU6LIgb8usJhCQ2+KzZvEjoU3ytPvVs7mD0Iz+
	 1nSDVTSZx11GQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AC9C982EB;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:13 +0800
Subject: [PATCH v2 11/12] arm64: dts: amlogic: s6: Add clk-measure
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-11-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9SDzhFYgFeR3zBxYK2Jcmr4Ssvx78QFB8BdBwjoaCo8=;
 b=Vsjs7WW+r5ugbL6idpVlhUEpnx0T7h+vBrL4GLl5aOWOcGE2N9h4+cD574WFhLUgaR7Pse2ns
 rm4BfWnNdhpBv2XXV3AdIrylReX04DutwAx7IFXw08a0WOS8fm2fQ9K
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

Add the clk-measure controller node for S6 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index ab3acef2b147..b0a1a05297ce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -217,6 +217,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s6-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0



