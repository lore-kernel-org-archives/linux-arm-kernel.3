Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC14606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hbyi0VPR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3qQiHB4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KxfJRuhR4e3e74XORePZ1NG/nK5vJBeiuU389kzwj94=; b=Hbyi0VPR639IxHfgxw5eLynwrV
	1a2bBONohI6Ho13cEXTeafWirwyAu9mTpZhjzbMyyvLmiMI6QfQzUzdVKr07oIi1MVVuHGotaJLpr
	kjkcOAoKdpjOqV4eiVJ6mOAwQO13g9pqz1MjrtKhncozjW9oUWaPakfEXJEaUdub5dlQFyngyHL9f
	+X191NfoBlTdY6poutTP2M62AfWYsvSpvFU/mq4pf5iAW7UdKqt7zUI4xTu4aZdIGXVd8L9dUMb7o
	GCPyfwYd3MHFDSt547VAu8kPD7gqIzc0NRK7lJcLR3OWU6RBlmZYef28W5gM3ReCt+S1t8H5V0vgA
	fSom16gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8M-0000000Fp5v-2WtO;
	Fri, 23 Oct 2026 07:56:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8I-0000000Fp5L-0em9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C3C4369B;
	Fri, 23 Oct 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792742169;
	b=uIvP21OMBF7mr56YnMLOXLLaKWk8vr+19TZLfnkHKpV+2HdNYG/FSCAj9tRFel1mUGoQ
	 9/DzCkYVC3mRNxwMDcjg+dudPuEbVikGupDhB+267j+O+AJoXVWgIMmrJFdsg1ZOSit2e
	 c/Q3NjhNVeSH0+IHEE3ex4yBtQ6WIV0TDGCzzeljo8mrI9ksqQdMd3/HLkEyym5vG8V7A
	 4u1ADOLg8HvxVT+qL6F4s5K7E9HPcTKcbKQ7rTFNYht/ekdhXlceyFq9pG0tsZ1/asHee
	 RQp63kCpefDqg+MwViBjHoxHqcWPQP2FnOyNZFu72QX2COmR68ctaIB1AuNHxRqYjOQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792742169;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KxfJRuhR4e3e74XORePZ1NG/nK5vJBeiuU389kzwj94=;
	b=aiaocRbC0Nmhi3KvnWSjJ7eY007/SDEHejrn1zvXcaXsFefcyHVoFk6rmbHI0dS4/EnZ
	 Z/CTO1StKpGEfjgIPMDqTcLauOgUqFmjMhImTWv1XuCv+wLGqpxGQIYfIhaD1Za3oYoZb
	 m5daWFt3lhQshS9B7W+1CrsCpWK6CBnRm+vdjYNHX5ISt/RZcs9Ey9di1dOCV5YViQT+5
	 Z9iMrvh+I8682uMGD1bOoM8v5boXRlAeaOP2/D5DR1oW2y6tP1idOs3ccI0vlTekk3zfa
	 R7t/+5P7QLcMp/wtF0qouPJrO8mfCOfYXW59thFJJQShgsmF8iGfSJWTBvMikFvOglg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A659C1F01829;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792742169;
	bh=KxfJRuhR4e3e74XORePZ1NG/nK5vJBeiuU389kzwj94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=G3qQiHB4WOQwJ89QBAQ7kFf3+y63IufQG4siwyjEQsBUkRIpRmjg00tcn7lA9oJx3
	 ihmPWi8iPbkTMVW0O3cCzlDvvt9tGTUvDQFeJBhUYnlwLWGK0pior4Mev94akAUi8y
	 Uk7K787d55cCnJWvKyYoma0egP229HQKhGI4c4TTD63BP2L0kJwO0nNqm2LcWWcsal
	 2sMGG+WO+nvoXyy8Sj151Nuy0lxeqx1giEUdOpZDqkEIo+s9YN4eR7OxLhgQykzr/g
	 txeeYoC/DQAEUzuRxV05OCynMSNXcnvxkk/N6VM7ybSAau8bLxZoRhwsP1SU2I7tTl
	 U+prOUlJ2s6Rw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0FA6644408;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 13:24:31 +0530
Subject: [PATCH v2 1/2] dt-bindings: arm-smmu: Document SM7250 SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-smmu-sm7250-v2-1-8bb881ce19f5@brar.si>
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
In-Reply-To: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792742166; l=1815;
 i=patches@brar.si; h=from:subject:message-id;
 bh=kHofjg1XdVn2qUP3so4fPH+WhKAeqzgGb/wA76RUHIc=;
 b=kcB0keyDTGZuDJirrCw6myRtz9EV4ChtMBoNpEgIhT0yoevqc1MF3Gwb9YalvJIuQi9Dm3Kwe
 cXS1J9WFYK5D1NCe1z3bNCPUaKB19zQf1pnnR1kErNYmfW47ablsW4t
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: patches@brar.si
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ishu Brar <patches@brar.si>

Document the SMMU found on the Qualcomm SM7250 SoC: the apps SMMU, which
is an MMU-500 implementation, and the GPU SMMU, which additionally
carries qcom,adreno-smmu.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7..9abfd77fc 100644
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
@@ -445,6 +447,7 @@ allOf:
               - qcom,sc8180x-smmu-500
               - qcom,sm6350-smmu-v2
               - qcom,sm7150-smmu-v2
+              - qcom,sm7250-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
     then:
@@ -641,6 +644,7 @@ allOf:
                 - qcom,shikra-smmu-500
                 - qcom,sm6115-smmu-500
                 - qcom,sm6125-smmu-500
+                - qcom,sm7250-smmu-500
                 - qcom,sm8150-smmu-500
                 - qcom,sm8250-smmu-500
                 - qcom,sm8350-smmu-500

-- 
2.56.0



