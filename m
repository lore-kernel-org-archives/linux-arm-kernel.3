Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41202D3E773
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naUrljARLNrIdPlsJLerriMyE2VDqk5djRyAo9F8rDM=; b=eiUKTD1au/+r/PY19TdlTF8hc/
	3buXZfk80metmhs771kN0lfIf42p8aywHMNiqTiWuh4yQwYFMiyOp0CzyyoLnR04Rdg6LU/tUvX+N
	JA2adFpd0ufogAZsG9AtrBe3JjqPCN6YUlG0lzfyG3ppQ74qGIjiBJDfbVFIFPeJ4TbzDKcWxZb8M
	Zc73R4E7RbhwQ4U281IUGkRlj1ByUJkqW6pg7hUG6R94SaOtOaJlt3dXN30VoUlM/tW87IuNJiNXc
	x6fmH+/s9YmznCsGidIgI/n40kcH9WhWqg5BJEEqecKPR7aIZnMlDf4hiE/L9FeXpLSwzmOdfGvAp
	zoFSaOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8R0I-00000000qhG-2rWP;
	Tue, 05 Nov 2024 21:22:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Qwu-00000000q9Q-2LTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:18:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F20335C567F;
	Tue,  5 Nov 2024 21:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E73C4CECF;
	Tue,  5 Nov 2024 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730841531;
	bh=Mggfy6UFGifZiD8v24Nk2yRnIHy9cWVERK7EVwoH540=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dSbbvE0/MJLi+MTyjeh/jTIxgGMBrMg7Uio/wlkfsa4ctlYN9aNJvXRw7xnyEC6S5
	 jqISww+Mnu7BtIsa0FaVvRb5LnJ6jlfpQsU/uGonByI5uR5rzZLjF8idnjogLK33pG
	 ZC6K276kvUaCS+PdxA9Kd/D2CfRdTzglI0MA42b2MXrrHgWyou+Iwoe9T1I0uko9Uz
	 EZnk7ZZwiIx9D+6hi36uI3VKnOtxLztmdAH1MxfREtCA3/07B3j7GE2HJoes0ugfxx
	 3FTKY+notdCWY6CSFMq1BB7yfVJ9pG7ReMYvayQRl60LlNZeRusKDqS6qhmDxdgjDg
	 uTbO0mFSxjMmg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 05 Nov 2024 15:18:39 -0600
Subject: [PATCH RESEND v2 1/2] arm64: dts: seattle: Update spi clock
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-dts-spi-fixes-v2-1-623501e5d1ca@kernel.org>
References: <20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org>
In-Reply-To: <20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org>
To: soc@kernel.org, Kuldeep Singh <singh.kuldeep87k@gmail.com>, 
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanho Min <chanho.min@lge.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_131852_784676_428DF5FF 
X-CRM114-Status: GOOD (  10.78  )
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

From: Kuldeep Singh <singh.kuldeep87k@gmail.com>

PL022 binding require two clocks to be defined but AMD seattle platform
does't comply with binding and define only one clock i.e apb_pclk.

Update spi clocks and clocks-names property by adding appropriate clock
reference to make it compliant with bindings.

CC: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, Please apply directly.
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 690020589d41..d3d931eb7677 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -123,8 +123,8 @@ spi0: spi@e1020000 {
 			reg = <0 0xe1020000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 330 4>;
-			clocks = <&uartspiclk_100mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&uartspiclk_100mhz>, <&uartspiclk_100mhz>;
+			clock-names = "sspclk", "apb_pclk";
 		};
 
 		spi1: spi@e1030000 {
@@ -133,8 +133,8 @@ spi1: spi@e1030000 {
 			reg = <0 0xe1030000 0 0x1000>;
 			spi-controller;
 			interrupts = <0 329 4>;
-			clocks = <&uartspiclk_100mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&uartspiclk_100mhz>, <&uartspiclk_100mhz>;
+			clock-names = "sspclk", "apb_pclk";
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.45.2


