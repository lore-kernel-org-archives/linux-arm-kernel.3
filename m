Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D11C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PVIbNkaQDavQEgjBDli++CwOPMV7IlcwfOvzQNao20=; b=tCfwO6GAYIJk+8afQwNEhHA0c8
	ZPKokbVwS1gHXxdYG69okWoRxU6AykmevIrdmYFY8lu3HODT5bu8S2TmXGWD4r08bDtPRD8Mkgizr
	Tpk+eTaDkg9fJigwcXwI6U4Iz+p18Sk/C42LEEFzUnAfMBZcv89+31QUHKEOO1hrR5Xm+cTE9eAbW
	VSLVHiOVnZsSEy8FMuYRHC2bSr1v+ObQJVnomF1tgGpH4dZ9PsuEDp2rxqJI937MB2/2rhYODQZ4l
	JawDT3ekwbvKiO5e97YT3umfWtxD5mJzFVJouzdU3x80xii610PVkimjZYjuzR988Gl5Se5SN5dG1
	DEGZdWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXTb-00000006TbF-3wee;
	Fri, 21 Feb 2025 18:10:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXNc-00000006SDp-1Inw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:04:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607D61CC4;
	Fri, 21 Feb 2025 10:04:21 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB503F59E;
	Fri, 21 Feb 2025 10:04:01 -0800 (PST)
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
Subject: [PATCH v7 03/10] dt-bindings: arm: Add Morello fvp compatibility
Date: Fri, 21 Feb 2025 18:03:42 +0000
Message-ID: <20250221180349.1413089-4-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100404_388626_4521CDA5 
X-CRM114-Status: UNSURE (   8.21  )
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


