Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE75D232C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xWZRZqU2NT7l2kzS4WE3JZDnP0JEazfG1jFMV8XZ8ts=; b=usoTfzYTsvib2KWbYfB4AUCdkJ
	SjF9Uh4OAyiARB1SiLLrfLGyfoaWQ0LVM8O3YysaqN7ypH8K+cwcyuZhLll2JclduA3uCjjqnllM6
	K5GBk5hExaTd4el3OjvH1v6wq3reO+9mBf3g/PvzQAppOg/pnI2SN1jRGSJMP2ztvAHGOVkKVBnKi
	wX7G0lrU2d9R89XZHK3RDBAdmbm0YXsnhBPi+8qmilcW2Y29zfVxbOq+magK9TQENuHgOBk+Q8qQb
	OANL4TFnSzMBpy2UJmaVfg6vmbVA8Udop5er3OyveYgSMG6SX3LSZgbr+HVBWghozhmyFa/N/PN8k
	3r9aQJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzFU-00000000zRl-2IIQ;
	Thu, 08 Jan 2026 23:17:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdzFQ-00000000zRP-2aW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 23:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C658443BD7;
	Thu,  8 Jan 2026 23:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AD8C116C6;
	Thu,  8 Jan 2026 23:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767914215;
	bh=AAVTvmmrCdvn6IvsaUM/pSKro696u24Sfk+5QKOS748=;
	h=From:To:Cc:Subject:Date:From;
	b=AAkG9ov290kYohM/aDEd3UqNH0iMjqEfCWbfzrK2DVu/460mmm3ZzIrrwcEIpwBrP
	 6qLoTBunfmbe03N68WQBr7fZtNw3tPKIFyn4+GCctdps811iH2X39IbAw5Im+Z78md
	 4anjldXUBsxKiXfxLcbgYCyI73+Qe6KmGU95cky+E/FEBAJkQeMy5LKcgtJBC0pbE8
	 RzjKS4NtXV530b36D8raD6GI30whUwfeXBOn123KtE7gr6wkqk04bt45XP4Da/A2bK
	 x4Q9kdgG/Tb1L532Id+2l8Ko0aoDefo7goHTtYXxs1BuXpXgWao3CC/DsytV5m6QAP
	 R47k4Ooe354uQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop unnecessary "ranges" in partition node
Date: Thu,  8 Jan 2026 17:15:58 -0600
Message-ID: <20260108231558.1422454-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_151656_706334_5F8FDB20 
X-CRM114-Status: UNSURE (   9.51  )
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

"ranges" is only valid for MMIO addresses as it is used for translating
addresses to CPU address. Even if a partial translation was supported,
the DT is incorrect here as the nvmem-layout node would also need
"ranges". So drop "ranges" and the associated cell size properties.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
One more dts fix to add after reworking the partition bindings.

 arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index a5f9ec92bd5e..c6d76ba04903 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -146,9 +146,6 @@ partitions {
 		partition@0 {
 			label = "cferom";
 			reg = <0x0 0x100000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x0 0x100000>;
 
 			nvmem-layout {
 				compatible = "fixed-layout";
-- 
2.51.0


