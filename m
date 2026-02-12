Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471A1EB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjZHyL6jE/ORA2X9vnoAX/BvuRGFeSqnb6P6IyrB55E=; b=1Uhy4zqcuMj0zAtxsDBmeooUv2
	TS7T59f0Dx3vvVSdoxM3QpBKxK0ngmJ2EvwKvK/cI0gwgXxpIv93H3i0j4tEGU67N7j9AO36GEL3h
	jm0ZEQ/T/MRdnpyDdyDdymDf3oixsNX5o6EpsrkK2uUIL6j/Qu75460LIjteZXX7oMZGF4uV3YRAt
	ZjJZ8/WvWylL5dTPmN77ZEFfSbZHvoKuULS/9it0EKdEHmkpikSyjXkZPOSCVR0br9xtmI4sqKIxX
	/0Db1snuHNUMBQsg0TB28KaW/PV3bpgWyZMhszVRwJmLKCmRABQcGl/HzUQuDojKLXd9bn/wEUgbk
	vZOb7DBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUhh-00000001z04-05oO;
	Thu, 12 Feb 2026 11:17:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUha-00000001yy6-1vxi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:17:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 222ED497;
	Thu, 12 Feb 2026 03:17:34 -0800 (PST)
Received: from e137876.arm.com (e137876.arm.com [10.33.10.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A573F632;
	Thu, 12 Feb 2026 03:17:38 -0800 (PST)
From: Debbie Horsfall <debbie.horsfall@arm.com>
Date: Thu, 12 Feb 2026 11:16:51 +0000
Subject: [PATCH v2 1/2] dt-bindings: arm: Add Zena CSS compatibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-zena-css-v2-1-d33ea23cb9c2@arm.com>
References: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
In-Reply-To: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Debbie Horsfall <debbie.horsfall@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770895056; l=1428;
 i=debbie.horsfall@arm.com; s=20260123; h=from:subject:message-id;
 bh=ByRtD0Z/Z5itOe1ilWqHHF5spJasDfNhMjZby+Up5qk=;
 b=GZ/hTY6oCHqjVnckHXwCr5TtiRzbtTJPMhXYLKPHii2ROsAaNozeK067gqzztuLtL7UIxq90g
 4gEPX5d5zssCjYw4pKx/EHS19CDaqwahyuUrdP1kagqOe8UJ8Ac5w5N
X-Developer-Key: i=debbie.horsfall@arm.com; a=ed25519;
 pk=PHSQwhhwfluuPcWn1fk950OfqGxCy2cjbyQb7dfAcFY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_031742_546085_2F659FBE 
X-CRM114-Status: UNSURE (   7.31  )
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

Add compatibility to Arm Zena CSS Fixed Virtual Platform [1].

[1] https://www.arm.com/products/automotive/compute-subsystems/zena

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
---
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 6430218ba1ce..8023f6ffe183 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -119,6 +119,16 @@ properties:
         items:
           - const: arm,foundation-aarch64
           - const: arm,vexpress
+      - description: Arm Zena Compute Subsystem Platforms
+          Arm Zena Compute Subsystem (CSS) is a compute platform targeting
+          the automotive sector. Arm Zena CSS is a high-performance Arm
+          Cortex-A720AE Application Processor system augmented with an Arm
+          Cortex-R82AE based Safety Island and real-time domain.
+        items:
+          - enum:
+              - arm,zena-css-fvp
+          - const: arm,zena-css
+          - const: arm,vexpress
 
   arm,vexpress,position:
     description: When daughterboards are stacked on one site, their position

-- 
2.43.0


