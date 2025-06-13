Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4770C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4m3f1pYq+rFkMaLqSAVruSNwnsDHVYrhIexGB0CO2c=; b=AT1yQ3IE3pGMr2e7jmJm0dvz/H
	NV7egNDwTtUd0NQXkBHoQCzkDh1RK5KHowINThP4uRG8r4Z7FolRPspnKS/cVE4Jfbu6rzLU/8WZv
	LAPzfZ7LMWPBl2CfP7h12l9TzBDirSoCoZxB+w1OYjDmdluaJV6OPCm2O4kG8K8XIFmr3vwoRR1li
	cACXw75s99jMGfA2L2uYGcLhG5XYTzjeXS1K7XajmICS4wwOh1sCAzaHlJF3JArJpunay9Qtd3rZ1
	sTlJcCDWT5FomAHk4Dz22a3qD28SFKfpxX+tp04mYSxaMiIPD1OmWtTh1nq68k5O3rJiC+Y9Xo2cl
	FNhY5uaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBqE-00000000782-2all;
	Fri, 13 Jun 2025 21:21:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBlx-000000006ov-3LAf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:17:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC8944518C;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1A36C4CEE3;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749849432;
	bh=NJadowudszLSgzKfdukMH5RpQ02v2soiEg2ACYH3B8o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=u7ehtF6UflhpbqPHmPNwFeoIx0Sy8IkEerJmt9xeYP+1KlCvYnS1gieekTG6CZ0ow
	 FLkK2N+KXosNJfuNbH8kRKWNBRxzwoEHDPixBIrGGsimftUTbKSOAOEF4bQZHAECUM
	 k8RaXcpkVugHXC/POHmcCl3nn2R/frNoqU+dSgq54+XeYu/KizakCx6IPFf8M1ulxo
	 AjgZljaKZ2CfRPcUL0pOdAEQgeSaCT1qndGYMSQ790IP405ADEcl6/n1s7frZtjCwF
	 Yx59s3J35jlnD9F/u3Mepg5uPL+CBh3e/sCVzNf4jwoeo5zn3A2GoKDMALaa/rmwr9
	 SpEYC4F3FLHPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5B6C71135;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Bindings and DTS for Apple SoC GPUs
Date: Fri, 13 Jun 2025 23:17:06 +0200
Message-Id: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFKVTGgC/z3MQQrDIBCF4auEWdfiaE1DV71HycIYNQNNLBokJ
 Xj32hQKs/mHx7dDspFsgluzQ7SZEoWlhjg1YCa9eMtorA2CC8WVRJb8xsaVXTQO9eQguIM6fkX
 raDugR197orSG+D7cjN/vj2jxT2RknF01opNdp0zL737W9DybMENfSvkANEBUnpwAAAA=
X-Change-ID: 20250531-sgx-dt-4a1ba1b3b20f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749849431; l=1962;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=NJadowudszLSgzKfdukMH5RpQ02v2soiEg2ACYH3B8o=;
 b=BTZDJF7eeNf0BzPM75xJma9mqlxWyaQQsSwlvF5Tt36Spv4LD2sOPeAllFWYZf8xYScndDcBE
 caKq7WcNHF+A9ESpuSB2Y9SlDEKmOUROX+iiiUMs9JXGiKyZjMPQ/Os
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_141713_881006_BDB77751 
X-CRM114-Status: UNSURE (   9.10  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds the DT bindings and tree entries for the GPU
present in Apple M-series SoCs. The driver itself is in Rust and
upstream is currently missing several prerequisite bindings, so will
be sent later.

The kernel and m1n1 (bootloader) that are using those bindings are
available at the following branches:
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- s/firmware-compat/firmware-abi/
- drop the agx-g13x compatible
- rework reserved regions
- Improved memory region and register descriptions
- Link to v1: https://lore.kernel.org/r/20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com

---
Sasha Finkelstein (2):
      dt-bindings: gpu: Add Apple SoC GPU
      arm64: dts: Add Apple SoC GPU

 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 293 insertions(+)
---
base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
change-id: 20250531-sgx-dt-4a1ba1b3b20f

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



