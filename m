Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73FAE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BUxOaSmk6cq1cipFEMyq/6uEqj9whr01OXMDUao7OU=; b=bs9RbKEyd99TV84/HDynFMzId1
	dpszNbBOYAsxBYG/sPebmO6jzn6/eDIpM6TvFDWeKpKrKgZ6KRXRee4eJB+3IeqZxGy4QUIB2VpBd
	iEENllm6+3lKWixO1BXudFjVk8r3ivZivkDS/WrHjTJfX0rmUaR+5UOcgKHY9K2WL8RZYENO5yJi+
	q+saayUGIYmw+0/Btz+cimfkUksyGFq+HE2ci2ZlZuIH6y7aoJUZm8hUeS9KG3rHDOnIBzd/Zwlj/
	ihTufxiP9jy824tFAC+IJYF8Y7wtu0cgzXsGMd/CQcQF7YcKhA1UN878Z0keDglf/Lpo4a3URP5bG
	NV62rsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZEJ-0000000DHEy-1tIR;
	Mon, 22 Dec 2025 06:17:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZEI-0000000DHEZ-2YCD;
	Mon, 22 Dec 2025 06:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7B6F6001D;
	Mon, 22 Dec 2025 06:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65A7C4CEF1;
	Mon, 22 Dec 2025 06:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384232;
	bh=+PJJrLUZuuvwo/YknxXQIYCxBgkPwh5ViNEYKOPqGLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUOZEoyJQstFde3gfBLzzzrHX16nHgjhjNRxUJoGVckt+cwXYFKX/8s0ahpHkJUJ0
	 wIvfxGJHOOxDkc7YqDXyD+Strd6UBqCkUddyT1eRF9MDsQGkSFjaY4wARRp1BKuM+Y
	 0EdF87kTzSxmv8tWQr9bc5VWFdr8qyflO/sqUUm8+FAmm6eH4McKZHH/C5IstKkLlL
	 jWj9I2HXicWC4Wv7JAk3x1wrwNA482sN7AZFQaYXm0R9aCkl7rzb7HHYzscZMTMSda
	 RWKysMjOX0UO+6Z4iku0esn/gWAH/turVg2PCS10ycK93qiTQ5g1bBAhwezZ6NmrJ5
	 Xt5Oz4xn7AbJw==
Date: Mon, 22 Dec 2025 11:46:57 +0530
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
Message-ID: <cngg5kifjqmrmb5ufyrv4k6dwo5tgatqssaeoog5aqpe7m253c@krov7axlplkw>
References: <20251111105100.869997-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111105100.869997-8-cassel@kernel.org>
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

Could you please rebase this series on top of pci/controller/dwc branch and
repost?

- Mani

> Niklas Cassel (6):
>   Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link
>     Up"
>   Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up
>     IRQ"
>   Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
>   Revert "PCI: qcom: Enable MSI interrupts together with Link up if
>     'Global IRQ' is supported"
>   Revert "PCI: qcom: Enumerate endpoints based on Link up event in
>     'global_irq' interrupt"
>   Revert "PCI: dwc: Don't wait for link up if driver can detect Link Up
>     event"
> 
>  .../pci/controller/dwc/pcie-designware-host.c | 10 +--
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 -
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 60 +-----------------
>  drivers/pci/controller/dwc/pcie-qcom.c        | 63 +------------------
>  4 files changed, 6 insertions(+), 128 deletions(-)
> 
> -- 
> 2.51.1
> 

-- 
மணிவண்ணன் சதாசிவம்

