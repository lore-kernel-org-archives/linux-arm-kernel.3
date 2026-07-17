Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04FCC44524
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGHwg+pCiTW+GtV5Jb646lpagnYcHC2azwZ2Lxtu3bo=; b=kxBpvCMfxBGxeSBICckCB7LQNg
	mvYgg+Y2o61MS3KT0Lt0qr90wWhlQxX2hxDv/i07nbawoeih4kNeOS7BT/qi4TBkvOD+P4+Cd8oex
	BaL1040xnwz2QT2Wv4pPBj5VrlOq2pWkVU4hudcYOpNvv860/4YtByHjpTZfIgc6WMQEnP/o/ObiT
	roXyrR7vmYqDc3Zbw7BeeKcNH2hXKplkWDg85WHDfsOzPA+Ty0dBHYDxvQtgb5p7+mPfjfYLchsxI
	LvkkKHN5kfrMX4CMl1rWQNPEWe5CWMERy6uwpTveBKcaUEVjZPEAzrPKag8JaKYK+eOKKVaxQz8NO
	NJVQZMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcul-00000001Oj8-2X8K;
	Fri, 17 Jul 2026 07:23:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcui-00000001OgR-2hY3;
	Fri, 17 Jul 2026 07:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B1BA43D0D;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11369C2BCF5;
	Fri, 17 Jul 2026 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784272996;
	bh=8Lf4+lLevsdpQrvn2nihJN74Z9rfOIw0rByerUqqz6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dGZMf6eLmjyNNLXd9b2yGlmYE6CbR0XNRGmBHyIoD8N2P1vkVTP2uGVLOrX0yvPpp
	 EjbN+zgACeX0iywKTBkieG6AV4LPLyfqrrHTe//cq/vF0vFQ8YOGfX9IE1cE+/Pl5Y
	 GMGrMv7exFI+lnM+hQx+2A4olH1+WLNFOqfOr8FmgGcWRyMLN8EQ6VU3VBlw51RfEV
	 HBhXWcDfcVHia+yD7Yr5zABFAewADLkf13s4QPNPdpRG06tbG7MZXfzTxauOJYeODB
	 IEjfxNOa4bYzDTbEdhu0S8QgTHh7b216BXbRy1KNzkLcErpR/1lESE+u1aSdnBlwQC
	 TveIwHrkY5QFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD9C4451B;
	Fri, 17 Jul 2026 07:23:15 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 17 Jul 2026 09:23:02 +0200
Subject: [PATCH v4 04/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 pull up on rtc int pin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-nanopi-m6-v4-4-b31391a72e41@gmail.com>
References: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
In-Reply-To: <20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784272993; l=849;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=h+9FQ/CrUXYqfYWONzEvidoezdThjgDJgIAcTKsFU6g=;
 b=mO8i6cJ8nbYaWCl+a+1Gjt9K9jc4RSPsCS9W6nY/emDF9W7llAQKhu1q8bXpNeVldUlt1DToa
 vQQJSr6QvxDB22C3NfcQsUgiIOIYHD/+0Kn0Jd0STua3a6x2abaGiYZ
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
index 6b8ca427e0f8..2d3ebcb9cb22 100644
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



