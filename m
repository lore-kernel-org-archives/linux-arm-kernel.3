Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0208CE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCrpYoPJ6N33+Q2Y170te2pYq/gHNunbssEixAmTtTg=; b=aqfWvq1MZr8/eraaFNWf4JpFu8
	FEFJ9LKPcg8AYIC7zgluAnzwrK96pKw2iZWfsH7CJG/NHOeXfdtaD1TNdGBQY2h3p5L4NruDgf43k
	F1EMwhsRK4uFYkhvzl+xovO8GN0O5OR+sX1xaq9/1s+YX6Fpy9yqKQodHh8Iilf5uV4hZAH+1Th/o
	DNZizzKGCUfQjaYeeWP+7s5gEsUM0ZMxS2ZvYv5n8nKocLG+vd9qlW/WJOgbmoomapuQX4gyExLva
	XiKkQsUqGJvthfkRD0lZ9OXoxn11xvkB8htdPGbGc6Ga2305EQmwJk5V72mXoYvT9Pcv9KEEcqFV9
	wmVxhfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBNk-0000000G1vQ-3Nic;
	Thu, 05 Dec 2024 12:55:00 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBMi-0000000G1jp-3hmc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:53:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l0ts2D00M3EEtj2010tsVD; Thu, 05 Dec 2024 13:53:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMd-000LOd-Pq;
	Thu, 05 Dec 2024 13:53:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMe-00EQDL-Gf;
	Thu, 05 Dec 2024 13:53:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
Date: Thu,  5 Dec 2024 13:53:48 +0100
Message-Id: <0a72c67991828784066f76b61605d2f7913a353c.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733402907.git.geert+renesas@glider.be>
References: <cover.1733402907.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045357_061930_7BAD5362 
X-CRM114-Status: UNSURE (   8.88  )
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

The White Hawk with ARD-AUDIO-DA7212 external audio board stack is not
specific to R8A779G0.  Hence rename its DTS file name to drop the
"r8a779g0-" prefix.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                          | 4 ++--
 ...ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} (100%)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index df9ea5b2e20818f4..dea812ba55f3132e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -86,8 +86,8 @@ dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-cpu.dtb
-dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
-r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += white-hawk-ard-audio-da7212.dtbo
+r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
similarity index 100%
rename from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
rename to arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
-- 
2.34.1


