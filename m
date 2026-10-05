Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2CCCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvwI9egWUv2laKFYKZYn2hBYItXRY3VXq3rv903ql14=; b=pP7aJ9+dBJlkf1q5huzSrn5Xbp
	A3iQYqu4Y1xnIvOYCInBHXEoNdW01JGk++2H1sfZ+gIvzM51b+0nPWMrZx6AzIgLVRsL9krH/EwnG
	by6KqHey6Z2VaogUjSp4GYwkocSL5tikEHzagQPR2YqI0ioxkzEBHtiT91m7BFOGrPGQaWhrl658o
	7fExk8imZMuicUAkEuKxqm0/lXha9+kRVcnzG0VYO4sa1ochCyfyMy4NVhPIGS7vRC9W84m2kRnBd
	70BO7fR2QJghhcHguHPdFtzh6wOPeurP+QLLMyXYWLK/ItVx5920SXeHRQrWY540CKhQYiSOdn22v
	GmzUCO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmn-0000000G99E-0wtT;
	Mon, 05 Oct 2026 10:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmj-0000000G97P-3vrd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:19:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0AE443F6C;
	Mon,  5 Oct 2026 10:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF071F00893;
	Mon,  5 Oct 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195545;
	bh=rvwI9egWUv2laKFYKZYn2hBYItXRY3VXq3rv903ql14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XVSIsfNTjOk7dq2udzYZk4OcRgP88EZJU48+gTsFU5AGARQxmQi6fvbZ4TGnaPdkN
	 WMd1NmFvmE3BvADQ28GaMoa5dAJdC5PW9vLantH7sIWF7JF799lxfQkmHu6WFcb5w0
	 RmSOyIzBKXLLzvx3oqyJj6aaK/sb1pAcsUOhHpi15yZ81BVoHPVdwtgt+H4vuWYjjm
	 Y44k8gRsSeYtt/b4lAPCXhbPV8/yicFY+JpvUGLjBe69sYdfxiuNozKcFOQIE4G/eh
	 IA+IfzIjwIfkmtxWYZzGfONAlFWsjdHq74bwtpjD1WsnVsZiJsyQ7be+6S1nQPILnl
	 eVsXW2fle5gNg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 4/4] ARM: samsung: mach for v7.4
Date: Mon,  5 Oct 2026 12:18:47 +0200
Message-ID: <20261005101845.34752-8-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005101845.34752-5-krzk@kernel.org>
References: <20261005101845.34752-5-krzk@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2627; i=krzk@kernel.org; h=from:subject; bh=J4wnzUkbFzSsjqh9eOxmqZc3vB/DrZrd5sVl7aANEpk=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3mIwmuEuT5oS40keu/q2ExmOGvzS5EzHK6a+ mzrofvILjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5iAAKCRDBN2bmhouD 1za5D/9FjQq6CtEE7GTWhJuS7na5LqxgNLDRh5U1fsO/KwCNIL8N4Owkor4xKqT6HZB6iYa0Hew yNfzh1azGmVB9kizCZs/aII4hEd9e8u2rBUanbIlY3NK1ztjtNf+mOIldECpSLEWaJm0GSDY6V/ LFJRs/0taTHTvhKWp/irU+7TH+GnFZRPTNaD8lfRRZyF1jZ2jsUltNEJQEU+dHh2TLfTKWWF+8W zmMYkvvoZH1/EF306USZOVGZ6KvHX2S2X4tg6Cz8Jn7ej0dzHzlvtVH9HF1u9yMLSWDUxKoy4kb IbEWFDj7vPg6eczsKBxx7pnhUFaXRxjv+ZFvNsVF84+EtgkX0a674V3qAHZJ1lP6j8+y1DW5bgH 3Fvbyc75Bnw7D5JBbE/K6td9Qs59+r7Dt+y6zMuAqsmzHQSfQHhKs9jj7EoBxYLKSx6KKJmDEmb I9kQfYQ8TbQB3aP/AsSO071fG726opVSe4GmhzpxoJs4CytF7TDuj7aWq/E7n+RIXXWLxMugGmK 1VQrAf8amLyRYhtH3sVOIO1liyRMCSaQTEdzMSKjhiEN7MVi6IBKcZO3Of3HBACj8n7Bz5ueLcb kkffFlyXU3X7I4tzbbWBdIpWuX5CzWtbEOU29P5LrPTcQtJJWjrL16/pi3v0tBPXootFN+9EI8y 7MgjaR1vOVpGLOA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

Hi Arnd and SoC folks,

This includes Input subsystem code, which got acks from Dmitry.

Best regards,
Krzysztof


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-7.4

for you to fetch changes up to 80c92d1f1a4e3000e6eb351ad8af16267b1d4e63:

  ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__ (2026-09-04 16:09:17 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v7.4

Switch to software nodes for GPIO keys, which will allow later dropping
platform data from gpio-keys driver.  Likewise improve samsung-keypad
input driver and drop platform data there as well.

----------------------------------------------------------------
Dmitry Torokhov (6):
      dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
      Input: samsung-keypad - handle compact binding
      ARM: s3c: register and attach software nodes for Samsung gpio_chips
      ARM: s3c: crag6410: switch keypad device to software properties
      Input: samsung-keypad - remove support for platform data
      ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys

Thomas Huth (1):
      ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__

 .../bindings/input/samsung,s3c6410-keypad.yaml     |  53 +++++-
 arch/arm/mach-exynos/smc.h                         |   4 +-
 arch/arm/mach-s3c/Kconfig                          |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   7 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   1 -
 arch/arm/mach-s3c/devs.c                           |  27 ---
 arch/arm/mach-s3c/devs.h                           |   1 -
 arch/arm/mach-s3c/gpio-core.h                      |   3 +
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h           |   5 +
 arch/arm/mach-s3c/gpio-samsung.c                   |  72 ++++++--
 arch/arm/mach-s3c/keypad.h                         |  27 ---
 arch/arm/mach-s3c/mach-crag6410.c                  | 135 ++++++++++----
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  20 ---
 drivers/input/keyboard/samsung-keypad.c            | 200 +++++++++------------
 include/linux/input/samsung-keypad.h               |  39 ----
 15 files changed, 299 insertions(+), 300 deletions(-)
 delete mode 100644 arch/arm/mach-s3c/keypad.h
 delete mode 100644 arch/arm/mach-s3c/setup-keypad-s3c64xx.c
 delete mode 100644 include/linux/input/samsung-keypad.h

