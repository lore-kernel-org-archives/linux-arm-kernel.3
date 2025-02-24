Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6ABC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8ZD7Nl30l7v2jVyuOaNthDym3qmyvZSIDfHemqIj+A=; b=YdTv/vCpoT6lMt2AihdUfhMsy+
	qltZTdNd68Yfzf3E3mp7IGJNjynnoh9P7bd2SCTzh2/nOXXeFrizai5f5HYcWIV/g7kS2cl6+jqO+
	j6Z5OGv0B2mzBQuwracPdRxTfcis/fYYh0+iYg51sldmQfpPI+vQphKgVBEih72f10dAiqBeS5Qdq
	TY4UpKyc/qNsXJ++6diuFBFn+8EHe+VXdHf/D0tmbzKdcwTExm42Srx1oQxljRcAfMrgea5ECVikX
	ja03xzNrmY1U0ORdtWK9ADfSBntZI99XY92u404osVvG3HNmSewoM65CnjVuvQfZiFvGfZO5GuYg/
	HkwC3J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ5Y-0000000E1Iz-3nvb;
	Mon, 24 Feb 2025 14:05:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrU-0000000DyEf-1a0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7925A5C6DF3;
	Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81D21C4CEF6;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=NkLn/3MG2E3CnR6jee3A29hXE2uuTTgpO4AUb4j8UnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iKlaDFL/agKTCm6ClZDzrHSOC0TdHAlP7wd/4D/uF1fTA6lFkPgtSZ5mLis5TPKi5
	 UbLHBYSwvNtajid2yN495VdKhYMSRYhHtEnIKkwD5zbUOf6T6V5z/Gvv6WFTcUpSHc
	 hwPm1ijOOoo5pGPhJ243XQfx9vE3XNEqRANFhpYnkBP1od35/QMe4TC30/24ClSXWO
	 KtgTehtsuLPkIgudGJVqKZWL2Tre+at1SWCUthkRwBCwYa62w8bqdk8wGASFBcH8J9
	 HAKglRMj+kxc4cTv4cVlCAuxh9J8ZUxSmQ5diIh1vSpfjoG4v27anu5jNcBCQXoJvk
	 n8aSreapHWF+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7558DC021A6;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:56 +0100
Subject: [PATCH 06/14] arm64: dts: imx8mp: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-6-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1790;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=onT8TBy0kWLgdCkmFuDnMoqyo8nMJja7Mwkr4JyDwjU=;
 b=hOJ3oQnibx8w4MPc+FcEJfZIDsCSGRpQL1vC/emd6CgR3e5dwXRVhMk7flegtw0k6nyRwuwAk
 xOTrdG71BgQCHrBcrklzfNBE9+K3HvREL4IjzR84Gi/x0CxIzzYsUFe
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055108_528824_FBF3524A 
X-CRM114-Status: GOOD (  10.76  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
register is written in the dts, these values are not obvious. Add defines
which describe the fields of this register which can be or-ed together to
produce readable settings.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

---
This patch has already been sent in a different group of patches: [1]
It was requested there to submit it along with a user, this series also
includes some users for it.

[1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
---
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 0fef066471ba607be02d0ab15da5a048a8a213a7..0927ed11ec687d5b273c4a4a6455e8d81468f676 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -6,6 +6,33 @@
 #ifndef __DTS_IMX8MP_PINFUNC_H
 #define __DTS_IMX8MP_PINFUNC_H
 
+//Drive Strength
+#define MX8MP_DSE_X1 0x0
+#define MX8MP_DSE_X2 0x4
+#define MX8MP_DSE_X4 0x2
+#define MX8MP_DSE_X6 0x6
+
+//Slew Rate
+#define MX8MP_FSEL_FAST 0x10
+#define MX8MP_FSEL_SLOW 0x0
+
+//Open Drain
+#define MX8MP_ODE_ENABLE 0x20
+#define MX8MP_ODE_DISABLE 0x0
+
+#define MX8MP_PULL_DOWN 0x0
+#define MX8MP_PULL_UP 0x40
+
+//Hysteresis
+#define MX8MP_HYS_CMOS 0x0
+#define MX8MP_HYS_SCHMITT 0x80
+
+#define MX8MP_PULL_ENABLE 0x100
+#define MX8MP_PULL_DISABLE 0x0
+
+//SION force input mode
+#define MX8MP_SION 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.48.1



