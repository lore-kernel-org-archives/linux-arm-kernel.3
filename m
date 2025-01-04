Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC207E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqMYWTit/aHWfXyDrLnrv4M960RHQNSuc+4InX9xelI=; b=2JKeIecKfGOu4BTv/mIvdTaWQI
	oZgfXTNcHXt+V0FPCUF+0Wc7pEDF5ltX5lrsj4ODtsdwIIQKw0EB33wbUna2bR4uSqSveodHFjayB
	+AyIJ4BqGT4iX5FJqYBdGfsLbbn1f+OOWYzN4xwVspzChZlKngyKNw4i8wbTHqsxU7dnh88fbeqV6
	A9miqwuh5YcM5sH7TQlaHCOIK1smjozak9BQXJ0biC22lZVQPqlppTS5XoAhUvBReSfp7zhrCEd+k
	H8iVon3OaBtiekjvs9ub/lplxLh2h4CSD3uUgtXry4EBA4cItPaR5wOke7FCqTiacD9fIWxPXyQMx
	c64jkixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBBX-0000000Fb2p-3O34;
	Sat, 04 Jan 2025 20:55:51 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAL-0000000Fafk-3JGf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:38 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FEXNIqLbA2dho6TkleojVJU/mNabeFXI+ZNE1ovlYhYWGv6w+dSDF7Ao+DJsC9IkhHH6czuTO/nXxpeJEbpsalZgHGURIbCDWTaRBMcNSP3S1OBR3QcwpZ7OBcGljJ25BX41BlvQ6Hz6Puacv/fvUFxtI7TjpqGElO8AkcbU43BcyiGjPQlOdfCY4ckyvFCVmDwgCTiYPjKltJhEbwkJJojdVcjLB9j/ZRk1WDcBd9ZMQ8E9yiI1/5oyyQ2VmovZpW/ioM1tjdTfsqcTmWjj9URkPiTX/Fcvfw/rSckDX8F8GNuxk7S4WtNyTxwT9RcFYuk8bsNZLV/Z45zKmI7lqA==; s=purelymail3; d=purelymail.com; v=1; bh=u277CPLBGNkpYhIE1Rr/ra64g8X2BqQPgiL87IDzy5Q=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166263896;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:54:30 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:54:16 +0100
Subject: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
In-Reply-To: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736024066; l=1238;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=u277CPLBGNkpYhIE1Rr/ra64g8X2BqQPgiL87IDzy5Q=;
 b=LmjPRu8Mc9V1XnLhYRXEnZgszVTkWv+64u5dFvrbNqNXJzVqL6r4jRSD41n4kiRqffrzMcZUN
 ClRoiJQmxEGD67zArdb9WO7RM52IToo79RzKP82xSBa4TBPXaN5Wcc2
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125437_904409_364FF5A4 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a dedicated compatible for the MCT of the Exynos 990 SoC.
The design for the timer is reused from previous SoCs.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 02d1c355808e4eadd77b98247cd70e76aea72b21..12ff972bfefcc5dcef2a38582e963ea49a567d18 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -34,6 +34,7 @@ properties:
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
               - samsung,exynos8895-mct
+              - samsung,exynos990-mct
               - tesla,fsd-mct
           - const: samsung,exynos4210-mct
 
@@ -135,6 +136,7 @@ allOf:
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
               - samsung,exynos8895-mct
+              - samsung,exynos990-mct
     then:
       properties:
         interrupts:

-- 
2.45.2


