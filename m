Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B8C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Va4MpYmnsWUKI1RsgHH0AX/wGRzl8dw6JPvOAFcqGc=; b=RCnfRu1vieAV3Ih+YB5lxQz+EZ
	uv6oAqDoZEiuI4D07ka7S6DMU3sJhslWNLKb9CHbn0Ytik1NKnrwRdHrRfPan4pyM7kxih8D3bOyx
	H6mdXeQswQbFcgiVWp5KJWSo+6NQccJPVES3FIE9xKGMDmFtjvzxvpbKtUdB8Wt0J9ESngQbiRqET
	c0M1ZDU4SRYZr4b7SLXNuj4Fz9cnjqpZG0low9PKlMVhgXVgqZ2jdZwr5s34iA1Foj9Yv9vpL1WPT
	nuPc6N6sLJlVBLePm3phxY0oC+XRPkzc/s+snLTRYcmJi6v04h80BP0B0wHEL0gJZL99Wb/9GepuU
	n07ohEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N0W-0000000Cbjg-4BuT;
	Wed, 09 Sep 2026 18:26:53 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N0U-0000000Cbj7-3hmy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:26:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37E28102998;
	Wed, 09 Sep 2026 20:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788978404; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6Va4MpYmnsWUKI1RsgHH0AX/wGRzl8dw6JPvOAFcqGc=;
	b=hjlKBDq6eW3la8lPRrCl+CS3pl3w5YviUNQDs1L3T53SqWMkUAvAYx3vjNFMGbiC53iFVU
	LeTCzWQydXrR1zeeAmALYaEsi9ZM6BNyfHEL6vXK3f9nIhS9LhqwOtpG7yMFX1V/CBQE2a
	uwo05S+16R//9hNPzNJ/Jnjnudr6RlO25G/U6zAmT7H9fYTbAsFIMxA2EFjTrtvZQLD3Pt
	TGYx40cVpQwbxmL1emJ1isxgKN4iQjucD2JpndJjOV9PlVMg+c0Uh7Og2u9rHGU1WPTWHG
	gTkQzEtcVGZM6a/AgiCBW4coXougUuc6otV+iBjXdByn4G9QDKpT0CWV14XLmA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed,  9 Sep 2026 20:26:04 +0200
Message-ID: <20260909182641.165383-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_112651_068896_CFD19823 
X-CRM114-Status: UNSURE (   7.16  )
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

Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2b35..49ef4e0c68501 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -44,6 +44,11 @@ properties:
           - const: xlnx,zynq-zed
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: ifm,zynqmp-vhip6-evalboard
+          - const: ifm,zynqmp-vhip6
+          - const: xlnx,zynqmp
+
       - items:
           - enum:
               - xlnx,zynqmp-zc1751
-- 
2.53.0


