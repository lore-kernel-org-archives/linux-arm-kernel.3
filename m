Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8691FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OBokeCxfnTm6eAu/h7mtemhN/Nfn+T+42ptXe6cPst4=; b=0CpKCmvrw9voYenoaqBO0SrJUx
	v6M3Pac46JpivpBdS/113y9bVgjO2VgaboFxEK8T/I5CiBlTJkWdsdXRpkJQsOyM7lSdWXxEIV/gC
	Sgs77mc+n4xydDWnLnAY1cpSYdyi78NXI3fhr960PdwoOff/xeNxkYs3pw/rzZCi0zy8I08FoO5Kj
	qmN7hbAs9rSU6LFQxbmqaUFeAPEHzyUzoJoBLKVDMjhT9ZmpNYL+qQxl1cm72dU/fs691ppr1qCck
	r8VHRpNavv2vYwOKxfg7CTkQA33OW96DqcLQdwBiNcG+WBlDJcZqkkEnvSF2kuVtV7/0v3oxzWVwt
	kj19gkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaCI-00000004aAG-16Rm;
	Fri, 20 Dec 2024 10:25:30 +0000
Received: from mail-m19731116.qiye.163.com ([220.197.31.116])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOa3A-00000004YSo-0pf9;
	Fri, 20 Dec 2024 10:16:07 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 655ee8f1;
	Fri, 20 Dec 2024 18:15:52 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	linux-pci@vger.kernel.org,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tim Lunn <tim@feathertop.org>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/7] Rockchip: add Rockchip rk3576 EVB1 board
Date: Fri, 20 Dec 2024 18:15:44 +0800
Message-Id: <20241220101551.3505917-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlOHlZCThlKS0xMSBgdT0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e391058303afkunm655ee8f1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBA6NDo4EjILSQgSGjMfM1Er
	PREKCTZVSlVKTEhPTUNCTE5PTU5KVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSEpDNwY+
DKIM-Signature: a=rsa-sha256;
	b=SaqqE/3shmWWw7PqQray8gEJWsYwpQMnGYHf8Yp0HDwxlSpSSc94j7efTau8U9/htSdpHm3YFeFTS5aaBl8nP4A7IHdU9AXEDuR55kfU5OIYIirzbzam9kSez0n0qILJhSVFkJTUPG5NcYQr7YX+CFX2Al/ilHJKG46pt0x9u78=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=OBokeCxfnTm6eAu/h7mtemhN/Nfn+T+42ptXe6cPst4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_021604_665318_E733A665 
X-CRM114-Status: UNSURE (   8.25  )
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

This version including the patch adding usb nodes from Frank Wang.

Changes in v2:
- update the clock and reset names to pass the DTB CHECK
- remove required 'msi-map'
- add interrupt name 'msi'
- Update clock and reset names and sequence to pass DTB check
- collect acked-by tag
- Enable USB nodes

Frank Wang (1):
  arm64: dts: rockchip: add usb related nodes for rk3576

Kever Yang (6):
  dts: arm64: rockchip: Add rk3576 naneng combphy nodes
  dt-bindings: PCI: dwc: rockchip: Add rk3576 support
  dts: arm64: rockchip: Add rk3576 pcie nodes
  dt-bindings: arm: rockchip: Sort for rk3568 evb
  dt-bindings: arm: rockchip: Add rk3576 evb1 board
  arm64: dts: rockchip: Add rk3576 evb1 board

 .../devicetree/bindings/arm/rockchip.yaml     |  25 +-
 .../bindings/pci/rockchip-dw-pcie-common.yaml |   1 +
 .../bindings/pci/rockchip-dw-pcie.yaml        |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-evb1-v10.dts     | 727 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 278 +++++++
 6 files changed, 1023 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts

-- 
2.25.1


