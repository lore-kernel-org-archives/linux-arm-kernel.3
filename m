Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50CCC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAo6ySx1q3rw1gCMhVaqXZ8ljc7CGb8/UsCGsLD+SBI=; b=W1UVvLJ4nU9vPL6D6gzTkO1jWT
	D/vT7OxFKz6lvwul2/E2H9e7gRFjkof5Cs07kdBso9oO1b+BlIKFa5ceaOa1IWqE/EWgxNDKd72KK
	41ik4eU2xDJwYPM86Yn7/3M+OqiUUnHhA9lk5wv1dX2Ww2aL8wWj+fCpYByW/ywqJEua2wvynBKg9
	5RHgXIbHuU7fJxcvuZWWWJqNwBlhS9SOdR727B/U/hDQTfFDnCAjvjivZ6FLM/2TP4jG1bhwrJYmq
	w/JQIop4mo9ZjFyUku6vvx2Kh9Mf2X7CkP6zpQUMSn3sQcgKr3M59Gj/oisgSo/mTV3togsJoNL+A
	iVJ1wOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzdX-00000007SoX-46Xj;
	Wed, 16 Jul 2025 10:45:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzBn-00000007OES-0SYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D86614A1;
	Wed, 16 Jul 2025 10:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A20C4CEF0;
	Wed, 16 Jul 2025 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660998;
	bh=yzWNQLcs7Lwt6DD7p/V1fRiZ01xlkbaqpa3oO6VxBas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NefkaHFR6S5g0x0GDS++IeHYKPWNJAO489ElZsmLXmWPmNXVZabxVre1ahgGcIiav
	 ZmBcrnWy1VREAZoFoyz4n16y9FNCOksWU6cXbbH7PRKI8AiKHtOLMM02g37hfO4sQm
	 ZDvVwdNSgk/rUTm+TmwtZdHjCES0miji19oc+G0kACm6/qNgaNBep47eRvDJed5ONT
	 Kl03GLzpDR2DuqQjUxPq1UYrsaAcqOCID3hQOLKqcL+z8l/nTuUk85ODyHsx0AScgT
	 Z27xcmfrSUbDHKGcSHcxy3zoCt+dzRty+wYYrqheQXQrDoxMNs/3sXkLHgdInFEGUK
	 al1rjY5eNcc9Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 16 Jul 2025 12:16:09 +0200
Subject: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752660979; l=1379;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=If/HtxS4xxNGL8GUie6r+h4GnTXXUuSRIqq3TrpnSUk=;
 b=TZslEKRzA3k6BoNEr8M85s8UXCI/i+n2G3yhNJmsWJ6LNRz8A1+HnOi6lh+8Kh89OcaeVXVQh
 aeaFdj3TK1uBytOC36NJ6IYE5CaN9SNJC5KpJ3RTJvs5w/OPMe8Kzvd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The firmware on SDM845-based Cheza boards did not provide the same
level of feature support for SMMUs (particularly around the Adreno
GPU integration).

Now that Cheza is being removed from the kernel (almost none exist at
this point in time), retire the entry as well.

Most notably, it's not being marked as deprecated instead, as there is
no indication that any more of those ~7 year old devboards will be
built.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73b7eaddae232ea64 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -132,10 +132,6 @@ properties:
               - qcom,sm7150-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
-      - description: Qcom Adreno GPUs on Google Cheza platform
-        items:
-          - const: qcom,sdm845-smmu-v2
-          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500

-- 
2.50.1


