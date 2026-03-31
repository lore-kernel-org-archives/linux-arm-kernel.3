Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298FF109B46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8XAogAQ0R+MTqU5ylu2Jm9t2irGAufgO8/6BfhUgGGs=; b=EIXHZzbgNig7LqsQoaYgGn5Yvk
	bHT/JnncytSz/0qQgDv3GD+ps95XkJLL6WxWrZomtqFFqacHE7S7hf+tbK0lCbEXhwtcJG4fPge8+
	fDMxGgXFMbrzVl8++cI4QGO/JLkjnXs42bXF6YvaRJcdLsrindZzR8bl7vF4vr9cJh40D0oByxKq5
	lqlP+LiiWP++zMIGxKSDqwpyIbXa7mYQDKJlSxuHZYKlhvTW/hHjTVllj8zM6Fda36SX79zN8PH7l
	3e/x2sHryLi2OMAFFxfx7EuRunJyFZe4vdBXS3rrnt7USup92MbyUT1Ofrc0okI38CnnRWssXhxQC
	lewtp7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a6b-0000000D6TV-2LB4;
	Tue, 31 Mar 2026 14:30:10 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a6Y-0000000D6Sw-3kXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8XAogAQ0R+MTqU5ylu2Jm9t2irGAufgO8/6BfhUgGGs=; b=CqEFWxHrEilCwY7+bJZ+AvtmEs
	9lcu1ILBJ5Y6jQBhgKzaVCtYLH4oKY/gg9CXJFEpWepPcrdPFaqd0gLjbIzdr5Dr8AX6t2kLfVGAa
	lOM2QVSYCVCJKKgP0nfjwIjtkW2xlXM0z3BUvuz0/rEo8l2hezAJiCBwS1f7TFjBq+BBscVlhjdrg
	STsRfTqDE+vLk17ueZHRl0Q2FWD6FjU3vWKrrHT0ELmAkAMmI+mAtoCSEhlOcyzdOxVfQD/A24Y0I
	jVAAQGQhfqFzTDKwkW6aQmTQq2E5O1vuZYbtH6NxCEIjLPIbZxYF1wxSSc7JMN/wNS/Gd+qKDV0s5
	0dawqAVQ==;
Received: from [115.246.246.98] (port=23422 helo=cypher.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1w7ZpE-00000006wgO-2MNT;
	Tue, 31 Mar 2026 10:12:13 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: nm@ti.com,
	vigneshr@ti.com,
	linux@armlinux.org.uk,
	ardb@kernel.org,
	ebiggers@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	khilman@baylibre.com,
	arnd@arndb.de,
	geert+renesas@glider.be,
	parvathi@couthit.com,
	tiwai@suse.de,
	kory.maincent@bootlin.com,
	andreas@kemnade.info,
	dmitry.baryshkov@oss.qualcomm.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	danishanwar@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com
Subject: [PATCH v3] arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x
Date: Tue, 31 Mar 2026 19:40:54 +0530
Message-ID: <20260331141124.1811313-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_073006_949130_62DB6BD0 
X-CRM114-Status: UNSURE (   6.70  )
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

This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using
PRU-ICSS which got recently merged and DP83848 PHY driver to support
TI TLK10X PHY.

Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
Changes from v2 to v3 :
*) No changes were made, only the version was updated.
*) Rebased the series on latest linux-next.

Changes from v1 to v2 :
*) Addressed  Krzysztof's comments on this patch.
*) Rebased the series on latest linux-next.

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..13362286b111 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -149,6 +149,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_BRIDGE=m
 CONFIG_NET_DSA=m
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -288,6 +289,7 @@ CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_ROCKCHIP_PHY=y
+CONFIG_DP83848_PHY=m
 CONFIG_DP83867_PHY=y
 CONFIG_CAN_AT91=m
 CONFIG_CAN_FLEXCAN=m
-- 
2.43.0


