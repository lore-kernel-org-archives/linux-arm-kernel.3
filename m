Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A3C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/60UA9IHJoOjNHXeYUbDr/UDef8Kd8K619tkfq+D93g=; b=Xr2jXZpTYf2LGP2w0bxxwgmnK6
	BeSLY01eEgzaH+RQVkoBvwCGjKk75zVkrb4he6b8QPiQDaiCmsAE8gDY3aWOjc7k8jNZpIbfCjvfX
	1cI1Dk4WALqIJbAvZLvK2HePOiU9J9NFLIDAZ9J+GgUicf6oQ34H0wQqmyM+ANUie/AIgjVJQ1IHC
	gHI6XDhWdbjLDbpBUGr4vR0mHcEpmj4+2nHpcQcdwxVAQvBkkO6m8W6jqbPAj47vVjA+CXtiwZMPx
	GdLcIpL+6XIWFJgUHSwFi8fKaMR3Ieo8ZPnY3gA8g3a4vBigam961UBzZ8GCk0agCRdj3fu30DM4T
	eFXHypSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapps-0000000HNnw-3pml;
	Sun, 13 Jul 2025 06:05:16 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uapg6-0000000HNAd-06Zv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 05:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/6
	0UA9IHJoOjNHXeYUbDr/UDef8Kd8K619tkfq+D93g=; b=Cow2YGFw3bwniIMQqM
	onqbXku2W3fL5Umiw52cIGZEgytIB71IIT6ccCdhgF2NoEm5KzlAaeFb67P0sTFx
	VkrBQFEyKBs57nBOO3oyRJ7N9hZlySIgTZP4OQFnihTvpI5RT3UsioOfdxl8QC6A
	m+OdeuWbYTQgqAb+X2l4XJYkw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S3;
	Sun, 13 Jul 2025 13:54:48 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings change for 6.17
Date: Sun, 13 Jul 2025 13:54:31 +0800
Message-ID: <20250713055441.221235-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgDXb50mSnNoHrt9AA--.3344S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13Xw43uw15Gw4xKFWUCFg_yoW8AF1Upa
	nIkFnrGr1kJFy7JwnIqF18Ar13XrykAr47AFZrJw10yFW5A3Wvqrs0qwn5ury7GryxXFy5
	tF1UGrnxK347AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jntxhUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwGJZWhzEWmtRQAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_225510_446903_9468E510 
X-CRM114-Status: UNSURE (   6.65  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.17

for you to fetch changes up to f794181b723141faa071d73b258a073e2c82d6ac:

  dt-bindings: add imx95-libra-rdk-fpsc (2025-07-11 15:30:01 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.17:

- New board compatibles for i.MX28 Amarula, Engicam MicroGEA, GOcontroll
  and phyCORE-i.MX 95 Plus FPSC SoM
- A couple of i.MX AIPSTZ bridge related bindings updates from
  Laurentiu Mihalcea

----------------------------------------------------------------
Dario Binacchi (4):
      dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
      dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
      dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
      dt-bindings: arm: fsl: support Engicam MicroGEA GTW board

Laurentiu Mihalcea (2):
      dt-bindings: bus: document the IMX AIPSTZ bridge
      dt-bindings: dsp: fsl,dsp: document 'access-controllers' property

Maud Spierings (1):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display

Yannic Moog (1):
      dt-bindings: add imx95-libra-rdk-fpsc

 Documentation/devicetree/bindings/arm/fsl.yaml     |  18 ++++
 .../devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml | 104 +++++++++++++++++++++
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml |   3 +
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml


