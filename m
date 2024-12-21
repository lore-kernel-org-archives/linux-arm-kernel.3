Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF539E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRPW053mS4IaHw56KlN863LLiyhwoTVI+WYIIxpNhJA=; b=klgtQt/+iSg184mI2Ya7nhh3ig
	xDbHYe+wxJnpKyOkvrpL+m486OFk3rHRNOm/yDvCU3Q859rve9aWct0argxyW/lcafoLlhOWXa153
	j9kPXVus++MZmfAjRbFry0s44FuEvWCVkAOMBGocDR2XpFIf8RGR1FCZ8Ivhm/sc77YSRJBXjCB51
	vk+l+IJVDPCN1AV7hGSVoMD4hV5W9/sxV930GOLaOGqENLnwSbl+J4C5WWG/5eamrMw5M3rhlcFkv
	0i0Oz0TYN12hXzP3bWE+mwVoVZdf4pIfOd59Xp8+0DxqKSs35EdIikuSr2bB8YXY1TBFLflCCNRXS
	tnJUpZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOx4X-00000006sSg-3LXO;
	Sat, 21 Dec 2024 10:51:01 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOx3L-00000006sMh-0RAO;
	Sat, 21 Dec 2024 10:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=PRPW0
	53mS4IaHw56KlN863LLiyhwoTVI+WYIIxpNhJA=; b=ZKGBDUz0hc9SdNtNqBNbe
	xnGgEAfJyW/euqeczXFKyavwmgzlDXvJChw9alAUG8QnnmTf9exd7t9urwPMF3iI
	Mm7WkVrbm1kwPYph8slnoyW7P2ciAXcPHVWMP0Cb9XATobHU0xg/nHWOyCDdxg1M
	mJHZGnhA/g1mIlAc0M0s/Q=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3b68ynWZnEhWnAg--.2634S2;
	Sat, 21 Dec 2024 18:49:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: dsimic@manjaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	krzk+dt@kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
Date: Sat, 21 Dec 2024 18:49:07 +0800
Message-ID: <20241221104920.4193034-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3b68ynWZnEhWnAg--.2634S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDuFyxJry5AFyrCr1xKrg_yoW3uFc_Xa
	4xWrs5JFs3Cr90qw1kKayrG34ak3s3C34fJa4Fya1kJFWaqay8JFW5Jwn2y34Uur4FkrZ3
	Jay3ZFyxCF1YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0DUUUUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwi8XmdmiMTT1wACsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_024947_550334_90D3EF91 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Follow most others rk356x based boards, and u-boot only use mmc0/1
as mmc boot targets, so aliase sdhci as mmc0.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
index 41b4cd5a4220..7d0eedf1bd0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
@@ -19,9 +19,9 @@ / {
 
 	aliases {
 		ethernet0 = &gmac1;
-		mmc0 = &sdmmc0;
-		mmc1 = &sdmmc1;
-		mmc2 = &sdhci;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc0;
+		mmc2 = &sdmmc1;
 	};
 
 	chosen: chosen {
-- 
2.34.1


