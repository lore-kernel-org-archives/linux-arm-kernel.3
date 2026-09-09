Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F1C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0mabFltmY8N5fYnc1jDn7dWJ/h3RCMBvbFE61H6sEk=; b=D16iLbdp/ggc7a687hPNXcrP9g
	rcRcWZ4sDxR6E37Pylmsv64vdM1B9il9FsO5DKZWxw1cRvxPx8rzkHkJo8Gk6oUwCRRpabhfuQw+C
	LCYbX+yLNYtv+PT3MGS7aAFlU+ixlxe8NcV8rr0f8amPhuLgXfsfqxH0WU5M7fmtvuo1pavHxHtX4
	Vpzy7aV0HhvfM/ORmphRxUP5YCG/JAPqRhl8ONK6zgQLPXewYe4nxFrtvwolvevhfqqeblr8LB4Re
	AZAOYhHH6rwSObQoM++4IJQFSd8wdP+HO/3U7rm9IRV6KBEYyQX0vPvjWlAote/v6Ki7Xpt5UwhLk
	W2Lx8ljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OEC-0000000CkhN-3iWV;
	Wed, 09 Sep 2026 19:45:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OEB-0000000CkgE-16ss
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1788983101; bh=X0mabFltmY8N5fYnc1jDn7dWJ/h3RCMBvbFE61H6sEk=;
 b=zO816BO+J4pPKDZJAvT7h0TxcSgbCEF6ZWl4dy9/shexQUv/TqR0hyRKkqGxTmZA/WpgXpFH+
 9jEAHbjYBWXuBO85Bfz49XUy9Mph9wxOsI8YNeLd0uCAchzMAlW8DfCN8IMC8jHhhlmRatMOtGv
 1ASFvXfZ8zedbBbqNCi5HLI=
X-Forward-Email-ID: 6aa1b7395382f19eb5d6c7e1
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
	thomas_turner@talktalk.net
Subject: [PATCH v4 1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
Date: Wed,  9 Sep 2026 20:44:49 +0100
Message-ID: <20260909194450.183693-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909194450.183693-1-tturner@lineageos.org>
References: <20260909194450.183693-1-tturner@lineageos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_124503_304152_74F697ED 
X-CRM114-Status: UNSURE (   8.84  )
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

Exynos850 SoC uses the ARM Mali G52 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
  - no changes

Changes in v3:
  - Add Acked-by tag

Changes in v2:
  - Introduce this patch

 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964..ece2b637cd41 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3562-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
+              - samsung,exynos850-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.47.3


