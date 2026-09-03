Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F34DC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiyQexRIW+F7sYU95UXYTcHyMxzFf7UbRjus8Wlks+U=; b=WWtlWsGJULzb9dteVRbM9anBXZ
	hMpcQqb1ypD3dzCifg8RkR5uzVE8yP+mzD2aXBuvPNkAJGfRrMWuiNZYXW+su6FKBXnGL16gx03JY
	G68CNwqSPlXgTlJKpTEKYjnN0SfpMnln6n3mBGDX2uFxAgKyKbMPwzsOpzqq8T5xStwWsoeWvPXL1
	NnDBfWB1yaE2eABh7ZaSmYWK9BheJ2uhzf2jJ4YenEMfNB/zHeMcuKIj7O2XJQNWMEswb9IZOLQKm
	WpXXsEbqrx8w/uNhUAeew+5SGp1zSLtf10TN9vwU1yShB8sitenHm11oSJdKEKWd/3ELe69MLqWCE
	+h1lnWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuS-00000000dFG-2Ytq;
	Thu, 03 Sep 2026 21:23:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EuR-00000000dCt-0It9;
	Thu, 03 Sep 2026 21:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9296E447BC;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D5FC4AF09;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788470626;
	bh=Y7h7sGTVhsEzlVMI5TQ4L554qW/IQlnc5Zu2vSWKmDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gs13FnurnXBRKDDqhGAP0Sm+IlBdGBtYW58FlAEG5yTAHTGPJFv/EX5N2lQ8xg9ap
	 Ap4/NiM7Yf5gy5fiow4DBQAGZhG/p8MfKdzSIN5wDXaBZhwhQCcp8y+oBjc4FhJiak
	 hi4hu2BUuh1ywVvhdISVI2Kpg/nyxePgaf7QX5Gli61H0JHGTNUSHhNL8NkZ7BqUFf
	 OwxQ0mgFbiqdxeDOPpKvxBWuiOs4q7DwRD+tsDmexJ00sB2Q49qS6su89L+WVP8Nbj
	 LhQGOcCcf5rNXxWqXHtW2JPO+Chdi8xu8niqqWt+XgbthToRMiimxS42MP6Ct9z2Rm
	 5uE+Lw5FHlcBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62297C79F81;
	Thu,  3 Sep 2026 21:23:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Thu, 03 Sep 2026 23:23:18 +0200
Subject: [PATCH v6 06/12] arm64: dts: rockchip: rk3588s-nanopi-r6: remove
 always-on and boot-on from vdd_npu_s0 reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-nanopi-m6-v6-6-37416bbd6862@gmail.com>
References: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
In-Reply-To: <20260903-nanopi-m6-v6-0-37416bbd6862@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788470611; l=843;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=ZXBLHN8naxHdNPducDxsTIU25a1ogqqtD70keJ0VhC4=;
 b=+SsiAjNvAmFyP3bHHhuw/mi1Tm14+BQdE8S5IHBTLrslXnvnTkP9gUW2/J2kw8v9FIupyJgfO
 wAHGjxd3y5FC6dKQNFetpHZJVKNPaLXqttnbTA4DNtzFnq1RxXsUR5h
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

Since the NPU is hooked up in DT, the always-on and boot-on properties
on the regulator isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b120dd98241f..8953dcebb93e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -314,8 +314,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
-		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0



