Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE5BD2ECFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpT1nLhGnFv6A5fusm6D2cp7RtnDUnwy0dy2T6ZVIno=; b=lwiYrI3zBiMJOZfhxcLupCpUUH
	IQvL4JHh1nKbphyedxHGNzbfipYDAYFSPpuhb3iKu+lCBv9291AyVQB5b/UvxY9eZ3LRy492gmQHJ
	iAK8zd8sltnL/TI4HuTdCchMEwycuIsCN+pqJ1C0pqXh/POwc5vG1oPPj3hZ86K80NMmc2I2VssVK
	XmWBE1LdcdxSWlltddAn4JdSIymHxKwPnsAGL/01n1dEE9ZkRSQxKIn9YAKkIiLCNqnTUtK9FBpwv
	md2rSdylD003RKgVDyDLBiZ5aSTGPNC2srXC/SNyS4Ut5vjlvW3n95oJLDWA6vXh9oBJJ9IJiCJTD
	AKrX6i3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0J5-000000031FF-0mQM;
	Tue, 20 Jan 2026 01:13:19 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0Id-000000031DI-2Rsp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jp
	T1nLhGnFv6A5fusm6D2cp7RtnDUnwy0dy2T6ZVIno=; b=CTkhLRB3TA9MDfcIDf
	DhJzoQZtSJSkFO1nrqklp8mDEzeumU8mjqN/Fe+XeQ8iPxqea+KcDiLFsLc7ff+j
	Rp5TbJRbiNOi59XnZvMCFWWxoaqkJH13g8KUqVBIx2ahcA4/u+Bx1sCFciQiR3ov
	tL+X1nxvWMERGMGYQ4ogZ5lmw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S3;
	Tue, 20 Jan 2026 09:12:30 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindgings changes for 6.20
Date: Tue, 20 Jan 2026 09:12:15 +0800
Message-ID: <20260120011221.4387-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgD3_+V71m5pGbEbAg--.16504S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4fZrW8Xw18CF48WFg_yoW8ur4kpF
	sxCF93KryktFy7twsxtF18Cr4UXry8A3W3JF98Jw1kAw45CFyqqFWrKw1kZry3JryxWa42
	kF1Ikr1Y9r18CwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j50eQUUUUU=
X-Originating-IP: [121.224.201.168]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNR7KMGlu1n68VAAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_171251_999258_0F07611D 
X-CRM114-Status: UNSURE (   7.28  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.20

for you to fetch changes up to b17171492e9897f2c283d7b62d7a283cbbeee6d0:

  dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board (2026-01-18 14:39:15 +0800)

----------------------------------------------------------------
i.MX dt-bindgings changes for 6.20:

- New board compatibles for i.MX93 11x11 FRDM, Apalis iMX8QP, i.MX91 FRDM,
  ifm VHIP4 EvalBoard v1 and v2, TQ-Systems MBLS1028A/MBLS1028A-IND,
  i.MX952 EVK, i.MX8MP FRDM
- Add vendor prefix for ifm electronic gmbh
- A couple of small changes for fsl,imx-gpc.yaml and tcg,tpm-tis-i2c.yaml

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: power: fsl,imx-gpc: Document address-cells

Fabian Pflug (1):
      dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board

Francesco Dolcini (1):
      dt-bindings: arm: fsl: Add Apalis iMX8QP

Joseph Guo (1):
      dt-bindings: arm: fsl: Add FRDM-IMX91 board

Lei Xu (1):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board

Marek Vasut (3):
      dt-bindings: tpm: Add st,st33tphf2ei2c
      dt-bindings: vendor-prefixes: Document ifm electronic gmbh
      dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND

Peng Fan (1):
      dt-bindings: arm: fsl: add i.MX952 EVK board

Rogerio Pimentel (1):
      dt-bindings: arm: fsl: Add i.MX8MP FRDM board

 Documentation/devicetree/bindings/arm/fsl.yaml     | 34 ++++++++++++++++++++--
 .../devicetree/bindings/power/fsl,imx-gpc.yaml     |  3 ++
 .../devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 4 files changed, 38 insertions(+), 2 deletions(-)


