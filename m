Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82281C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=teQTKm+rcwhjm2Bk78ja69kS52/A0csVlkW7wMTfnQk=; b=utFdNTwAm+pXF7TY6hAAdqJGiE
	r7H+HXjGjKpBZbT4lW1os9SCHHFqE7PAxzIzG7dv/7/os7YhpjO2HCGg0mOOKp5L1QbeRBwedDq72
	FPlEXO7lFJ4tdzGAwsHdNCfI5tEv4AT1tvTtvDSt+UNqEG5EW6xqcXdIn9E5TtqJwab/K1lOtakLD
	hn4affb+o11OD83ZAOYgX2hyw7vzIVCghMteP/I16CRuXKXUgsIGhp0AFndteKq+ZyA+OMS45ppNn
	cv6cOh0U4xwHMLYxY+yfPIG0ekbBmNJmjx7po3fbHnflwPw63hNlZTZg82QvDONINunu3IGxRU2l0
	V2R7LK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u676w-00000001HR9-3SIF;
	Sat, 19 Apr 2025 12:15:54 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6751-00000001HFn-0neO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 12:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=teQTK
	m+rcwhjm2Bk78ja69kS52/A0csVlkW7wMTfnQk=; b=Y3UdCjWJuUtFsvrK9Xzqt
	3mC2KAPycB6Q6QJDc/4J/C+4sP48dQARc/BT5UEk9nfoc5s5K3OyKP9l2IaxuTQP
	jKCQALgS8zWumbX+3Oo7UwoE/WUA8ERysK3mRmFBzmL0JzlOA3Ybwnh/OA0S2Jvx
	6HlTwx8GfJbvW79qnCVZJg=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S2;
	Sat, 19 Apr 2025 20:13:31 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:16 +0800
Message-ID: <20250419121326.388298-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn3XtnkwNoWWZ+BA--.31074S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xryrur1fKF18KrW5KrWrGrg_yoWkGwcEya
	4Ig3WrCF4fAFyDu3srJa15Gwn2g39I9F1xKFyYqF1xAF98A39rJF45tan2qwnrCF4a9F4f
	AwsrAF1fAw1jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_g4ftUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h80XmgDkx0IOgAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_051355_653961_AD7C5760 
X-CRM114-Status: UNSURE (   9.98  )
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

There are two hdmi connector on Cool Pi CM5 EVB, the current supported
is hdmi0, assign corresponding index to it. It will be convenient for
us to add support for another one.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 86744c53801f2..3beeb0616455e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -23,12 +23,12 @@ backlight: backlight {
 		pwms = <&pwm2 0 25000 0>;
 	};
 
-	hdmi-con {
+	hdmi0-con {
 		compatible = "hdmi-connector";
 		type = "a";
 
 		port {
-			hdmi_con_in: endpoint {
+			hdmi0_con_in: endpoint {
 				remote-endpoint = <&hdmi0_out_con>;
 			};
 		};
@@ -129,7 +129,7 @@ hdmi0_in_vp0: endpoint {
 
 &hdmi0_out {
 	hdmi0_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
+		remote-endpoint = <&hdmi0_con_in>;
 	};
 };
 
-- 
2.43.0


