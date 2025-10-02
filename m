Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3A4CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdJ4NRck8LMRjBLVH8p+BhUfYW1R+ESVuMytAA3z0hQ=; b=dcGt9SbhZIAMJY9geh3HazVjjI
	++9ucbz4KBG3faPVntPm9eZXPVdsHwKCPP/r7eexq54MmP0FXTf0L8bdPRJwuuCRLpS/2Myt4JK/g
	V5u1wC62Rwb5FDS7msLvLYX3oSr6IoCT378txES8RfwY5BiDhqbSqqQBmVrjHobs6JGBZf27tEj2b
	cXH2WlfdqIt0jemQgBlZEV058kbLeB2EPLXxipMPH5MrizotSTLyq00GPkMg976QmezytZRXoK1Jk
	9cyoaRziLVCZs2JH0d38dEx4bdyH4DY2FkS71TJNVQuVY2eBdIIZoQq0xBUBO1ADxLAyXo/dKm2IF
	gPYtl2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUI-0000000Ach1-3Vac;
	Thu, 02 Oct 2025 14:40:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUH-0000000Acfq-1IWf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAE1F60300;
	Thu,  2 Oct 2025 14:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49832C4CEF4;
	Thu,  2 Oct 2025 14:40:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/13] ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
Date: Thu,  2 Oct 2025 16:40:30 +0200
Message-ID: <ef9e56dfb55da092bdc489309309bf4262651042.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

There are two identical interrupt-parent properties: one at the top
level, and one under the soc node.  Remove the latter, as it is
unneeded.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r7s9210.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210.dtsi b/arch/arm/boot/dts/renesas/r7s9210.dtsi
index fdeb0bc12cb794d6..2b349b51003b58f3 100644
--- a/arch/arm/boot/dts/renesas/r7s9210.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s9210.dtsi
@@ -52,7 +52,6 @@ cpu@0 {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.43.0


