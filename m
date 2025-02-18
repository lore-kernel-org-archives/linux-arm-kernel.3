Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B00C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+ftn8jkbitWUtsbEAaJmABpvum9lNkKn+UCCsMOLhc=; b=xOZukHMqFhLt6cBN3bzG1lMxyk
	0ZAowOxnsfBuj316n0c/x6iddx3nx+n0cB/S9fSebsLUpo7vZ1mqisZh1DrHeFUYdmnWW78RP4PKP
	/prM7p98iFidIwG6ut/Ng1pkXMM8G492EW+gBpfXQmfNB1a3CcrNfYYlNkddRwxmGja6+howYLkvY
	cxpOb8YCd0hgNaq0lrAnW8HdkKz33GOonFhdtFcadEEPo691Sxq+sM73m637mphiRv6nvUAXbTWgD
	qE3//zxxfzFpEOlABarmzjMnE88zxlHdz8yzcyxASM1+/i7w9PICu9KQpKaML9MR8reacVL4cOTRN
	YRJLVSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMRf-000000085lG-1gvz;
	Tue, 18 Feb 2025 12:11:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6h-000000081ci-2TbM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 11:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c+ftn8jkbitWUtsbEAaJmABpvum9lNkKn+UCCsMOLhc=; b=TJSkdbMElVsn5KQVXbJl9G9ml/
	KdXPcBsZOUlb6803jeIa0+n1cYSnbul+k0ioVe8TTUW8E8kI6I01KSyiaFOv1lStmJxLR/v0gr01S
	P1CTutpl7K59tSaZTLctJRWprUNx2oWJ/I6LjIjHaxNZSnGsG38p/OnCtYPTBmbPp6ZYdoYBj6nPH
	ptmVBqFToYOHJjji6qdwns7U1jCzjzjKG42zRMdiP/dYeenhmfs6kwHRr2UqUXX07/GwyjPBctWmN
	DdCUaqPyC+boPJjwBqjyKilEROJzCe4W+dPOqQT4qZUke8dTRYp3upewUk+bYopBtwKwd071s1C7F
	dUMHqKlw==;
Received: from smtp-8fa8.mail.infomaniak.ch ([2001:1600:4:17::8fa8])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6b-00000001zRv-0CFl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:42 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVj6m9wz79p;
	Tue, 18 Feb 2025 12:49:33 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVj3DxqzmC2;
	Tue, 18 Feb 2025 12:49:33 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:20 +0100
Subject: [PATCH 9/9] arm64: dts: rockchip: disable I2C2 bus by default on
 RK3588 Tiger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-9-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114937_951397_D139591C 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Tiger routes I2C2 signals to the Q7 Camera FFC connector (P2) but
nothing on the SoM itself is on that bus, therefore it'll be up to the
adapter connected to the Q7 Camera FFC connector (P2) to enable the I2C2
controller, if need be.

Thus, disable it by default.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 81a6a05ce13b68a93e381f7051c1f861c1f11a25..0ab7032924cf60768f848e0d5ecbe32c189dbdfe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -173,7 +173,6 @@ &i2c1m0_xfer {
 
 &i2c2 {
 	pinctrl-0 = <&i2c2m3_xfer>;
-	status = "okay";
 };
 
 &i2c2m3_xfer {

-- 
2.48.1


