Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCBC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmXlqe5R6hsGU4DBO6sbomkEKCbVcFPZco7aHxeCYgU=; b=r3a5nAo5KI+I8Tj6iDIV5R56q0
	jeITtVqeBwIkea7M+zSWR4kezF2/0UuFDJruV+AMAbbH2UlbWQxGyGP56wOpQQMfmRFkVwOmwowgi
	OuOWZadePUEvOdqIYHTvB2CXHmKxcKSKc/FmSPKU1vycSjdV5HUtrnCdscvUkme9Jxm1Nnd0YhY/n
	sG2lO7s90Le2Hhmc55nbQt8z8tJn8654Qc+VDfqcs1T6wIQ7TwmJA0z6cLBOolALDolZJ9SmLCQoX
	+yeFdUwIv7i1KrsZ4V71LoScdmQS4/DmHEKNqnJy1tJTvSulA56rvg/kX2AquUHabkQgou3VrzvPJ
	2aYkmChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJmor-00000009vUN-2lvQ;
	Tue, 27 May 2025 05:25:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJmmi-00000009v6P-1nGy;
	Tue, 27 May 2025 05:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D39D9A4E748;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 653C5C4CEED;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323410;
	bh=EOFcyhTV/hOBYlu+9SROGy3FDiHIkp+vuQMdA1Ficts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gPwvftPO6lvCYD+4UwVVe8dox8JDhv79JpoN+BlmhVrGUXySwInK/ZJ2sDDOJcgYj
	 kSZaKvgO4HAZWCJMptTVFkBPebSOAjx5Hl5hb/Ulmr5Cysin4dFXpD52FaF4VRKV+K
	 xPlfvqVCs8kzFOv5vUgceMvjuN7dWkAAFrAoyt5dc3IbC/Fia9ziDQJK/7qZYv2Cew
	 eswUQfXkE+QjY4XR1clL8JmoHgqwISBfPpQL+iPN9PF4ND4Xh10O9KkU2rCCzGsrih
	 5k248zaI5HXxVFFaEhLi2978FzkpXz5hJoh9HQUuKSwyCX7qf3DVFMtF284A53in80
	 XDHyAh/K5NHrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56310C5AD49;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 27 May 2025 13:23:28 +0800
Subject: [PATCH v3 1/6] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7/S7D/S6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-s6-s7-pinctrl-v3-1-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=1098;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=prX14EgQxx+RSrte6iKA/xDeT6QG01a/L3Prb2dIYk4=;
 b=MCVkadAxc+QJWR8KLI+ziAQqDUO8mWkG838u+iFmr/ATnjWWjKDFcHPXR4qxu9ANnEbYFecVo
 6mSMypFlLH4CW+7lda4TvdDv01tO5gtZW0bMLIfy3NgfOvxUtDYvICt
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_222332_543245_34A9E8A8 
X-CRM114-Status: UNSURE (   8.04  )
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

Update dt-binding document for pinctrl of Amlogic S7/S7D/S6.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index c36b6fe377ad..61a4685f9748 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -15,11 +15,18 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: amlogic,pinctrl-a4
+      - enum:
+          - amlogic,pinctrl-a4
+          - amlogic,pinctrl-s6
+          - amlogic,pinctrl-s7
       - items:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1



