Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971A4C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z2qn67pe6YPBBwZWIDspdJmI/DndbUzteSlOzwSGK8=; b=FAVUK3hKp6ku59TZDuVzr6tNBc
	xb0ZhO+oppcOPrcl+TYFk73uzy6EHqimEZ+EGpT/4iwGugg5SeHMhM1FVC5IoYqSspZGYvHRAwqY3
	98UsZz2vzyCJLy5jt7Wg85eoqmURfbIW5O7uYHUL0Wtdlsp7Ylgz8v3Uc0Ap4rb6gUypQWHTaKGl4
	Vl0I/keAsSsU497tg8vpoRtXVoyhVPFufQneKPbVkb+wS9q3aNpc0fbzklq7keybH2k76g0tc0q2B
	DYpEIiQV7Yp+6V3Njq/ssV6OPZufPEhq12/iYecCNHaq0E4vRAaWeG7uS7BMyOtziz77Zf590Q8uv
	89gVAwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv85Q-00000003auI-1DxF;
	Sat, 15 Aug 2026 06:41:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv85O-00000003au9-1lOY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 06:41:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1F6C41873;
	Sat, 15 Aug 2026 06:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF001F000E9;
	Sat, 15 Aug 2026 06:41:33 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
 Aksh Garg <a-garg7@ti.com>, Thierry Reding <thierry.reding@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
 Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
Subject: Re: (subset) [PATCH v10 0/5] PCI: tegra: Add Tegra264 support
Message-Id: <178677609346.498308.4041265473685850703.b4-ty@b4>
Date: Sat, 15 Aug 2026 08:41:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Fri, 14 Aug 2026 17:38:54 +0200, Thierry Reding wrote:
> this series adds support for the PCIe controllers found on the Tegra264
> SoC. There are six instances, one of which is for internal purposes only
> and the other five are general purpose.
> 
> The first patch tweaks the DT bindings slightly to avoid new DT compiler
> warnings that slipped through because they are now disabled by default
> (-Wno-unit_address_vs_reg). The second patch references PCIe root port
> bindings from the controller bindings, which will allow using the
> standard WAKE# handling, among other things.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: pci: tegra264: Strictly distinguish C0 from C1-C5
      commit: ba28f970791de8cf1bb352489a37307815d943d8
[2/5] dt-bindings: pci: tegra264: Switch to PCIe root port bindings
      commit: 66305010e3dbf9c27cb0abaa4726ccee5041f9ed
[3/5] PCI: tegra: Add Tegra264 support
      commit: f7349d6951ce4f21fe3c910a8ca93fabdd79c059

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



