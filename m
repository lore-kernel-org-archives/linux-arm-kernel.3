Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E227606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x6672KS5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IEvKB7pX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=; b=x6672KS5iqD9c61hjpJMr7QYL3
	+a4S5ZcYdD15AVASn0Qt9Rfoh5DRTytVeWMrQQq2sVohJcBn19hyoEyCJcuRGenjeBgvBixDUEl3X
	E4FW87kV66c9PMAcwSqOg9QDgSeeeujYd3O2w9n7qlD0svpRt6ve+QWMYvK1gnIwhwHxGB+lYregr
	0XbgE2wYhMK3bLvCkMSx5TmZOlVGDbFPs7Q/ZlmBwEWh9Q4KW61uFycjO78gaZl2kI+5msObr3UyD
	4peUCIZ2qoqOYD7iGXCHx3w4RlOUk0UMXIYdfdmBYvWr3p1td0s/BpOC9/T0TYBX0Www6y3/viz9W
	038PDrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wJ-0000000FbBP-0Vjn;
	Fri, 23 Oct 2026 06:39:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wG-0000000FbAn-1WXj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:39:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c4be28b82so395658f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737578; x=1793342378; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=IEvKB7pXBz6xCNKl2kft+3bDvd5cMq1fYn/UefwTNyU3Ppc9H8GGx9rQlvrmjkRXfw
         IVk//pC0cStVXQhNONLBqA7VsU1yPlYEkKH88xZHX9PlvCMGg5NVwXk8hROLZDGtoyhk
         Q8yC959L6Za3mKnjhxgb1rZ0CfbtEGx8fjhTEfS+McAOg/IlAyt+aXFFntKSMM15Sxy5
         h8I8+tDRPnl7n2Rg7NJC8DtSkudGkhWsg+jkt+ewKP6x8z5/KoqqlFcB5iLFtSQy32je
         lybIFmKYV2cZhy9G2htenaDRfanXzgqUTiJSxVksQ5YWBXs44OD7r2kOoZHjTapK9B8e
         RXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737578; x=1793342378;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w4cL4G9eHUbqDzKnbCFLNqMjngYxYEBxYMlVjjbvdqE=;
        b=CLCpiTJ1xba3FS1sOfd0F3GeftVkbPGqtQTf2Ez6Ys+Zpq794WbPNCttezogvW5FPv
         EmbrctSvr3GoCyQddXS/NMHFzsyLRim1CCrljyMPPR8fPxITjshIljeWAb71Lu15qYFM
         gQaeDgAyPV5DmRTvIsxrCdYb8gnRzN+uAYoCAA+YgBs7AR/EcuERaEbT4u2uWHu0pLDj
         1om+5Sj4ktSH3EfnmBVeHSiKw+N9L7iGh2aMWhqQgQAarD4L6T1HmOMRT3FrmbyAxuUR
         cUi36CpUOcvvMTq6mdzMUaFVrpKlRaZYVTglspTx9GfTHpGvxeQa1iIVM9zHCaR9sC+7
         NNDg==
X-Gm-Message-State: AFq9FYIjDoZ5OHhclG6VtJLGfKtgC9baev8lMMy7V/NiuuHhf0lJ+5zj
	6YguFad3bse/sy6MxSX7/odMYMO1P7eVJBuhflC167WS2wRcMEA/vtDD
X-Gm-Gg: AYBFou2dtzFk9XSWJ6xBvbxzhyK1YEJd85ZDM64BWN8nyUGyt8RvJ+XBKJPp+F2NsAt
	BvA9rg6M6iUJpKRzNaPtW5vAc8esorc651vszJkpI0CwiKW6Uq8UfGDh0GPLJQlYoUqjGNmunC0
	w0KRup8+XEIvwABtcSWcbWLfacSiiGKZFYG1stPef+vq6oXaM+9/Q5OuVG1A45LAz/W63hOPAtd
	YETHPZT3ldwv4L+qn5y0ZDdNaB3da61QeTHG0ViNx0twrc9SIjm4tQvjf3BGWWoDSKs7arb80J/
	uUeVq0vx+v6LIXy/rGmxq9y6fmZZC4mYzHXhi70Bf+DsenNRiLeBfjzTOp8x0P2lTytjeYR16gq
	upuSs7sgF9gJwqn8KplhkgUDi9TUsjaecZ7JVvJkvW7aEVp8H82wyytrrjZJcsVkPAt2vJuk5RO
	8MLBeoBCHd7n00XOOXgy2wEZ4rzA+fC9z14uCuGhJ32e+4GnJ6FWaPekUZRSke7djzSJte5bsez
	fyHPWxvKn1aiGTBh2OK0eVk/X6wj5YZEupWRcFWvZs+NJ2Obkg3/cowCyYryd+av7Jf0X7wVAid
	EVS0ByfjJn1ao6MEOpMsO0v84Y1dgTgPif1depL7FID0u8o2OB5eqas6GoX5on30uf1ojtBYnXU
	7LDA=
X-Received: by 2002:a5d:5f41:0:b0:48e:c84:5be6 with SMTP id ffacd0b85a97d-48e3859498fmr1687114f8f.14.1792737577617;
        Thu, 22 Oct 2026 23:39:37 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:34 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 00/16] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Fri, 23 Oct 2026 08:39:25 +0200
Message-Id: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB0B22oC/2WMQQ6CMBBFr0JmbU3bwZK64h7GRQOjzAJq2tqoh
 LtbWBgTlm/mvzdDpMAU4VzNEChzZD8VwEMF3eCmOwnuC4OW2kilUKTBjRQFYq1043RvVQ9l/Ah
 049cWulwLDxyTD++tm9V63SWyElJYi1aWh8Wma5Mf6Zn546M/TpRgDWX9L9c/WReZbO2MQUPyJ
 Pfysixfz8MqRN8AAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233940_465790_2481906D 
X-CRM114-Status: GOOD (  30.94  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a new DRM accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S (the only SoC
currently supported). These can be used as accelerators for various
workloads, including machine learning inference.

This driver attaches to the DSPs through remoteproc and talks to the
firmware running on them through shared memory and a mailbox. The
firmware is the accelerator's command processor: the driver pushes Jobs
onto a per-core Ring in shared memory and rings a mailbox doorbell; the
firmware runs each Job's Kernel in the DSP's user mode on the client's
own page table, moves a Fence when the Job is done and rings back.

The kernel driver itself allocates buffers, manages contexts and submits
jobs to the DSP firmware. It also populates the per-client page tables
with io-pgtable-arm.

No carveout holds buffers any more: every buffer is the kernel driver's,
page-backed and mapped through the DSP's MMU in the client's own page
table, which answers Andrew F. Davis's question on v2. The one reserved
region the driver uses is the first 256 KiB of the IPC pool, where the
handshake, the Ring and the Context table live. A buffer that a DMA
transfer names must be physically contiguous, since the DRU does not
go through the MMU; the client asks for that at creation.

If there is more than one C7x DSP core, the driver will load balance
jobs between them with drm-gpu-scheduler.

The firmware isolates clients by using its MMU to protect their memory
and by running their kernels at a lower privilege level.

Besides executing user-generated DSP kernels, the firmware can also
execute DMA transfers at the request of userspace. These don't go via
the MMU, so are validated by the kernel driver.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames-firmware/ mostly under the MIT
license. The ABI with the firmware is defined in a shared header with
versioning.

Known limitations of this version:

- Runtime power management is not implemented (system suspend and
  resume are).
- The J722S EVM does not resume from s2idle with TI's shipped
  system-controller firmware, so the resume path ran only in the
  driver's own tests; the suspend path ran on the board.
- The submit IOCTL waits on no sync object, which a Vulkan driver will
  need.
- The 4D block move is the only DMA transfer type accepted.
- One firmware image serves both cores; a core found running another
  firmware is left out after the handshake's five seconds.
- The DRU channel stride is stated for the J722S instead of queried.
- The J722S is the only SoC this version runs on.

Three additions were needed in the device tree bindings:

- power domain references for the two SoC timers the DSP firmware
  drives, which the remoteproc driver does not hold;
- a second mailbox doorbell, since remoteproc's own serves rpmsg and
  this firmware rings the Ring's; and
- reg entries for the AUX SRAM and the DMA engine's registers, which
  the driver maps into every client's page table.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v3:
- Shared-memory ring and mailbox doorbell replace rpmsg
- The kernel driver writes the client page tables
- Buffers are bound at userspace-chosen DSP addresses
- Kernels run in the DSP's user mode; faults reported per job
- DRU transfers submitted by userspace, checked and translated by the kernel driver
- System suspend and resume
- Versioned firmware ABI; hardware ID reported and checked against the SoC
- Firmware rewritten bare-metal, MIT
- Link to v2: https://lore.kernel.org/r/20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net

Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Suman Anna <s-anna@ti.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Oded Gabbay <ogabbay@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Tero Kristo <kristo@kernel.org>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Tomeu Vizoso (16):
      dt-bindings: remoteproc: k3-dsp: Add the L2 auxiliary and DRU regions
      dt-bindings: remoteproc: k3-dsp: Allow a second sub-mailbox
      dt-bindings: remoteproc: k3-dsp: Allow referencing the timers' power domains
      accel/thames: Add header with IPC definitions
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Create a context per client on device open
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add support for submitting DMA operations
      accel/thames: Add IOCTLs for job creation and submission
      accel/thames: Recover from faults and timeouts
      accel/thames: Add IOCTL for memory synchronization
      accel/thames: Install memory mappings populated and dirty
      Documentation: accel/thames: Add initial docs
      arm64: dts: ti: k3-j722s: Add the AUX L2 SRAM and DRU regions
      arm64: dts: ti: k3-j722s: Add second submailbox to the C7x cores
      arm64: dts: ti: k3-j722s: Reference the power domains of the C7x timers

 Documentation/accel/index.rst                      |    1 +
 Documentation/accel/thames/index.rst               |   47 +
 .../bindings/remoteproc/ti,k3-dsp-rproc.yaml       |   33 +-
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   16 +-
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |   27 +-
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    4 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    3 +-
 drivers/accel/thames/Kconfig                       |   27 +
 drivers/accel/thames/Makefile                      |   12 +
 drivers/accel/thames/thames_abi.h                  |  238 ++++
 drivers/accel/thames/thames_core.c                 |  867 +++++++++++++
 drivers/accel/thames/thames_core.h                 |  120 ++
 drivers/accel/thames/thames_device.h               |   97 ++
 drivers/accel/thames/thames_drv.c                  |  554 ++++++++
 drivers/accel/thames/thames_drv.h                  |   67 +
 drivers/accel/thames/thames_gem.c                  | 1077 ++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |   77 ++
 drivers/accel/thames/thames_job.c                  | 1319 ++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |   81 ++
 drivers/accel/thames/thames_trace.h                |   77 ++
 drivers/accel/thames/thames_transfers.c            |  405 ++++++
 drivers/accel/thames/thames_transfers.h            |   52 +
 include/uapi/drm/thames_accel.h                    |  843 +++++++++++++
 25 files changed, 6043 insertions(+), 11 deletions(-)
---
base-commit: 1ecab8b0bad393750c60cc3819ce9c256595463c
change-id: 20260113-thames-334127a2d91d

Best regards,
--  
Tomeu Vizoso <tomeu@tomeuvizoso.net>


