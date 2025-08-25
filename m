Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KRq/IwotzLLYuVj7PpxaygrL44sgkinwI3pjoy5upqE=; b=Xjv/EA/HBg+YUxM/4MzrxOtdN9
	H9B6lzxcTgMfa9ggsMTo++mtLGrCbIBFqCF+ayB/5oYmbcoW8GoCCnd4d7760QlDmUpe/0/qRXbcm
	tF+hLVh9IJ/l13jTRGv27THnh2HiaXzV9da4mI4cjPCvhwT8HSR5Xi3+MmyIZ4/ryJm/f1+WhvAW1
	so84cJx/Awjie0P4MP25bA/GAcYUkGCf0urt7r0vYSspVf+sXbeiXo6O21SyE4O3qrxOZo9QjcL14
	E3Jy5qlCaqXY9RWCHWCnQwavXZ1y/uCkEDc7CtxfYwPUYOVOPPXvFopIhkWV6EzpcvCWtnUDayXxX
	K3y+wlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOxt-00000006tMk-1Vgy;
	Mon, 25 Aug 2025 04:37:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOvF-00000006t2R-3Sa0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 04:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756096505;
	bh=KRq/IwotzLLYuVj7PpxaygrL44sgkinwI3pjoy5upqE=;
	h=Subject:From:To:Cc:Date;
	b=migGjffZRA8dfDHH3+sAjmK/q1cv6bIL74ULtRDFN4fleamO+S7VfU1iVs73cw2eG
	 Hhad4DV03Lc3c3k3DdISvGbgygzgVJXRkD9w34lcbiQEaGqAvzj4rw5tRG42P8neKq
	 B96gwzXu3tu7TlesGJafzo3oPV4LZKB2IzzMh1869QVs6TDbjTi45UMpSQ0sOaSrFJ
	 8R3tJ4wQyfp1Y8cnm2vhaI4LkfIqqT5Gq1jiy6O9iKz98HV5xaFxRej5Rc0M9NZPFV
	 Radu8EiQmbWWrVgj2YX1O0Q3HBvzQ8lwu0U82giBbxbMnPzh45GBmqSnd6p+1wBvAc
	 3B4G9FiNf2JNw==
Received: from [192.168.68.112] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 179C0640BB;
	Mon, 25 Aug 2025 12:35:03 +0800 (AWST)
Message-ID: <bf3734aab62a5fcc8959261551bb4b1fa636efbd.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton arm64: early devicetree changes for 6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Aug 2025 14:05:03 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_213510_054457_A75B6118 
X-CRM114-Status: UNSURE (   5.85  )
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

Hello SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-6.18-devicetree-0

for you to fetch changes up to 13587befb34ffa5d605196494c243420e045f28e:

  arm64: dts: nuvoton: add refclk and update peripheral clocks for NPCM845 =
(2025-08-11 09:38:08 +0930)

----------------------------------------------------------------
Early Nuvoton arm64 devicetree updates for 6.18

Integrate changes from Tomer reworking devicetree pinctrl, reset, and clk n=
odes
for NPCM845-based platforms.

----------------------------------------------------------------
Tomer Maimon (3):
      arm64: dts: nuvoton: npcm845: Add pinctrl groups
      arm64: dts: nuvoton: combine NPCM845 reset and clk nodes
      arm64: dts: nuvoton: add refclk and update peripheral clocks for NPCM=
845

 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 669 ++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++--
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |   6 +
 2 files changed, 663 insertions(+), 12 deletions(-)


