Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE80FC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIDgssy0wT1IlvPXHjkOzWbDlH2KA5Eq0WCdeK+jwFk=; b=wgMS65i3uuJGnwHOqVu0dzPF8I
	Vuw1qUdJxJgdNy726FLhcD3+790FIvHwG8o5y0jj/w5WvmWMo5MEdKW3Yh04s0qYFtjXvKVjvdM8A
	Bz/UfQn6nAj0J4e2hM//TUFYojUXHpmNOV1RhFbMUcy/dNeAdabeYiDUtbeuA5VlV8SGzKxHFe3wZ
	QmJf8OmlqUAx3+ENk+qWFT4kC5AdGdFH5SNEFBj3Bi+Q8xyQcwB8anxIifQIluJ5a/5VnGMRy6ziN
	x6UKFAmm0P7W/cH/jZSAo3JqAQNcsX47Q4xgSNiz8IrbjG6DYPpnygqkpv/pWoQkKrvPl/j6GmggA
	sjl5MfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5Qc-00000008GuZ-1DNK;
	Wed, 29 Jul 2026 14:38:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5Qa-00000008GuN-2JWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:38:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA69843B65;
	Wed, 29 Jul 2026 14:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7D31F00A3A;
	Wed, 29 Jul 2026 14:38:27 +0000 (UTC)
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
In-Reply-To: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
Subject: Re: (subset) [PATCH v8 0/6] PCI: tegra: Add Tegra264 support
Message-Id: <178533590733.885241.18362795978523136400.b4-ty@b4>
Date: Wed, 29 Jul 2026 16:38:27 +0200
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


On Thu, 16 Jul 2026 19:07:11 +0200, Thierry Reding wrote:
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

[3/6] PCI: Use standard wait times for PCIe link monitoring
      commit: 9cb1b6a781ab5166a6afdd4bbcd6044d75bffed1

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



