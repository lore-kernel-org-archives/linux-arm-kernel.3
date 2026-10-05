Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84847CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=; b=0V51dgsr6LZpiYIb4naDu6OjY5
	ERKR6lds0HnB385qpBVl2jkfbIHfvyhlTUR7pnv3Ny1R6GoZrD8wJgwRz2+gYQGpRzL3PwZwI9T9h
	Q/DYmj1MYn6gxJ7kkjLrqnjnm5jJA94zwa//FACj74CtIi00+L1P4X+9CPWPrZSkvlWokdB0qRmZt
	9pcKAgHGFStnoybsqzfbxfgtDLOxnK/nkEacDx3CoGycgwRWBDE8efmu4ypMh+Q0BI43hAyyLd42Z
	vLyRyJXQFR57UTBcMus5dvrEwaSDSLM9rC9om8VicnxHPfpyHnT1Rwvb/AEMr8d1Q8i8afael5Xfq
	LDq9CbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmYy-0000000Gvbh-1F4v;
	Mon, 05 Oct 2026 17:33:20 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmYv-0000000GvZd-2eLm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221595; bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tB41Zp/aGVaqqNc/hL+ElXNHNdPL4eLjJ6V+9zaPYXEANDoy/rw7BoO9A0XIGVh5B
	 qmvSWX12O+yaXFySGFO9y43O0/rXiNqJWNnVxVf7nVwEY8XBlBmhvln51ufTYrcPtV
	 I3v5qH7phJpNUDXmW34gYILm0Y6uk80xSfMIdCxM=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221592tgriulzwz
Message-ID: <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>
X-QQ-XMAILINFO: NPa98HB0c72N6mKWPBkJHsTZnIIWm+8XJ+0yQej+3GaFYVus4aT97VRnhNSFs5
	 63ScrPHGQ38HJDljaN7iDYUC90pYwel35V+YfbwSYbmYixYbH4ld46m062aG/CrLY9npbw25RMzc
	 1ov82jxNCod7EKBIGvjh8JqysfDRWjKEUo9mWyMRMtJ+qq3OrkzQS8CHvY2dZwQHcf+21WmIiGKO
	 MjKPmrqkOuEuHZScGAWhW3F6Z2o24k17tgMD3ujj59RYv3F3612gtK4+HW6/bHcYcTcPu6BUOVGI
	 1nyVmM73fgw9+1BXEreVvJY2cXpSks+lYFLc742hu/K89CLHw9kUHPAjrXIrvfnKq/oDT+Kjm35j
	 Cg3VarSCdODgmAJksx2jctizuFfPw5p1Im3MTnYxt+f4QlAmqpPzk5RAX3C5LlQ6bsgoOvWzqIcs
	 WWA7eN8em8/RvOgjTuLYgsjtAA9b34TULk+BMdi5HJKocHGZ0JdNh4nZenV+KNF4rH4mvAXGCSrW
	 +pTABPi5zuxqJWHvWLE9br7VEHLD8oUJ5pm7IxB7DrOyUu+Xjf9iWr3ybV5XnHJqDsAPddp24MU8
	 hzcd+7CGey9I1fyXVJfeWEe7HTRPKRmiGIICRGs10rBDbgSJr/tvamlkiUM4cY5slyasryBFuBlP
	 tgeNJH6QEhP5iC0LmhWSVpIU/TnwF49+Bv2rQPe1/dD53JGjzW5sC5FJeyUtneewivyWvRhmpPpC
	 Q4VUZaUhrp3r4a6OWZIyPRFWLWfSWORzkfPEnZAuThK9At0gnvMKZbPuNZBiWd8SbvP2vO7jG70E
	 gqPAS8nnuJ3PThoDh9zic6dwpBbz8X5q7sSsKhfcLEREo2RGrnWh2nh9uzQdjvS50NK3nwwdrk9a
	 0QZ4/8uZ32WfuHGLKmSTbwvuYhvOU+E94WRqvKcceVlWcyb73WAC8Am1VYPksKTuo+ritiMVvRv0
	 6FEPEMpvKV9tTz3Snz+KCg2iPf0maYAknc2uK0QRkKl+oTkhaZIcRXIi1BBRcRQoB+c0AWd9yhPP
	 rc0ETX2TZLWFESSAEFxvaGd19q7GUiyAIxF7ZRcxt06FXpPL1gpJ/JbS2tYJ7zU72I2LFqJa5/oY
	 0nXtsdNOK42z+FoF9ak4tyKwF4PnBG8owbMF4GV5BXt81as9DKyf8aAF/KXbkKSCfuvEQ3
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:33:07 +0800
X-OQ-MSGID: <20261005173308.710986-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173308.710986-1-2254650260@qq.com>
References: <20261005173308.710986-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103317_981015_0A78697D 
X-CRM114-Status: UNSURE (   8.45  )
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

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0


