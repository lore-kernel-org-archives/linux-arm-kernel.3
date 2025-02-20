Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF384C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PVIbNkaQDavQEgjBDli++CwOPMV7IlcwfOvzQNao20=; b=1vDzArekiYCYhUfJIYc8zGhN9B
	0EwqOFW9dcmUYsbthR/eYSRonASN6QKhGgL+2Oh5FHLiL2TXhfd6CQZWzGITsRTuIMelCMvyoVk6a
	OTpPJUl08eHYuGH8cCt6q5fut0PmLzTvGy+1IVP8mhl269Q9otjCbn6v0BH7yw0dGSKpx0EAoBTux
	Jcs7J4LruQi7Xso4MEhmVu6+w5QjBq4jsYCslXo3W++Sp+MZjumsZju6wAdqJF6VjSz9DYlNugHhF
	57jYvAP4qPKZ3VyXvf+3L+uf8i0wuIimMfYEJsL5NMVQ+VkHZ+qMDSMdw1ZMJrr1w+2MV4qWExUVd
	DZaHAJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB0d-00000002Ik1-3WIY;
	Thu, 20 Feb 2025 18:10:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAun-00000002H54-1Ogz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:04:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BE5016F3;
	Thu, 20 Feb 2025 10:05:07 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6F773F59E;
	Thu, 20 Feb 2025 10:04:46 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v6 03/10] dt-bindings: arm: Add Morello fvp compatibility
Date: Thu, 20 Feb 2025 18:04:21 +0000
Message-ID: <20250220180427.3382482-4-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_100449_414648_AD3063BD 
X-CRM114-Status: UNSURE (   8.41  )
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

Add compatibility to Arm Morello Fixed Virtual Platform.

Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/arm,morello.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,morello.yaml b/Documentation/devicetree/bindings/arm/arm,morello.yaml
index b4cfa8d048c4..e843b97fa485 100644
--- a/Documentation/devicetree/bindings/arm/arm,morello.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,morello.yaml
@@ -23,9 +23,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Arm Morello System Development Platform
+      - description: Arm Morello System Platforms
         items:
-          - const: arm,morello-sdp
+          - enum:
+              - arm,morello-sdp
+              - arm,morello-fvp
           - const: arm,morello
 
 additionalProperties: true
-- 
2.43.0


