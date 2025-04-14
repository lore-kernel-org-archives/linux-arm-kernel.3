Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA26C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXlbWKegeuuphuVD8v7XhITmdjJpr+DU67mdolnYNJ8=; b=IyzmRk6L0ZYznZbZxYGQSsWCkY
	WmHwDe62aDmyL/3Z1bgM75dE7uGN1rgSilzrq7Zleylt/ScWbLYA3JaJ/F6HcT207kBv1zxqh0iv5
	IjJ9df2MjpxChohPQNXhsY8Lt5Irx7hCNdGJxNEGVQP1VYw/uoilLZXy8nJ+sKtgNj9A/sGb6IhQr
	7vz/LATL1h2vKpHtNN8qXuShi96QiviHmOAaWAz5GI2rXXD0bYWiGh5GhFTj6Ayz08XZPiUIEN14d
	D8bj9FbXlm1AdQzEWDSMTBT3GkxDJlJDQ13Vo13v/m0Yu+XNbFY1NSBgDgg0eYrR9LYHb2n/qi7iz
	a8S9Zu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LDh-00000002VDa-1zqQ;
	Mon, 14 Apr 2025 14:55:33 +0000
Received: from mail-m1973173.qiye.163.com ([220.197.31.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L9i-00000002U4r-3PFW;
	Mon, 14 Apr 2025 14:51:28 +0000
Received: from localhost.localdomain (unknown [124.72.37.3])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11d4dc641;
	Mon, 14 Apr 2025 22:51:12 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: andersson@kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 0/2] rockchip: Add rk3576 pcie dts nodes
Date: Mon, 14 Apr 2025 22:51:08 +0800
Message-Id: <20250414145110.11275-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEoZVkpMGEhLGENCQ0JLGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSU9VTElVSExVSFlXWRYaDxIVHRRZQVlPS0hVSktJSEJIQ1VKS0tVSk
	JLS1kG
X-HM-Tid: 0a9634c86d2a03afkunm11d4dc641
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P1E6PAw*KjIBKCIRSgs#EkwX
	FU8aCgNVSlVKTE9PTU9JSUxIQ0lMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKSU9VTElVSExVSFlXWQgBWUFJTUhNNwY+
DKIM-Signature: a=rsa-sha256;
	b=iZD/OC4KppITphC8tbsX4PwJw6hHwNbJFgEM5bNyDTHCWkMwnb49j42ECGwPfTJxzV0sU7PDBpN+M9E8u2qZ6Spy1SLAQdizv6R3P15UPNkVUgw5OtuTQBgffFfuboRQvs2DNH/0wi+MUuR0C4oTH+slONI4ZTJ+wVFyDOsi2ko=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CXlbWKegeuuphuVD8v7XhITmdjJpr+DU67mdolnYNJ8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075127_382592_A4BBECA5 
X-CRM114-Status: UNSURE (   9.18  )
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


Hi Bjorn,

This patch set adds support for rk3576 pcie by adding the dts node,
and this series is a re-base on v6.15-rc1 and collect tags without code
change.

Please help take the dt-binding to PCI tree if there is no more change request.

Thanks,
Kever


Changes in v9:
- Collect review tag
- rebase on 6.15-rc1
- Add test tag

Changes in v8:
- Collect review tag and add Co-developed-by tag.

Changes in v7:
- Move the rk3576 device specific schema out of common.yaml
- re-order the properties.

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

 .../bindings/pci/rockchip-dw-pcie-common.yaml |  10 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |  55 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 108 ++++++++++++++++++
 3 files changed, 165 insertions(+), 8 deletions(-)

-- 
2.25.1


