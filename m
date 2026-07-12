Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E23DC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE8MBqoAj0FtTOcSUdLwCfJt+0lmd+CK3qEgeuR8JEo=; b=C8novseqLwqN5MuSQzNZF3Dz10
	lUb/cudGV4SNDTIa46IHf17EDFuikPneX/skUhofSckseeLN3zC2E1IU0Unuv3kM0JmEmhP7cB7ug
	Pa8wPFGly2yX0eY53dYUWIpyKp5NBD06aKBG8yUzgyA/bnXYdoc+riegva3gLzqHqGCYlfl7hOYoP
	kTjt/AvM0LEIYBReUJsPHsv2axZ45bpjKUHPgxPmb7XGBwg/W2Amq67JBrgr0cl5XsNphlrV8avi/
	DQwyJQVMa18sYcIaX7Arej76RZRYTyZ9UZ9JwODgIkiaprQn8ybV8lBNSVCLBiMBXyim2t1/WwDis
	2HQMglqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0sa-00000007jN6-3qAR;
	Sun, 12 Jul 2026 20:34:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0sX-00000007jLr-1k9N;
	Sun, 12 Jul 2026 20:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TE8MBqoAj0FtTOcSUdLwCfJt+0lmd+CK3qEgeuR8JEo=; b=W9a1W2JLX7Vl/q81wLcZHVfiki
	aPmb2NSV6/JU8miYhfk5KyKu0vvLLNuhwOJB+Kdlvm4PCyUcsfzyxQXVAbTR8ZOGNapsieUdKCkoH
	vKX8ys4wgnABD8XQKSZFqTuSeM9q7EJx0xf5M7OYQRTSikStHQDTYRsv4JG+7EaHEtCqvSPj8B65p
	FVTswJS+q09kxLMOSzUb61XdypaiQ7DiM/BilNROyY3Enm7C9rCUvtOgkV7dJ5YC8lVWbLZ3+0tym
	lrB2d0SfF92tG3YY0g87nzZgOqT7y3zDM7Rk3+KxX5V2wJXiCUYenfg1xkcY0Fwu+MRzChBrQwJzE
	VD0Oe8vQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
Date: Sun, 12 Jul 2026 22:33:56 +0200
Message-ID: <178388833971.1396294.14091650862105286693.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709005006.413145-1-festevam@gmail.com>
References: <20260709005006.413145-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_133421_506088_1F8577C9 
X-CRM114-Status: GOOD (  12.12  )
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


On Wed, 08 Jul 2026 21:50:05 -0300, Fabio Estevam wrote:
> The USB3 OTG controller on the ROC-PC can be used in device mode,
> but the board description only enabled the DWC3 controller and USB2 PHY.
> The USBDP PHY remained disabled and the controller had no role-switch
> default, so DWC3 did not register a UDC and USB gadget drivers such
> as g_mass_storage failed to bind.
> 
> Enable the USBDP PHY and describe the controller as a USB role switch
> with peripheral as the default role. This lets the controller register
> as a UDC when no external role provider has selected a host role.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
      commit: 9d1e32bfdda1aef3291e47c2949b3b9978162a5c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

