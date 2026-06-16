Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44287CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HxWtK9CW7zSp/AinsKXcXeXES3z/hbXl9XIT9z/apM=; b=NBsm72T8DU6dE7oTjxkoK5VslN
	8VFxxpVk95DwJL43JqC3keMpdPbUi/BqVCEd3aPRQNachRWlGaH/3V73vqxHP7Zly+WmnWvfPj3ho
	uW/w9yZ6SAV7dL8gdyi1FTlfDHvQUubBo5LVi7W5mJLUyZA43TmZyvO6iHL0j38A3VgV60U9RXCDS
	+aa/6QCucS3j3gQUGwQTLpr9lKY3xGrGkPvi7ZexISAxDXFJ0NPdQV22SrFPLjhOfJGCT3orqByZk
	7gfcDJ4NBEB5AQfbHak8teIyVd7dZ6aZJDOf6R1Pj25DuuHupbW9ycJV5JkiIqHA72KWRJx7ToV+Z
	6MmacDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZObu-0000000FOxc-1Vcb;
	Tue, 16 Jun 2026 07:53:26 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZObr-0000000FOxF-1PNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:53:25 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 705F41D001AE;
	Tue, 16 Jun 2026 03:53:22 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 16 Jun 2026 03:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781596402;
	 x=1781682802; bh=+HxWtK9CW7zSp/AinsKXcXeXES3z/hbXl9XIT9z/apM=; b=
	ftzNLp/kAFznO0taZhnlAXt3OBh0wi9fI+OORrIYsoblgtIKKSQ1iOZlK9j5wH70
	SLBYJs0ZzTfTpTxGC/twUuQ5niSUC2SYeBolzARM/BH0tAelBGBK4iLt0t0LjfCl
	lbmkN7aXTr2X56fGexQ5HU2RlJ/xJlbEua+mU4ROcsD7vUKZQ1lrj5TPrtxFdN8z
	/qb5QZsAndZnMdq2Ym6hBKhjUbscRP+cBcB+R9vTcLFo6oMeAPz1ORjSYzCdcbHt
	hyibtXJ2HSoKm4w8AUGz+0ieC1tPz9e+rcLwf85XnOtcQe7JAgbNOCVh+NreHG4t
	hTIfjBdBgwlgqXOWtT/EFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781596402; x=
	1781682802; bh=+HxWtK9CW7zSp/AinsKXcXeXES3z/hbXl9XIT9z/apM=; b=N
	UYEXB0zxfsy0oGlMBaz0Xa/vbYKQihIcVr3PtXHutrEJVdhkQ7ZprMzypdyhBxCg
	wP3jHZdP+vb0tlmXUDeC7p7P4o7/HShLVdOg1lbyO86alnwZdyXckvTI0bprccQ1
	7rfN/ZCQmkuYf9BvAgHfdbrPry0zXa2eqC+EoBJQJROR+xxkCh5ILSdAnWNMCUJR
	jsma+7ytN8KKTwATLhlN7QqVmTc+9/qJ86UwwPDmtYriIGVDBNKmajMl22Ix5hY6
	gi1aXfVqMKyqa8/ph/J3Z1YVSugYUCkAmMI1n/K1575VIxXm2kwDYda7aspM0qKC
	jVas+bprBkM498+nVmSVA==
X-ME-Sender: <xms:8gAxagORPgeG8YHsOSAytakCwQ1HcChdGeQ0Glgq5m94clc1bTKErA>
    <xme:8gAxahxEP3CWb5YTK3xwgYJvXj3nDgi_bPwk8WkumOTTWCkYyPoJP5zFCyxc1gfE0
    x8Yg7hySQ9sO7HJTkHvgOHq-8GLpz8sVwxl0Wa8v0bbUnnT9lKo-W4>
X-ME-Proxy-Cause: dmFkZTFi8rGVsyzIXil49SEqW1jILLSPPR0hdXRgLCSQs34MTB0ysKTJmvUnJJpdwFPp+H
    X0KEQaU4d8pwwWh/hupU5N3lUMMueYMpVrlrAPD2EdmWMvIu+X3yz6Fea8YPKaIAZlvayS
    xzqtWGiCaKsrm3FJjjy8QDXO44FO0LPdHGWSPXTAgSxWPrpgH+98ZhWbLCgLqDQPmpzoFv
    MvLwSlA/1aLHQu5jEr9qqEuyEiN/7U9YK106DUtC5EGzauEUiPaD8sBt+s6q5Qge966ePL
    +81UFhYDBoyTlBGZcSh0ShFqEaao+d8e2nDTXlF8QDUcRYDZw64UQrR6cVwlTR419sMoBD
    e/PzvycTiHQS1H4qWu2O688phVbxD3Z52JH0iLmtgq1xvtMIZGawZSCygneHlm0jIOx+29
    lKnOllUF3OyFhFuKI/MFPA61mreMMD4h32jSpEzlnvT99Vk6s2n3wSSzB4IJ0NTDLqjz7P
    v2xY9c/J3yHexdLhGEUlhMLXp+1IRBtnuLt2ZS12T7neppDl/X2xZ6rnJTEx9yyERoYMGu
    B/DsVhbiwPpa1oPk3ABhIY7QFkzMdpU7nj7SvE3pVKc1nbt67QXTyLspYYe76LmQtfClH4
    mRNkQyYIxFLps4S7f3vngySUi1l40uWFF2eRh0Gqp225z0sBKJpnqnWezSkQ
X-ME-Proxy: <xmx:8gAxapwrgF5pUFqeGb9eviwz6iFYKGPTbwytdSsKDcOlnZVQ5pvzFg>
    <xmx:8gAxaoW0-W0C-PHFpzs2G6tZCL7Xlet-jc6n1XhINm9GZjIPkAFY3A>
    <xmx:8gAxapgYqn-lKNEfIjaeTig3Vsh8Va0-rCpb8qX-WMR_AJXzF02AwQ>
    <xmx:8gAxaoAmjh4iv977Rm21RE6vFLbfMPVVL9_nyliA16crBmjU2dqBjw>
    <xmx:8gAxautw0V-6L_OfCIrdnYvWcpPDmDx-TyLABEvquegxhy2rHJVpBjFF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE3B71820082; Tue, 16 Jun 2026 03:53:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 09:53:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Marek Vasut" <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org
Message-Id: <528465a7-4ffb-45ed-82e4-898b01d2da98@app.fastmail.com>
In-Reply-To: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com>
Subject: [GIT PULL 2/4] soc: drivers for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005323_499231_17BD5D2B 
X-CRM114-Status: GOOD (  13.51  )
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

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.2

for you to fetch changes up to c7437fab2f2249c1f12d805770c5ba15cbd0e46a:

  Merge tag 'memory-controller-drv-7.2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers (2026-06-15 13:46:03 +0200)

----------------------------------------------------------------
soc: drivers for 7.2

There are a few added drivers, but mostly the normal maintenance to drivers
for firmware, memory controller and other soc specific hadware:

 - The NXP QuickEngine gets modern MSI support, which allows some cleanups to
   the GICv3 irqchip chip driver

 - A new SoC specific driver for the Renesas R-Car MFIS unit is added,
   encapsulating support for the on-chip mailbox and hwspinlock
   implementations that are not easily separated into individual
   drivers

 - The Qualcomm SoC drivers add support for additional SoC implementations,
   and flexiblity around power managedment for the serial-engine driver
   as well as probing the LLCC driver using custom hardware descriptions
   inside of the device itself.

 - Added support for the Samsung thermal management unit

 - A cleanup to the Tegra 'PMC' driver interfaces to remove legacy
   APIs and allow multiple PMC instances everywhere.

 - Updates to the TI SCI and KNAS drivers to improve suspend/resume
   support.

 - Minor driver changes for mediatek, xilinx, allwinner, aspeed, tegra,
   broadcom, amd, microchip and starfive specific drivers

 - Memory controller updates for Tegra and Renesas for additional SoC
   types and other improvements.

 - Firmware driver updates for Arm FF-A, SMCCC and SCMI interfaces,
   to update driver probing, object lifetimes and address minor bugs.

----------------------------------------------------------------
Abel Vesa (4):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza compatible
      dt-bindings: soc: qcom,aoss-qmp: Document the Eliza Always-On Subsystem side channel
      dt-bindings: cache: qcom,llcc: Document Eliza LLCC block
      soc: qcom: llcc-qcom: Add support for Eliza

Alexander Dahl (1):
      memory: atmel-ebi: Allow deferred probing

Alexander Koskovich (3):
      soc: qcom: socinfo: Add PMIV0102 & PMIV0104 PMICs
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7750
      soc: qcom: socinfo: Add SoC ID for SM7750

Andre Przywara (1):
      firmware: smccc: Fix Arm SMCCC SOC_ID name call

Arnd Bergmann (20):
      Merge tag 'soc_fsl-7.1-2' of https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v7.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      firmware: samsung: acpm: remove compile-testing stubs
      Merge tag 'qcom-drivers-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'scmi-updates-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'ffa-updates-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'amdtee-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'optee-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'tegra-for-7.2-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-7.2-pmc' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'tegra-for-7.2-firmware' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into soc/drivers
      Merge tag 'samsung-drivers-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'memory-controller-drv-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'arm-soc/for-7.2/drivers' of https://github.com/Broadcom/stblinux into soc/drivers
      Merge tag 'ti-driver-soc-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'cache-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'riscv-soc-drivers-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/drivers
      Revert "Documentation: ABI: add sysfs interface for ZynqMP CSU registers"
      Revert "firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface"
      Merge tag 'memory-controller-drv-7.2-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers

Ashish Mhetre (5):
      memory: tegra: Make ->resume() callback return void
      memory: tegra: Wire up system sleep PM ops
      memory: tegra: Restore MC interrupt masks on resume
      dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
      memory: tegra: Add Tegra238 MC support

Bjorn Andersson (2):
      Merge branch '20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com' into drivers-for-7.2
      Merge branch '20260227061544.1785978-1-praveen.talari@oss.qualcomm.com' into drivers-for-7.2

Chen-Yu Tsai (7):
      dt-bindings: sram: Document Allwinner H616 VE SRAM
      dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
      soc: sunxi: sram: Const-ify sunxi_sram_func data and references
      soc: sunxi: sram: Allow SRAM to be claimed multiple times
      soc: sunxi: sram: Support claiming multiple regions per device
      soc: sunxi: sram: Add H616 SRAM regions
      firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST

Christophe Leroy (CS GROUP) (1):
      soc: fsl: qe_ports_ic: switch to irq_domain_create_linear()

Claudiu Beznea (5):
      soc: renesas: r9a08g045-sysc: Move common code to a helper
      soc: renesas: r9a08g046-sysc: Move common code to a helper
      soc: renesas: r9a09g047-sys: Move common code to a helper
      soc: renesas: r9a09g056-sys: Move common code to a helper
      soc: renesas: r9a09g057-sys: Move common code to a helper

Conor Dooley (1):
      dt-bindings: soc: microchip: document irqmux on pic64gx

Cristian Marussi (16):
      clk: scmi: Fix clock rate rounding
      firmware: arm_scmi: Add clock determine_rate operation
      clk: scmi: Use new determine_rate clock operation
      firmware: arm_scmi: Simplify clock rates exposed interface
      clk: scmi: Use new simplified per-clock rate properties
      firmware: arm_scmi: Drop unused clock rate interfaces
      firmware: arm_scmi: Make clock rates allocation dynamic
      firmware: arm_scmi: Harden clock parents discovery
      firmware: arm_scmi: Refactor iterators internal allocation
      firmware: arm_scmi: Add bound iterators support
      firmware: arm_scmi: Use bound iterators to minimize discovered rates
      firmware: arm_scmi: Introduce all_rates_get clock operation
      firmware: arm_scmi: Add transport instance handles
      firmware: arm_scmi: Add a generic transport supplier
      firmware: arm_scmi: virtio: Rework transport probe sequence
      firmware: arm_scmi: optee: Rework transport probe sequence

Dan Carpenter (1):
      soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()

Deepti Jaggi (3):
      dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
      dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
      soc: qcom: socinfo: Add SoC ID for Nord SA8797P

Diogo Ivo (1):
      soc/tegra: pmc: Restrict power-off handler to Nexus 7

Dmitry Baryshkov (3):
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      soc: qcom: ubwc: add helper controlling AMSBC enablement

Dominique Belhachemi (1):
      cache: sifive_ccache: Add StarFive JH7110 SoC support

Ethan Tidmore (1):
      memory: tegra: Fix possible null pointer dereference

Felix Gu (1):
      soc: fsl: qe_ports_ic: Add missing cleanup on device removal

Fenglin Wu (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string

Francisco Munoz Ruiz (3):
      dt-bindings: cache: qcom,llcc: Document Hawi SoC
      soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory
      soc: qcom: llcc-qcom: Capitalize LLCC/EDAC in comments and diagnostics

Geert Uytterhoeven (9):
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-drivers-for-v7.2
      firmware: arm_scmi: quirk: Improve quirk range parsing
      firmware: arm_scmi: quirk: Simplify quirk table iteration
      firmware: arm_scmi: Convert to list_for_each_entry()
      soc: renesas: Convert to of_machine_get_match()
      firmware: arm_scmi: Fix bound iterators returning too many items
      firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
      firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()
      firmware: arm_scmi: Fix OOB in scmi_power_name_get()

Harrison Vanderbyl (1):
      firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in

Hirokazu Honda (1):
      tee: optee: Allow MT_NORMAL_TAGGED shared memory

Ioana Ciornei (1):
      bus: fsl-mc: wait for the MC firmware to complete its boot

Jamie Nguyen (1):
      firmware: arm_ffa: Honor partition info descriptor size

Jason-JH Lin (2):
      soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
      soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa

Jon Hunter (3):
      soc/tegra: pmc: Populate powergate debugfs only when needed
      firmware: tegra: bpmp: Propagate debugfs errors
      firmware: tegra: bpmp: Add support for multi-socket platforms

Judith Mendez (2):
      dt-bindings: hwinfo: ti,k3-socinfo: Add nvmem-cells support
      soc: ti: k3-socinfo: Add support for AM62P variants via NVMEM

Julian Braha (1):
      soc: aspeed: cleanup dead default for ASPEED_SOCINFO

Justin Chen (1):
      soc: brcmstb: consolidate initcall functions

Kartik Rajput (2):
      soc/tegra: fuse: Register nvmem lookups at probe
      soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info

Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650 family
      soc: qcom: socinfo: add SoC ID for IPQ9650 family

Komal Bajaj (3):
      dt-bindings: cache: qcom,llcc: Document Shikra LLCC
      dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      soc: qcom: socinfo: Add SoC ID for Shikra IoT variants

Konrad Dybcio (1):
      soc: qcom: socinfo: Add PMICs that ship with Glymur

Krzysztof Kozlowski (9):
      Merge branch 'for-v7.2/tegra114-mc-bindings' into mem-ctrl-next
      memory: tegra114-emc: Do not print error on icc_node_create() failure
      memory: tegra114-emc: Simplify tegra114_emc_interconnect_init() error message
      soc: aspeed: Move MODULE_DEVICE_TABLE next to the table itself
      memory: omap-gpmc: Silence W=1 kerneldoc warnings
      Merge tag 'mtk-soc-for-v7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'renesas-drivers-for-v7.2-tag2' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'sunxi-drivers-for-7.2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into soc/drivers
      Merge tag 'aspeed-7.2-drivers-0' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/bmc/linux into soc/drivers

Lad Prabhakar (2):
      dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
      memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms

Linus Walleij (1):
      Merge tag 'zynqmp-soc-for-7.2' of https://github.com/Xilinx/linux-xlnx into soc/drivers

Luca Leonardo Scorcia (1):
      soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge

Marc Zyngier (6):
      fsl-mc: Remove MSI domain propagation to sub-devices
      fsl-mc: Add minimal infrastructure to use platform MSI
      irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
      fsl-mc: Switch over to per-device platform MSI
      fsl-mc: Remove legacy MSI implementation
      platform-msi: Remove stale comment

Marek Vasut (2):
      firmware: arm_scmi: Rename struct scmi_revision_info to scmi_base_info
      soc: renesas: Identify R-Car R8A779MD M3Le SoC

Md Shofiqul Islam (1):
      soc: ti: knav_qmss_queue: Implement resource cleanup in remove()

Mikko Perttunen (1):
      memory: tegra: Deduplicate rate request management code

Mukesh Ojha (3):
      dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
      dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
      soc: qcom: pd-mapper: Add support for Hawi SoC

Nishanth Menon (11):
      soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
      soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
      soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
      soc: ti: knav_qmss: Fix kernel-doc Return: tags
      soc: ti: knav_qmss: Use %pe to print PTR_ERR()
      soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
      soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
      soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
      soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
      soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
      soc: ti: k3-ringacc: Use str_enabled_disabled() helper

Peng Fan (2):
      firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      firmware: imx: sm-misc: Print boot/shutdown reasons

Prasanna Kumar T S M (2):
      soc: xilinx: Fix race condition in event registration
      soc: xilinx: Shutdown and free rx mailbox channel

Prathamesh Shete (1):
      soc/tegra: pmc: Add Tegra238 support

Praveen Talari (7):
      soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
      soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
      soc: qcom: geni-se: Introduce helper API for resource initialization
      soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
      soc: qcom: geni-se: Add resources activation/deactivation helpers
      soc: qcom: geni-se: Introduce helper API for attaching power domains
      soc: qcom: geni-se: Introduce helper APIs for performance control

Raj Aryan (1):
      soc: qcom: spmi-pmic: add SUBTYPEs for Glymur/Kaanapali/SM8750 PMICs

Randy Dunlap (2):
      virt: fsl_hypervisor: fix header kernel-doc warnings
      soc: ti: knav_dma: fix all kernel-doc warnings in knav_dma.h

Rijo Thomas (1):
      tee: amdtee: store buffer ID in tee_shm->sec_world_id

Rodrigo Zaiden (1):
      tee: optee: fix kernel-doc warnings

Ronak Jain (2):
      Documentation: ABI: add sysfs interface for ZynqMP CSU registers
      firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface

Rosen Penev (1):
      soc: qcom: wcnss: fix leak of fw

Samuel Holland (1):
      bus: sunxi-rsb: Always check register address validity

Sasha Levin (1):
      firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol

Shawn Guo (2):
      dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
      soc: qcom: socinfo: Add PMIC PMAU0102

Sheetal (1):
      bus: tegra-aconnect: Use dev_err_probe for probe error paths

Siddharth Vadapalli (1):
      soc: ti: k3-ringacc: Fix access mode for k3_ringacc_ring_pop_tail_io/proxy

Stepan Ionichev (1):
      clk: scpi: Unregister child clock providers on remove

Sudeep Holla (19):
      firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
      firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
      firmware: arm_ffa: Avoid collapsing NPI work from different CPUs
      firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
      firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
      firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
      firmware: arm_ffa: Keep framework RX release under lock
      firmware: arm_ffa: Validate framework notification message layout
      firmware: arm_ffa: Align RxTx buffer size before mapping
      firmware: arm_ffa: Snapshot notifier callbacks under lock
      firmware: arm_ffa: Fix sched-recv callback partition lookup
      firmware: arm_ffa: Register core as a platform driver
      firmware: arm_ffa: Set the core device as FF-A device parent
      firmware: arm_ffa: Defer probe until pKVM is initialized
      firmware: arm_scmi: Read sensor config as 32-bit value
      firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      firmware: arm_scmi: Validate Powercap domains before state access
      firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss

Sumit Gupta (6):
      memory: tegra264: Skip clients without bpmp_id or type
      dt-bindings: memory: tegra264: Add full set of MC client IDs
      memory: tegra264: Add full set of MC clients
      memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
      memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
      memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()

Svyatoslav Ryhel (4):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller
      memory: tegra: Implement EMEM regs and ICC ops for Tegra114
      memory: tegra: Add Tegra114 EMC driver

Thierry Reding (11):
      MAINTAINERS: Move Peter De Schrijver to CREDITS
      Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse
      ata: ahci_tegra: Explicitly specify PMC instance to use
      drm/nouveau: tegra: Explicitly specify PMC instance to use
      drm/tegra: Explicitly specify PMC instance to use
      media: vde: Explicitly specify PMC instance to use
      PCI: tegra: Explicitly specify PMC instance to use
      usb: xhci: tegra: Explicitly specify PMC instance to use
      soc/tegra: pmc: Create PMC context dynamically
      soc/tegra: pmc: Remove unused legacy functions
      soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard

Thomas Richard (TI) (4):
      firmware: ti_sci: Add BOARDCFG_MANAGED mode support
      firmware: ti_sci: Add support for restoring IRQs during resume
      clk: keystone: sci-clk: Add restore_context() operation
      firmware: ti_sci: Add support for restoring clock context during resume

Tony Truong (1):
      soc: qcom: smem: Switch partitions to xarray

Tudor Ambarus (11):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

Wang Jun (1):
      soc: fsl: qe: panic on ioremap() failure in qe_reset()

Wolfram Sang (5):
      dt-bindings: soc: renesas: Document MFIS IP core
      soc: renesas: Add Renesas R-Car MFIS driver
      soc: renesas: Add R-Car X5H PRR support
      dt-bindings: soc: renesas: mfis: Add R-Car V4H/V4M support
      soc: renesas: rcar-mfis: Add R-Car V4H/V4M support

Yeoreum Yun (1):
      Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"

 CREDITS                                            |   10 +
 Documentation/ABI/testing/sysfs-driver-tegra-fuse  |    2 +-
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   43 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    3 +
 .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml  |   11 +
 .../memory-controllers/nvidia,tegra124-emc.yaml    |  174 +--
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   31 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |   31 +
 .../memory-controllers/renesas,rzg3e-xspi.yaml     |   60 +-
 .../soc/microchip/microchip,mpfs-irqmux.yaml       |    6 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    2 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    6 +
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml         |   31 +-
 .../soc/renesas/renesas,r8a78000-mfis.yaml         |  221 ++++
 .../sram/allwinner,sun4i-a10-system-control.yaml   |    5 +-
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 MAINTAINERS                                        |    1 -
 drivers/ata/ahci_tegra.c                           |   17 +-
 drivers/base/platform-msi.c                        |    4 -
 drivers/bus/fsl-mc/dprc-driver.c                   |   14 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |   50 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c                    |  166 +--
 drivers/bus/fsl-mc/fsl-mc-private.h                |    2 +-
 drivers/bus/sunxi-rsb.c                            |    3 +
 drivers/bus/tegra-aconnect.c                       |   14 +-
 drivers/cache/sifive_ccache.c                      |    2 +
 drivers/clk/clk-scmi.c                             |   48 +-
 drivers/clk/clk-scpi.c                             |    2 +-
 drivers/clk/keystone/sci-clk.c                     |   45 +-
 drivers/clk/samsung/Kconfig                        |    2 +-
 drivers/clk/samsung/clk-acpm.c                     |    8 +-
 drivers/firmware/Kconfig                           |    5 +-
 drivers/firmware/arm_ffa/bus.c                     |    7 +-
 drivers/firmware/arm_ffa/common.h                  |    4 +-
 drivers/firmware/arm_ffa/driver.c                  |  228 +++-
 drivers/firmware/arm_ffa/smccc.c                   |    2 +-
 drivers/firmware/arm_scmi/base.c                   |   25 +-
 drivers/firmware/arm_scmi/clock.c                  |  301 ++++-
 drivers/firmware/arm_scmi/common.h                 |  165 ++-
 drivers/firmware/arm_scmi/driver.c                 |   98 +-
 drivers/firmware/arm_scmi/power.c                  |    6 +-
 drivers/firmware/arm_scmi/powercap.c               |   18 +-
 drivers/firmware/arm_scmi/protocols.h              |   13 +-
 drivers/firmware/arm_scmi/quirks.c                 |   17 +-
 drivers/firmware/arm_scmi/sensors.c                |   12 +-
 drivers/firmware/arm_scmi/transports/optee.c       |   46 +-
 drivers/firmware/arm_scmi/transports/virtio.c      |   52 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |   86 ++
 drivers/firmware/imx/sm-misc.c                     |   73 ++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/firmware/samsung/Makefile                  |    1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   17 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |   20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         |  239 ++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |   28 +
 drivers/firmware/samsung/exynos-acpm.c             |  254 ++--
 drivers/firmware/samsung/exynos-acpm.h             |    2 +
 drivers/firmware/smccc/soc_id.c                    |    2 +-
 drivers/firmware/tegra/Kconfig                     |    2 +-
 drivers/firmware/tegra/bpmp-debugfs.c              |   55 +-
 drivers/firmware/ti_sci.c                          |  201 ++-
 drivers/firmware/ti_sci.h                          |    9 +
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    9 +-
 drivers/gpu/drm/tegra/dc.c                         |   14 +-
 drivers/gpu/drm/tegra/dc.h                         |    1 +
 drivers/gpu/drm/tegra/gr3d.c                       |    9 +-
 drivers/gpu/drm/tegra/sor.c                        |   16 +-
 drivers/irqchip/Kconfig                            |    6 -
 drivers/irqchip/Makefile                           |    1 -
 drivers/irqchip/irq-gic-its-msi-parent.c           |    7 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c        |  168 ---
 drivers/media/platform/nvidia/tegra-vde/vde.c      |   15 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h      |    1 +
 drivers/memory/atmel-ebi.c                         |    3 +-
 drivers/memory/omap-gpmc.c                         |    6 +-
 drivers/memory/renesas-rpc-if.c                    |    2 +-
 drivers/memory/tegra/Kconfig                       |   19 +
 drivers/memory/tegra/Makefile                      |    3 +
 drivers/memory/tegra/mc.c                          |   40 +-
 drivers/memory/tegra/mc.h                          |    9 +
 drivers/memory/tegra/tegra-emc-common.c            |  143 +++
 drivers/memory/tegra/tegra-emc-common.h            |   46 +
 drivers/memory/tegra/tegra114-emc.c                | 1351 ++++++++++++++++++++
 drivers/memory/tegra/tegra114.c                    |  193 +++
 drivers/memory/tegra/tegra124-emc.c                |  107 +-
 drivers/memory/tegra/tegra186-emc.c                |    4 +-
 drivers/memory/tegra/tegra186.c                    |    4 +-
 drivers/memory/tegra/tegra20-emc.c                 |  110 +-
 drivers/memory/tegra/tegra234.c                    |    8 +-
 drivers/memory/tegra/tegra238.c                    |  391 ++++++
 drivers/memory/tegra/tegra264.c                    |  585 ++++++++-
 drivers/memory/tegra/tegra30-emc.c                 |  107 +-
 drivers/mfd/sec-acpm.c                             |    6 +-
 drivers/pci/controller/pci-tegra.c                 |   19 +-
 drivers/soc/aspeed/Kconfig                         |    1 -
 drivers/soc/aspeed/aspeed-lpc-ctrl.c               |    2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c              |    2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c               |    2 +-
 drivers/soc/bcm/brcmstb/common.c                   |   88 +-
 drivers/soc/fsl/qe/qe.c                            |    3 +
 drivers/soc/fsl/qe/qe_ports_ic.c                   |   23 +-
 drivers/soc/mediatek/mt8167-mmsys.h                |   11 +-
 drivers/soc/mediatek/mtk-mmsys.c                   |    8 +-
 drivers/soc/mediatek/mtk-mutex.c                   |    5 +-
 drivers/soc/qcom/llcc-qcom.c                       |  481 ++++++-
 drivers/soc/qcom/qcom-geni-se.c                    |  270 +++-
 drivers/soc/qcom/qcom_pd_mapper.c                  |    8 +
 drivers/soc/qcom/smem.c                            |   56 +-
 drivers/soc/qcom/socinfo.c                         |   23 +
 drivers/soc/qcom/wcnss_ctrl.c                      |   11 +-
 drivers/soc/renesas/Kconfig                        |    9 +
 drivers/soc/renesas/Makefile                       |    1 +
 drivers/soc/renesas/r9a08g045-sysc.c               |   33 +-
 drivers/soc/renesas/r9a08g046-sysc.c               |   31 +-
 drivers/soc/renesas/r9a09g047-sys.c                |   34 +-
 drivers/soc/renesas/r9a09g056-sys.c                |   33 +-
 drivers/soc/renesas/r9a09g057-sys.c                |   44 +-
 drivers/soc/renesas/rcar-mfis.c                    |  384 ++++++
 drivers/soc/renesas/renesas-soc.c                  |   11 +-
 drivers/soc/sunxi/sunxi_sram.c                     |  196 +--
 drivers/soc/tegra/fuse/fuse-tegra.c                |   14 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   40 +-
 drivers/soc/tegra/pmc.c                            |  648 ++++++----
 drivers/soc/ti/k3-ringacc.c                        |    7 +-
 drivers/soc/ti/k3-socinfo.c                        |   41 +-
 drivers/soc/ti/knav_dma.c                          |    8 +-
 drivers/soc/ti/knav_qmss.h                         |    2 +-
 drivers/soc/ti/knav_qmss_acc.c                     |    2 +-
 drivers/soc/ti/knav_qmss_queue.c                   |  155 ++-
 drivers/soc/xilinx/zynqmp_power.c                  |   47 +-
 drivers/tee/amdtee/amdtee_private.h                |   16 -
 drivers/tee/amdtee/call.c                          |    2 +-
 drivers/tee/amdtee/core.c                          |   52 +-
 drivers/tee/optee/call.c                           |    3 +-
 drivers/tee/optee/optee_msg.h                      |   50 +-
 drivers/tee/optee/optee_private.h                  |  120 +-
 drivers/usb/host/xhci-tegra.c                      |   38 +-
 include/dt-bindings/arm/qcom,ids.h                 |   11 +
 include/dt-bindings/memory/nvidia,tegra238-mc.h    |   74 ++
 include/dt-bindings/memory/nvidia,tegra264.h       |  287 +++++
 include/dt-bindings/memory/tegra114-mc.h           |   67 +
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |   28 +
 include/linux/arm-smccc.h                          |    5 +
 include/linux/arm_ffa.h                            |    4 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   36 +-
 include/linux/fsl/mc.h                             |    6 +-
 include/linux/irqdomain_defs.h                     |    1 -
 include/linux/scmi_imx_protocol.h                  |   14 +
 include/linux/scmi_protocol.h                      |   36 +-
 include/linux/soc/mediatek/mtk-cmdq.h              |   24 +
 include/linux/soc/qcom/geni-se.h                   |   19 +
 include/linux/soc/qcom/llcc-qcom.h                 |   44 +-
 include/linux/soc/qcom/ubwc.h                      |   22 +
 include/linux/soc/ti/knav_dma.h                    |   11 +-
 include/soc/qcom/qcom-spmi-pmic.h                  |   15 +-
 include/soc/tegra/mc.h                             |    2 +-
 include/soc/tegra/pmc.h                            |   81 +-
 include/uapi/linux/fsl_hypervisor.h                |    4 +-
 159 files changed, 7850 insertions(+), 2365 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/firmware/samsung/exynos-acpm-tmu.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-tmu.h
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
 create mode 100644 drivers/memory/tegra/tegra-emc-common.c
 create mode 100644 drivers/memory/tegra/tegra-emc-common.h
 create mode 100644 drivers/memory/tegra/tegra114-emc.c
 create mode 100644 drivers/memory/tegra/tegra238.c
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

