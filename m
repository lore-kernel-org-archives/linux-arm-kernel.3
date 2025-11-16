Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DE0CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UyWmX8lyk6Q6Z7q+BldQ+cSN+KVoYs+SIyHi5V2ZslY=; b=eWS4G9qI+P+4iB4s8WFcE0UOED
	17MnX9HjPVbD2aHit7kaqqoI8F4R1glO+OKzll2DpF/8sUWWfx8D86TYjFQwH9x2Nsmo4tCRnMYM/
	q0FjTDywfBtNGoT6ZpDEe0HA7Vh3c3+CqaGhBVavRlJ8nUJwSpeIvj3t7l9W3P9GRAqwqLKj4vW1D
	XXD5oGHsxIc1DUAXTotDdq25CrkK0LK6vUYdcIQy6LTILl0pY4nACXVtrYtFja7ACfZFNpnNj+w7x
	Zaum2H3k2UiFWKs3TPshsOXtga98spyR5C0vWOY4Xwafc//uTx9rCt/GI+/4APr4414aWXpkPwOqA
	1WQm4ucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcik-0000000Efx3-0i8s;
	Sun, 16 Nov 2025 13:23:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcif-0000000Efwg-2KTW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UyWmX8lyk6Q6Z7q+BldQ+cSN+KVoYs+SIyHi5V2ZslY=;
	b=peEO2RQMFXaIluYeeud6gLbCDaDrueelwCG5Jbhm2uYPmZTns9jGPk1sD1Oi2J
	9nwb2+KfyRhfvwoE3/GpC3bFsVJhKS8QvJ32BrmWc7ZY9udfsm1hJf80PL5kX9Kw
	Kj4BVCned518h/+k/kn1Wx/Ve3AYzWt8xB8V80YwOIlHM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXPz0r0BlpBasYAg--.7967S3;
	Sun, 16 Nov 2025 21:22:53 +0800 (CST)
Date: Sun, 16 Nov 2025 21:22:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.18, 2nd round
Message-ID: <aRnQK0kiLvQZ9X-f@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: M88vCgCXPz0r0BlpBasYAg--.7967S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw47Xw15KF43XFW5ZFb_yoW8Xw47pF
	WSkw17Gr1fGF1rAF1DJa1v9a90yrn5JF15Gw4DG3y8trn8ZryUXrnxGrn5Wry5Kry7X3y5
	tF18Jr1DGw1kZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBrWrUUUUU=
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOA7fRWkZ0C6S-AAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052306_714614_A1FB2681 
X-CRM114-Status: UNSURE (   6.38  )
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

The following changes since commit 6504297872c7a5d0d06247970d32940eba26b8b3:

  arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18-2

for you to fetch changes up to e89ee35567d3d465ef0715953170be72f5ef1d4c:

  arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity (2025-11-16 21:10:06 +0800)

----------------------------------------------------------------
i.MX fixes for 6.18, 2nd round:

- Correct i.MX8DXL's pcie-ep interrupt number (Frank Li)
- Swap interrupt numbers of eqos for imx8dxl-ss-conn (Frank Li)
- Correct SAI3 interrupt line for i.MX6UL (Maarten Zanders)
- Correct mux-controller select/enable-gpios polarity for imx8qm-mek
  board (Xu Yang)

----------------------------------------------------------------
Frank Li (2):
      arm64: dts: imx8dxl: Correct pcie-ep interrupt number
      arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos

Maarten Zanders (1):
      ARM: dts: nxp: imx6ul: correct SAI3 interrupt line

Xu Yang (1):
      arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity

 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 4 ++--
 4 files changed, 10 insertions(+), 5 deletions(-)


