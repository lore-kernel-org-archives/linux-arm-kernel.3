Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460B6D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZJnRdDyp9NycN9TQM+zsZPUQevo1ft7Ycnaul0LkGw=; b=Gabq+NA0tFpE7QK8qi/0YgnNTl
	rbcOcqEKZ4XewW0USJdH23Iqzoh9tHIJMWku0w/G7/kXrGQ85dwvM2lSmJCnC1WU/X4ggPvzvTD9l
	d70NWjOdkHjA4wFu1buV+9Omf3C28JkmilcW+0djA7Vu/2u4z9GE+hsJH1g/G9AE16WvunwKlDNpY
	phYIEk+K81KyrDhAhOB+AJzcr85SwK9x7mdLVn9Co8muv+kMXLYr9EjDE9t48yczJ/kbec3u9yrB4
	Qa2fowAkWIhGQl9vG3udV8/QcbKKPFwJnskvrdnyFL8QgdO97tl6FbzyLdl5tLGNlhfbawE7frrOO
	rJvglLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wb-00000003V0j-3YuQ;
	Mon, 01 Dec 2025 11:57:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2Wa-00000003V0C-0mST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 929836016B;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BB01C4CEF1;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590219;
	bh=zMdqW7g2CzgociwT59QgF/DC0rtiRYU2cHrE8GIJF7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eee+Aa5yR8uU3XpZ5VYDC77ThI9dy3vttjpBHGsYUXX0MB6ZMlaUsQdpJ9PqZZdD4
	 e5z1wIuwL4RnqO2nTWufLJ1H7H/+E2cw7QEuSRsc3Tf+IMJ70e7UCaobXg/ee9qEV+
	 1djqW1ZcmEyXWhWoNiQ3GYtiLEfQ9eiw9zZIcfhy5NKLcX7uOu04DplWn4+zhDI8Wo
	 XF+BFbxr6UNfW09QOsL6r2W3cHapJz3gSoPVxnflvlm6WSg1Gz+i45pOb8oOBBHGTm
	 IEhxDsQgDuLUAwC+SsauogUchoyZMQ6ME+Wd7Gjc6sA+s84U3TKRsl9WRT6oao213B
	 GNpcVTBaIp01Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212B3D116F5;
	Mon,  1 Dec 2025 11:56:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: freescale: moduline-display: several
 fixes
Date: Mon, 01 Dec 2025 12:56:49 +0100
Message-Id: <20251201-disp_fix-v2-0-9b03026311b6@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIGCLWkC/22MQQqDMBAAvyJ7bkqy1VJ78h9FStxEXbCJJBJaJ
 H9v6rnHGYbZIdrANsK92iHYxJG9K4CnCmjWbrKCTWFAiY1SqhaG4/oc+S2QWmkujR6kMVDyNdi
 ij9WjLzxz3Hz4HOekfvbPJCkhRd3SYG941SNhN3nybgt+Wc7kX9DnnL+wsV6dpQAAAA==
X-Change-ID: 20251114-disp_fix-2c90d35ab0dd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590218; l=1188;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=zMdqW7g2CzgociwT59QgF/DC0rtiRYU2cHrE8GIJF7E=;
 b=CdE/3itTq3j2lcjVA+F8qWr9BwrHdPT4FBmvCbbfte91Ze+IVMe/UCWb1b7nVKhrM8k4Z+sfR
 tuEqVZusKWkBN90xi2u+5ZuiiHi5EtKmm5HQCWx4920Mh3QtQ6fLAJY
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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

A couple of issues where discovered:
- compatibles should integrate the SoM
- the eqos mac address is stored in eth_mac1

The first one is breaking, but it is early enough that it can be
corrected without causing any issues.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v2:
- re-add the old compatible to fsl.yaml
- expand the reasoning for these changes in the commit messages
- Link to v1: https://lore.kernel.org/r/20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com

---
Maud Spierings (3):
      dt-bindings: arm: fsl: moduline-display: fix compatible
      arm64: dts: freescale: moduline-display: fix compatible
      arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

 Documentation/devicetree/bindings/arm/fsl.yaml                   | 9 ++++++++-
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi              | 5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-disp_fix-2c90d35ab0dd

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



