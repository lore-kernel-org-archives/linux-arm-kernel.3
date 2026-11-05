Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C19C6082BD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S2v16Aew;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVK2y3Xt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SZtNFTgnXNhX1eI6mreUzLZWNukJZLYZyuBYtuClakc=; b=S2v16AewGbKmxwyUHfqMGaDi8S
	J0FqBVM+jom4x4uVYa1pBri/IxAQQKoxvMmKEARD2jzs45hN77nVb8hIL5ZQUs1g6EiTA+Fve+vsN
	L/vWC9zBFMAN8CVwoWuy9WmijpvX7zLzXImPbEA/OMhFuDaqFp+ETgBheTojk94Hc+06HmzC3plsp
	5jkrkyePHL3+hd9pma+WHx8vRfxIMJ7nDIY6pF/mEkM8Ic9Z3WaTRekzwccNCqEtJL9faQzc2skho
	FrdQXlqOBKfgIzIjI1V1zyBxf1Ci8h6KHRlESbxdU47H8UeN7ySMdSbPVGIWDkVHIURkMKnIpj9ec
	jPvwfmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJM-00000008ZNs-226T;
	Thu, 05 Nov 2026 11:07:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJD-00000008ZKC-3mAi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0136C60F45;
	Thu,  5 Nov 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876826;
	b=o/NSGd4HYZpM0b2VSSBMFoFl2fg0oi1a7N7oQF8ZS5xIqyYpxnyvsDJ3uoyXGvIIeFRM
	 MZMzmOZMmP9kTJoOGWekJ2/XcWxxH9/QXKdxrXlAhSsZ05rvGkweZ5WqDdRhJXKksiued
	 b2be81Os9uIuFWLCkxbZhpLBFjy+C6aZNzLsc2giRtBQ7bS4yOuWYHruzmivV/CP/FNVS
	 eIKGsvai47c0SfvdlTDt3H5w6PHbsz1/8rNsMEX3zc/C2Ea/XFd7saeGPipijbJfwOJhI
	 62VTNdkw8L5rhVRTSSyAcID081E2cV0rFK3x0j6YIefpKcy2jtErCZTPcM7f0RnnXvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876826;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SZtNFTgnXNhX1eI6mreUzLZWNukJZLYZyuBYtuClakc=;
	b=0+QA4vY5eVyLeiBXlMRG6nUuZqYYoPIIeepCLkEZ4z/WwcThZHXs9j3I3IosyII54oMa
	 IQptOfxXV9MFSCHnvIQLt3qMNqyfLqge8D41ZO52Nhk54AH7yOilc8VQ54CB01wze1TeM
	 4rGRC3js7To/DRby2M01eT84mvACWDhZ2OUHwB4hTdb1z8eoke36qQrj7IYDFjm7nMbNg
	 xMTM2uUwLu3uPq7GX/rGVywfGbzIqXc+q87cgPvmpcqLCUzCcDMlgvwGVm7S3t698zD14
	 meLtR65e7vYiVZiMBAn+aLpHxqdpelKNcQsZghl8pqQRB5k3/xEv7+PHjXlhnTnG/dQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D82831F0093A;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876826;
	bh=SZtNFTgnXNhX1eI6mreUzLZWNukJZLYZyuBYtuClakc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=BVK2y3Xt6bgTk7k4c3ByxHbGnh2vAqyPLwZTys7TZ6lBbNZP3HTIlprTYKVpiZaGw
	 PolVwLg5ZabulCFuXVJsBvxQEHir29FHTx2Pe/HXGUx7UA7K6AcZaSbwB1xDp+mfoM
	 +Dlc5tgazgUWkpEYiGnow8FbFTrpo5uY9Qql21eJEyB2y7jk631StFuF3LCMn6qgku
	 3z26+NbWG6PWBF5QzGmlVvDUJAyZaTqkAd3ZGRfZL7D19S2vWLgecji2g/85cdMiMf
	 0lf8hYhTCEQxYPgl3hHGJn7uV2Zk6+eGarYu+Lku8s6GT7U9NwbPT6zVio7ehSu4MD
	 z8Oqp+DXzBYjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 37932471F0;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Subject: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Date: Thu, 05 Nov 2026 19:06:34 +0800
Message-Id: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpj7GoC/12OwQ7CIAyGX8VwFgNsMObJ9zAeGHQOsw0Dk2iWv
 buwxWhMemn7f187owDeQkDH3Yw8RBusG1ND6X6HdKfGK2Br0gAxwgQlpMI6VhwHpzEIJtuCVy0
 RAqX43UNrn6vrfNn68GhuoKfM50Rnw+T8az0W65z7aOmmjalqTHAphdZM1qps5EkNjfLQ9+qg3
 YCyOVLyA9P6+1PaJNwUUhDBgRnD//FlWd4F6klB9QAAAA==
X-Change-ID: 20261007-cv75-soc-e628f357f066
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=3501;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=AVzwdrPqmXDKIIAxlOumBsj3BZ0AuGGaxyVMdRkHk20=;
 b=8UWLdjRv/iksvX+vRoXqsIjzNdNyzojvgDsrJYb0Tin0Z1ymhEd1Jq9z4hI2Cd7nCZly4x/Z1
 CirGO7XBDt8DbT4724QX/nTjOwrwBt7TSqTjPPT/dcvYyveRrmyTPI2
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the Ambarella CV75 SoC and EVK support: the board binding, the
RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
MAINTAINERS.

The clock ID header is added before the devicetree that includes it,
so patch 2 (the clock binding) has to be applied before patch 4 (the
devicetree).

The ambarella vendor prefix and the CV75 secure scratchpad syscon
binding are already in linux-next. This series does not repeat
either of them.

GPIO, UART and pinctrl bindings and drivers are separate series.
This devicetree references those compatibles.

Tested on the CV75 EVK. The board boots. That boot used a local tree
that also includes the GPIO, UART and pinctrl patches.

To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: soc@lists.linux.dev
To: linux-arm-kernel@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: Brian Masney <masneyb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: Long Zhao <longzhao@ambarella.com>
Cc: Long Zhao <zl020895@163.com>
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
Changes in v11:
- clk: use builtin_platform_driver(). The Kconfig symbol is bool. (Brian)
- clk: drop CLK_IS_CRITICAL from the core PLL. It has no enable op. (Brian)
- clk: drop the misleading (u64) cast in the div_u64() call. (Brian)
- clk: add .suppress_bind_attrs = true to block sysfs unbind. (Brian)
- clk: drop MODULE_AUTHOR. (Brian)
- Link to v10:
  https://patch.msgid.link/20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com

---
Long Zhao (5):
      dt-bindings: arm: add Ambarella CV75 platforms
      dt-bindings: clock: add Ambarella CV75 RCT
      clk: ambarella: add CV75 RCT clock controller
      arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
      MAINTAINERS: add ARM/AMBARELLA SoC support

 .../devicetree/bindings/arm/ambarella.yaml         |  24 ++
 .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++++
 MAINTAINERS                                        |  14 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/ambarella/Makefile             |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 ++
 arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/ambarella/Kconfig                      |   8 +
 drivers/clk/ambarella/Makefile                     |   3 +
 drivers/clk/ambarella/clk-cv75.c                   | 361 +++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     |  14 +
 15 files changed, 708 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261007-cv75-soc-e628f357f066

Best regards,
--  
Long Zhao <longzhao@ambarella.com>



