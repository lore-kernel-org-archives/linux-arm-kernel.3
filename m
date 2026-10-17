Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DC5CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUVvl0xTk8oc+JnZwRmtiA2U+4p/XpYYEqyGPQspPgk=; b=iLGYwBuMh0gYqdbCiCYY407FME
	WlgY4M6YnTMeXkRwVwdVGBE68fVTqRu9CtBFJlieUIvrx8RBBuD6weEL/esQwink4j8CFYp5ffgE1
	5Xw/cuKqa1wEf8LdC/GGhETWu/3XngqScFHGNXv7M7Qa04iYHGzIWuo3LusXOHiYUHmbSy/yn6APV
	SCrh2449aop40wcg0+xPM/SlcsuS2tQA15QJtSQXc5uMxHWNYSAd+By4+j8p2J3BT+qgXa0Y4Bkne
	4aPUWfpbsST+NN0xZGV05c/ozi6olFPQWnPqMkPk1Udyxzyax3WcKnFpvQ2rkZD/SB+YzMwwQM08X
	VVv/Hybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8n-00000004Y7J-0RXz;
	Sat, 17 Oct 2026 07:47:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8d-00000004Y49-1tVY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E117360A9D;
	Sat, 17 Oct 2026 07:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C321F000C4;
	Sat, 17 Oct 2026 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792223250;
	bh=UUVvl0xTk8oc+JnZwRmtiA2U+4p/XpYYEqyGPQspPgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W7qcEaXQPTvyhg6UU8mGVaag88yAnJKJt4zGEum+FVP1sTBqy0zA7Tm7vRUgeSpuu
	 eARZpyObcvTEhVlPJLlj1NXnJ6bg8Vy2E1iugFzL7vJ7ixiaWmmCCIpRTTtBDcilkG
	 ST8G9v29xcI0bygdbv5fQUw7iX1JHLQnwq5LgMDWmzLks0wqGayWCR5ADG1chOfYMX
	 nXFv67fG92a4fyQ3ecxr3JDT8kj8236lpRvw6WOQVDOjTFtudDQdjVr3imBz0+jV5q
	 ztiQZyzgZwYB3z1R6zHmPZt0on+FTalMerscUsZy++nSItMhViMxVPOxfJ1LrGKwHz
	 AtxzwhlDhxEiA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 17 Oct 2026 09:47:20 +0200
Subject: [PATCH v2 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-3-bf6b4b374b6e@kernel.org>
References: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
In-Reply-To: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
not provide PSCI. Chain-loading mainline U-Boot and starting Linux with
"go" does not install a PSCI implementation either. The working PSCI
interface in newer GenXOS firmware belongs to a different boot stack.

Disable the inherited PSCI node on this board so Linux does not issue
SMCs to an interface that is absent. Remove the CPU PSCI enable-method
properties and use the board-specific CFE SMP operations. Describe the
CFE mailbox in CPU1's cpu-release-addr property. Keep both CPU nodes
enabled and leave the SoC's PSCI defaults available to other boards.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index 6cb221dca0ac..1b85e382c70c 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
@@ -56,6 +56,20 @@ button-restart {
 	};
 };
 
+/* CFE parks CPU1 in its holding pen and does not provide PSCI. */
+&{/psci} {
+	status = "disabled";
+};
+
+&CA7_0 {
+	/delete-property/ enable-method;
+};
+
+&CA7_1 {
+	/delete-property/ enable-method;
+	cpu-release-addr = <0xff800568>;
+};
+
 &gpio0 {
 	status = "okay";
 };

-- 
2.56.0


