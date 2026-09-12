Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87280C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8PVs3cb0umUtKOfPewi7kgORw+jmpNj/krhUR5Z1jg=; b=Yc7IpUhmcPuHBToze3rw7E8bwY
	eIZ2sY2x8UQVvnQ8qytCO9oZJ032qA/EOHySnATS3hT9p7yTeUcZ7y8DvR15xJ5InKoO3eg9kdMch
	043SUoP8HPIVk8ZjPcKQDBud/CvUaHwAPd58np8pTlB7/aS+IXBETyvgbQzXs1HAhudCQO+tkDmn8
	wqJTiOxbMEAf9BHAdDi8+OwFInd7Pg6wtFQv5v0PsUrLXC3owd5lpJYRD78iia0/tmCvWkU8EX3eK
	BFf3Z6/KO38EYdJYiz5XTMCaDAjDGhmzPJAnHXpXHRNYnxJuJ+/YXwgcK4ohXL735shvX+dTt1rMD
	5R6XaCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Nqg-00000000u5t-2U4C;
	Sat, 12 Sep 2026 13:32:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NqW-00000000u1W-4C4i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 13:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD90E60238;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E5F4C2BCB9;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789219963;
	bh=n5QACkd1zv3PhqXE3MIany6DDgK40aeV4SQY8yeovjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kMPb1eNAKy2ull0Kt4rBiyZNO9WrhVXXATUcsnauepvA8hwOaPV1JEvbRkFgRUYDo
	 ib9wUiWzHLu6xtkBebMm2vi6ec3YqPOEfZEBH2ylhFauf2dXeAU5wrwHR5r8MW8Phk
	 o5tcIfLZGYhTQNvFmKqaWd9QUCYUdrEqI+zIAzhBqjPaDpLtdpZYqOzKF1m6vDBr7B
	 LQohuqHPaZxdYOtRKHOp6+33lH5M9kBVaKKiR3cJJsp9ilgIWGh7AYoYGw9P2DYXt3
	 QOHHk+LMhUeuYH0aPEd4SndKOhcaPqs1tsiaKlkK1+ajXP7oXuzMo1nHF06EeWBr5V
	 12BrIDTKpMLTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF19C88E59;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 12 Sep 2026 15:32:36 +0200
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Free Mobile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-for-upstream-nbxv3-dts-v5-1-ead604dba61b@free.fr>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789219957; l=923;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YJnL8SVSS5jtnm6LBYWZbK3h+dEb8nY2DV6ueCzz3OA=;
 b=qmRFT5RpvWd3q46tYhS7mCLr27LjvwhGpawYwavOPxHiZMrNwHJmpV6pexi5F0y4Mr67j/h4e
 eTXs1KxxHNcCXdfMV2EVFsKvoFrCVUbrb8BoR7ItnPUiVjgoS+XHxGA
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e467da45cd7a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0



