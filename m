Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD82110987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4OKw+hOY0jIL9kpXUDDhRwNMSMaoji/u8Maz5+z6OQ=; b=RDir3xJ08l14Qr7g++NDVw4Cpc
	UHVJUUYbK8IRrNeieunMwg4KsmUhRqJ6aMYWoTgkq4zEDadcAIzYOZwU9uGkRQYAIg2agNxJIB2n1
	0rNJPvGHA+VQGcN9Qt2FK0Cusx/QqxjzjM3ai9iRIHupRJh8eeUSuicsIZGbavjj0h/yzZRbXkx+r
	HbDrUbd1h/RHOs13HL5GEvIjinBYzU4dfB1AK8nKyH/xfZEyft7QSY6AcADEqa2DqX56JTu0c8Xpm
	OT8u+VG0361CKukApWv9q95X3pvpgIfPjfEIjpvR3GXUgQ0TqMv6c6kE0B7WOLNT0QasVSJ5oKdPs
	YKPXxSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0g-0000000DBa4-27bx;
	Fri, 20 Mar 2026 16:47:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0a-0000000DBUf-3h5E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3373F42CBD;
	Fri, 20 Mar 2026 16:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF44AC4CEF7;
	Fri, 20 Mar 2026 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025256;
	bh=MyZDEC4YA2XUVdCFPz/d1D9B38/FSwdqJVLDQRdEA5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OISUcGy1sFHRTsHjircV7QmS8szmkxU1QAwSH7YXs41U4R2Hhz9H4YK1G8YVmSAnR
	 BJySdaPPw31dEuF3cmEDdSxIvu7ojrwOHn0bKgeV1xUD3AZ4VDDVlzg8NaqkAxbFzD
	 CDHPvS9ciB3Kx36J+STgqedpS9pL9aqIjsvnhjdFM+y3gBLfzpT0PsE2lDpbC79lY3
	 hoPjTVMgonxxyTqMMsFXepGWLNQSTO3RPMcVniHOzBjqwPfemZ60jRJOEQbdIKOw4t
	 NkYktN8FVXWdQ914SrrEOpINGmbH/57DrSFMUV7Wf/yjm6nMX/3Gf+AgtJCRf4hClj
	 NQG/vGqF28snQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Mar 2026 11:47:14 -0500
Subject: [PATCH 1/5] dt-bindings: arm,corstone1000: Add
 "arm,corstone1000-a320-fvp"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-dt-corstone1000-a320-v1-1-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Frazer Carsley <frazer.carsley@arm.com>, 
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>, 
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094736_967478_632B0D93 
X-CRM114-Status: UNSURE (   8.47  )
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

The Arm Corstone1000-A320 is a variation of the Corstone1000 with
Cortex-A320 cores and an Ethos-U85 NPU. An FVP for the platform is
available here[1].

[1] https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/IoT%20FVPs

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,corstone1000.yaml         | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,corstone1000.yaml b/Documentation/devicetree/bindings/arm/arm,corstone1000.yaml
index cff1cdaadb13..48ab3356e383 100644
--- a/Documentation/devicetree/bindings/arm/arm,corstone1000.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,corstone1000.yaml
@@ -15,11 +15,11 @@ description: |+
   provides a flexible compute architecture that combines Cortex‑A and Cortex‑M
   processors.
 
-  Support for Cortex‑A32, Cortex‑A35 and Cortex‑A53 processors. Two expansion
-  systems for M-Class (or other) processors for adding sensors, connectivity,
-  video, audio and machine learning at the edge System and security IPs to build
-  a secure SoC for a range of rich IoT applications, for example gateways, smart
-  cameras and embedded systems.
+  Support for Cortex‑A32, Cortex‑A35, Cortex‑A53 and Cortex-A320 processors.
+  Two expansion systems for M-Class (or other) processors for adding sensors,
+  connectivity, video, audio and machine learning at the edge System and
+  security IPs to build a secure SoC for a range of rich IoT applications, for
+  example gateways, smart cameras and embedded systems.
 
   Integrated Secure Enclave providing hardware Root of Trust and supporting
   seamless integration of the optional CryptoCell™-312 cryptographic
@@ -39,6 +39,11 @@ properties:
           implementation of this system. See ARM ecosystems FVP's.
         items:
           - const: arm,corstone1000-fvp
+      - description: Corstone1000-A320 FVP is the Fixed Virtual Platform
+          implementation of this system with Cortex-A320 cores and Ethos-U85
+          NPU. See ARM ecosystems FVP's.
+        items:
+          - const: arm,corstone1000-a320-fvp
 
 additionalProperties: true
 

-- 
2.51.0


