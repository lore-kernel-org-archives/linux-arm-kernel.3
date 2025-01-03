Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE81E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3ea5ZTzUxPbDZAF4ulI5gn5AaO8y9XJnND3IEPDu/w=; b=c5RmzUya9wg5MmTPuBURQQtXQB
	LRIon1IrRjF4qhDqxcDDT3Pc2dzfBMWexw9DOIT4Qp4jVuRyZBJJ5l9+h8U3Qq04alRH6BWIp+dgQ
	40hSqtLenvlv3oj/qvTdC3xKptz47F+ap9MqIzA3qDLe4LQy6yi2ziSV30n8rkyN2X0LTlK4iwUTJ
	5BJSNyVKgQI5hRmOPRRB6wuKdDGSaMU62tF7CWoQsbct4OQhZYkwbUcNfBMvnBipvCjaxu7GNSS/i
	46XlgG7X1uRECzPZo78Rn/YBE3URvZjuwVC5Q9aUFqMfrf4DdAWEpJTB4w29MhSBtkkpKPDVecS0p
	Gd80StEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmGQ-0000000Dgiv-2z2n;
	Fri, 03 Jan 2025 18:19:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmE5-0000000Dg7q-0irk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 18:16:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A335150C;
	Fri,  3 Jan 2025 10:17:13 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE0F83F673;
	Fri,  3 Jan 2025 10:16:42 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: Add Morello compatibility
Date: Fri,  3 Jan 2025 18:16:20 +0000
Message-ID: <20250103181623.1980433-2-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_101649_254606_AA978A76 
X-CRM114-Status: UNSURE (   9.19  )
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

Add compatibility to Arm Morello System Development Platform.

Note: Morello is at the same time the name of an Architecture [1], an SoC
[2] and a Board [2].
To distinguish in between Architecture/SoC and Board we refer to the first
as arm,morello and to the second as arm,morello-sdp.

[1] https://developer.arm.com/Architectures/Morello
[2] https://www.morello-project.org/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 8dd6b6446394..40e7910756c8 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -118,6 +118,10 @@ properties:
         items:
           - const: arm,foundation-aarch64
           - const: arm,vexpress
+      - description: Arm Morello System Development Platform
+        items:
+          - const: arm,morello-sdp
+          - const: arm,morello
 
   arm,vexpress,position:
     description: When daughterboards are stacked on one site, their position
-- 
2.43.0


