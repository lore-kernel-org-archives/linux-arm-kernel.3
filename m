Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C40E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HbXkrvngECAti2YdLItTE7lclPMNfzI3QgCujE+EWYI=; b=EnF2N+sUAVilrEpl7w0Cxz6XG2
	agXf832EAxPZ1Ya7zIvySfvIClpsNarBplCSASEryvXRkgdvWLm4r9woHNDXnhnOSPkc0TCTxrh12
	0saTBQVR2u59SU7klonMXwEmdzLL/YWOAfzec9Q570/FAClfi63GDNLJk1+8Y0IpCfruvnKutsX0H
	bXuB+BwATScq78RlGyBHo9IJSWsjkg3qlGqtMY0Oj4eeeVxRyek/RhY3BoWgQzxVYz2iUah5VOkkv
	6/gT+xOwh/Y7l46ETNAR82SCl2S+JPlJMIsSCZ6ZqKcv3BLVpgHTQjqSPMUvGN2ELdyf4Eh+S1367
	rIaZebcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Gl-0000000FYei-2Pb0;
	Thu, 05 Dec 2024 10:39:39 +0000
Received: from mail-m3287.qiye.163.com ([220.197.32.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Dl-0000000FXfK-2AmA;
	Thu, 05 Dec 2024 10:36:36 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf7c950;
	Thu, 5 Dec 2024 18:36:25 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Andy Yan <andyshrk@163.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Liang Chen <cl@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Tim Lunn <tim@feathertop.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 0/6] Rockchip: add Rockchip rk3576 EVB1 board
Date: Thu,  5 Dec 2024 18:36:17 +0800
Message-Id: <20241205103623.878181-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktDSFYYQhgeSk4aGU1MTxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a93966473a603afkunm4cf7c950
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6PAw*PDIqFQ1KTC4oCyFL
	FQkwCkpVSlVKTEhISEJPQkNMQ0hNVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTEk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=UGYudZ49/Tpfn7Cf5rTTiJQdMgDdEGhcTtxG+aVVnUzIlQQDYPHIb+fUCQQ+MVlbRR9Wd0bGmZf9N7HmnLYGba+gM1wJi/c4c4+zFLvIz0n+Tv6L05qq1lnNJc2BcQ9vTeONAYZ4QI45uju0nIXt+hpvj2M8hpjPc4WzgZGoxuI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=HbXkrvngECAti2YdLItTE7lclPMNfzI3QgCujE+EWYI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023634_013224_2CCAB657 
X-CRM114-Status: UNSURE (   7.47  )
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

This patch set is for rockchip rk3576 evb1.
Based on the naneng combphy patch from Frank Wang.


Kever Yang (6):
  dt-bindings: PCI: dwc: rockchip: Add rk3576 support
  dts: arm64: rockchip: Add rk3576 naneng combphy nodes
  dts: arm64: rockchip: Add rk3576 pcie nodes
  dt-bindings: arm: rockchip: Sort for rk3568 evb
  dt-bindings: arm: rockchip: Add rk3576 evb1 board
  arm64: dts: rockchip: Add rk3576 evb1 board

 .../devicetree/bindings/arm/rockchip.yaml     |  25 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-evb1-v10.dts     | 699 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 147 ++++
 5 files changed, 863 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts

-- 
2.25.1


