Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D08C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtJcVoHK7wFTyyEvaJyLbNCv5OkNWU3lynv8Kz9PUiw=; b=IzIjmYbbktlcYFG+6ZbGJvJJ+p
	vPnOiFdZdliNGGzRMNiUpC97/7hYXFBT67EgRuDeuXhlb4l1v00j3HhumX2BL4Q6GUrFbr0IVIqxS
	kwh6ppVYbIrJ2vGt8pftS/WgUn/BAlsmn9a+8TYlPbNuMPL8Mr+F/DjLQfEk8SN9YA8ILHg55XJUT
	50RwGExRT6NsmRw1y1jfkiaEOgSP2hoE8TiwZzMyJOwe9jtmEQCDoyXVOmFC7YfVYnQJFdMcZ6FW/
	uSW0QgmKPUp/EEr/IqLOICVLJuHeEern+LBpw2dGNLSFG9CYjIWUMc6rXGPAni0hovo2hNv8fe+ux
	GsHI0yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy8p-0000000FR5e-0dYS;
	Fri, 14 Feb 2025 16:02:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiy4X-0000000FQD6-24CH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CED95C5742;
	Fri, 14 Feb 2025 15:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28EC5C4CEE8;
	Fri, 14 Feb 2025 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739548664;
	bh=X0Agohr9oHi/ZUCQ/VQiX7OEwANKVniqV1xfW9Qd7X4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=myC+aGHJFXJYhoW6N7qwAagawL3e9GbNV89ndpmC2wVQHyuCOTxQ9KbQPJtA1Ew8Y
	 5plFExN7VqBOS9di6nmwjIlQ15sl7cn1EVWWaeeABbGSnWGKH91rXX8ghRbVXdG1/p
	 ivXo8IV6OhwW8QN7XmcUjIU032V/6A2z+vQQMLQNHY8MaVUUFnr8hsr7dZaj6/9rFB
	 sKNk30G91qY+6hCzJA7WRQY2NZUzshDCk5p/SlOHKypdYSXFftTfucAYoP0D+sJdBx
	 NNCDVYxq9LMS+Qhc9Qhdq9akZaI1JE/0sHw+PxZdg/NztFq815UALC/EP/4TiCcQh8
	 h4vVx/2MbkEzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3CEC021A6;
	Fri, 14 Feb 2025 15:57:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 14 Feb 2025 16:57:43 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mp: Add pinctrl config definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-pinctrl_defines-v1-2-fbc86a42ef3c@gocontroll.com>
References: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
In-Reply-To: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739548663; l=1502;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=9sf7EGiqWWtALwUaK5VfgvYXRabE7bq8Almx6FlUGXc=;
 b=NfAzhM23mmmdlp9seKZ09vzSHp9Dlr7kU0pa6Xix3xCZgpVid9kH2jgqY3/UJ/cmc+42H5g5/
 5ErsfYmMERyDOX8UgLGcekAw8ykxaF1FNltNKLVwIJPfhHaSXcqk3rU
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_075745_626602_C7177D4F 
X-CRM114-Status: UNSURE (   9.11  )
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
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 0fef066471ba607be02d0ab15da5a048a8a213a7..8d4d621ad22165ca6c92499b273ec4178780c475 100644
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
+//?
+#define MX8MP_MYSTERY_BIT 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.48.1



