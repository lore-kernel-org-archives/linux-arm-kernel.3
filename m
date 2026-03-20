Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD410987B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSCUaGUG6qLqM8jNQWBiQPOrc2sIFyf5vCxYZfpJess=; b=4/WQXqoCK71kGUKFMSNYxAlpv9
	cTH1vTjoOWgvJZL+lb4NJm54eZ+yZRHh8LcdDdJN8cCswLkAySyleYEuiclEwHlP3RGzLYqlUp7hp
	pyGWUjTEQ/bCh6h0jLTSDTHjckzPtxXkwHbzcvE7ZFUVFA82ZRfO24KzrTlo4raOLXP53ORSiaoCu
	htEwdufggwAEfabfSIQZV4Ihd7j/szIttQQ5F2mN99y08LgwTycl0oPw5Su1OmgXQN3nf35l79DG2
	Tq5GRgeJm9Qjwsl1d+pfUVLkFu0BYzfmIn8FWcVCJwPKTGkGWsXiMHhtV1s3XjR3xhCW1PW9bMtb3
	0U9BH72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0g-0000000DBZR-0CVU;
	Fri, 20 Mar 2026 16:47:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0b-0000000DBVt-3cpp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E44260154;
	Fri, 20 Mar 2026 16:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC66C4CEF7;
	Fri, 20 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774025257;
	bh=WdWA2hrSgUxDYtn4CcB4fFRlpQtCztod+x049Hswyq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=htEpj31aiKAuapJGqKm/+82sWRo93k2qQvg6dk23Id2j0YXbzHjbKKYAOH4410OAi
	 jYQ/FJqdrZbmGkeBhFB1fcHNPpBu4rkQaBf/F3t5+DNhFtxfH/GZTuXihRWeVPDMd2
	 R+2SvqgC1xd5YiAc6BUwr+7wOGfC1joW1Ug6ghdNWsPMn33JXc57OPBf0GlWN3M5Wu
	 Wk9nE/3B9tuCor7kl+LYZXh0JC6XGOPjIlLFvx1cQNMj8BZDBWhSIndcf/5dLRhSCQ
	 I5tlmEYTnOEvkkaMUXZRqnFrsSfqc0gbl6DYl3dUJqONJfHEFshubD51S+O4xg7zJf
	 yTPhKB/0r/mMg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Mar 2026 11:47:15 -0500
Subject: [PATCH 2/5] dt-bindings: npu: arm,ethos: Add
 "arm,corstone1000-ethos-u85"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-dt-corstone1000-a320-v1-2-a549dfcfe8da@kernel.org>
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

The Corstone-1000-A320 platform contains an Ethos-U85 NPU. Add a
specific compatible for it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/npu/arm,ethos.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/arm,ethos.yaml b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
index 716c4997f976..d5a1fae4db9d 100644
--- a/Documentation/devicetree/bindings/npu/arm,ethos.yaml
+++ b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
@@ -30,7 +30,7 @@ properties:
               - fsl,imx93-npu
           - const: arm,ethos-u65
       - items:
-          - {}
+          - const: arm,corstone1000-ethos-u85
           - const: arm,ethos-u85
 
   reg:

-- 
2.51.0


