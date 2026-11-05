Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E75606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o/mQBS2h;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNa9+CKg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wFE5OccGT9k7Iu9igK8BTncgR6NdDYboc+wrbdQGo+Q=; b=o/mQBS2hYu3+DD
	rrOEWFSqq3aAqDCdrP0K24UYumtRZJyl72MAzVzDrqZtrq3pjAxRvaBmC0cYFN3BEKY709yyQP25o
	zdAH4AQgGXrMQNs+HsnXAZvxW8wbTxj0Uq69ZK0Xqg9q0Ud3RjGtf2GwVaeCtDYnbUwmq+/xBC9kk
	L1FFvLNbZwwea1dn/mmJt+UoW1A6vWnVeuA/Xx9+oYUA2j/u+BBf3CQUleTTjKlpHsNISaNS8AURa
	yZ3I1UtBSQWKb7+iHmnOdlMVeFhMlAuSPnpXqiZK/m+xdXRzORCjhtUCfFUdnSZgkeJKtcJ4qx0l2
	T5zJUSCUUzvC4gkYuELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62o-0000000AoZu-363Q;
	Thu, 05 Nov 2026 22:34:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62X-0000000AoQu-0Ofi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2F2040D90;
	Thu,  5 Nov 2026 22:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D191F0089F;
	Thu,  5 Nov 2026 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918076;
	bh=wFE5OccGT9k7Iu9igK8BTncgR6NdDYboc+wrbdQGo+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hNa9+CKgrefZrv1QfASZV+xCC+g6UJukrvZMgDY0b8maNLezZJ9eZyCY54Q+m5mM4
	 LsRCtGlpd49+LHMXUQQtGkLwCsNveavKXUcGwFMdAx3ke/anj5TJUT4CIHhx7hsL38
	 yqCxMO37x7u0fQ+HqKARTKESPeOBe/IOhr6P74zTkr99qJu7yi5vxYvdIYYDk4+LAh
	 ZG0D+EYT0Euvppdd/RTeS7liNWCytO7MsOy6rSX36QlWAuvyrGWRWfunvm0iRZjsQA
	 vi1aJ5Yh11Yr7zGcHoej4GPhh/SBe1mVAGztxLf9pQOee/SZVURF7h9KqIvyEKO2RY
	 5d27TB+uc5ZGA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:20 -0600
Subject: [PATCH 7/7] ARM: dts: arm-realview-eb-mp: Move "pmu" node to
 top-level
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-7-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PMU node is not an MMIO device and doesn't belong in "simple-bus" node.
Move it to the top-level which is the normal location.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
index 55287a2a0654..1805c00a90e6 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi
@@ -101,16 +101,16 @@ twd_wdog: watchdog@1f000620 {
 			interrupt-parent = <&intc>;
 			interrupts = <1 14 0xf04>;
 		};
+	};
 
-		/* PMU with one IRQ line per core */
-		pmu: pmu {
-			compatible = "arm,arm11mpcore-pmu";
-			interrupt-parent = <&intc>;
-			interrupts = <0 17 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 18 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 19 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 20 IRQ_TYPE_LEVEL_HIGH>;
-		};
+	/* PMU with one IRQ line per core */
+	pmu: pmu {
+		compatible = "arm,arm11mpcore-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <0 17 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 18 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 19 IRQ_TYPE_LEVEL_HIGH>,
+		     <0 20 IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 

-- 
2.53.0


