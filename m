Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F51CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cAzsj1EhJdaSpgCSGTta8uyD5ssYKgRF2FnxxSAySmU=; b=ZccDO0k3g4rfCNvL0ZDZVWIauu
	AZF2rzLGMRbZ9It8x/Fv6j4RWFTRJxK2dSQcwp83HixDn8uWyJ0spXf1/h9T/OosrY7HAe0x5diqS
	sAQFuP7IHaeJYcXq41lGFgIWLSifeBj4YsKg/ZfR7KYXw97tpGwNvKgo9Nfvauic9q0aLK1XChSjU
	7x6134nMtR59M82x12d+rA5ryOfnDIiajKFUjnyizcugDvCkPr7krtTIx8nw1Kq9Nz4YLGirTEA3f
	g4J+8qYFI6/guLXBcXJTUlecIy79DZQPCmqIvoV5SmGXEQatTc8NUj4a4VCWdJAizcLrqzxJqcJaM
	ovZMhSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgpw-0000000C872-1rqs;
	Fri, 02 Oct 2026 17:14:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgpv-0000000C86h-1gTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:14:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A600B4386E;
	Fri,  2 Oct 2026 17:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567471F000FF;
	Fri,  2 Oct 2026 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790961258;
	bh=cAzsj1EhJdaSpgCSGTta8uyD5ssYKgRF2FnxxSAySmU=;
	h=From:To:Cc:Subject:Date;
	b=H6BFdJYRiHACkVcJo7Ki9EEl94P9hXt4OXUbc0Gpf1oFzXbzGZVIk2NS1BztqPQv+
	 /qxPDdIwXKqiCSHO3zKmjCruRdObQ8koQWBxsVNaeIYp5hLHZqwHxzojTN4Eu+suCQ
	 jOxFk03hJsARG/vCU4dHs2P/ku8p1ANEZjszcbNWpcSr3o3LGswJW+sGK9RuMqmSzs
	 B+orhj0y6cTB0gjtfQGsLC62H4JvaSc5CkRPNSLdm7ON/gHAvQrlw774FGihqlqt0M
	 ABd7qlgh0+XT6bEvlUTUrDRmv1Rov3Fx0xUEzNDVF1d2Eaxs7roEvhha7XqO4tTAr6
	 QimKtAtGNF9SQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
Date: Fri,  2 Oct 2026 12:14:10 -0500
Message-ID: <20261002171412.2716314-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The STM32 RCC bindings are replaced with schemas already. Drop the
obsolete .txt bindings.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt    | 6 ------
 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt | 6 ------
 2 files changed, 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt

diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
deleted file mode 100644
index 384035e8e60b..000000000000
--- a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-STMicroelectronics STM32 Peripheral Reset Controller
-====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
diff --git a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
deleted file mode 100644
index 2880d5dda95e..000000000000
--- a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-STMicroelectronics STM32MP1 Peripheral Reset Controller
-=======================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please see Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
-- 
2.53.0


