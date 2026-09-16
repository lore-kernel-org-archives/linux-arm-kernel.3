Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7941AC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhzeGGOWspxEKNtt/Z47b/hluKWdnAB0PnukFa3hiCc=; b=hQEtOq2f/OxP0Dypqom6AI3Fxf
	Jezj1+E4LA8B4N9f/D68btfecvCXI+BGDkn1OFXOAIS/fPZcBtR22l/XtA7lyHW6koGHmBM00xI6H
	JuwtWg3bGXR5Jp6LjqBMGdVA+5N7uUX9pGhNUJOquvIodSbx1pbpVpXCZsERHNuaGL6+FLiI9utib
	oYe1m/RLdPXfFdtYKBcdsUPGB9IaBWF/EwHGiAqMlh2gb8BkI1mur215vzg2LDAERnml2bfVVshqo
	U77A8DrtD1yj5FWKtiwF6yBJ2PQyMOJxTMcYZz6iAze7bb/8W8EXxNuMn7dg45HEO/5oEEtSdQFHj
	biWXkl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wfQ-0000000A6ml-0gLM;
	Wed, 16 Sep 2026 20:55:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wfJ-0000000A6kO-41Wy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789592137; bh=mhzeGGOWspxEKNtt/Z47b/hluKWdnAB0PnukFa3hiCc=;
 b=MdUdnhGIFXf0dEbTB9NsM9QmZv/0vLVIGtTK1NRIFnaJGdTmEnh/laN75mAeoRKPK1W2gmUD2
 2ZmJVqDNHNZXB+NWD1oMHRYcodWQqJagqOG/MewiYd55WmUfEbm699kLx7lGgyjZM93BXbbYIJk
 iq4pjZzLeHyAEX4Q6DpuH7Y=
X-Forward-Email-ID: 6aab024407c281602cddbf31
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: krzk@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	semen.protsenko@linaro.org,
	alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Wed, 16 Sep 2026 21:55:21 +0100
Message-ID: <20260916205522.159393-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916205522.159393-1-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_135537_995600_1E54AFF1 
X-CRM114-Status: UNSURE (   9.14  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
 - Add Reviewed-by tag

Changes in v2:
 - Sort via alphabetical order

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..db19a686f490 100644
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


