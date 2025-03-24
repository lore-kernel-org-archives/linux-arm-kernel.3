Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B040C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PHKuRDmBKYPk3+KtVV7z/lVVayQrARu4WFny395S+VM=; b=XtpCFpjiAkrJQzml+YWm6p6RnY
	TaeTkNDvjRYuANcTnavp8/UwddvMMBMAwVUHCX+k2wLedIzueN7DIfecP4cAhh0VEVcGH3ML0UWA8
	PeSaHEyqjI5kXmZl8DDJSq8QY1vuxZZ64hUnAw6Xz+7Nmi2SuUU4/st7ao4jyyqzKLsLC2U9+pLXl
	wp9S1+7WWhSZpECbkaVwbhlbi3f208ROVJKZSu5rniHV8sCK1qZ2ukoIS6fBsxEQYy23BQ+s57jFf
	IkLbwAy7zzcegw0+tRdEFrs5+ni2jXZAg0G+tRnS3lthqzKZtZ3BWf6NaA4LLf+J9m9J69iIIb1vA
	NyKvhEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhSm-00000003BlS-2wKo;
	Mon, 24 Mar 2025 13:03:32 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIE-0000000367P-3PGH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=PHKuR
	DmBKYPk3+KtVV7z/lVVayQrARu4WFny395S+VM=; b=XuHjMZ4HXjyo2LiJLFL/6
	udAg/qCviGk94zLDk1nyK8+NvlfwSEO9Tljhwg4EHfObmZCK0PBf85mPEvnoJTWs
	xULr6PoEvaxgANf+FluZJGMMDTdkLJ6FZWuhj8v1tCgE7Im3yjS3U1cnMH5tzV7u
	HO1QUdR8DmhPDnDC5cFarE=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnL9mAVeFnOfyBBg--.24149S2;
	Mon, 24 Mar 2025 20:52:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] ARM: dts: rockchip: Add aliases for MMC devices
Date: Mon, 24 Mar 2025 20:52:11 +0800
Message-ID: <20250324125215.160616-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnL9mAVeFnOfyBBg--.24149S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DuF47tFW3WFy7uFy8Zrb_yoW3tFg_ta
	43Cw1rJa18GFy5Xw1Dt3yrW343Awn7Kay3G3WDAF18GF1vqa1kXF4kJas7t3WYyFW29rZ3
	JFWfXa1Yqa13CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1LvKUUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gYaXmfhTQKPYwADs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055239_279815_3C760B1C 
X-CRM114-Status: UNSURE (   9.16  )
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

Add aliases for the MMC devices so that after the system starts up,
they will all have fixed device numbers.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
index 15a8860c7ae47..a2d7ec2729116 100644
--- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
@@ -8,6 +8,12 @@ / {
 	model = "Rockchip RK3036 KylinBoard";
 	compatible = "rockchip,rk3036-kylin", "rockchip,rk3036";
 
+	aliases {
+		mmc0 = &emmc;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
 	chosen {
 		stdout-path = "serial2:115200n8";
 	};
-- 
2.43.0


