Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78125C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VBNIyz9cuBjZoJtZIql5gATNUxrtX/L4E0kfIQR1FVU=; b=TkRmXCgozdlbC7/CxWhV2gPCYx
	35ng1BVfaRKiK9TTk9zK2aLoPoe0Uefa8IruCdqXiyFUVZ1TKbo9yOwaSBSMR11atC8k8K1oADiT0
	2RAavuUfXy0hC1LrZOUPnDeP4SBxKj7jZMpd7chG0/qZfUkURUjE1D+1x0/4Pu9EeHFKLYM+ABR0M
	fZOFcQFu4vPev5PktBECx76YxQS/wjpdkHwxQ6ZwQvdJehJYcsy1R3m4zn6QgItQiOU3kY+fnYtao
	ZPs3AUjx/QWzO+S5fk3bDt9wFl0DxveyfBfwm7D5JpYvEsUugbHdK2871+/k9cmh0DM6XK1hQjK6q
	8PG1d5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazR3-00000000NOn-1Esq;
	Sun, 13 Jul 2025 16:20:17 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazOa-00000000NDK-3LpR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 16:17:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752423452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VBNIyz9cuBjZoJtZIql5gATNUxrtX/L4E0kfIQR1FVU=;
	b=wSbUNT2KQf7F6owQb126AXQgG8NAE5vzWO37zgz0zVVHPYo3SjAxF9KpgjaeF9wQ0WUnzH
	6QAF2GSmc3/3j8WqQy4heZSF2t4e1sITjnWPs/4EDqFMxPADOy0cSoFz5mQpfvl/ttjwAI
	EML6PYD+M1MKlurhRg+9S6t+nQHh5HpsuVI3Co/gqD+JcuTlTRvPvIc7vLfpi9bKFF2i8I
	i3izdpylYASUYmq37wbDWOSJLS9VP5NFLP3ohGm5CZVCYTUXk5W988iKMS7vT6rK9TNF5u
	NtqkynsT42/z/YWegbfZo8fl6dS3clrLbFZkvkuJlOoDxYZG46v5JCwWHCEbWA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Add rtc0 alias for NanoPi R5S + R5C
Date: Sun, 13 Jul 2025 18:16:36 +0200
Message-ID: <20250713161723.270963-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_091744_980647_F6743AC0 
X-CRM114-Status: GOOD (  10.35  )
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

The RTC_HCTOSYS_DEVICE module defaults to rtc0 and should (highly)
preferable be assigned to a battery backed RTC module as it is used to
(re)initialize the system clock.

The R5S and R5C have a connector for a RTC battery which is used by
HYM8563 RTC. Both devices also have another RTC from the rk809 PMIC.
To make sure the HYM8563 is always assigned rtc0, add an alias for it.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
index a28b4af10d13..f4d042bdd328 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi
@@ -18,6 +18,7 @@ / {
 	aliases {
 		mmc0 = &sdmmc0;
 		mmc1 = &sdhci;
+		rtc0 = &hym8563;
 	};
 
 	chosen: chosen {
-- 
2.50.0


