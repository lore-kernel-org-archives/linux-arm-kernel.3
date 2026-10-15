Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F2DCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mXKenAul2pgscinfPY1MCJHdb6h6XxLACr+mAY7ybk=; b=ZrNH+PEdZA7Rfi1G4K3J3iBxwF
	5IOwN/XYB6FHtIrDG45GmOpJIUuk3N2v0kVAcFKv3bDgmsyuvTCjspI68dfUcBxLByGyF1AqZWYm6
	tFk03btAzn5/JsWX+WWvOxGAvn1g1F41eB6Lqaqh/EHHsgVnMAFrFO522lx1YQiWfzbSa14LqJs+W
	LdTgkea14rNFlRN+F3xbnmr10cmeY0SIYRoy6g64OQqOfOSMmCPAci1O1vAOjCttAMjh+j2AQ/TVz
	29MAuMCU3oAa9M0OeojH5a4vm3rsy8Ql4YyiSuHq2XiCA8fzZEVu0+EKy5D5aUAGh8NmeiQS02uFc
	jFry+2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGhw-0000000H8Pt-0iHG;
	Thu, 15 Oct 2026 08:21:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGhs-0000000H8Ot-35to
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:20:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B61D26022C;
	Thu, 15 Oct 2026 08:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DC51F000C5;
	Thu, 15 Oct 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052455;
	bh=6mXKenAul2pgscinfPY1MCJHdb6h6XxLACr+mAY7ybk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LRP8bMx0BcJBJnXM041eXZY+btqTsGp8Z9SGF/anYyy5Ag/ug662ti6pGjMPF2tMl
	 3FCV4zaScQhr30U5zM/4ApzZgBkOCN2bgmfwtPtMy2603iE8CC7ixcYxtTuZ5WC1le
	 Ix/0zXqWRcPs9Ne6rNavv+h8BQhCZD25S+FbFQnt91KC+QlG3rbMpIdRPBmqgccdO6
	 okzwpgmEQEvf+FEr5STvTqhJ+5tf33p7OKvxjlz2MFhgfzkzZA0UYZ8OUA75SFRp20
	 WWRVh8ADyTktUbfd+JDgzi31Nzt0MwNHoR48wJF6+ogILD53e6spHZNvKO8jXSmFC0
	 FDFDrsPSNRHdQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Oct 2026 10:20:25 +0200
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: gicv5: Relax IRS
 properties constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

An IRS is architecturally allowed to be stand-alone (ie with no direct
CPU connection).

Relax "cpus" and "arm,iaffids" properties constraints allowing a standalone
IRS configuration.

Fixes: 7d7299bd07c6 ("dt-bindings: interrupt-controller: Add Arm GICv5")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
I have not marked the patch for stable though I think it should go
to stable kernels to fix the original schema. I am a bit nervous about
making cpus and arm,iaffids optional but I don't think there is a way
to keep them required and force them to be empty for an IRS with
no CPU connection.
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
index 86ca7f3ac281..b901e4288816 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -120,13 +120,14 @@ patternProperties:
 
       cpus:
         description:
-          CPUs managed by the IRS.
+          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
 
       arm,iaffids:
         $ref: /schemas/types.yaml#/definitions/uint16-array
         description:
           Interrupt AFFinity ID (IAFFID) associated with the CPU whose
           CPU node phandle is at the same index in the cpus array.
+          Omit it if the IRS has no associated CPUs.
 
     patternProperties:
       "^its@[0-9a-f]+$":
@@ -210,12 +211,14 @@ patternProperties:
           - reg
           - reg-names
 
+    dependencies:
+      cpus: [ "arm,iaffids" ]
+      arm,iaffids: [ cpus ]
+
     required:
       - compatible
       - reg
       - reg-names
-      - cpus
-      - arm,iaffids
 
 additionalProperties: false
 

-- 
2.53.0


