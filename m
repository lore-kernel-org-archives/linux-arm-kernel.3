Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005E4D132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQOwH/EH5RsK+sUPmOSDwLSkkwWhH4FAujH0mstfmQk=; b=uNd6FdKdOBj8CJc1iUBetra6EX
	uycMVVKKqycRsaIa0vbs+yJLLX1BNRqbyUPJMp18O114WEjcWrDOLLGFbhqlC4+ZKeEELgzJ5lITm
	UokLguDQBOGrgp5MkngUhoZxHhRJcpag0bTtUHvPrAUX89wXM4M+93t1kiEVAugDCZ8KTktqfuaqj
	nk6JrWTjRdYyAueQWap6HKnPO8dwY65mRqnHhKLIikEV/nuzu+GCqE/QaljxmaRbESkdcfa7LbrcS
	2hO8X5p+96TYOSzkoZd0wnh15XYfA6xGtjM/ndGvJHid8OvjqQ3sAymLnw6EwuDDK3fiGgJhssSuK
	GhMIeP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t5t-0000000D6Ck-33XH;
	Mon, 04 Nov 2024 09:09:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sxY-0000000D4lY-3kod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=NQOwH/EH5RsK+sUPmOSDwLSkkwWhH4FAujH0mstfmQk=;
	b=W24XxvFnZ3Sv5utXPcGep1qPjlunI5y0pD8hbuOQeNXpKFCG2i5lw4ITd+nxU2
	sbGhCq7UCYrMIep5qClXOSE3bQLU4f+erU2GHEixysxHAR6h4J5+oqK4OB0de3lq
	i+mw1n6QM9hapRMW8rvJLYP42iwtpkINS3DdhcV2yGA3M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S4;
	Mon, 04 Nov 2024 17:01:01 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings changes for 6.13
Date: Mon,  4 Nov 2024 17:00:52 +0800
Message-Id: <20241104090055.1881860-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgBXD75LjShnSBmkAQ--.16437S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4xJryrWFWrJF4DGrykKrg_yoW5Xw4xpF
	sIkF9xJrykJF17Jw4avF1kCw1rXr18A3WfJF9xGw1kJ3W5AF1jqFn5twn5ur9rKryIqF1Y
	yF1UCrnYg34xZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhpnPUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwqNZWcoYr+P7AAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010117_441719_EBFF6533 
X-CRM114-Status: UNSURE (   7.16  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.13

for you to fetch changes up to f1f6309aa9065487c527b538f476b49771aa0c4d:

  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E (2024-11-04 15:15:23 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.13:

- Add vendor prefix for ComVetia AG
- Add new board compatibles for Kobo Clara 2E, Boundary Device Nitrogen8MP,
  Comvetia LXR, Kontron i.MX8MP OSM-S, Verdin i.MX8MM/P Ivy, DH Electronics
  DHCOM, IOTA2 Lumpy, Gateworks GW82XX-2x
- A couple changes from Fabio Estevam to improve imx-anatop and imx-gpc
  bindings
- A fsl,dsp bindings update from Laurentiu Mihalcea to correct power domain
  count

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E

Bhavin Sharma (1):
      dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC Carrier Board

Fabio Estevam (5):
      dt-bindings: vendor-prefixes: Add an entry for ComVetia AG
      dt-bindings: arm: fsl: Document the Comvetia LXR board
      dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7 irq number
      dt-bindings: soc: imx: fsl,imx-anatop: Add additional regulators
      dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX8MP OSM-S based boards

João Paulo Gonçalves (2):
      dt-bindings: arm: freescale: Add verdin imx8mm ivy board
      dt-bindings: arm: freescale: Add verdin imx8mp ivy board

Laurentiu Mihalcea (1):
      dt-bindings: dsp: fsl,dsp: fix power domain count

Marek Vasut (3):
      dt-bindings: arm: fsl: Document DH i.MX8MP DHCOM SoM on DRC02 carrier board
      dt-bindings: arm: fsl: Document DH electronics i.MX8M Plus DHCOM PicoITX
      dt-bindings: arm: fsl: Document i.MX6DL DHCOM SoM on PDK2 carrier board

Michal Vokáč (1):
      dt-bindings: arm: Add i.MX8MP IOTA2 Lumpy board

Tim Harvey (1):
      dt-bindings: arm: fsl: Add Gateworks GW82XX-2x dev kit

 Documentation/devicetree/bindings/arm/fsl.yaml     | 45 ++++++++++++++++++++--
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 31 ++++++++++++---
 .../devicetree/bindings/mailbox/arm,mhuv2.yaml     |  2 +-
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     |  1 +
 .../bindings/soc/imx/fsl,imx-anatop.yaml           | 20 +++++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 6 files changed, 90 insertions(+), 11 deletions(-)


