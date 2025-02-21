Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E7FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MT6Zk1Iwr6eslt5Pp/o6g6qSvge4hDtsWAuflUPzc98=; b=dzXh0pPcmQ0yjugwGlanc+7b0b
	XMtEIfDWNThkynfZY8EyPC2yCHw0KXcy4dhFvXLq4tVbU1nNC19RTaOohKTGIg3SOx6ZeQWvXsOW8
	diuOPsG9j7mEFe3G5bFUUX2C4ouTTivXLtZrR7svzVnpqT4Nv4wIVr9YlN13U38SuoKwHn2ul0tIS
	ay92XzQNvznyRULy9MDZn9LwJvZqBd5congqvyBRkjGvEyjuc8axOL/bHijhkqqJj0T3ImLLpRiE2
	nqCdLlWSLSQxDwjBU/u1ki1p9Gv5R4yoEgl2JJgTOl2fZuyexUWTyL4f2CpKVDOdxnDhWxHJTaA+f
	P23iyEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQwC-00000005I43-0QdD;
	Fri, 21 Feb 2025 11:11:20 +0000
Received: from mail-m1973170.qiye.163.com ([220.197.31.70])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQW7-00000005E5m-3Jlu;
	Fri, 21 Feb 2025 10:44:25 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bca250ad;
	Fri, 21 Feb 2025 18:44:11 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Liang Chen <cl@rock-chips.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v6 0/2] Add rk3576 pcie dts nodes
Date: Fri, 21 Feb 2025 18:43:55 +0800
Message-Id: <20250221104357.1514128-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxNHVZPQhlLGB9LQx9PGktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95281b96a803afkunmbca250ad
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxQ6Ggw5IzIIShkMCQw6GEIj
	Lj9PCxVVSlVKTE9LSkhPTU5IT0NJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTElNNwY+
DKIM-Signature: a=rsa-sha256;
	b=HT9z0/UERvinc9PmYjW0D0SzSA9ITQBv0zkT2adlyUV4vd/bJhX6cixa3U9sVXs5MRg3fCc7xAf8HKOs/jr6ArUgtsv0CQyPTaZEYfUropfK407CPzngO5ZQyL8Gobf+L2L90ZFRi8p0JsOX5wlcJvWseEHSgLEzvaCo5wuJeOc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=MT6Zk1Iwr6eslt5Pp/o6g6qSvge4hDtsWAuflUPzc98=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_024424_021161_889BB72D 
X-CRM114-Status: UNSURE (   8.75  )
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


The make dt_binding_check test has pass.
But I got error for make CHECK_DTBS=y as below
  DTC [C] arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb
  DTC [C] arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb
/home/kever/src/kernel-mainline/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pcie@2a200000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'msi'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
/home/kever/src/kernel-mainline/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pcie@2a210000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'msi'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
  DTC [C] arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb
/home/kever/src/kernel-mainline/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pcie@2a200000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'msi'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
/home/kever/src/kernel-mainline/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pcie@2a210000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'msi'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
  DTC [C] arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb
/home/kever/src/kernel-mainline/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: pcie-ep@fe150000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'dma0', 'dma1', 'dma2', 'dma3'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#

Could anyone told me why, the rk3568 has pass the test, but the rk3572
and rk3588 failed.
How can I debug the yaml check failure? Why the check rule does not go to
the if branch I defined for rk3572 and rk3588?


Changes in v6:
- Fix make dt_binding_check and make CHECK_DTBS=y

Changes in v5:
- Add constraints per device for interrupt-names due to the interrupt is
different from rk3588.

Changes in v4:
- Fix wrong indentation in dt_binding_check report by Rob

Changes in v3:
- Fix dtb check broken on rk3588
- Update commit message
- Update the subject

Changes in v2:
- remove required 'msi-map'
- add interrupt name 'msi'
- Update clock and reset names and sequence to pass DTB check

Kever Yang (2):
  dt-bindings: PCI: dw: rockchip: Add rk3576 support
  arm64: dts: rockchip: Add rk3576 pcie nodes

 .../bindings/pci/rockchip-dw-pcie-common.yaml |  59 ++++++++--
 .../bindings/pci/rockchip-dw-pcie.yaml        |   4 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 109 ++++++++++++++++++
 3 files changed, 159 insertions(+), 13 deletions(-)

-- 
2.25.1


