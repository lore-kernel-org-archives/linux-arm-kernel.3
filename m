Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C93C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnDskujo+ZaOsqBWchB4/+yGrn2yhcnuZKY775MXwRY=; b=VorTgSLrSWej4z0SoFubJqyoQI
	a83UIDuVnizSsO3UKzkjKCmDf9bTJbmtkYdarDeQ42SsdMVUHn1z2bP6bsxymS6ykoCxE/+viJh1b
	oH6BEOsKsdXIJFI6PKwc1qEEOJRklnGTPYTeBoFPSyJ+uskl+AdiGPnaJF8kocy3TXPs7vVbMS77o
	Ylef+DCWpC2ZbA+e/HItV+3yvjN+TnLdqc1r0RZTLG67HnOJ9DYanv/jYYNVVqAIN+i5BmA95+0Cl
	/rDqrafARLNH8iEXqx5j0TdZDibZx4tyvZ0ABu1Sk1+D07WsQqd7iTQQBg1cvUpVz+vl8pA+kFnDc
	qs71PsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy54-000000062Uv-0Vk1;
	Fri, 28 Aug 2026 15:01:22 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy51-000000062UO-31L9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:01:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26E4A11C6A9;
	Fri, 28 Aug 2026 17:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929273; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qnDskujo+ZaOsqBWchB4/+yGrn2yhcnuZKY775MXwRY=;
	b=W87B0C0MmNLrFtjil+5nb0xVIw9wAcM7NQn9v77WxH/AotFfeBy3VDRsS2AJIGN7K47kjf
	mWQ0aTVE+qAu9UUhPtrtdOFsfwUJT8IueJqxzaKE0h6sQ9i8DSuqwSUgMVsJ4FV+jtX1m/
	vvH8ecsb4kPO4I+LSyh+Cs7DtNMh3cPnmfeLXrkjxVuYtt5NyA7WNOrc4ZgAGq71oFOe/A
	WN66KlOFO1VGS5oHPJ3lB5kdvvqpS7UzbWTtmvVbELpvHMQuAdesk1yXYdyaVpALKgi8Qb
	H3fBty5GVpd6B4K4NCfJAC8j0bIe/YxszHNfu7d5QP9gk5dNBskx0OkegAgl+A==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Drop bias-disable from STM32MP15xx DHCOM SoM sdmmc1_b4_pins_a
Date: Fri, 28 Aug 2026 17:00:52 +0200
Message-ID: <20260828150111.173089-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080119_895172_C2926ACE 
X-CRM114-Status: UNSURE (   8.67  )
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

Drop bias-disable property from STM32MP15xx DHCOM SoM sdmmc1_b4_pins_a
to fix the following DT checker warning. The bias-pull-up property is
the only bias-related property that has to be present in those pinctrl
node subnodes.

"
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000 (st,stm32mp157-pinctrl): sdmmc1-b4-0:pins1: {'pinmux': [10253, 10509, 10765, 11021, 12813], 'slew-rate': 1, 'drive-push-pull': True, 'bias-disable': True, 'bias-pull-up': True} is valid under each of {'required': ['bias-pull-up']}, {'required': ['bias-disable']}
"

Fixes: 7cd8567d988a ("ARM: dts: stm32: Enable internal pull-ups for SDMMC1 on DHCOM SoM")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 4cc633683c6b7..0a4263e6209d8 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -505,9 +505,11 @@ &sdmmc1_b4_pins_a {
 	 * - mandatory on SoMs without SD voltage translator
 	 */
 	pins1 {
+		/delete-property/ bias-disable;
 		bias-pull-up;
 	};
 	pins2 {
+		/delete-property/ bias-disable;
 		bias-pull-up;
 	};
 };
-- 
2.53.0


