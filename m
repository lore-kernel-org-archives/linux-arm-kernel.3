Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52421C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep5BGf091hcttCSVWbef2Ogcioq4Q0PE79D6mQqQPAM=; b=CDDskw0VYnvyDMdLHiR+NDoA+s
	TpE2ZvRdJkWdn/RUC7XhUzMQfsNYzfasU4JOqAtPfw+8fSnA2dooESIBHa121aff3ftpJ58QSbcqo
	ZnIbWeqGlQIK/r+FO69D+WIuacSFep/UiUJ1PWTShTsyzhl9AA4vei79of6aJC29e0C/hKytCfcK0
	4QJHpVP1orEalg6pRHiSBcAHTk4wirRvkV2X41We8Hg1PaEnbQAHftLkSz1WpEJffkHwTlCbnv7gv
	q8hQYNTMjxCHhnu9c++pvL+BICU3pQ/GM8C7r6C/HMa9Knlj1UrMHXJ0bb443RciojiNQndHKhSQf
	HSZavsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9P-00000007MYe-1aPs;
	Wed, 23 Sep 2026 07:12:19 +0000
Received: from mail-m10313119143.xmail.ntesmail.com ([103.131.191.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9E-00000007MQJ-3YWa;
	Wed, 23 Sep 2026 07:12:10 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed74ab6e;
	Wed, 23 Sep 2026 15:12:03 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/4] arm64: dts: rockchip: Remove cap-sd-highspeed on Rock Pi S eMMC
Date: Wed, 23 Sep 2026 15:11:36 +0800
Message-Id: <1790147498-47766-3-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa0cd1b74fb03a4kunm59cf9035478c9c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQklOTlZPT08aTh0aSk
	gfTE9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QWS0c2YZjh2gXKXjMWLzuWAohzu1KkDlDzdqREthlQhWfqjBRGRZfHE2KGglFEI8TsxKe/Yjw59w2yWSS6JftFrJlFS6WAmUn7e1bZ60Ys3n9MlxaK3zEuXIKnh0TAXeaD0e89CxeiyrnvAI7iufNB2MPMvcSstlp/R5MhXFydw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Ep5BGf091hcttCSVWbef2Ogcioq4Q0PE79D6mQqQPAM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001209_173662_06CAA0CA 
X-CRM114-Status: UNSURE (   9.43  )
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

cap-sd-highspeed declares SD high-speed support and has no place on
the non-removable eMMC node. Drop it.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
index c1e3098..677d129 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts
@@ -133,7 +133,6 @@
 
 &emmc {
 	cap-mmc-highspeed;
-	cap-sd-highspeed;
 	no-sdio;
 	non-removable;
 	pinctrl-names = "default";
-- 
2.7.4


