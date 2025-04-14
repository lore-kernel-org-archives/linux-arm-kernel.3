Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DEBC369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEgZZxScHIMw9bh1r50TVrE8mKCke5KJ3t9Xky8pSrg=; b=a1vjwo6XhPj4yua82teveVUc1A
	fAk+/kwi2EJnSyj618XBv/zals1szHqnlN84TqyqbkDSKOVOhAQa8X93ZYV42Hz+icPmuWgsK9T1q
	u/r7KvS+0i1W8j75C7Ge2auT4/7RBZ37nFquDZxhu/clnnErQ+pmYX6WU3+QIJlKJNB5Nt+o2zhoj
	3qN9aXdciY7UY3zhurF3iO2cdYa1KnPw2ZBBn7qvhuNqyTYNQwi7NTf6aDtJ61qnKnlSJehJsxHkJ
	htOYaXYm8U/xfUxDDztvGjKd22q46GGuDz8dljEakncY8VSt8TbBkg1Td8zaQcCsWBxbEOhmnxYnI
	flNPo0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gzh-00000001Vu4-30lj;
	Mon, 14 Apr 2025 10:24:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GoD-00000001Rl6-0E9W;
	Mon, 14 Apr 2025 10:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 458934A582;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16DB3C4CEF1;
	Mon, 14 Apr 2025 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625576;
	bh=HLUNHReE0cNLO6CqkVo6sXtk4KZJ2890NAAWXXyNoFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CLhY4Um1h3j2aFquJGFPvC38oqN+YOCoEPZdww7e9guZVqXFB2xazsCAGRitei6df
	 SjgpylDfKlNfGRKTtzNHuie0We5swhdJHhbbdOVHZv/O5vZUIysOTrVGbo0C6aon6p
	 F3hpkLtX4GG+ZWwR5xBIEPLmtiso+uAvGZ0FDklb+HKFvK46HxOZIvoy0njsOBaDuh
	 VBEYOLU5N1nvb8StFWh5X8c3NZUPoGUFd3IxhMGwVv+LFVLo6U9P/jfDvq1Bd4pbDc
	 ZhtkYqqgTN3OL1FppvbtLMxyN3RNVFK9aUR/OAhPKluijAO7jhS1LISN3oxGbz1L6u
	 OlevZIWu+F0JA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFB0C369B2;
	Mon, 14 Apr 2025 10:12:56 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 18:12:34 +0800
Subject: [PATCH v2 7/7] arm64: dts: amlogic: S4: Add clk-measure controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-clk-measure-v2-7-65077690053a@amlogic.com>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
In-Reply-To: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=767;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=itRtutR2PIVs/kAFr6Titwp0GUUTkodKKnworvlokhM=;
 b=JEJNCUO49wWdoCvxqJSItcfefAv5rWsX4x/UkgYRkHFA0qg8SFWeO9i1EIxsud5Y+obbjddCI
 3/5z2wWBSNGC9HWTbopBDAUc3pYnQy0DWo/8Z9Z1FJklsqn/o1kSqlT
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031257_106200_53970CD8 
X-CRM114-Status: UNSURE (   7.34  )
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

Add the clk-measure controller node for S4 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0..9d99ed2994df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s4-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0



