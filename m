Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C7CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kajcMqwaZPXl9WMQuyq1uhakLYmxQULnsnl+OeX2b8=; b=l8sOyWws2IJrRzw+TkqyVfntzN
	zg8czHxJQd86OiybzrxP4CB1mg+vgyRBoDLB/ixSogAOBFnQp24UT3ptjyc1ZvJjCXrC0yVomTTP7
	IeURdMb8hs/wsLb2QMPssZvT6eylLJ5hL6F2X/zk+YbzU2rfh2MVZqRxh4gPrTrKJfo4At37KFMGc
	uGYpBsqz7LYWdkfYJ54+kfTTyCQbE2A/Y5lKo3ZFXx9BN7UtQSaode6Sxp48TgT7gVedFxz/kSmgH
	thOwNXaKGbTvpZ+CE+0SlGYmKdCbVb49vo5iH/sLoop1Pj+zRTZAY58XAkMbLmbadT3gnHzOCzHeE
	KedtDE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFO-000000091Dj-2o8G;
	Tue, 16 Sep 2025 20:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090kA-1Kof;
	Tue, 16 Sep 2025 20:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC0944D56;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 976CEC2BCB0;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=9/G5ZTxTD+BBqSrE/vwGnDJrgre4QIYgA6oTXtY5stk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZHT/sSOTHa6bfD8o5gNbnFzThRXuOKzVKaCBbDd++aCO1eYwOQO3sx6i/8TQNdsRm
	 CnItc8YCH+Hc/lqSokDvLem0ywUkeptdh4TyA7yKAxpHwd5jvO55giobsAt8iIQia7
	 2j4AtVR/JuSKey5ESfUTcfeLy/3piMc78dssNL+4UnUSREhw77IiDGBzFN8AZj+H8W
	 DS87xqFh7+KVEYlFCNwgO76XwqhZnIeNWaNzhdtHmHnFl774FsaJkWksqdgJcSkElH
	 O7aHwpnMQ1DoBKVCeB10K/o9B/Uz9jSWUHW4Hc9UXo8BsOi3EtZxVn2xtQDqDVcqQG
	 UnPsSqCCoGlew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF7FCAC59D;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:08 +0700
Subject: [PATCH 11/25] dts: unisoc: rda8810pl: Enable clock/reset driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-11-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1103;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=iisWV1yQIJV2H6A79OICiudNGMDM/d8wOSexhp4+9s4=;
 b=Uvbh1qdCuPgMg2Cya3wHJFP9B0zxFrsqfkRbRH3160/AsRSPEzMZMlwk9yvCgAuRqcoJQnphz
 LShcA3DOx1LBDlnxtXB3POz/cK5m8ZeoMMoHjCQKsqRFMuyqcxZ4qHk
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132527_470193_33925CDB 
X-CRM114-Status: UNSURE (   9.47  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Enable RDA8810PL Clock and Reset driver so we can use it for various
subsystems.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 45a2fd3e04cea5aac4fb6b40a6b332ce3eee4f2c..1f7a6908d68367441e5dc865216cc7a5c39feb35 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/rda,8810pl-apclk.h>
 
 / {
 	compatible = "rda,8810pl";
@@ -79,6 +80,13 @@ apb@20900000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x20900000 0x100000>;
 
+		ap_syscon: syscon@0 {
+			compatible = "rda,8810pl-apsyscon", "syscon";
+			reg = <0x0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		timer@10000 {
 			compatible = "rda,8810pl-timer";
 			reg = <0x10000 0x1000>;

-- 
2.51.0



