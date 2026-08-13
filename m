Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C87FC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSCgs0lQLqQsikPfdXK9PGRbuAiA76T18Sx7NNxX49E=; b=ZG+xjhKcdoTi5457ljlSzbjdLg
	hLJtv+Ds7VIIfrGsx/9pyTgOLa8qjGowJrbOJe1Mm74I+NeW4NFxxX/QP5KveVMQzywBtjmc268ND
	xYTU1HVi/9yEvlpmt1reVa70TLbysYW53O3XvJc8JDk9K0zwyMWvjubzdJ+7q2+/p+tFo5nwNh6se
	6ryEx3ZEKFJranErf7eCCem3ezpuj1k2lhQQN6/SiwCv8lqiX2Zg+PMBos1uMLLNOmOJqNgo9XL3h
	xRmBBRDLrLHPZO4Erv2L8nH3zzCboJek/JysKFdvzbovsHMBHJhA2EszKyLEp0VK3XCp5SDXqgQK+
	ryCT0yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6N-00000000bAY-34yK;
	Thu, 13 Aug 2026 12:00:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6L-00000000b67-1ovS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 388D7600AF;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEFCDC2BCC7;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622399;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UwLk7aUX6eblDL5+ILVIy7EMM+xYUVYYERWPlhowguzjo3XQYAkSihclHOJ0jBZE8
	 kX/niZlh3Hpj8iVdIQRUfMS1FMjjrNKJ0gPAuqwJfvd7ENbvUdUvd6WvrNoE2jcXWl
	 Nvu9dSI9sHLK457S3hKaK/skYCaUO9yZRMZyWF2LNStIyVNmS3CtWnT2K9lTMv30LK
	 TGKtmkPHakzRIs/vsbKrU1cBFs8fC6IhqLryj5iqVsx07Uoe3PS8PIV8IFtHy9boso
	 S0ny6pXHhpAOIXAKz9DHbb3n0w77C/G//FiWqpZb1+Hx8bL3+F3q0UEMAnJW6bxAsb
	 4JFpZP0t8yr6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAF9C5B572;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:31 +0800
Subject: [PATCH v5 01/15] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-1-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=985;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Sw+OWK3YcWaJDMswc4oOvzoue3GKb6ZepbG6V99kpbc=;
 b=Um55I6CVH1x3FcJbngRYHo3gZ8DbRaJiyMXDx6AbqYHQ6ZCPaaBQ44jhg4oELVPsZ3bXgqO79
 b+i5I3R1XGmDvK44ZrYD92TWtlq0ieC2qjMGWtxiIdrbdXSZPpBZ8Pm
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Colin Huang <u8813345@gmail.com>

Document Anacapa BMC EVT1, EVT2, and DVT compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..1c1570143bd9 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,9 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-dvt
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1



