Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8494DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XVL48TWiY+XNpNk7iyosHFV+k4tPpfzis3dEB9ackg=; b=xQ7XMh8gBahAvj3xIOPPUcJWLr
	495/RUFfMh5T/90W2iaePS83yi6OCgJQGPsGPMTFzGu/hVehzaNnLQuyEr5NCN1Lo7OK+YyKG4N/b
	itiJ3sS2dzZFIzPwOejN+583VGsNogE5a2npzrucqzWB0/1xnmok3YCJtuTJSrfWv/ZKLvpoRYLSS
	XbRwd8xZRyb+vumjoscgoUr39yfrKd5VgsATz5gSlkIaA3MSvuXulFbgO+67XCg5SYFxSi554a7RZ
	HBCUm54PG+oLr0fh0UrE/vSc/DU4bu7gyAEF9BHWkgtB0TkzjeSSitls9FxsQ4/yOW/oud0INaOSG
	17kK1iAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCLt-0000000H9sh-23Hw;
	Thu, 18 Sep 2025 10:59:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCLr-0000000H9rq-0ylG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D91F441D5;
	Thu, 18 Sep 2025 10:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D853DC4CEEB;
	Thu, 18 Sep 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758193137;
	bh=JfXbLoAYPx2pAIs4oJkUHnbn8HvPZWOeNhod4g901PI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G8s7hZmYRBl/oX5E5GiAt5vgrOdiDJz8LYbP/1T3fQp6qOOMLI83oZjDoRVr1Qrsj
	 K6Z2GwGj9FWzIUNNMUo4qFz2NSi9DXNaJkRnbGvjFYypusZ/T6/1fSrylCYOeqCh2O
	 gUubEuysEzu5FeVMJIbBBlOzUbNcvolj7igVqo5Exb66+wbLQceKPVwyVM1kKw7mPD
	 F3cJ3lh0cjJmSOU2hWKQB5PAVPL9xiA86pnyjskI7UUGk/iSo++8Hn5gNtQnmRNiCx
	 3eAIyS2CSC1prjxxrOZY8S+7hp7sKllxH/hU1O6hGfi5dFZDmO05jEhsAw5NJeNt1Z
	 96Gq6MZzIikMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FC5CAC59A;
	Thu, 18 Sep 2025 10:58:57 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 18 Sep 2025 12:58:43 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Amediatech X96Q
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250918-x96q-v2-1-51bd39928806@posteo.net>
References: <20250918-x96q-v2-0-51bd39928806@posteo.net>
In-Reply-To: <20250918-x96q-v2-0-51bd39928806@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758193136; l=1236;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=GxXI6NJW9t/fO0BoT9gBld9sqiI4uwUuxiCCn6jsYZ8=;
 b=7ViBDRCcbfuuKW0xOEmrt/a3RTnfDNy5KfIEfIkmiwQTwlnz8y5ogApOKM6L9sH60C93kaQCU
 Qu0Q5bIUhynB6wV8+AZk3SLm/48afNXFvMtvd94CZUdA2fvn8owAmPN
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_035859_294129_64D4BE7D 
X-CRM114-Status: UNSURE (   8.37  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
output, and infrared input.

  https://x96mini.com/products/x96q-tv-box-android-10-set-top-box

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- add review/ack tags
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c25a22fe4d25cbd8a8132689f1326548f7f43f2c..c9940b44bc888f7ab81ace671040bd663556c113 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -963,6 +963,11 @@ properties:
           - const: hechuang,x96-mate
           - const: allwinner,sun50i-h616
 
+      - description: X96Q
+        items:
+          - const: amediatech,x96q
+          - const: allwinner,sun50i-h616
+
       - description: X96Q Pro+
         items:
           - const: amediatech,x96q-pro-plus

-- 
2.48.0.rc1.219.gb6b6757d772



