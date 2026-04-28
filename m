Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B57FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meRViYFs5X6dMii8+AEMMwNCnbBUtMzAHESVJg+sawk=; b=OLphEPLCOtMcaHBEV/p/TtX/Qm
	t0Ee+xE3YRdwe6GV3iRvD7cK7y7RPPnfklpoQINexW2dow+ynuVu97nsK0//4i4Uld8vNDO5UMAAU
	M4pe451akcHik7UpyW9oF5VRbnfh5AOOdA+EjBed0a1OG4dcmCcPWzIgrvB0FsCIWhypVOl+XZJ02
	BKNb6PF3BulU9/N/H4wG/uOlfn/XdXLn2027GmWmsQtG7su4OuNPLHePzCqgWgGdNmSsxoaUK+MSo
	JP2A7iBMfIq/3tPNEssHpfsbImbLVDwftVhul9BGtglOixBnLgYjaG+GXeUQ9T4WMFmZcfl4peyZa
	TEoKKabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdib-00000000sUn-2t0Q;
	Tue, 28 Apr 2026 08:22:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdia-00000000sUP-1PR3;
	Tue, 28 Apr 2026 08:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B026961119;
	Tue, 28 Apr 2026 08:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6BD5C2BCC6;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364574;
	bh=2Vjr+gzdqEzGNWSWn0Sk/xakPdleF096MbPBDXVAhts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LtcJzwb7l6BMOm96R2uPwtpJ0bQyC2w4jY3pr9lruO+qBdYkC0GKfuxDx7kI0RWlx
	 rzm2DqXTQAayJLAsjdu/3f1KrU0wC1ODVoeYoYNJkvvX2cRksFBhyy6l7/PpNxBVH3
	 ThsmgLnUxQcj3dhYRYX75aNymwfvPMY0l1sdIVYfriDgSs3uaDR/pXS+xg334oda+r
	 iUJULUWKFqRVp13GGFAvdMrJgtsCwWu8pX2PzqCFgJK1PTmDzk0woWIDqmqtmAFPBD
	 qnD1LXxqrlJLVbhfrwR4JsXJ2guk8iMQ9R+yLlQbWXKALJSiIxnE3rOzz//V8smiOV
	 6Z5RseE1rSKjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D4EFF885D;
	Tue, 28 Apr 2026 08:22:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 28 Apr 2026 08:22:48 +0000
Subject: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777364572; l=786;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=ZCQ9AXusiocY4m+0VEcyvhrnI6BCr+BT62vN2ubdhfE=;
 b=xjCHxc9DgI/cq+g0Uw7BwWKjy/UVmfIvgt2iNeeY93ziednAQAhkzXWGcDmkq8pnrle7LI4pW
 LlOPIaqIjtVAAPz6riUk3JbQz2ujPhAGPzn4COaKfZDnryewWevr14o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

Update dt-binding document for pinctrl of Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 6ba66c2033b4..b69db1b95345 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - enum:
           - amlogic,pinctrl-a4
+          - amlogic,pinctrl-a9
           - amlogic,pinctrl-s6
           - amlogic,pinctrl-s7
       - items:

-- 
2.52.0



