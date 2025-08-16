Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51FBCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l3MonmtBjsLUIPBRvv+XVRxu4APXGRBlkbr3lJ0yHPc=; b=L+OwLv3DQ25jFrcCgoXOUL6COs
	4gvibJU+IEQaA6cMK5MiXaE8uwiPQKuLiRrvl+wl/FjQbnvFQKBklCjlfuGUZYbsGB+2l3XJVQCvr
	QGdN1lZmMmYrW7PXKIVWL2uGr/Ke9ztzPyKce0esw48u2m+zFkO4A1EPSWmYxgQAQf2xd49yVxDkF
	Qwco45tmgNw8DmXSdEyUa7SLevaYfNhON64xqC6CwJtdi/imv1IcQA1KZDYvdmMM2NNerptHUuewt
	XkU+L0DuHGCUiGTSWRhPgm5MMnRFn0trumCZ9gG3x0gsSbt8x3/lXUDxTt7eWqWMeKAwXEU0qfRZW
	kdzxAzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKYK-0000000513Z-2AL2;
	Sat, 16 Aug 2025 17:18:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKVg-000000050rr-1ISZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 17:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A73E8452CD
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6D9C4CEEF;
	Sat, 16 Aug 2025 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755364563;
	bh=ao8lo751AGNzX2v8GLWik2TEF/A3j9GyMFvXVbbqS+o=;
	h=From:To:Cc:Subject:Date:From;
	b=d+Xmw6o/iwobRjqC3S6SVSVDDs2vuVYW5O2HNDL3XQWiZhxzU+DI6/0lYw/ScSLsr
	 jxnGo9X39gNEqgmMMq73caB6cUlifePPGwTVlxY17BoVo+k5TEGUvtEAEg1RfK0f+u
	 a6JAOu3gTkfCfu4UiXZk28wcNb9zKBBNES0jKF/pNACIkGeQ03rpdlwEAydzFmlBfO
	 jBkDqnVCXesOrLAU7TUXwnur0eskpTZX+xAJ4NjhaxhiWfs8VhIRuGd7DzNi48xNMe
	 TOJS5RE5UIjABjStkF3zXSRjGOMpH6iQtg7vZlqw65gVhlZftz5/hR/3keVCsyn6gu
	 9OACVze1QjwBA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC DTS changes for v6.18, part 1
Date: Sat, 16 Aug 2025 19:15:01 +0200
Message-Id: <20250816171501.31944-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_101604_372286_F895060D 
X-CRM114-Status: UNSURE (   9.67  )
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

Hi Arnd,

Here's our first very early pull request for the 6.18 merge window.
All of these changes could've been part of the 6.17 window but the dt-binding
changes were only picked up after I had already sent out my pull request which
was already very late.
These have been part -next for about a week now.


Best,


Sven


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-6.18

for you to fetch changes up to 4379305ffbc2eebe3de673fc965145d441c89b8f:

  arm64: dts: apple: t600x: Add SMC node (2025-08-10 20:21:57 +0200)

----------------------------------------------------------------
Apple SoC device tree changes for v6.18, part 1

- Added SMC nodes for M1 and M2 including the PMU GPIO controller and
  reboot sub-nodes. This now allows to reboot these systems and is
  required to later enable the power GPIO line for the WiFi board.
- Added i2c nodes for A7 - A11 SoCs

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Hector Martin (3):
      arm64: dts: apple: t8103: Add SMC node
      arm64: dts: apple: t8112: Add SMC node
      arm64: dts: apple: t600x: Add SMC node

Nick Chan (8):
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi   | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi   | 57 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 35 ++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi      | 76 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 35 ++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 35 ++++++++++++++
 11 files changed, 694 insertions(+)

