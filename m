Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95463C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o/Mo7PEZVnBLaRHOpCeyBG7g5T7BpBoFkyQBh8RW7I=; b=UKLiYYpV9dEht4cZE2OkeWoDBb
	53TcQGZA84X+YVtUn9+cZWuZ/K9OjThujALyVn8stlpKKPOETVB1yFuXX599wCpMJK0cc/DuXAWT6
	0k2YOLL4D2LBXec16UNyY8FMxAmm0TnesUQ1rbimwz8zxJKD/GobPwNWEzvuS5U1w7bpbdZQeLWOn
	DwHQIuHFaYdr+C7rNpEvRr1OZYAnYjtzu1Q4Et1MVPQA8cbyIQmjKZcJIWRDfPKhTKZAhxaYXGz9F
	6gBa/VWA2WJ4n8JJ7CCIYLK1TSuF9IfafblzvKY+djaA/RinaLXdhhBdaURYAwwyHFfxcutWgcDUj
	L25qEc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyJA-0000000BQwf-0HOd;
	Fri, 31 Jan 2025 21:12:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFw-0000000BQEp-1gJa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1897BA414E5;
	Fri, 31 Jan 2025 21:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE3BC4CEE3;
	Fri, 31 Jan 2025 21:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357731;
	bh=hMG0Y6gWueOlmwyswPIHvrcICb1asfhtGWiaIHkDqUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IvC+KNEBpSzkQFiGkETJZRvRtqGu/lYPn+oL2jh8sNk1KplgaDB3kE7AD1t5bKOOx
	 s3JIYKU55/SgRdAsP/wFsOG6PCHPRfAShus+fZsKyoyUaGagWiL9UuK6NGvtwPcY6W
	 zQZP8p6wqRlimNfziZq5T0SAfd4HC4eW+SAitPP50bvLn7Yx3VMybUR1x2Yknty27X
	 CxnKgY36aDzyqhwQzxnRtOVzfHHj787rmMn3kSY4RRfs0nxkztnnzKR420vp6J4ZwU
	 Xy7ANee/jHDwm0cAsgAUfYLFms9CEaUcTpBbnHHc6YsLl+OzzY46+98JedJZ6PGDPI
	 pGzbOkIw3W4Og==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:25 -0600
Subject: [PATCH 1/6] dt-bindings: marvell: armada-37xx: Add
 glinet,gl-mv1000 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-1-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130852_505066_422DCBFB 
X-CRM114-Status: UNSURE (   8.00  )
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

"glinet,gl-mv1000" is already in use, so add it to documentation.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
index 6905d29f3108..51e1386f0e01 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml
@@ -18,6 +18,7 @@ properties:
         items:
           - enum:
               - cznic,turris-mox
+              - glinet,gl-mv1000
               - globalscale,espressobin
               - marvell,armada-3720-db
               - methode,edpu

-- 
2.47.2


