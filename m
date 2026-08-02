Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3307C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvZHB+V44L8GYhi9JYbmmktJzKqbJwzWpTrCCT/CpSg=; b=lnVy3P4tktFAJLmBxxWc4gfknd
	p+xmO/awhnL9upLtVPCdlqSi+YnWpfHGbHvF0u+RE2n6NPGudpGUBGLQ6De83NGpWDcOOWkMSDzAe
	33+HbRdGO+PCxvWq2/wncmZ4p3m4RzqHCBgnB4GDZD3wtJme+zIlwW309PSKo8XX3lh28FPFTLWCI
	y2hmtd5UgjS0NWVKQJLYBcorN+N+HJyHXCet2/1c0gw90JPBZ45Q6YJiAFF271GIcJW1KHYAX7SxV
	L68mcTlRsQx4yRk5z1KpHRBOYPCUCVWG799xTp3hvWAmRec02U9AwSzG8fYVxeEcK9Oul8qxKsmVx
	jR2A1hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbFu-0000000FxFg-3K46;
	Sun, 02 Aug 2026 18:49:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbFs-0000000FxEP-3KU7;
	Sun, 02 Aug 2026 18:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mvZHB+V44L8GYhi9JYbmmktJzKqbJwzWpTrCCT/CpSg=; b=PANDWike84aLQV0/yndkOCzjfh
	Ie+NnNZxqD7fpmYD0nQ8UbVvRuV/+AP6vjm0rNbVyB0YMQjWguHgZYQIEVYJ6ExiOROga9cZpgcMj
	Q8xiT2OLal9TSM37lnLgqtdHC/WDAbAaomK3bO3wxxQD6sB8DvWJxtiUfqquEXDZXDJO7f5TFI+gT
	Tiyd4pW3UxKBJCzrcVBSVUTohkkKnOYohS6jM0M4T/ik5e+0RHMDSVsHeF04VJHpA2GLOL7qPR9KH
	9cJxu1IjuMJzytkjN1lO/FLF5tayp9gl01FFVbux+XDLA0vJiAXu9Nr/w0GL8kjHt0mU908p/hI8p
	f8jVG5hw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Vicharak Vaaman board
Date: Sun,  2 Aug 2026 20:49:37 +0200
Message-ID: <178569657659.1403346.14538834007028104921.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730045947.388660-1-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_114948_829907_68571B01 
X-CRM114-Status: GOOD (  10.18  )
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


On Thu, 30 Jul 2026 10:29:45 +0530, Hrushiraj Gandhi wrote:
> This series adds initial support for the Vicharak Vaaman, an RK3399-based
> single-board computer manufactured by Vicharak.
> 
> Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
> arm bindings. It carries an Acked-by from Krzysztof Kozlowski.
> 
> Patch 2 adds the board devicetree, enabling the RK808 PMIC with
> SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet (RGMII,
> RTL8211E PHY via a proper mdio subnode), eMMC, microSD, SARADC/TSADC,
> PWM-based vdd_log regulator, and UART2 serial console.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
      commit: 50208eafca2b1187079c0c5c54e5cf804c0ce0d1
[2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
      commit: c0fe7b7226942eb4e405d3dd08671510510463f1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

