Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91717C54F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3db1h7o6uQFuYdbcBP1L1RmnJrN25ydOfezveo/w7E=; b=pSfYxio63RLwhV5hvvy9i7fSwZ
	ytDWucLQUtPnQMok1onawA4ZjEL0Yr3cmWBUD3AVHbToX9IqnzABMgY3l5iPUfQ3lB3MFwTcgu+33
	w6dKU179lfGQTZcGmORiPRgERk/0sXWr+7i23ShIDPNDbTcjSxiXWBhSDK1lBAF5ugJSQ/RhRG/zL
	Si47H5q6d9TgtRunDLtTfvFmHG69VMc5V/nPD86xYV54SKWNaz2wLa8INIwvK/7/kHprArwKS8Lin
	oH5d7r4V744/XW/v/vZBYB9jyKpvz4ihT+XqEdNxevpaMejKzSPTcMkYNX4tUWnQwc5UsQFHu5P/q
	X3PUv3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVy-00000005AC8-3OkZ;
	Tue, 28 Jul 2026 12:02:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005A9V-0iiI;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0BC743DE7;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99881C2BCFD;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240148;
	bh=EbrpFXcP7WqS/VSdLWd1gn6iHNZnciSa+KGonGeazdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BMTx7/My9l5GJ8kNr5BLauKGdXTntpe/zfGAE1XwZbQ1mVHoawoVBig/2q/a9bzhT
	 ASYyjz801IMJ0cRhcyskoy6GzeXYTehn2kx6jytg5ilfKJ89yL7H/8wGGKOLEe8ojG
	 oL/PkWxCp4SshsrK2odLDPNvmcLOPSIaK6XpDtIJ5dQsX9LCGf9lEyYvHJ0oi0R6Or
	 nFU7guAe5KUVCzmWEMbTt0rXQ/cJVgqzxGC8Sc/0+IyRwU/aLkneoL+rw4X/OzzcOg
	 oD0isfSGZnZ7r6+iNkijgJeutW+Ib2mMMzy2NiVLTuYCWvks04E4DNIjUv7KchlEMR
	 kNDmjDtG/zK9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854C9C53219;
	Tue, 28 Jul 2026 12:02:28 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:31 +0200
Subject: [PATCH v5 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-4-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=bOUJsEUkqBQ7tLIttYbDSPYSPt/SU6MVMp2Nx20LXH8=;
 b=9bt4bDCtK4Zwmkvz2ep1guxs6feuqL3IukHbc6VAMgM2jlFCSkj/fxAYaGKngUcDp4IAWYsEk
 f44ksY6+eUABThBGkQb0+1L07cIEDvStKrOBnmYrRRfgpNIte2WGYoi
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

All boards in the RK3588S NanoPi familiy has a pull on the PCB for the
RTC interrupt pin. So there is no need to enable the pull-up in the SoC.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 5bbd5d2fc5fa..f2b15e03d5ef 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -420,7 +420,7 @@ hdmi0_tx_on_h: hdmi0-tx-on-h {
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.55.0



