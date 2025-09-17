Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11751CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C3JLm+WtAgOBOP5ZX8TVm1Cp5vhXuI2GzWj1bb042eU=; b=JGwqjVEAML3w+V2i8GGaTFz+du
	GZMcK3N6ZnkKizfOEc8WRO1442d1LP1GGcuZItR4pFpe0NBoi/xXzwmfImx4eS7kWsU5T3pYkzzVc
	G/YzQACpXTn5Q1wjNVMidjNWcCCE/zqmpwc8KB2SATYBcS0hpPX+8IMAerZJxEE4QCNZcHqEZDXW2
	p2saYTUEhDExYDTFKI3yKhWoPX9+dKhqz+krLdHGriYoC6JGyr9rbBq0on734A/WUx+9zhxG2Z8xN
	iKkP61NNyqOX9CDE/Jl6uh9osyE1wNbRTq6PrNEiz1kOLm81VhludFbwSYSB6dC1y/b1P2ukfHJ84
	A4iq8waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqgv-0000000BBRS-2fE3;
	Wed, 17 Sep 2025 11:51:17 +0000
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqgt-0000000BBQX-3uSl;
	Wed, 17 Sep 2025 11:51:17 +0000
Received: from grunt.nippynetworks.lan (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lists@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cRcYC3FT0zkd2v;
	Wed, 17 Sep 2025 12:51:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758109871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C3JLm+WtAgOBOP5ZX8TVm1Cp5vhXuI2GzWj1bb042eU=;
	b=bmE4l/oziTF0VmvvghpjBK3QAb49FXUE5rBADlKvSbHSr3lK9Wpj2rWXJ8iBGmy3m7olQU
	1tGerj1aotI0U8cQOISRLXp4zBnrJL4kqT3AMXk2bzCUyqchkEbCgPRfsbL8xbvTI4RL6v
	KkSbE8V9DN8Vjuz9X0cjY3SrPsk68p0=
From: Ed Wildgoose <lists@wildgooses.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ed Wildgoose <lists@wildgooses.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: fix dma and pinctrl defs
Date: Wed, 17 Sep 2025 11:49:29 +0000
Message-ID: <20250917114932.25994-1-lists@wildgooses.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045116_212487_7592FCBE 
X-CRM114-Status: GOOD (  11.93  )
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

The default pinctrl definitions for the Radxa Zero 3W don't match the
datasheet. Possibly few people enable extra UARTs and hence it wasn't
noticed? I needed all 5 UARTs for a project and the first patch corrects
the pinctrl defs. Without this patch, enabling the extra UARTs causes
issues such as the MMC devices disappearing, due to collisions.

Second patch adds a dma-names property, which appears to be a
pre-requisite for enabling DMA on the UARTs. I've applied this to the
base rk356x-base.dtsi as it seems like a change that should apply to all
SOMs? However, I confess ignorance in this area, so could I ask for a
second opinion before anyone applies this?  It's tested on my Zero 3W
board and appears to function correctly and DMA is reported as enabled.


Ed Wildgoose (2):
  arm64: dts: rockchip: correct uart mux for Radxa ZERO 3
  rockchip: dts: Enable UART DMA by adding default dma-names property

 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi    | 15 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi     |  9 +++++++++
 2 files changed, 24 insertions(+)

-- 
2.49.0


