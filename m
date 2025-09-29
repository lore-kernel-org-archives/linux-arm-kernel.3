Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E70ACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii2/ocwKKTBAbF09jFttUzfa27Qlb/QxKkunHa96qFg=; b=ft0pkhBAXJcEV/X2D9bdEFjSqz
	q03EPLzfjxa7ELTdVAxDBRibpf/GbfXKWW6G4QHPWEFh8Su/wdVIJm0wemo3j3VRKk3GUND+/NMY+
	WyJlPgNJSSVv5RVIGMuWcvuBkwkczpodfAulU2RPiLjg44y1gB4lBVpVm7DGQhV4BkAd7zGg5DqQ0
	pMUsYeAeCHxtgxOIQXVWOJ8wBVNAObb3SJJkbT377XONrMHmwqdjqF44UgoyA7Yt0uYOtjBvWYzbE
	zg3vyoDEA+MGhp7G/7uQWRvTrcZ+G8ELWiox58AkE4I/DXS7z0SATZ1KaT7J+NuzbqGZf2AfB0anq
	bU8DGqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pl-00000001caI-1khp;
	Mon, 29 Sep 2025 07:35:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pj-00000001cZe-0S5u;
	Mon, 29 Sep 2025 07:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE25746387;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3A79C19422;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759131313;
	bh=7NYQN/xl5KhOZgk379tTGk/P5gU5kC6zCwf6FS1ZnTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o2hZtDgb5K9QlOfTjC98L5iRwA7E8xwtpmOTUYjQTtwmEBdwX/LOug36uTyqiqae8
	 QjdqwHSQHR8HUKfGoX83DEpcxvsQMFiyUABwTzkySgbYboeaMbGlTYNiq28Kdo3HtU
	 YMZ+a9WPJZg1OGXNzDZAzc0jXkImKI+lIa4TYoVVQBzJJ3okUw2HllPY52K6PLKds0
	 dH1S/ktWVuM3L30nSi8dFAVddjBrSf/4kSBtgDolrEkG212c1pIAjr63vmHcfQMsgy
	 rYSavRbn4tLGwXRHJ/7IVEnJg+68bFXk153AMil8UhVJLZtOQVIrlI3YhgTCYcbMoA
	 0SidfooQBnmYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAA4CAC5BD;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 29 Sep 2025 00:35:15 -0700
Subject: [PATCH v4 4/4] arm64: dts: rk3399-pinephone-pro: Fix voltage
 threshold for volume keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-ppp_light_accel_mag_vol-down-v4-4-6598f22d3451@gmail.com>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759131312; l=1565;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=GpUQl51v5pQWdXs2BOWJyovxr7JU7F5Mge6gevMi3Lg=;
 b=ab+W3K7XcZNNPkj23XjF8RuvULAYxDqRHxKlFjqVR6ZPwZRRPaYRduyUSHUAvKCp5CjHrBRh1
 DFFnuf1ZL/cDshMh6NFs21K2ORl4epAIXZULo5mGQaKSbeKqpBQ12/D
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003515_200042_A5767DA9 
X-CRM114-Status: GOOD (  11.57  )
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

Previously sometimes pressing the volume-down button would register as
a volume-up button. Match the thresholds as shown in the Pinephone Pro
schematic.

Tests:

~ $ evtest
    // Mashed the volume down ~100 times with varying intensity
    Event: time xxx, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 1
    Event: time xxx, type 1 (EV_KEY), code 114 (KEY_VOLUMEDOWN), value 0
    // Mashed the volume up ~100 times with varying intensity
    Event: time xxx, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 1
    Event: time xxx, type 1 (EV_KEY), code 115 (KEY_VOLUMEUP), value 0

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 05aaf152b5efa5a87663fc97ce034e75131670bb..e7b0d965df6f5daa3e1b7ff98d567b74e8c7715f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -40,13 +40,13 @@ adc-keys {
 		button-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
-			press-threshold-microvolt = <100000>;
+			press-threshold-microvolt = <2000>;
 		};
 
 		button-down {
 			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
-			press-threshold-microvolt = <600000>;
+			press-threshold-microvolt = <300000>;
 		};
 	};
 

-- 
2.51.0



