Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6800DC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=limCUGt75bwmNTfvqtXyS2z+fYmSt1DY4ZoNgftDlR0=; b=a6k/rmCjwxWRp4QWg1omkcNpLo
	YS7E0crwidhlo9NFwvnIPqPy49Iq1ezNYeVCbUj0GBgNq7vtZJbW1dAK6wlhTsXnWf2sJ1AWM/pTq
	iUvPWuOy9RHsf9b/F9GNErO22X1BJUhxmWvBFMd23/GDxGQeD4RPDhMHHtXnSt+GM2SHEeeOevbcH
	MNoxvGK3lVB8JBOkSkyLsLNCXrRAc7R22ZWSKYt69MTsP5QsJYW1bXUfMGl5sXOIPMtcGPx6SUhNP
	BfqnA2IA+i00aqz0/tkJURhmdqcL/pAWof/JmOmWf2Jof5w/LKaq4JKEYubPVDQ96VYCgDaWZsNOw
	SPS2T+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf477-0000000GgDQ-1phG;
	Mon, 03 Feb 2025 21:36:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf40i-0000000GfCy-2l5y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 21:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A64FBA41E14;
	Mon,  3 Feb 2025 21:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F8CC4CEE3;
	Mon,  3 Feb 2025 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618179;
	bh=gH86BnBn1M4iZA8c/LY0iT+xjsDYLG4Lpb3OpxlxBX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ViNi5+atd52ZE2v0na/nWMNohfRf5VMWshiKPTgLSEkgGjw1LZ7nzVD41O1hjsP4g
	 njZTdAUeoQ9KSvJwqn2rqtqwiIIMUn0Mj7/nkCwHFGp3MgX1/8RNXBIC7VSthXIVtu
	 t0m7MtdUlj1rgrDQXEUq60TeBAdjRrtYEZv8l8orFj0e25fY7bbCxkSltgrgJuUnOq
	 uHF6tCE+OT/drh+aumnOFYdIZ2T/lErOxoMLacLt0uAk6n34Bvs/aH/azIEbyHvoRc
	 5iP6zFmUKURefAzd1p7NLHr2l/GpcOXan2C5aYCLCn1BJywy7C74sycMpegqE/cHo/
	 uQf5wqyD+9Myg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:16 -0600
Subject: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all properties
 are defined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132940_772571_39C718F2 
X-CRM114-Status: GOOD (  10.37  )
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

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add a reference to
mc-peripheral-props.yaml which has the additional properties used, and
fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Please ack and I'll take the series.
---
 Documentation/devicetree/bindings/net/smsc,lan9115.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/smsc,lan9115.yaml b/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
index f86667cbcca8..42279ae8c2b9 100644
--- a/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
+++ b/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: ethernet-controller.yaml#
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -89,10 +90,7 @@ required:
   - reg
   - interrupts
 
-# There are lots of bus-specific properties ("qcom,*", "samsung,*", "fsl,*",
-# "gpmc,*", ...) to be found, that actually depend on the compatible value of
-# the parent node.
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.2


