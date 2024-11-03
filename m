Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07276D11081
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WmTUPeSBb+svkmezLqwSQpXBbexJ56aq+pF1uohHTgo=; b=oN4IhCykeo1GSzmuKKgpjlgd5O
	j1WP87F6PY5kF75Pip2tWkAh9BHii0T47jnGoX3tKx6XdAUaV5ZOBAkMt8JoXxmL3mKOHSnIqcCo8
	GV99Mzyf1NLwFb289MLJ8id+/iot2OuYj8g9CJKZ3pHVvc30dB0bY7V7NvagIHiaF9YQJHj7o+tcz
	EUeXd2CMJRpmemtnaCNI+3wh/DYK9MlIhLMDPLs56JezN6DmfGv4v+4FTUc7t/HnR42s3zCLwiJRU
	x4ChdwvJYK5CxgINM0cdNUteAa/q84eqPLDb4ESkU/zuwp0vhTiRN/C9tFli3zcDrUL1Ac9eniCtX
	14y/YhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b6Z-0000000BVLv-2eAj;
	Sun, 03 Nov 2024 13:57:23 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b1b-0000000BUlP-46Yo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 13:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=WmTUPeSBb+svkmezLqwSQpXBbexJ56aq+pF1uohHTgo=; b=12cTzl7YxUPUCCjgFAuYrUZgH/
	0hNLb5yLIguXpbk4sQHNTIlzdyCvF6MB+3Q6kgHfFn8CNqSjIW72mOYTMTl4+mWZ8v5pLP3TfqQwS
	VcWKv04VXpNuAk+4g3oHM6M61r3o/QnqINkuqGLhS67I1NyeR1nT66RQrW4nuqClbZc6AlYTyTYkc
	6xZbpGESqLdC55v23uQWZsBYuFA3Gc/bEJ1LXV2YKHAqRJjTMl/Si2q3qwjegR0DbYpMFquerEGq+
	EaAurzsSTT6pnvcQQZQmUAslsrMs6E4uA8nWS+X+Z/euC9FAaUDq61V/I7KU2nhzYoebq4nf4MHNj
	MwUTRyWQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/3] ARM: dts: add Kobo Clara 2E
Date: Sun,  3 Nov 2024 14:51:58 +0100
Message-Id: <20241103135201.25615-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_055216_039263_3E59FD02 
X-CRM114-Status: UNSURE (   8.83  )
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

Add a basic device tree for the Kobo Clara 2E Ebook reader.
It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
are not ready for mainline yet.

Changes in V4:
- fix order of pinmux nodes
- remove some blank lines

Changes in V3:
- removed 30MegaOhm current sense resistor nonsense

Changes in V2:
- improved commit message about devices without binding

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
  ARM: dts: imx: Add devicetree for Kobo Clara 2E
  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 .../devicetree/bindings/arm/fsl.yaml          |   8 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 511 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 569 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5


