Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51708C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nM5n4oXuXucNnjRiDnUbFUfP0Jr55vbwvQEU/YMI4mY=; b=eninmv4uoFzfKHspOar9ZH/idK
	4s30dEjsUUQi7uOA/OcevhQgMhEm85UzAul5WuckoFOELvPk3ntjs8te2sOyIhdT6o+CwgqtFnpY3
	B7fVV6eMVV7+KnM1OQuWuIk6A73gI+znRsCPUwpBXmPTirZCWckaZFyO3BugLgmiXYfpb40wQ/b71
	cLjMFQimdDodB5Ovd4fdAhXvEZNocrhtLtz4WdaSSQ9naNNkcd7RXcgxZzT4X/Z47N8ol5BXAp9SP
	UeBQmfbF1JyOv+RdwybBU+n9M7r8mqLYyj6rfKMSkz8iENtdVWxFg9Ru+YwJImxthYJiPDOGQ3Ar3
	GnIol8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNb-00000005AI9-0z0G;
	Sun, 06 Sep 2026 16:06:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNZ-00000005AHk-13wr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FB1F436B1;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08423C2BCB8;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788710760;
	bh=caba7iV0TFn9M6TC++uiQpGXS0aTWxbFXW99xT02rXE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JwsMjbUaMZ/x518+M9YrrKrS1L0sGegRnk8CigScVg9XQ83x8zfBDxjj/R+cFdGLX
	 HL0T7KbclYtxctgSaseJRj7v/3FRgOLT7aaOjFwUpJK9uJGhVURmFBkm/vjaqIgb8u
	 CbA8FtLuf1x4yVsIx+heE54xItjsH6DEuj9HtyeLjI6sxr8sdwHAs6GDzopF1FkjPL
	 zOZSwQZOvEm5rRiogW8xwLrylya34kN66Wmh11+xckzSTG+xIvnmV+BHW8BRaZ/uIK
	 mLaksXs1Mhrr1jKpmaMIuorRYZnWt/+NUznH5ZtEt2oDSntQFTVog02Sj1ogpdKMgO
	 p3qayhH2kpqnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC8EC79F8C;
	Sun,  6 Sep 2026 16:05:59 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Subject: [PATCH 0/2] Add SPC Glee 10.1 A64 board support
Date: Sun, 06 Sep 2026 16:05:48 +0000
Message-Id: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm0yIDbqVYyLzvCLNQbJVAkJ4
 e6MuvwW7y3kyAanc7VQxmRur6Gg3lWU7jr0YOuKqQmNhFMQji37mLh/AqzS8lSzQLqo+6PqAVT
 CMeNm8296uf7tn/hAen9PtK4bB62QmnYAAAA=
X-Change-ID: 20260906-b4-spc-glee-a64-v1-6e6dba38aa5e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710758; l=2104;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=caba7iV0TFn9M6TC++uiQpGXS0aTWxbFXW99xT02rXE=;
 b=cUKSRkx9BBgLI4AuGvEDwoNpcMTdkYV58Xmaj6UZcfvXlzlAK8ArFCy9pzbq80RVCo9egA26X
 Aq3u7moAyvdDQAy+zqk/n567UIa1341g5SC92dPzSkH2U3EMre99Vq6
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
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
Reply-To: jcarlosgl96@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add initial mainline support for the SPC Glee 10.1 tablet, based on the
Allwinner A64 and AXP803 PMIC.

The board description covers the 2 GiB DRAM configuration, essential
CPU and system rails, microSD, UART, battery monitoring and USB device
mode. Other peripherals remain disabled until independently validated.

The microSD slot deliberately uses broken-cd and a conservative 25 MHz
limit because its card-detect wiring and higher-speed modes have not been
validated independently. USB is limited to the tested peripheral role.

The exact DTB produced by this series was cold-booted from microSD with
Linux 7.3.0-rc1. The kernel detected all four CPU cores and 2 GiB RAM,
probed the AXP803 over RSB, detected the microSD card, mounted the ext4
root filesystem and started systemd. The boot command line did not use
regulator_ignore_unused. No eMMC access was required.

Validation was run against sunxi/for-next at commit 913f7eda9f3e:

  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image \
       allwinner/sun50i-a64-spc-glee.dtb
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
       DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/sunxi.yaml \
       dt_binding_check
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- W=1 \
       CHECK_DTBS=y allwinner/sun50i-a64-spc-glee.dtb

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
Juan Carlos Gutiérrez Lavado (2):
      dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
      arm64: dts: allwinner: Add SPC Glee 10.1 A64

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 123 +++++++++++++++++++++
 4 files changed, 131 insertions(+)
---
base-commit: 913f7eda9f3e3fb1c67285e144e202494d440049
change-id: 20260906-b4-spc-glee-a64-v1-6e6dba38aa5e

Best regards,
--  
Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>



