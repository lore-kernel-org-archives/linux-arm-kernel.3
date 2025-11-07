Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAAFCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Duv/Q6cEKq4cRRVZcwh0BeeZbFc1GfYoSlByuYp1fjQ=; b=aapXjfslt9M7DM
	R1acAZPOFoQCw0HYS7Yupb9+Jeahpva2RFBjVks6bzAbNWxran0b6Uj4SEaN21ekEWhgG7M1E3eLq
	glIYu9YTR5LxSlCZuXwUBmQ2XxfF3bawxfbq0A7rmRmNrG/SOBliXvm9dc8Pc33GEl3uwJ/kLAT5U
	I+FxHNoGHlY01dLn1WXOjkb5XZJ/iiA44bBKmJHWe+enQu+yO2FfQ5U6x1/jXNKTN8VVr1J1YIGan
	z17e/J2AcGsby2eq90+XvylDZZ1jD7QKj4PMYikSoH8AfKpc2L9JnVxHjqzMS2AuNQUjxzsAMZi1d
	TECzadl3V0vIE2VvWdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNml-0000000HWvb-1cgM;
	Fri, 07 Nov 2025 14:49:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNmj-0000000HWue-1581
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 14:49:54 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vHNmh-0001Tb-GO; Fri, 07 Nov 2025 15:49:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Add support for Skov Rev.C HDMI variant
Date: Fri, 07 Nov 2025 15:49:50 +0100
Message-Id: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4HDmkC/x2MSQqAMAwAvyI5G2iKG35FPHSJGsSFFoog/bvF4
 8DMvBA5CEcYqxcCJ4lynQWorsBt5lwZxRcGrXRLpHpMHdKAcb8SFt/h5g9B4sE31hqnOwMlvQM
 v8vzbac75A2dpewdmAAAA
X-Change-ID: 20251107-v6-18-skov-revc-hdmi-1e8d4bbac26a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_064953_320173_22C2D173 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi,

this small patchset adds the support for the Rev.C HDMI board variant.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (2):
      dt-bindings: arm: fsl: add Skov Rev.C HDMI support
      arm64: dts: imx8mp-skov: add Rev.C HDMI support

 Documentation/devicetree/bindings/arm/fsl.yaml          | 1 +
 arch/arm64/boot/dts/freescale/Makefile                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts | 8 ++++++++
 3 files changed, 10 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251107-v6-18-skov-revc-hdmi-1e8d4bbac26a

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


