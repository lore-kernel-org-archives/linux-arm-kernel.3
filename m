Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9932AD1359C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rUyDx0vuklpgjcam5pFybAYZ9WYDYJD93t6vy8jbVY=; b=lniTDUMMysR/FP7mC1VlVWnTSL
	34RR9xuD1GW2KxuUH/I2fViNSF99JirIGHIxLwy7Oz0Ej4iwrd79Awm4MnuJblacOpe9sUieLoKbJ
	4lhOj77MVZ5DvVvjeh/clsbPbhJZN1D+/z/nNSMv2r0vakO+6bIwa2J1LNkpY1OjjAQSXa+vb5wad
	+Ev4nbDScvhlMK/AX4APbgMzPScf51NJVPkDnosda6v0vIqgci68qAumtIpTEPcll88/Lm8o8NMDt
	kvxbguxEfWy6fTDC9Cfv9dDe0O4ViuJAexVFm5ZfjBpSf50Wcc7RzRd8BDArEhKLxLLnGlSdew9cB
	xI4vO6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Od0-0000000Ahpz-3ZGa;
	Mon, 28 Oct 2024 12:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORw-0000000Af41-3Elr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9CFA13D5;
	Mon, 28 Oct 2024 05:02:49 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC5A93F73B;
	Mon, 28 Oct 2024 05:02:17 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 6/7] dt-bindings: firmware: arm,scmi: Add missing vendor string
Date: Mon, 28 Oct 2024 12:01:50 +0000
Message-ID: <20241028120151.1301177-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050220_875308_A25A3593 
X-CRM114-Status: GOOD (  10.61  )
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

Recently introduced max-rx-timeout-ms optionao property is missing a
vendor prefix.

Add the vendor prefix from the original committer.

Fixes: 3a5e6ab06eab ("dt-bindings: firmware: arm,scmi: Introduce property max-rx-timeout-ms")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Note that this fixes a commit that has been merged in v6.12-rc1...so it
should not present any backward compatibility issue.
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 9d6e1147f9e9..e331da4d606b 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -124,7 +124,7 @@ properties:
       atomic mode of operation, even if requested.
     default: 0
 
-  max-rx-timeout-ms:
+  nxp,max-rx-timeout-ms:
     description:
       An optional time value, expressed in milliseconds, representing the
       transport maximum timeout value for the receive channel. The value should
-- 
2.47.0


