Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E245E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D2c/SE7vYWcihsMMVqmJdJJhyO1KiFLqRTUcCBMc7GM=; b=C8y3p+/tLrrh3GXsAodkN2Xkyx
	xe8El0YVVez8YdOa5EzTTCvhxtq9aSn6qwPMzfGofhEHjFsdu8MRlt8Ywo7W7RYpT56pcmviTCuZr
	pvruAw7u/ptAcwnw0rBJ2fAqkRTOVwhTK5ZFhpRTXXo7454YwGnLAakrBEj4r5nqCZagTjjnQZ8Rt
	Ol02NnvKAyIhFr0rABwEEGAymM4tcOeIWAHzY5RChtdW/xrVx7fTiCv576ijyULiycKmEerH+YukE
	2YnFTylf9KP56fl6g4LbRjHwISVoIM0DWyVA5NVcPXyvKLJ96ROUx9Uk+DHJwUcN65Y7KpRo3fT9X
	cVCIj09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Q2-00000003oa6-0Dox;
	Tue, 07 Jan 2025 07:54:30 +0000
Received: from mail-m3296.qiye.163.com ([220.197.32.96])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4L3-00000003nkk-13UK;
	Tue, 07 Jan 2025 07:49:28 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f3b5a6d;
	Tue, 7 Jan 2025 15:49:13 +0800 (GMT+08:00)
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
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tim Lunn <tim@feathertop.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/7] Rockchip: add Rockchip rk3576 EVB1 board
Date: Tue,  7 Jan 2025 15:49:04 +0800
Message-Id: <20250107074911.550057-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR8eTFZCGk9IT09PQkgZGkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a943fbd396203afkunm7f3b5a6d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46Pio*SDIUCxMXFCoXSBYZ
	S0JPCk1VSlVKTEhNSUhNSk5OSUpCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTE5LNwY+
DKIM-Signature: a=rsa-sha256;
	b=D40YXh8Ig3x9KgSYbaspqwgV1zdkY+BYpjVnsflXf0RtiF9PS7rk4LMbPzJ+aXbBsoBwYk/wbO4SFTZbZzndmTPHjEn0ZvOWDBPHYWGwaXl8LAiy46ajkeI4Xej56HZIiWbzaj9k8SC6s3UJIHdoZuLOFJ5JS3+CScRUonk+MLk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=D2c/SE7vYWcihsMMVqmJdJJhyO1KiFLqRTUcCBMc7GM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234921_491298_AE401401 
X-CRM114-Status: UNSURE (   9.89  )
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

Changes in v4:
- Fix wrong indentation in dt_binding_check report by Rob
- Update the commit msg with sort rule per required by Krzysztof.

Changes in v3:
- Update the subject
- Fix dtb check broken on rk3588
- Update commit message
- Update the subject
- sort for all the board entries instead of two rockchip boards
which suggested by Diederik
- update some properties order

Changes in v2:
- Update the clock and reset names to pass the DTB CHECK
- remove required 'msi-map'
- add interrupt name 'msi'
- Update clock and reset names and sequence to pass DTB check
- collect acked-by tag
- collect acked-by tag
- Enable USB nodes

Frank Wang (1):
  arm64: dts: rockchip: add usb related nodes for rk3576

Kever Yang (6):
  arm64: dts: rockchip: Add rk3576 naneng combphy nodes
  dt-bindings: PCI: dw: rockchip: Add rk3576 support
  arm64: dts: rockchip: Add rk3576 pcie nodes
  dt-bindings: arm: rockchip: Sort for boards not in correct order
  dt-bindings: arm: rockchip: Add rk3576 evb1 board
  arm64: dts: rockchip: Add rk3576 evb1 board

 .../devicetree/bindings/arm/rockchip.yaml     |  59 +-
 .../bindings/pci/rockchip-dw-pcie-common.yaml |   4 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-evb1-v10.dts     | 722 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 278 +++++++
 6 files changed, 1037 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts

-- 
2.25.1


