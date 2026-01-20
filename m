Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88ED2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUYCmm7bxQSQh4lEwFnqu0YDtSfIfUIIpR6xtUikt9E=; b=AGP6aq6+Zl8I78MdgJ7nGpupIL
	B2fX2nXiEHQPnpcUcPdzuEzRGAXhoLo0jGHuS2UTfKcXthvFOoc5s4B1LcHkrTS3mxTHoVQ/DyyFF
	pnbstdkL4CbH6Wk8yukqSIViKtoQwaaARHHYGGgtXZwn0yLGT8HDAD2vJ6hOrP5d326fwLJucbk4S
	g2ZTyh7fW2ZY1TmuVWIe/yRDP2+P4JbYU0f3v/TdjTkwuBNaQjIYRCfw5ZtI+yADIOwSD3qdP07H+
	q1IyoKeNFoqwYDvXma6+gcNOzqRUsxavBiePrnV5hKiBOTZlY/AvprK3v2Uq9w+7ZiDxYy4loXu0w
	DejPAhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0J5-000000031FV-270s;
	Tue, 20 Jan 2026 01:13:19 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0Id-000000031DH-1132
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vU
	YCmm7bxQSQh4lEwFnqu0YDtSfIfUIIpR6xtUikt9E=; b=E+7EYX5L2jcZYYboGr
	yq4Wptk9e1lmiyp9Nt9ZfmRIZJeyrBwDWZp9b3DscB+jVLUP9JnKPjIApEOxbLJR
	o8fcl/MsTUxvoL+Aec7ggquensOvsqKBU1DslC7IETQ9WlNqrCZEwAS0zllN2Sbk
	Vz/nJemRBf06e/z1tcW2yVW2c=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S2;
	Tue, 20 Jan 2026 09:12:28 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers changes for 6.20
Date: Tue, 20 Jan 2026 09:12:14 +0800
Message-ID: <20260120011221.4387-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: M88vCgD3_+V71m5pGbEbAg--.16504S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw4Dury3GF13WF4UJwb_yoW8Xr47pF
	4fGr9xCr1kGrW3Jr1fJr4UAF1Yqws5CrW5J3yxJa48Xr1UCF1DJr12yw48XryDtryxGw43
	KF17Wr1DKF1rtrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnfHUUUUUU=
X-Originating-IP: [121.224.201.168]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR7KMGlu1n6LTwAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_171251_603718_BCEFD55F 
X-CRM114-Status: UNSURE (   5.60  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.20

for you to fetch changes up to f6ef3d9ff81240e9bcc030f2da132eb0f8a761d7:

  soc: imx8m: Fix error handling for clk_prepare_enable() (2026-01-18 10:33:42 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.20:

- A few changes from Peng Fan adding dump syslog support for i.MX
  System Manager firmware driver, cleaning up soc-imx9 driver, fixing
  error handling for soc-imx8m driver

----------------------------------------------------------------
Peng Fan (6):
      firmware: arm_scmi: imx: Support getting syslog of MISC protocol
      firmware: imx: sm-misc: Dump syslog info
      soc: imx: Use device-managed APIs for i.MX9
      soc: imx: Use dev_err_probe() for i.MX9
      soc: imx: Spport i.MX9[4,52]
      soc: imx8m: Fix error handling for clk_prepare_enable()

 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
 drivers/firmware/imx/sm-misc.c                     | 37 +++++++++-
 drivers/soc/imx/soc-imx8m.c                        |  6 +-
 drivers/soc/imx/soc-imx9.c                         | 46 +++++-------
 include/linux/scmi_imx_protocol.h                  |  2 +
 5 files changed, 142 insertions(+), 32 deletions(-)


