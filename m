Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC28C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8GlZLcOq/1TKQQu2gibplQv4pt4AVLjA4QI65SUIoMs=; b=riOSMsGJwmGH7waeUBnYkWj4oA
	Asj7KJvmshTNwuGEiVJWB3LhVKGCGhjCnWsF3s3Zt5DtwhZMV5CPu+iioT8meLEOb1fvl4PDJQwum
	m646xyQMn+AQQyrdPjRKz/k3qIq03wZEa5XwCsm4KG7jYmJHnL0LRPnyTaELtBA2/dsn/VjA55uuk
	rRFV6S2gB4/io0RqVyjDNdS/9BsUn0kFbKdQUG8w3Yz7Gl1A8SJ1sEC2socRCBMifPHk6bEmuTu5N
	ymbi/HnA+/hE8Xqx/7HvvlUy2TnLZ7mbYCkYvZHDIB+bLQGEdgbGy7dJXwu3S71VANVZJ3UwlZmTv
	CIQIF06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qul-00000001d7X-19yj;
	Fri, 04 Sep 2026 10:12:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Qui-00000001d6w-1KnR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:12:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-485850cf499so443964f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516770; x=1789121570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GlZLcOq/1TKQQu2gibplQv4pt4AVLjA4QI65SUIoMs=;
        b=Tn4D1HEA5982dBnI4m1nJZM2dTGBimyXUjLzVm3Btd0ysC/VArXQkjEGx0+yCCqGr3
         7jMg0xKAN9swjMl3fSCrzOWrdf01dVUKyTlYp7yOaFFQ/oM8qCk/cEK1eEPD4FLZKOlX
         fE4KNuHyKB1EbKdXb/s0Z9HXrjmvSUuoOdhfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516770; x=1789121570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GlZLcOq/1TKQQu2gibplQv4pt4AVLjA4QI65SUIoMs=;
        b=Ta2bOLrFUQOppmJdTPC8kQvLbit+A0IMZjaSJAwGwS8OygIKcjxugT85sMCktoQM3M
         BYsmXoxQWVEQ0LVva+tChY4yXUmdyNtGe7dvpvvcRtDPIpYt5G2vR5q2GnJG4FVUvMqj
         1pl2pGrWf7Mn1W7KflIf3iNhZjuOLTZQlVY4ZFQWeF9o8Gvy9GCfi4kBCEhGxxc5c/OC
         dEI2UJMsghM7/z6zkmq9KVEEJQRKJTYnDf3o/OFZmeVCPFTMwN8AQ4FupRvuvxBfIPnk
         8QKHOYZ4AgOSut8jvSEQpX3rxtkqm1RNAlmh6aFsTezMuc5wypaCIOWrfBLw2mv/8zxv
         YKCw==
X-Forwarded-Encrypted: i=1; AKwUvBwSscsy1m9L5+XCyTj4HiPf7klORn+Dn2R7j+a/FtWcSmPjnhOhWDDjxqeLtce8/tye9jwaywpNkvST3QVGumfl@lists.infradead.org
X-Gm-Message-State: AFuF++lleIzEpxieq4XH5HFKv9rWW8/+eDxZwSUvi0NI6/ZkubGMeJI3
	IibzjVDbX8cOURYOp/LAbuLLbyU+ih+b9gFUJsq/ZmvhtGj2M9gsjJg7uRY4EscCWns=
X-Gm-Gg: AYBFou3iL2/9o0OO5TKrBkPp8J/8NkjusjSrO0Is7GHSHzyEw29sXztwTIZ1DtD52C2
	cdVCe5sJrsUKcwV+Wz5Bg6hRlSeKYN95AzKIqPRrFAfI6ZVKvNWkEgr0GJ85dA9oqGbDKnKRWnP
	D6XFg5MPvwwEZFAwcH2xJT9YEKbASKUjMdOZmEuEyH8lbTmsg8O7TnDWKPKesEW11/WvmRqbigK
	QGsb15wl925SWvomSymi4msBm+yza6nf5yuijFIbMv00mrNj8qnXSYMrk9wn07Qrvi8z5TRr4aQ
	qjpBF2I8FWZgH7WCR0mDvNWuXeskq5BQl0pyZo5qblbldmXWr3JlZTxokz+P44KmB7ckd5LJupE
	6c04fCYtpEDNFLCz8q3B9o1EogzMZlaTfFJcJTYfo/iq2qBxHSGdaHlMv08TZiaBXZ2RCpzae+9
	wP6DX/VjeFV2QEpk2oWvTdt+Bw3otMhM8vpw3u63nQMZqlCLOJjiaSgr6K8bfgyeQVpUZm5KTPw
	9tBDF+HYEsf2ffn9H6kO66bJzWIOaBVZDcnaMY8kndGc84T2HsSoa1qkvafrSUf6eGPuiiM5sl2
	P7DMEH0aoeLWGspP0G/aI2pND3+bpvqmakACCRsNKwRj1zHSjSt4xMs=
X-Received: by 2002:a05:6000:46c8:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-485872a5523mr6326417f8f.18.1788516769126;
        Fri, 04 Sep 2026 03:12:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 0/4] Support spread spectrum clocking for i.MX8M PLLs
Date: Fri,  4 Sep 2026 12:06:29 +0200
Message-ID: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_031252_390424_6A475A2E 
X-CRM114-Status: GOOD (  22.45  )
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

The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

While at it, it validates the spread spectrum configuration in the clk
core before it reaches the providers, and fixes the i.MX SCMI OEM
extension, which converted the spread to the wrong unit.

Patches 1 and 2 are fixes for 7.3 with Peng's Reviewed-by and do not
depend on the rest of the series, so they can be picked up separately.
Patches 3 and 4 are new material for the next merge window.

Changes in v14:
 - Move the fixes first, so that they can be picked up separately from
   the new patches.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.

Changes in v11:
 - Add patch "clk: validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.
 - Fix issues claimed by Sashiko for patch "clk: imx: pll14xx: support
   spread spectrum clock". See the details in the patch changelog.
 
Changes in v10:
 - Drop patches 1-22, superseded by the generic spread spectrum clocking
   support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
   is no longer needed. This patch is now based on the following commits:
    - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
    - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
    - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
    - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
    https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
 - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
 - Fix building warning raised by the kernel test robot for patch
   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
 - Add patches for imx8m{m,p} platforms:
    - 23/23 clk: imx8mm: support spread spectrum clock generation
    - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
    - 21/23 clk: imx8mp: support spread spectrum clock generation
    - 20/23 clk: imx8mp: rename ccm_base to base
    - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
 - Drop the patches added in version 7:
    - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
    - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
    - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
    - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
    - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
 - Add and manage fsl,anatop property as phandle to the anatop node with
   the new patches:
    - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
    - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
    - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
    - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
    - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
 - Merge patches:
    10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
    11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
    12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
    to
    05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
    now renamed
    05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
 - Split the patch
    15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
    into
    12/18 dt-bindings: clock: imx8m-clock: add PLLs
    16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
 - Fix compilation errors.
 - Separate driver code from dt-bindings

Changes in v4:
 - Add dt-bindings for anatop
 - Add anatop driver
 - Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
 - Patches 1/8 has been added in version 3. The dt-bindings have
   been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
   anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
   syscon, so it represents a memory area accessible by ccm
   (imx8m-clock.yaml) to setup the PLLs.
 - Patches {3,5}/8 have been added in version 3.
 - Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
 - Add "allOf:" and place it after "required:" block, like in the
   example schema.
 - Move the properties definition to the top-level.
 - Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (4):
  clk: scmi: fix SSC spread conversion
  clk: validate spread spectrum configuration
  clk: scmi: reject SSC configuration out of the OEM field range
  clk: imx: pll14xx: support spread spectrum clock generation

 drivers/clk/clk-scmi-oem.c             |  27 ++++++-
 drivers/clk/clk.c                      |  14 ++++
 drivers/clk/clk_test.c                 |  12 +--
 drivers/clk/imx/clk-pll14xx.c          | 103 +++++++++++++++++++++++++
 drivers/clk/kunit_clk_assigned_rates.h |   4 +-
 5 files changed, 148 insertions(+), 12 deletions(-)

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0


