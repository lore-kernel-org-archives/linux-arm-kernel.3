Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB5C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqLdBlsIsEJM/SSsfhFPRlA6cfthQReVJi/Nw1l3u0A=; b=gZsX3ktDuu9td8saDbAw/mC9/j
	8v+SlNr5DNQvHAGPYNux7BrRhF+4Rwjt0z0H+4uLNVsAbr5NHQSQHXj4cf8HIt9GHuFWUU8Xf85tW
	4GXng7ekKLKkkUl8iyGC+4sO4ZPupMdzAnuRoAkuutl64odbpB0KqtRuV3B4+ZK8zHIZMNmG9L9g8
	unoI0VJtevlFDxEJhge37VGxiKVUFEzCLf2n+6itf3rMcgHeyJWAtJOWfGpCNoA290QIe2mNEIL9Q
	DZyhdVDcuhVGSGBTlkwmjaqToLYpUyic5gc6krmFYmKXqmoLTaqBJPQKrViKW4JAlv17vUcL19bvW
	S1YYgopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn0M-00000007s0E-11dL;
	Wed, 05 Mar 2025 11:33:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplZW-00000007bKQ-3KXV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 10:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=gqLdBlsIsEJM/SSsfhFPRlA6cfthQReVJi/Nw1l3u0A=; b=sRBfGBuu7pTnb345DqNJwBcf9N
	q4kRmH+XGAlnXRMO6gLu7fRsPS7KgT6X73X0DwUctQILchDmMpjF4vJDawgLpMnNqFBwS+jFNt1Ml
	afjFCkMDjGNT4tJ0l/zmWkAae1TV8jmGZVgDBnbAYk4FuDJiiMMmPHfQFUmcKE2fQkD9j4ihBQQxH
	SGRA3Twf+QV5+r/VCv+joFobj7ZhNrr1UbLFNoC9OAni5Gqv/8NJn2yabdueXTjxkBSs467V1ixwq
	dMwQglnYTNptnnpr4Lo6x7ZUUzToL5jaFUjh3W7rG6W5PAYZVRg9ySdlXMCQsA23IgxaES1b4l2vz
	iJV4b9mQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplZT-00000005FRc-1gSV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8F1F5C6787;
	Wed,  5 Mar 2025 09:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203DDC4CEE2;
	Wed,  5 Mar 2025 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741168902;
	bh=1nIsRNc3Lh78MiadvQxVA9dZBYCTinDpe9nUk8DVt+g=;
	h=From:Date:Subject:To:Cc:From;
	b=X6hAhl49+hDCpkMEOjmGnpsNm4VU9eLFAEo3RPawtan9YFA9ZrZ8ycCxQ4+GERR99
	 qLZgiiJsnJ/IkxmALY+uBXBA53+mDJRfqIrKQ/57GCLv6Mn25Tb+TRm4ZHXxn74c7v
	 SrMlAZO4QdKfc5sf0txRVsi+CTrtZO9GNnJdAwLoTr1bSsjMveoOvp9vGWX2f1TR7n
	 RyQdUv2f8p+ogv8ZVC1zHDPMpY2cwkigS/wPI8X3KaqLAkN3dZCtIVNU4BpzV8Xavu
	 Oxv+nTyyH3WHQptgqe9L7oeZQjtepHBpFUNj9NEFIz7C+9QIWixEllvf76ZFX3yNbY
	 5kEf+DtqXcH7w==
From: William Breathitt Gray <wbg@kernel.org>
Date: Wed, 05 Mar 2025 19:01:19 +0900
Subject: [PATCH] counter: microchip-tcb-capture: Fix undefined counter
 channel state on probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO4gyGcC/z2NsQrDMAxEfyVorsBJqqH9ldLBVeRGQ2Mju6EQ8
 u8RGbocPI53t0EVU6lw7zYwWbVqXhz6Swc8x+UtqJMzDGGgMAbCYlKlIcfSvib4yZOHsmWetWD
 j179KceyJgiS6XcH33Ez6O78ez30/AL3L2DN7AAAA
X-Change-ID: 20250305-preset-capture-mode-microchip-tcb-capture-fa31550ef594
To: =?utf-8?q?Cs=C3=B3k=C3=A1s_Bence?= <csokas.bence@prolan.hu>, 
 Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=wbg@kernel.org;
 h=from:subject:message-id; bh=1nIsRNc3Lh78MiadvQxVA9dZBYCTinDpe9nUk8DVt+g=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOknFFkcyyYYzr5cwv16hz/rr9W/2cuLw/m6b1WFHOhr6
 vunLDS7o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjIGQ1GhtYdH04vfRIT6LrZ
 xPL8/qqTaTa2yrcTwloUEk29TeP/cjH84WCdeXSnU+Rs+YrAmUdfTtjGxygTz1P/weeDVJpIfmo
 WHwA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100147_689856_965E4B56 
X-CRM114-Status: GOOD (  12.48  )
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

Hardware initialize of the timer counter channel does not occur on probe
thus leaving the Count in an undefined state until the first
function_write() callback is executed. Fix this by performing the proper
hardware initialization during probe.

Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
Reported-by: Csókás Bence <csokas.bence@prolan.hu>
Closes: https://lore.kernel.org/all/bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu/
Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
This should fix the issue where a user needs to set the count function
before they can use the counter. I don't have this hardware in person,
so please test this patch and let me know whether it works for you.
---
 drivers/counter/microchip-tcb-capture.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 2f096a5b973d18edf5de5a2b33f2f72571deefb7..c391ac38b990939c6764a9120a4bd03289f68469 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -368,6 +368,25 @@ static int mchp_tc_probe(struct platform_device *pdev)
 			channel);
 	}
 
+	/* Disable Quadrature Decoder and position measure */
+	ret = regmap_update_bits(regmap, ATMEL_TC_BMR, ATMEL_TC_QDEN | ATMEL_TC_POSEN, 0);
+	if (ret)
+		return ret;
+
+	/* Setup the period capture mode */
+	ret = regmap_update_bits(regmap, ATMEL_TC_REG(priv->channel[0], CMR),
+				 ATMEL_TC_WAVE | ATMEL_TC_ABETRG | ATMEL_TC_CMR_MASK |
+				 ATMEL_TC_TCCLKS,
+				 ATMEL_TC_CMR_MASK);
+	if (ret)
+		return ret;
+
+	/* Enable clock and trigger counter */
+	ret = regmap_write(regmap, ATMEL_TC_REG(priv->channel[0], CCR),
+			   ATMEL_TC_CLKEN | ATMEL_TC_SWTRG);
+	if (ret)
+		return ret;
+
 	priv->tc_cfg = tcb_config;
 	priv->regmap = regmap;
 	counter->name = dev_name(&pdev->dev);

---
base-commit: 8744dcd4fc7800de2eb9369410470bb2930d4c14
change-id: 20250305-preset-capture-mode-microchip-tcb-capture-fa31550ef594

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>


