Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BB0C88E67
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9vbUExTnSfxpeKoDbrmG4gAzUATjo+nnHLBYfJpQBc=; b=kFt2rT7i3uBUVyVitkxJ7+oEJ6
	4akgQ/AgqMuzTBLhYHLKOyOhTftzSnw31VtYdNTf0aA73k4NXdWvRNdPSwAkGF41gmAAdc4XmTcGk
	s/BZW31M2zmlmL4d3FnL3C3DNh23uOa0NYm+c4ZSahjvFmT1XgJK2T75LqNHFvYUVsyLnZveLNfj3
	6a0dp1Z0e94o9I2nnmEfQNFS5PARY0kX6jRiFccaCQ6jmJFOEJFJFeutLaTL4IEpg9W8HJ2gOe5Qk
	/zrY7roQwCvrE21Yin4dUR40uW5rcZz/hvrp0xvVkyt1Qdt4EG0O0v4VpDy3H74OOJnstk+WKBxk5
	EE/86Wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jT6-00000001fGC-3J1L;
	Sun, 13 Sep 2026 12:38:00 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jT1-00000001fEH-1dRj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 12:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789303073; bh=C9vbUExTnSfxpeKoDbrmG4gAzUATjo+nnHLBYfJpQBc=;
 b=CNf5bk4v9fMql7NBrVe/asEYbiGF5UdEk+MZDGxkgl4V2GPCcH1XI5gOpxtXOL32cIZeoZspB
 U8LGuOJSAZPl1trHPzLta3sZKnVFaB3UURFL6w9Y4kZPLpxiPzfkiW/hwhwp/6WOhpoL5YAwjiW
 VhywO0mL92LG6uzM+Wk3Fb0=
X-Forward-Email-ID: 6aa6991b53bb319e9d04cad9
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 13:37:39 +0100
Message-ID: <20260913123740.203698-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913123740.203698-1-tturner@lineageos.org>
References: <20260913123740.203698-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_053755_438654_D7A05C89 
X-CRM114-Status: UNSURE (   8.38  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
based on the Samsung Exynos850 SoC.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
Changes in v2:
 - Sort via alphabetical order

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..021250497da9 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -232,6 +232,7 @@ properties:
       - description: Exynos850 based boards
         items:
           - enum:
+              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
-- 
2.47.3


