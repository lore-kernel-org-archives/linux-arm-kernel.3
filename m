Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355BDD3F079
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWPwn53Ol9ekWVCB9lvcHfUbRZPKdy+NP8fTOLLEeiQ=; b=UQanf+e/tiklPrmKZsIo3zn0Ol
	Q3fFB7t69ROa46DsWo5ggk5kWoeCQqn8bTG3HL9c8KRazL0ZYMkrXmBZZO0BXRgl58/MHrG2gxFNg
	YCPtEQBdd9JAarx0utLGd/WTzDx60bQqTH26xiOMfflpn/2bjrIqSQbmwsPUrVWzlvLQZJ8xhzoY6
	WvCCzKC5AORFS8yx8BgLgpwELFIjZIgyHPN6TXAaUDzPTkwCILBedoxmdfO0EdIiAXJVeDspaHDZ/
	+G/DoqW3BdY9B81G8h9+U3woSfFrae0nF6Xc9t0j0CvCYUZPLFNH5LIq8ui+qIH8Jfea79zdZn3sK
	JvuvBLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6x6-0000000GDWA-49zf;
	Wed, 28 Jan 2026 14:55:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6x5-0000000GDVz-1kIX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D19B06000A;
	Wed, 28 Jan 2026 14:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91530C4CEF1;
	Wed, 28 Jan 2026 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769612126;
	bh=UZhcBjbG4OlySfIhFDxqIUaepkapWzNZkH8yaYRq/qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n88qhjuiNnwo2tLONNdy+YL/EBTtX1WWN5jyA0LMx2ukeoPKd8Q/LoIw9LldznPPS
	 qidWz0BRAQD3qsAtWJgYDpMF4criLJrG7Vnb0Wf5PSKEAo/wNfyuk6EYT+saa8eexA
	 5iUodmrtGO86gEbdlfHH7e4yS+TB2nkgfmJagKsIkCyvVVpiVARjlDPaXbrpac3iH1
	 Mx6SeKx85B0dnrttpKjVAyIxo5Vo2+6buV39pSM/uprz7fO7g/TUOtdPhdmhEAGaW+
	 0cT4QtJ9bkDMypi8uJwyFh6V39QLVCBOczXwz1oSIpcUr5fbaN/nzAxaPHvvCci9IS
	 K9kGY1z2Hi3oQ==
Date: Wed, 28 Jan 2026 08:55:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
Subject: Re: [PATCH 0/3] PCI: qcom: Add D3cold support
Message-ID: <leonjtaswjzgibn4p5rmgegtad4fhi2y47qwtagilewebm3o4y@pc6eydqfujm4>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
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

On Wed, Jan 28, 2026 at 05:10:40PM +0530, Krishna Chaitanya Chundru wrote:
> This series adds a common helper to determine when a PCIe host bridge
> can safely enter D3cold, converts the DesignWare host driver to use that
> helper, and enables D3cold support for Qualcomm PCIe controllers.
> 

You only modify qcom_pcie_deinit_2_7_0() so which targets is this
expected to work on and which targets have you tested it on. How can I
test it and what outcome should I expect?

> The first patch introduces pci_host_common_can_enter_d3cold() in
> pci-host-common. The helper walks all devices on the bridge's bus and
> only allows the host bridge to enter D3cold if all PCIe endpoints are
> already in PCI_D3hot. For devices that may wake the system, it
> additionally requires that the device support PME wakeup from D3cold
> (via WAKE#). Devices without wakeup enabled are not restricted by this
> check and may be left in D3cold.
> 
> The second patch updates the DesignWare host driver to use this common
> helper in dw_pcie_suspend_noirq(). Previously, the driver skipped
> putting the link into L2 / device D3cold whenever L1 ASPM was enabled,
> since some devices (e.g. NVMe) expect low resume latency and may not
> tolerate deeper power states. However, such devices typically remain in
> D0 and are already covered by the helper's requirement that all
> endpoints be in D3hot before the host bridge may enter D3cold. Using the
> shared helper removes this coarse heuristic and centralizes the D3cold
> eligibility policy.
> 
> The third patch enables D3cold support for Qualcomm PCIe controllers. It
> adds pme_turn_off() support and switches to the DesignWare common
> suspend/resume methods for device D3cold entry and exit. If the
> controller is not kept in D3cold, the existing paths are used so that
> ICC votes, OPP votes, and other resources remain managed as before. In
> addition, qcom_pcie_deinit_2_7_0() is updated to explicitly disable
> PCIe clocks and resets in the controller, and the now-unused "suspended"
> flag is removed from struct qcom_pcie.
> 

This is effectively just duplicating the commit messages. Lacking from
both is a good explanation of the problem statement, but that might just
be me not getting it?

Could you please help me understand what the actual outcome of this
series is? I was under the impression that this work would lead us
towards unblocking CXPC, but the other patch you sent will prevent CXPC.

Regards,
Bjorn

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Krishna Chaitanya Chundru (3):
>       PCI: host-common: Add shared D3cold eligibility helper for host bridges
>       PCI: dwc: Use common D3cold eligibility helper in suspend path
>       PCI: qcom: Add D3cold support
> 
>  drivers/pci/controller/dwc/pcie-designware-host.c |   7 +-
>  drivers/pci/controller/dwc/pcie-designware.h      |   1 +
>  drivers/pci/controller/dwc/pcie-qcom.c            | 114 +++++++++++++---------
>  drivers/pci/controller/pci-host-common.c          |  29 ++++++
>  drivers/pci/controller/pci-host-common.h          |   2 +
>  5 files changed, 101 insertions(+), 52 deletions(-)
> ---
> base-commit: 590a64365d9bcc13ee644a3e73ffdc3df26cf23c
> change-id: 20251229-d3cold-bf99921960bb
> 
> Best regards,
> -- 
> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> 

