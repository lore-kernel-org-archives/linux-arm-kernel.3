Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E96C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LU/QwjGMBeWR7e4u8qSa1ijknawHIQmur/XJwgQZ9B0=; b=mXZjTwiS9ouUD/0pisWdiVrNuK
	RChJ4/A1HLD0A/AB+Qz6OfgSmRPF4skKBtxvfLVuHzNNUGjKWieCCyW0vm+9KOZ+VDZs/WWOGDdqG
	LfObsJsNYEkvh/uXcrBN1K26OWc9fvgVbxaQ657sDurDl6vll0gfHZcRmtpuDO1Ev/ek/wf65pQfa
	NFHtG6iSzCi7T2QI1tE3znwHjilEyVmBKABMqx+rJorVOWR+BuBe4LY63qoXcWCAE5ZMNCZDhLCWk
	529YsVbg7CGuTAps6Eg8rLL8aaOqNRNGeCOEo2AFCyVPwDRIFLelYyMYSzwd4FHE5CEbbwodjrCk1
	3iktvjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6La-0000000EGtq-0Q4P;
	Wed, 14 May 2025 07:16:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF67b-0000000EEb4-359v;
	Wed, 14 May 2025 07:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 368F35C5B9B;
	Wed, 14 May 2025 06:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30A6BC4CEE9;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206102;
	bh=byLh/bsiv/fh1hzyDOXgi4uR68X6jhJgLI5muBJNEqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=otJpfrzN4sAQT2ytf8z6fW020uvqNP9h04UWaVVjgtgbv9mpVLikBN0rkvCwN318c
	 Z0BL9wASYF5r9hPCB2l9JRn3b8WjWgXeYfWk9ZNPcHn8UDlxmFB2QZSq8dy6KDaX1p
	 VxRoUXxw2qfXKA9R805Oc3BaieU+RLhqZ3hzDF6xdqhkLhIGb58Ux66Yry92kOTRhq
	 mFyLv48vlCjqkODrxFM8r29SFKNp7bVJ1A2AsIK/Ra86nhNtedR7nGQ8q/gNhU1CZZ
	 f+Y3W0JTAM+nYRlvtFN2ldmSpj0hDAD+c+r9rQxqYRa+tNyqIMARZ9/LeYwMFd1sLp
	 uwYj04k7eihBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E488C3ABDA;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 14 May 2025 15:01:28 +0800
Subject: [PATCH 1/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-s6-s7-pinctrl-v1-1-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=857;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=GTxtiAQGmCYOsgbEQ6EOKgzNKF5l16qDKM+F3b/U1zI=;
 b=Tss7kkbHInMJD70OvuMcwhicWga68wC2NtehbOPKsGQ2z8FEc6GRKYVYIE88fkviKSXt9HCpG
 9Oe4CQ+Je/1AWPaRSy0cahmKIGRXxbF94t7lAUnZmL4+Dlvb1L4NChm
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000143_836015_D2747DE7 
X-CRM114-Status: UNSURE (   8.74  )
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

Update dt-binding document for pinctrl of Amlogic S7.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..8a6981e9f873 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5

-- 
2.37.1



