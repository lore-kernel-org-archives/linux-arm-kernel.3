Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F8E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0qkh9NDueAgmjfZXlNcUqY3qLpWOOPfkCMJCmVRhSeM=; b=DjAgIiPSzxlNWqI6hnMyMMtZVW
	C61pJ4aOKDPoaJIKo0f2rNBFtpepu5t0Ws5dvrMex0Q95jbKTYSxMoIlZlLXxblgrvHmHGLXTzBNQ
	byipFq3XRHm2nvrUYFRqyinMsTCew3xnuExaJX+6PKqEc+Y/oVlxsOFyQl+6o0oYKIJYOs60+fHUz
	VdyCfD7W9nrroji6XltGb9zCztFdfInIsso4zLqi48uYG6N9EuAwuJN27n025mB+RE4F56xhGbmlW
	teqN7FXk4JzzVjy1sKgbpI5VrjNwF+z7iOzpPhazyzrTantCme5pTswJPfDVsgT64jm/EwlGHrXoe
	R/q/TReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fh-0000000Fl8i-0h2D;
	Tue, 23 Dec 2025 16:28:49 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fd-0000000Fl6E-2b4q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:48 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 65EF41FE01;
	Tue, 23 Dec 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507321;
	bh=0qkh9NDueAgmjfZXlNcUqY3qLpWOOPfkCMJCmVRhSeM=; h=From:To:Subject;
	b=bfHWyYiz9scdm0bBe8fdoLg+M/oq84E/CM3Imf0YrJMTz7kgk2gmteOD7CWKp9vCR
	 MVurGEE8WeiY9s/oETwZhSAJz3fBS0tshVKuf+aq+rW1hziimo2uJLlg8IfciKcamg
	 3YDf9O3pfIoIgoNbvJdE3EdmHFwAfK2v1RSgDwfe7nhkO2fEVAKhC9J6RkwjnDGDdq
	 E/c5KIco0SBiGJ1q74jGLjS8B3DLZkLymRVyU9nwFZpBKuwfJz7Aga6W8q4LOM29zF
	 1l9mQxL9auwSVQDepKwk5S34GvtH4cGpcgDTwP9nxzG1kWaaPHQJi58SonUwmZpZhD
	 vg8CmYon6pPpg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] arm64: dts: freescale: Add Apalis iMX8QP
Date: Tue, 23 Dec 2025 17:28:26 +0100
Message-ID: <20251223162833.138286-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082846_587591_1C1E23C1 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for the NXP i.MX8QP SoC and for Apalis iMX8QP SoM mated with
Apalis Ixora and Apalis Evaluation board.

Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
A72 core instead of two.

The two Apalis SoMs variants share the same schematics and PCB, and the
iMX8QP variant exists only on revision V1.1 of board.

Link: https://www.nxp.com/products/i.MX8
Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8

Francesco Dolcini (4):
  dt-bindings: arm: fsl: Add Apalis iMX8QP
  arm64: dts: imx8qm: Add CPU cluster labels
  arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
  arm64: dts: freescale: Add Apalis iMX8QP

 .../devicetree/bindings/arm/fsl.yaml          |  6 +++--
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     |  4 +--
 .../imx8qp-apalis-v1.1-eval-v1.2.dts          | 26 +++++++++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1-eval.dts | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.1.dts         | 16 ++++++++++++
 .../imx8qp-apalis-v1.1-ixora-v1.2.dts         | 16 ++++++++++++
 .../dts/freescale/imx8qp-apalis-v1.1.dtsi     | 16 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8qp.dtsi     | 24 +++++++++++++++++
 9 files changed, 125 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi

-- 
2.47.3


