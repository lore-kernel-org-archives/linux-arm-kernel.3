Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A8FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq+nCCJgA2s4Q/WEXHvVM+g1/JB/hOxC2HKYgnays1A=; b=Wv/QtxKLlv+/LeSfOvacEkqCcK
	coOlHg4dwK7r1rd5nSz9G11GUIMb54XPscICKpwPv0KCyka42R7kMQ1tzsUn8d52jRkon+m5ioCuQ
	gjdp/alnUopmQMMuWXqQJrqzfa+2DanbPAR0YM9pnfZvlVsdnKSmR+VA7LXS3HMpVb/Ih/fPN11dj
	TAMZJQB/qJ5IwUBvKFdJx/LgQnRA9Uum39uMvnM6oibzQVgr5GGX0JWZQ9n548iwbTu4f/pZQgizQ
	7kn9PYIfQwM0gB1Rm5jHbxDsUE9L1Y9PGpAGxSX4K4InEQXmx2FpieoepLFJyexnXJQbB9G2ic4UK
	ONVNlW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H99-00000007MPI-3bcZ;
	Wed, 23 Sep 2026 07:12:03 +0000
Received: from mail-m2411.xmail.ntesmail.com ([45.195.24.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H96-00000007MOh-1Txy;
	Wed, 23 Sep 2026 07:12:02 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed74ab3d;
	Wed, 23 Sep 2026 15:11:53 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/4] arm64: dts: rockchip: Remove broken-cd on Rock 5 ITX SDIO
Date: Wed, 23 Sep 2026 15:11:35 +0800
Message-Id: <1790147498-47766-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa0cd1b4de603a4kunm59cf9035478c36
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUMeSlYaShpISR9NSB
	hDTENWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Gd7E7ez1wBQNfGiII4tcsuz6Pcwsw+1KNisvTG4MzK/BdRqunmS5qYLHyzPjai2/3QC7CKp2+hIAVfE/pQPzg1DMvUjr+ynSJv9yOTP0ZCqn7vc2Is6WUUnj45a/loIMekPAL4q1HdzCDFnhCEMiIsaJbajemZKOpcARKyupelI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=eq+nCCJgA2s4Q/WEXHvVM+g1/JB/hOxC2HKYgnays1A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001200_873937_A7CCD3B1 
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

The M.2 E-KEY SDIO slot is non-removable, so broken-cd is meaningless
and contradicts non-removable. Drop it.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 6f25e08..241df3f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -895,7 +895,6 @@
 
 /* M.2 E-KEY */
 &sdio {
-	broken-cd;
 	bus-width = <4>;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-- 
2.7.4


