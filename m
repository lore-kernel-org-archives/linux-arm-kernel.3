Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8DAF01835
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOEy9WKhI8rKI8TbUH9Qvf1lRBWum2JzjhB6UT07wnw=; b=kUbGcf0y6DnayJmqMdDaREULa3
	m/z0WMZnZNHu5n4CeuCftCe5l3Y4icG7L1WHxX834rJRE8+DzHPEgA+UJgtqeLif9CYBGjU4LSW6z
	xelD343uh+psZA/RpsVQ65AcNoY9YLn/xH8KuEPhACLhk7Aelv+kvxsdLK1ECOG7tVv2VV33w5r0f
	/4qXQkZ/Op3beL7NgDiVx2e3HvPOPbWag+nM22zp3/pE37s9rwHwrdk3yQ6UF43kXde8lIfkQXpxK
	Bn6zyqnL3dpu9r7dWAE+2AIRHj9cFiR6kZzESHuLCjVdCA8M7JmBwapDRN4k7IO+y7k4YCDTNvJuu
	vMiPepcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVDy-00000003mV8-1CeI;
	Fri, 06 Mar 2026 13:28:14 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVDq-00000003mLB-2mGY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:28:11 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2DA30200103;
	Fri,  6 Mar 2026 14:28:05 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F8EF2000F7;
	Fri,  6 Mar 2026 14:28:05 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A8CDE20305;
	Fri,  6 Mar 2026 14:28:03 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:19 +0200
Subject: [PATCH v2 2/9] accel/neutron: Add documentation for NXP Neutron
 accelerator driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-2-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803680; l=7020;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=70OP0Dj1Z9Nhg2uTfcWxmjST7VKQFl9/cXvxpjdBVks=;
 b=mXDK8X4TOEJxbpfqQn4ABFB1O7rRmnB+eXuPeewKCwg/8ZFqK5n30K9Fe3obGQPIIvLagQ+DU
 9SAJ+C0b4GSAXwj4vJ6N6yCbAlGmNrZ7SN2NaHd6Y3EGvh2NW7fIE4+
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_052807_028703_6835A5B0 
X-CRM114-Status: GOOD (  22.78  )
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

Neutron is NXP's Neural Processing Unit (NPU) and it's integrated on
the i.MX95 SoC. It is capable of running inferences on a large range
of ML models and targets edge AI applications.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 Documentation/accel/index.rst           |   1 +
 Documentation/accel/neutron/index.rst   |  12 +++
 Documentation/accel/neutron/neutron.rst | 131 ++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..dbe177074739 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -9,5 +9,6 @@ Compute Accelerators
 
    introduction
    amdxdna/index
+   neutron/index
    qaic/index
    rocket/index
diff --git a/Documentation/accel/neutron/index.rst b/Documentation/accel/neutron/index.rst
new file mode 100644
index 000000000000..8f15346d16c7
--- /dev/null
+++ b/Documentation/accel/neutron/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==========================
+ accel/neutron NPU driver
+==========================
+
+The accel/neutron driver supports the Neutron NPU (Neural Processing Unit)
+from NXP.
+
+.. toctree::
+
+   neutron
diff --git a/Documentation/accel/neutron/neutron.rst b/Documentation/accel/neutron/neutron.rst
new file mode 100644
index 000000000000..c5066d53ce69
--- /dev/null
+++ b/Documentation/accel/neutron/neutron.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. include:: <isonum.txt>
+
+====================
+ Neutron NPU Driver
+====================
+
+:Copyright: |copy| 2026 NXP
+
+Overview
+========
+
+Neutron is NXP's eIQ Neutron Neural Processing Unit (NPU). It is a highly
+scalable, power-efficient machine learning accelerator targeting quantized
+ML models for edge AI applications. Neutron is integrated into i.MX95 and
+other NXP platforms.
+
+A more detailed description of Neutron NPU and usage scenarios can be
+found at [1]_.
+
+Hardware Description
+====================
+
+Neutron has the following hardware components:
+
+- RISC-V core: this is the "brain" of the Neutron NPU. It runs a proprietary
+  firmware responsible for programming registers, processing commands and
+  managing the other hardware components
+- one or more Neutron cores: the main computation engine performing Machine
+  Learning (ML) operations
+- TCM: a dedicated fast memory
+- Data Mover: a DMA engine that handles data transfers between system memory
+  and Neutron's internal memory
+
+Software Stack
+==============
+
+The following software components are required for running an inference
+on the Neutron accelerator:
+
+- Neutron converter [2]_, [3]_: this is an offline tool that converts models
+  from standard TFLite (LiteRT) format to a custom format for execution on the
+  Neutron NPU;
+- An inference engine, e.g. LiteRT's XNNPack, which in turn uses
+- A LiteRT custom delegate [4]_ to dispatch custom operators to Neutron NPU;
+- A userspace library [5]_ that the delegate links to, which wraps IOCTLs
+  to the kernel driver in a higher-level API. It handles microcode, weights
+  and kernels preparation and base address computations needed by the NPU for
+  job execution. It also triggers cache syncs when required;
+- The Neutron kernel driver, which handles device initialization and
+  communicates directly with the Neutron firmware;
+- Neutron firmware [5]_, a proprietary firmware that executes on the RISC-V
+  core and directly drives the execution of the NPU hardware.
+
+Usage Flow
+==========
+
+This section describes the steps required to run an inference job on the
+Neutron NPU.
+
+Offline Conversion
+------------------
+
+The first step is to convert a standard TFLite model using the Neutron
+converter. Supported standard operators are extracted together and mapped
+to one or multiple **NeutronGraph** custom operators in the converted model.
+Standard operators that are not supported by the NPU are left unchanged and
+will be executed on the CPU.
+
+Runtime Flow
+------------
+
+On the platform's Cortex-A cores running Linux, the LiteRT inference engine
+is responsible for loading the ML model, pre-processing the input data and
+handing over the tensor computation to the NPU via the custom delegate.
+
+The inference engine can be exercised via one of the standard TFLite tools
+(e.g. benchmark_model, label_image, etc) or via any custom application that
+uses the LiteRT runtime API.
+
+When preparing to run an inference job, userspace requests a memory buffer
+from the kernel driver. It loads both the model and the input data in the
+buffer, while also reserving a section for the inference output. It then
+issues a job submission command with the prepared buffer and waits for
+completion.
+
+The kernel driver sends the inference job details to the Neutron firmware
+via mailbox registers. The NPU executes the inference and issues an interrupt
+to the Linux core once it is finished. The driver in return marks the job
+as complete so userspace can access and post-process the output.
+
+Boot Sequence
+=============
+
+The Neutron driver is responsible for loading the firmware image and
+initiating the NPU boot sequence. The device is powered down during suspend
+and each resume operation implies running the firmware load and boot sequence
+again.
+
+Hardware Constraints
+====================
+
+Cache Coherency
+---------------
+
+Some of the NXP platforms that Neutron is integrated on, including i.MX95,
+do not ensure Neutron memory coherency at hardware level, generating the
+need for explicit DMA sync operations. Given that only parts of the memory
+buffer may require syncing at any given time (e.g. multiple inferences using
+the same model but different input data) and that the kernel driver is unaware
+of the buffer partitioning, the sync operations are driven from userspace.
+
+Buffer alignment
+----------------
+
+The Neutron DMA engine requires the inference buffers to be aligned to 1MB
+boundary. We allocate buffers for Neutron NPU from a reserved CMA pool that
+satisfies this alignment requirement.
+
+References
+==========
+
+.. [1] i.MX Machine Learning User's Guide: https://www.nxp.com/docs/en/user-guide/UG10166.pdf
+.. [2] Neutron Converter binary and User Guide available for download here:
+       https://www.nxp.com/design/design-center/software/eiq-ai-development-environment/eiq-toolkit-for-end-to-end-model-development-and-deployment:EIQ-TOOLKIT
+.. [3] NXP's eIQ PyPi repository: https://eiq.nxp.com/repository/eiq-neutron-sdk/
+.. [4] TFLite delegate source code: https://github.com/nxp-imx/tflite-neutron-delegate
+.. [5] Neutron firmware, library and TFLite delegate available here as binaries:
+       https://github.com/nxp-upstream/neutron/tree/upstream
+

-- 
2.34.1


