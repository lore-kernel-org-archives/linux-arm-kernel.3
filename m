Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E08CCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y6eNQQOrohdJIhzzt2s0OvA+/TojtqzWLKmoxp8ffk=; b=H9DLHXqlHBjghVvNSDPqyk5jYx
	6J+HIKu7s+0z8J60BuyQFJReL00BGZ+zYadU/8ORwkP5mKmxlipD+XqeIauN3NqYe1fzwauorBPra
	O1insQUS0YqbFpy4qTixFD6JKVOPtBJ14ikcycK5SrHw2KO6C90PcjAgoEb32nLz3T6SgOSyca3q5
	CwQMhTWPwWDiRcNGDzxE71z9X/S3GNLWfGOm6HxnbfDxMfPPARvChs9MgawrcncUOiTEkD3I/xfq4
	5RfXJmCYkMQvMdwOv6qLPoj2qzIgvqdx8ojmVzUE4q6eIfrat9/iD0+OSRTZpnQ42orZsm7I6Xbmj
	OkXLRetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVpS-0000000Bezl-3Ktb;
	Mon, 24 Nov 2025 12:38:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVpQ-0000000BezH-2Yro;
	Mon, 24 Nov 2025 12:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 483CF44270;
	Mon, 24 Nov 2025 12:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A385C4CEF1;
	Mon, 24 Nov 2025 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763987878;
	bh=FKPMg3uIfj2UWT9aHfXB2xyEkoogoVhivvuGZBBOJGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oj1T3K9ZkUT3h5FIilNKp9UIlOF0kOeYy9B12BU1Ea2vPhHix5HIkzy6DujgrAgJE
	 xJn68EYHNNUfmE3/q8O6VAzu+1ANOaFBltp2zSVHFJGw3/dmXMKdBaS1q44yMuX/cT
	 9QfDZstg5rCrVGLXFwImgUTkk43f0C8CH5eJKlVf6VHI9jx+XwitHyDuv8DUvVsz0r
	 BX9LLdz/uu0JpeRUWymWnacr0JRQ5Etug1ff/qOhB2ir6DjceZiWXoEB7HbwG+VJPO
	 l4gVf13KcLrT6xqAugMB0vqdcr7SOlMDTbdX9Iva3RGu0pTV7dff/zw5TfTFkXxoMe
	 zxVOOIY3rGfFQ==
Date: Mon, 24 Nov 2025 18:07:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, Krishna chaitanya chundru <quic_krichai@quicinc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
References: <20251111105100.869997-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111105100.869997-8-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_043800_714197_E7E5369D 
X-CRM114-Status: GOOD (  23.31  )
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

On Tue, Nov 11, 2025 at 11:51:00AM +0100, Niklas Cassel wrote:
> Revert all patches related to pcie-designware Root Complex Link Up IRQ
> support.
> 
> While this fake hotplugging was a nice idea, it has shown that this feature
> does not handle PCIe switches correctly:
> pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> During the initial scan, PCI core doesn't see the switch and since the Root
> Port is not hot plug capable, the secondary bus number gets assigned as the
> subordinate bus number. This means, the PCI core assumes that only one bus
> will appear behind the Root Port since the Root Port is not hot plug
> capable.
> 
> This works perfectly fine for PCIe endpoints connected to the Root Port,
> since they don't extend the bus. However, if a PCIe switch is connected,
> then there is a problem when the downstream busses starts showing up and
> the PCI core doesn't extend the subordinate bus number after initial scan
> during boot.
> 
> The long term plan is to migrate this driver to the pwrctrl framework,
> once it adds proper support for powering up and enumerating PCIe switches.
> 

While I suggested to revert the link up IRQ patch for rockchip earlier, I didn't
expect to drop the support for Qcom. The reason is, on Qcom SoCs, we have not
seen a case where people connect a random PCIe switch and saw failures. Most of
the Qcom usecases were around the M.2 and other proprietary connectors. There is
only one in-house PCIe switch that is being actively used in our products, but
so far, none of the bootloaders have turned them ON before kernel booting. So
kernel relies on the newly merged pwrctrl driver to do the job. Even though it
also suffers from the same resource allocation issue, this series won't help in
any way as pwrctrl core performs rescan after the switch power ON, and by that
time, it will be very late anyway.

So I'm happy to take the rockhip patches from this series as they fix the real
issue that people have reported. But once the pwrctrl rework series gets merged,
and the rockchip drivers support them, we can bring back the reverted changes.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

