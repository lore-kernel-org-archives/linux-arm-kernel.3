Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D1FD004A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/OS8NxmVc8TXQa4Eqd0u+6Vqnw3Fkhim3WGjkAMleuk=; b=mB4mOMevwznZGUVq+lfswJEZup
	8rZmjjaGQ6v2MYCMzplwTBUYPMBBneSvV1uFp6rGJzlgTpZiOlviMI+5k20L3iGMccTfFd1u0lZh2
	eBKX+qpHOJtr0XxOEFAVzmdlJLfgEZznvQMIu++GT+quGRU8gzTFr708a0HXo3CiNiSilofptoJmh
	9qLibbJHTBDa/E7ROe3wzEbeenjkiJw7NPEWjr3U9QfUVcrqQxbszEXFMotgi9QT/H8v7pVvkHOZc
	LFuELoYA2YcLOwBynQNcgm6dpO5HMsBL3aQW8bg19F9ph4X25fI/TD7ZmdS0rka7nIDBQuuxjK2oP
	Kv0f02pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVTP-0000000AU0H-1ce2;
	Sun, 01 Mar 2026 01:19:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVT8-0000000AThK-3meq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:19:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5EA40704;
	Sun,  1 Mar 2026 01:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B29C2BC86;
	Sun,  1 Mar 2026 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327978;
	bh=vEG88Hyk00Tafp4vt7H+O1aYyWOVvOlo+WTwnXnHFrc=;
	h=From:To:Cc:Subject:Date:From;
	b=BFJUEOOTZKKH6agKey1YkwxxawmhTlHLzgRuRffnWcnAH2YSAZKvA39s0vVP1TVV5
	 GY8CFYRwW/y1bL4axXJbM+giBPhYh7zGlVl/R9jIHVjtbA3993qTSbPjgdsqhYFC/a
	 bxAndcPzVL4f/JaSx1XHVdSYWaSw2F8eoRb0DV7c3KiRmO4vYDsfzSfv7hrC/7FX9J
	 CD2VjoC4qtOU/pLOsDOjRUUrBVyDHCV/9GKNe5gXG0L/Hnh2r8E7puMgX3jRG88irE
	 BN15LkUTf8RWCzTqW7iV+xKMrIrJb1iXiy8oKA977HUdp0bgU7qHH39tGNSgxrxS+i
	 MJL9zQSW7WMsA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	j@jannau.net
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "arm64: dts: apple: t8112-j473: Keep the HDMI port powered on" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:36 -0500
Message-ID: <20260301011936.1674726-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_171939_031367_19AD0914 
X-CRM114-Status: GOOD (  15.09  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3e4e729325131fe6f7473a0673f7d8cdde53f5a0 Mon Sep 17 00:00:00 2001
From: Janne Grunau <j@jannau.net>
Date: Thu, 8 Jan 2026 22:04:01 +0100
Subject: [PATCH] arm64: dts: apple: t8112-j473: Keep the HDMI port powered on

Add the display controller and DPTX phy power-domains to the framebuffer
node to keep the framebuffer and display out working after device probing
finished.
The OS has more control about the display pipeline used for the HDMI
output on M2 based devices. The HDMI output is driven by an integrated
DisplayPort to HDMI converter (Parade PS190). The DPTX phy is now
controlled by the OS and no longer by firmware running on the display
co-processor. This allows using the second display controller on the
second USB type-c port or tunneling 2 DisplayPort connections over
USB4/Thunderbolt.
The m1n1 bootloader uses the second display controller to drive the HDMI
output. Adjust for this difference compared to the notebooks as well.

Fixes: 2d5ce3fbef32 ("arm64: dts: apple: t8112: Initial t8112 (M2) device trees")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
Link: https://patch.msgid.link/20260108-apple-dt-pmgr-fixes-v1-1-cfdce629c0a8@jannau.net
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index a05951e91a022..bfa959023a0db 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -22,6 +22,25 @@ aliases {
 	};
 };
 
+/*
+ * Keep the power-domains used for the HDMI port on.
+ */
+&framebuffer0 {
+	power-domains = <&ps_dispext_cpu0>, <&ps_dptx_ext_phy>;
+};
+
+/*
+ * The M2 Mac mini uses dispext for the HDMI output so it's not necessary to
+ * keep disp0 power-domains always-on.
+ */
+&ps_disp0_sys {
+	/delete-property/ apple,always-on;
+};
+
+&ps_disp0_fe {
+	/delete-property/ apple,always-on;
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
-- 
2.51.0





