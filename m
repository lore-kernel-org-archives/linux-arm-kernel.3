Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C03ECA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ7Ak+K0RCX1w+BI+URSrXPSy/fTBAgTTpK6SW1U0ik=; b=XJNrQx8BzVrSUTqnLi/ICm2tQf
	D/XRczgag49DLnideE6j+qdGNWQ4WAuDXixv57Eq9Po/Fnmcab7d5aW8frHmbcmEXtf4K8GdiYogv
	X9v9kjkCUbVj68k6vmW7qkdeWcs28zkukilgpNMnF53/5FWLBnYaklBIAiozbRZxApYqY8P8MnTIL
	oixpIiMPXJo6i0zq9Bqni3TKoFCuEtgfmsQeArzm12Nup8XtqATvh+CIbjHo3EqRnHz3CuDSmgyGk
	2kTE340Ml0EHUiw359cdiYSWAt7K3/PoVrNpzuDk16sYVL/fPZjA3y4vAaoGddqV7NmvzK7WY5Dmr
	Xg3CcsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB0d-00000009tB6-0EKQ;
	Mon, 12 Oct 2026 08:03:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB0Y-00000009t8B-2UvT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:03:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B68840534;
	Mon, 12 Oct 2026 08:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC701F0089E;
	Mon, 12 Oct 2026 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792222;
	bh=DQ7Ak+K0RCX1w+BI+URSrXPSy/fTBAgTTpK6SW1U0ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FMEiPw7Fbes+8iki3JFyis7J3DfzyjmXP5SWzBtlot2TkNh3tt0yImdU54MVui70G
	 2iqkwhXtPD/3/CG4zVzq9eN9kmMCyMzdyaZMdA+y+7ETXMbxTHW79lI+/TJGB6ihHd
	 LE7vO4qTMbE94EQ+Wk/d4qMEjdFLEv5dI2U+4br1CE/gBXly7cqtUy4PCndPKfsksv
	 51+0wGSbkO+x1Yg9yUzHboisGs6YkV+lKeW/cly+3baMlQg1QWMN+es79CIhvD1/oB
	 /fIzrMLsD5BpdHHs4KAqkQdiwXz8CcWiKFCtckv5Y1EWp4d/VHlS8xH4gVyIhNAasi
	 B1nJbT6QiyOPw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 10:03:27 +0200
Subject: [PATCH 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the
 XG6846B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-3-a51d4afde4a7@kernel.org>
References: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
In-Reply-To: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
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
properties and use the board-specific CFE SMP operations. Keep both CPU
nodes enabled and leave the SoC's PSCI defaults available to other boards.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
index 6cb221dca0ac..bb467320e1f0 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts
@@ -56,6 +56,19 @@ button-restart {
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
+};
+
 &gpio0 {
 	status = "okay";
 };

-- 
2.56.0


