Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12699CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8s07+aHOBm+Wl7Dfgxd61dpla9aGuKbeOIqU8IwWe0=; b=RjSVE1jyv4WGxBsA6ZaRIZMe4x
	feF6JbaMOQg4C9e7sQzZjTLJHXuEHgaQKaiA6xDCpORdaOguecGrwFB8z0LQdHdysLSjLrert3WfG
	KPOIfDx7NZC1SImoxzPl8IP+JRWHhKb4ImkSpeGjgGsPm9kqhFeDXgtOnikVM2qovf3sbnkW+jpsR
	+NEL+RA+lpdrUX/53T2l3/xVw2gJM+GEck0m17UhSYcdQtSTwq2jvp8Z2ZtMfXI9TDzYBF/5d/3AV
	yFNmiYnWxPeK2KxxrSNMVswto4dxq8bM7ksgHhi3OLc8JxBcfVG+K1l+JZBT2xSUrWx+UmXjQZ2+S
	5tmhHcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVw-0000000Geww-1M6Z;
	Sun, 28 Sep 2025 16:44:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVp-0000000GepL-3Nst
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:39 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F297720545;
	Sun, 28 Sep 2025 18:44:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlNmfzM4vBb3; Sun, 28 Sep 2025 18:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077874; bh=9kz9dMsV6oTsNdTem4b3h8GxVUiRsET4OUStPQfyat4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iOpkOiga+mCUd38B0dutlperEK2+hSwNpno/hexRdxAbt2K3bS5QWugSoMyAdfXze
	 D+f5QeqkxtiEYYzJf69udopJtUaZxnWWlMBuZVOL4hBjU4tujrbS6CsL0z2UaqD/it
	 0Ggan6eQed08NjxzhTNE7XBpCv2gp2OvlFc7TKpr9E0mdh/bffojo4flwmWrB6/VZn
	 k/opnz6fpN7z0cAPBz5eCpOKMa7i8aj+jMJSqbWQBcjiBcmDj/GAgwDDetVlOGvSt5
	 QnQEoZTCLX7HML37ZC+KsvA/ACnLpcD2ZGZxkgf2jJq5TtgAdOjkft1YWhj/sBv5AZ
	 3Cu9bsBnPk4Ug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:56 +0530
Subject: [PATCH 5/7] arm64: dts: exynos7870-a2corelte: add bus-width to
 mmc0 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-5-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1075;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9kz9dMsV6oTsNdTem4b3h8GxVUiRsET4OUStPQfyat4=;
 b=TpZn57CPBUNWhNCookdBkAfjZgnpTSTIVzRTVW4sldOljeTMK8X488tDVVrb1STH6GyBmYAae
 /oMhOJrc/RjDI8FoU4ubpWV5lZAni1cfIsyv5qXv1g/z0+L+A+T19sG
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094438_009045_DBE624D1 
X-CRM114-Status: UNSURE (   9.75  )
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

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index f8a7610abeb77cab9f38aaf48d441d99ec61ab5f..1193f0f7dcc171762fefccee23c2c294a41c46c9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -447,6 +447,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0


