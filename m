Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8AFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT3vqpUf2cbi/8QqlCXx+FpB7aiR84YF3JOTeNwJzIM=; b=pCFkZ4jhhYXoGMRqKvcine175/
	EzidxcucOzmkUFKhrOJNwH3Tp94yd5j3yM9YDBxK4WRuNYaEFeXbHFp51iozQ9hSnQi+7B81/wYfy
	9zRsD89L8MkPPxrvzLU2uvEvTfykUzsoSKm7UzqIhxMzB58TWI49scz7+A9OW03oexthg0+nvp6do
	DNdhGJZUCsxvu+IlxogXuoQqhykn/X+ooiapHIElr3TDd8QR8VT5x1sOkIYZLaYihWnSmppCk6AqS
	3wOcqJyh0wu/Vgwj70ya0r4HbE2SCqDHULRF9Fmy2GxHYhqjZDf4SV8SFjTRn1hSfm1VyLkl24EpA
	vxkU4ndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucevS-0000000BoIq-1kll;
	Fri, 18 Jul 2025 06:50:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucej2-0000000Bmm5-1K3n;
	Fri, 18 Jul 2025 06:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47D20A50DF1;
	Fri, 18 Jul 2025 06:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CFC4C4CEF1;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752820662;
	bh=B1nEStj0+V6pHpYPik8DbbNYwrpA6YOZBXo8D/XPxu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YtQQVS/BzrykY3H/cp2lg0p+1AfWPfffaHya0Cf6TsGBeSqlG/RqDlysYrD5WOqO+
	 gLNBbTCwaijMD/babk6iPvGVdxBdG7BPFP2BufXf/ny+YJMBmZk4juthhfsKqc8Xvu
	 5zqe+UQDjyyvYM1QlB9VYKOmjNTM140ZwOMMu9z0flUt04hLKfSRdH3V7HFtDfify2
	 uwBMeoPYM9ZAeS7IoSQ/xOOpg4abDZR8KAlCGQkxTSgrCsKpzcg4PM3JlokL1V7r0a
	 lf4S3ZAN35h84kmOzRQXwkSoxp54ea9pXGTCY7aa1Uq/TuTbvShuWSOpKSZcqoR/Gw
	 wycuuz7fYKq2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A042C83F1A;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Jul 2025 14:37:41 +0800
Subject: [PATCH 1/3] dt-bindings: thermal: amlogic: Add compatible string
 for C3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-c3-thermal-v1-1-674f9a991690@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
In-Reply-To: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752820661; l=908;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=m70FS+G7MWgfpyXfqF/GcZI0oweMwKZErmLTKjbvs28=;
 b=jQEBxT6KzSsfZPc7EiS43IuLrjjutZFmEj5PLSOauRyZSFDl29n1k0oACNtSGEWNkiRyKb0OH
 EgxLAOKTAYqD9OUrtKAr8ZvUD1osLlLp2J+2YpAaXQVqL0LYm5VUYM3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_233744_425957_785FDA28 
X-CRM114-Status: UNSURE (   7.77  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the compatible properties for Amlogic C3 SoC family.
C3 family supports only one thermal node - CPU thermal
sensor.

Signed-off-by: Liming Xue <liming.xue@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 70b273271754..095b92aa5ace 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -22,6 +22,7 @@ properties:
               - amlogic,g12a-ddr-thermal
           - const: amlogic,g12a-thermal
       - const: amlogic,a1-cpu-thermal
+      - const: amlogic,c3-cpu-thermal
 
   reg:
     maxItems: 1

-- 
2.37.1



