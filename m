Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390DACE7AEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfHwksj/aReqxdPtzoQiQHFkHWuwI4n6ruzJuyLRC3Y=; b=2jw31J5+PaKet8soJAP9JCOdyv
	UZ0IfwkDYOkNxFxrILJ/axH1TjyRIBg+hFYOG/OXOH5pPJJhoKivQF36WYT0dTs/4vft+1OkYZ5S5
	91Op/qFMXfBUTjk1XdOWGlVpbsNhrB4mjkLjW129aq0nrClLPHUf/+gyPcstHCAcs+qnGkTyitWGi
	M5Lrz37WNGLSMouRBiQOy5wJlxN+2b0qj4i81TlKEmbmLz7gjW2S7FQbdxZ0p1ZJqDOVD3J9RRvg9
	hgeg7kHqniPMDscBOF5Std/q+gEUn7vUVujG4/cl3w02HPLkgYw9FdDMAbuRT//vIl9S33GLvEFG3
	c2V+Kcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuWp-0000000CK2r-0TZE;
	Fri, 14 Nov 2025 14:11:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuWm-0000000CK1g-1Qy6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B0B740B5C;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09374C4CEF8;
	Fri, 14 Nov 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763129511;
	bh=dar1GitVgzSL3thT8mS4kxQWjGPcF9tQbQT2Aymvgos=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R4B6KofxY24gm6MFTqcyyNvHTaNzuWJXRAaGk4u8rw7/Cd9Mvkq2/pOW2l0nJUC95
	 DLpaP95ksxZEHuwzO3xLrcePwgLsQZyBbybKko/IJXa/bgXxiNaAQlyG4+0dhbPBHp
	 offTIq4/W7UhOR2dXrgKqIQC9OOw27If265I/G8XKd/sww3zW0QMrZ3qV2932U6I0a
	 vTgJSbBQxO1gXjwK2+F1SqRoF3rkvlJkDtwLcsCyay/SV+FFA/ucQDUdke2yZWO9F1
	 ElqzjwgzUjf+PkE15gSofI/T0TZ738F8xpmXyRIPq4VjNyd1QcVXLGSNxWTscjjyPB
	 BVM+DiteEBHAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21B4CE7AEF;
	Fri, 14 Nov 2025 14:11:50 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: freescale: moduline-display: several fixes
Date: Fri, 14 Nov 2025 15:11:48 +0100
Message-Id: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQ4F2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZTM4oL4tMwKXaNkS4MUY9PEJIOUFCWg8oKiVKAw2Kjo2NpaAHR
 ob81aAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763129510; l=971;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=dar1GitVgzSL3thT8mS4kxQWjGPcF9tQbQT2Aymvgos=;
 b=PuPgSFng3RzGVizBii7B7MV3Vbtta44/VL4M7bg/F4COAzYEuLd0ahfv4wT90G6ISGumlb6k/
 qAdZK50Fa7PDc+++LX7EXgXB8CJGQs/UCkK166ioG8esh7w0G1D7ZHb
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_061152_413832_5D62E98B 
X-CRM114-Status: UNSURE (   8.10  )
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

A couple of issues where discovered:
- compatibles should integrate the SoM
- the eqos mac address is stored in eth_mac1

The first one is breaking, but it is early enough that it can be
corrected without causing any issues.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Maud Spierings (3):
      dt-bindings: arm: fsl: moduline-display: fix compatible
      arm64: dts: freescale: moduline-display: fix compatible
      arm64: dts: freescale: tx8p-ml81: fix eqos nvmem-cells

 Documentation/devicetree/bindings/arm/fsl.yaml                     | 7 ++++++-
 .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi                | 5 +++++
 3 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251114-disp_fix-2c90d35ab0dd

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



