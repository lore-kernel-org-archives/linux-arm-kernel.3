Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53520CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SrJ2V8UNYntX3Glu8rnKvmxnm2ZDX5Z9oWu9zS2sz4=; b=hM4OKzk8FALUivsYKgiJO53kdm
	G2RPwzhJ8biHsI8yXJWh9szF+rcZN7Y2AlQnJovtw//iubXX50MaRDvQinzkB4eFWJsXaG8GSUYMk
	Fogfsyh0W+KOrQemn3FOrMvrrAQCALTTaKeLy32E1Zf+tMf9TegrMnMtRFJ7QE0rYipbr2eAzl7Vx
	K1y5R6wZ7jr3zScK42FZMaJqbSNymZfcer+l+Vz8eXIXu0HSdy81qtMkpnQNKJRwHyqIsKp+7eGT+
	4AN5i6h7yxuYZjUYBr5qfH4fBuLY7O7CcVZ/86w7BHQ21Kq+2NiLl3T2ercAAMJBuzrQHqioEx8tc
	NEJoKm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWV-00000002Wye-2srt;
	Fri, 16 Oct 2026 09:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWU-00000002WyF-0cBV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94132602C5;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E910C2BCF4;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792144005;
	bh=MoIMCn4pnZ7Jrzjm6GrTNPc+oXM8c3ghgn/LD9RZBgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q/SYW4Lzpk9Ji1JiU40rrWeBDbrNJgFPHqOMP4TLtlO7hHu5Xs2Ib37kT4sTzEbna
	 kOmxmEJbqFEqjS3TZ9/ZdN7nh/l6QYIRUNswlSUhwC1/aCSpLhid1tBgA2NlBwrcQV
	 +wMFK8Ji/kArjmTGUzqGzR8hLnHHzLHv3FnVtV65GylatZ8v2bseWUDzIK6LkBI6qo
	 N7iBOA9BG/FybQcop69K5d7DdbjFS/jVhA6HoxHcu+sDeBK6iu6tgiREN/PDxmp/Kv
	 oZo9iB+gecUWbigMISMljo5eR/5tyVqqXB2KHQUXvG/zqDGrBE0cuddkor4qfXm6//
	 498HBI4aQGWlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D911CCA462;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 15:16:40 +0530
Subject: [PATCH 1/2] dt-bindings: arm-smmu: Document SM7250 SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-smmu-sm7250-v1-1-e11fc0384cfa@brar.si>
References: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
In-Reply-To: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144002; l=1541;
 i=patches@brar.si; h=from:subject:message-id;
 bh=eoLyOF9/wNBzZ+sKEN+DTeBqDSGPwVGLE9P0wgTznzA=;
 b=hmM4xz8ovVApQf2nZtu1RSpEqyjrLarY9UHJg8Uy3+Ds9pSE1KHQib13EAkqUuR7A7SxkzO2P
 Usj4sn67yNjC+IdMqKiatwsgMjc5ujgqOtirsGrrbke3rJWm7UcRR+W
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
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
Reply-To: patches@brar.si
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ishu Brar <patches@brar.si>

Document the SMMU found on the Qualcomm SM7250 SoC: the apps SMMU, which
is an MMU-500 implementation, and the GPU SMMU, which additionally
carries qcom,adreno-smmu.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7..86844cefa 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -64,6 +64,7 @@ properties:
               - qcom,sm6125-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
+              - qcom,sm7250-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -116,6 +117,7 @@ properties:
               - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
+              - qcom,sm7250-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -641,6 +643,7 @@ allOf:
                 - qcom,shikra-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
+                - qcom,sm7250-smmu-500
                 - qcom,sm8150-smmu-500
                 - qcom,sm8250-smmu-500
                 - qcom,sm8350-smmu-500

-- 
2.56.0



