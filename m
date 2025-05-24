Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3348C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K94uErRWjEUyXOyg5fbrWZP1TgB7IwZ5oGejAumKAz0=; b=fJlwHf3gAjT/7polCyDX/3Vx+H
	dnB5WIeXatjTmaXyJABMSdrvPVf1IFw9gN/K4MJoXfV8Lr4VrkuW299HqZh+OYH4ld9jIqZLeDre9
	EFni9r0idpWzBITO6IadD5YJOdOx7diLUJzjQ7JJKCoNrf21T5TX/ng43fTLb/fYhkKlaXlQKmw6L
	3CSg0zDAMtJpKTUFWVlD49XHGYkG/IYb1jgeFJ5pc+R4Z7Ywg4YW+sUrB6hDfI6VqrZ6TFrcWSWds
	PEVZVQcAO//G7nBQSEUUA5vFaizcs8rQ5W62GHxX7aYmhaCeaOwkFnjFikO2nPSJ2mJvcn+kFlvtQ
	uK6lIrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIiey-00000005OIN-3veF;
	Sat, 24 May 2025 06:47:08 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIias-00000005Nu5-2Qv4;
	Sat, 24 May 2025 06:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=K9
	4uErRWjEUyXOyg5fbrWZP1TgB7IwZ5oGejAumKAz0=; b=GlizN76d3+A2be+zwH
	EopVGB249nrOSvwm6AVc1JAw2d9w8CC1lnEEBScPjcgf1wbWxuvBbpexkaamlW8S
	YsPq6YHHoG5SFbdSedHIGWauVC1T34NZ1aqEJDHiLXOCl8L8TxDFPMTzxIMchuJW
	1JsHz/o7YIkTgQsAWsf/69dkY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnP5FQajFozJwcDg--.25687S3;
	Sat, 24 May 2025 14:42:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	jbx6244@gmail.com,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B
Date: Sat, 24 May 2025 14:42:13 +0800
Message-ID: <20250524064223.5741-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250524064223.5741-1-andyshrk@163.com>
References: <20250524064223.5741-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnP5FQajFozJwcDg--.25687S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWftw1ruFWUtryDWr1Utrb_yoWfArg_KF
	y7WF15JF4fJr9xX3s5ta4UGa17G34vkr4xX3yYyas5JFnIqanxJayrKay2ga4DCFWakr4x
	JrW5XF4UJw1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKzVb7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB5XXmgxaZMW0AAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_234254_921952_23E1A3FD 
X-CRM114-Status: UNSURE (   8.05  )
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

cd-gpios is used for sdcard detects for sdmmc.

Fixes: 3f5d336d64d6 ("arm64: dts: rockchip: Add support for rk3588s based board Cool Pi 4B")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 8b717c4017a4..b2947b36fada 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -474,6 +474,7 @@ &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	max-frequency = <150000000>;
 	no-sdio;
-- 
2.43.0

base-commit: 1800b5d1cbd1027cce0136267c2b703f81b0af42
branch: linux-rockchip-next


