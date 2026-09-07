Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C118C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvrGKSxnwYqvseFIIpVBDIc7ueVkEBRm3dlWZdc+k34=; b=Uy0OXAZNIZFy/AprIYri2Ab7wh
	391uBYKXVYulBhRaFOTl5Ym3H5xP0icFvaX8WVi5zhe3PL8Rf6y9sWB6q0nECuIEV/1oMC0Z09roS
	ss+7cmdYuLJRU4DxalbBnWBXSfB2xkNiEvVbjf1IHY7/gQyCyzK6rIeJHj/KsWBPmBD7lIvf4f1km
	OboDBK/FM7rQEBl6ptrD1Ismi0EkyOWcg5jFECTEIS6xUt3J6W/bv+nssCj0KlZoOnPN+9oZCSyMD
	5nOKpRUluEgIOp6bOpT+Ck758lgifsCT5dHMzEzxYuz0auu2ohnEt2QPNHmvqVWkqO4pLU/mGoePC
	mC9ZngPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuj-00000007Rwl-24hp;
	Mon, 07 Sep 2026 17:13:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuh-00000007RvE-3M24
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E08408EA;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B85BC2BCC7;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=YMwqtk5kFFVk6NmGC1FOGANY0SgL0Bc9vtiSDOAw7LU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Zq3fT03BfjWHlgUc/9Mri7kh86YhT2KEytjCPrpfqMZ+RV1gedghY0c06WwwbgS3h
	 J4JemTl0VNAIrH+ZcSJt1kNvLivqGfnSZ71q0b0P/qYRE7a9CSL41ewjKRF9L5c++7
	 KZn8183+CaULlB6+oeNruIYwoqEd99ZR0ttLKndvuoxpz46LVdm04qEUMJf5Pw5d9w
	 2zbKHqvQUBmWZMtb8PypW3nkNqHda6JJXSofTYJb5ffNEFdmHlF9PNUKkP2SWoNzJ+
	 kF0hnkQk42N1e5XdIX/5FzJF5ATmWx7Mnp3pO9tPa8s5oFogkZfAaFixdyjG74uD3b
	 DsiWugiAEQhEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A1EC79FA1;
	Mon,  7 Sep 2026 17:13:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add Free Mobile Nodebox v3
 CPU Module (LX2160A)
Date: Mon, 07 Sep 2026 19:13:38 +0200
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLwnmoC/4WNQQ6CMBBFr0Jm7ZihEKmuvIdhQelUurCQKTYY0
 rtbuYDL95L//g6RxXOEW7WDcPLRz6GAOlUwTkN4MnpbGBSpC12pQzcLvpe4Cg8vDGZLDdo1ojE
 8Wmqp0YOCMl6End+O8KMvPPm4zvI5flL9s3+TqUZC1zbOEiltOn13wnx2An3O+QupSTIDugAAA
 A==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=1868;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=YMwqtk5kFFVk6NmGC1FOGANY0SgL0Bc9vtiSDOAw7LU=;
 b=bYN/0gd6/toQ6bC9ZCpsN95CU244lpKKLYbnDuxSpx1DPNG+tTql+s37Tx+3ijWiWcrauz+Ce
 kcbUZquphNuCFoRBDQCZ01dH6Sy39Zp2a+j4HyVvyVGAO3pLAqZxAny
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Nodebox v3 is a Free Mobile CPU module built around the NXP LX2160A
(16x Cortex-A72, DPAA2).

The same fsl-lx2160a-nbxv3.dtsi shall be used verbatim by the
U-Boot port, sent in parallel to the U-Boot list, so the two trees
cannot drift.

XXX Dependency:

the DTS uses gpio hogs on the QorIQ GPIO controllers, which
needs the commit
  78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
already in gpio/for-next and that will likely arrive in v7.4-rc1.
Until it lands, dtbs_check reports the five hog nodes, the rest of the
tree validates clean against the current schemas.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2: (from Sashiko's comments)
- Makefile: dtb entry in alphabetical order (before qds).
- Move the XSPI1_A_DATA[7:4] GPIO mux group from &fspi to &gpio1, so
  the reset hogs on gpio1 do not depend on the fspi probe.
- gpio hogs: describe ethsw-reset# and ethsw-mdio-en with their
  active-low polarity (GPIO_ACTIVE_LOW), same electrical levels.
- Link to v1: https://lore.kernel.org/r/20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr

---
Vincent Jardin (3):
      dt-bindings: vendor-prefixes: add Free Mobile
      dt-bindings: arm: fsl: add freemobile,nbxv3 board
      arm64: dts: freescale: add Nodebox v3 CPU Module

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts |  34 ++
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      | 342 +++++++++++++++++++++
 5 files changed, 386 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260907-for-upstream-nbxv3-dts-bbecd04038a2

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



