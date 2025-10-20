Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B30CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuQNCifUktlMCAA4v8tmCWank1/HSzSiksw1WUKqzUc=; b=Dw21tyPTg24o3C6n0eyyQz54gw
	AEkBOQo/GtbJV/6MJIOB6vV6JSyaXlMRU3v4fASRaZWq0YWEx9UsRCQXWJfPl5zcVTh/8uv5CObZD
	SiknLG8g/VRdnNeImO5wqGVEEduZQQjLLEqIEFxw1duTAY9Y+8MMsgZgtmqK6f4vsHvMgvtXauPww
	XFCKOGiuLq1hed/BicaawHpPePslLGbNhtog5dFnn1l1CSwdUKdmGh5U3QG+jLXhstULCnDzTa+hD
	EbY9jzThV9A6cu2tdKDu9DlC0mdAkOCafiXrPNSycpwEE5FSdrl2QfRYLjTnEGDCS6p+2ZxRJu8WV
	7DYzVo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApiy-0000000Dk6h-1TIg;
	Mon, 20 Oct 2025 13:14:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApix-0000000Dk6D-3A8j;
	Mon, 20 Oct 2025 13:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CuQNCifUktlMCAA4v8tmCWank1/HSzSiksw1WUKqzUc=; b=bRa0cSJ4442ZO650F8Hg7bwebI
	DAeE+GC2X1mxjz1ioB0UzZZdywqJ3Hd0beb+JVhJUwGZ2EzcNinhyuDcXj9lA0vh/FWe3YeneDjYo
	jmiYlbINHHq0JuSUxhQvoQW5vfWcs47YQwwLRlyiSBym5pF7j83NroAy3ReSmhUSCGU0IUBxDJQGm
	yQ+JtIdk1cwpTOFaKBjB98DeP/u39x8WkFmwLUHMdE4EoIjVK5LI/O+QVWsV2ebV8EFg65+JjL1jM
	oGFNC/gr+LxZIXc/ZyD1Q9SRWvxyQQcNIEFMObKf9AKc9M3yFS/DSylE+KOOps9zTlapEXOma/opp
	+ikkjA6g==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApit-00000007xVh-372d;
	Mon, 20 Oct 2025 13:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CuQNCifUktlMCAA4v8tmCWank1/HSzSiksw1WUKqzUc=; b=uELIpQfigKvvT9McDvhdbiIu/c
	zlGP7XcXJrLNQcPukS4BU+SgL7bIIFazM0OVpQ/HbL2H7+59YcHeZm4Q1D4mI3pCLAB+P4TJcn9HI
	A7fV1OifN1hw2ERuqgWa3o9PogVvleK7G6EtM1R5+N2IwjTo9IYgTd9c0VIbRK/LynLllv1hk5buy
	WqgHQYzgysvNldEUCUTUSniEajLmisXl0JUo50ccLUNSn5dvP0lDMbqXKVCalpiLPOKIvcdlyqpYP
	MW8XLCKz5Kzq90Tx5xPHAY1gJ/9Y4wYS7H/QZyFKxgR8pX7xMaoQhut98GvAgq77NKBtS+0wO1wQg
	lH6z4rgw==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vApim-0001Qj-4C; Mon, 20 Oct 2025 15:14:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: (subset) [PATCH v2 0/3] Add PCIe Gen2x1 controller support for RK3528
Date: Mon, 20 Oct 2025 15:14:41 +0200
Message-ID: <176096606936.3742628.8434480469163363343.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250918153057.56023-1-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_141453_030377_F3EA2570 
X-CRM114-Status: GOOD (  10.12  )
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


On Thu, 18 Sep 2025 15:30:54 +0000, Yao Zi wrote:
> Rockchip RK3528 ships one PCIe Gen2x1 controller that operates in RC
> mode only. The SoC doesn't provide a separate MSI controller, thus the
> one integrated in designware PCIe IP must be used. This series documents
> the PCIe controller in dt-binding and describes it in the SoC devicetree.
> 
> Radxa E20C board is used for testing, whose LAN GbE port is provided
> through an RTL8111H chip connected to PCIe controller. Its devicetree
> is adjusted to enable the controller, and IPERF3 shows the interface
> runs at full-speed. A typical result looks like
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add PCIe Gen2x1 controller for RK3528
      commit: 263fac6b09b42a1b077c21354370d38758237ab0
[3/3] arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
      commit: 047bac0be317e68b89d0deed4f659f8e080df6e8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

