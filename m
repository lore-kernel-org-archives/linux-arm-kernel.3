Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50321CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yiMaY+1+6O6QQhgh+gVIXcJeQTcezyS4f/j96FgrdA=; b=GcGRdvz2GCAruRgn52kR4gaJ7w
	iZuKPO30U6tXf5tL5gbwdVa0D6vTfyLq/z5S5B8vEEtwxuLUY/B5+Ba7uJSwCPPBbZkaaHH6xvRN+
	R6/YU9AI58jYvbcBdJXA9pYwSDp4xoqZ9M7s5lP9kyJQUPTekCPr3OIfZk5cSxWqUpyRmvo8hVJ/c
	yXpetOYLyHjNIXxijq8ingBflM/udSkY9TzXZ1NDcd2ILGxsNNj/pHNcsO3Vjt501NJAVWbrOWZCk
	UTNXLWd3UPdC0I4rZWN7dFAR8C9wCb4ZzWJqrhwDLSNNHtyeyJsPrrxLkGg9/VZNek+4nxjr3cw9Y
	mwBdDZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTDS-0000000BNdJ-0tu1;
	Mon, 24 Nov 2025 09:50:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTDQ-0000000BNce-2yFQ;
	Mon, 24 Nov 2025 09:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A18C460138;
	Mon, 24 Nov 2025 09:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7DFC16AAE;
	Mon, 24 Nov 2025 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763977835;
	bh=bASfff82Xxt7ngaVSFG9avx6FhFPZUj+QtmErTDg24A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIk56rAJr9IMPxcPnfspRsVoorSI+MPgdaWXBtVKQaAvYHbKilPtxBtq7HIU98Af2
	 Ch8NHjhiC/ov16p7Elm9xxrUF4DxjKN0TvqJPhi1IXUImh+lizpdcRXSJKLFzpGKGF
	 1z49l1fFp3XwmFqSYZ4n6I9TqgeYVvHhYiZCvEGZLs2aeULYk1b2WdTfialVG+Hk6S
	 drKA1h4/bY21JL/GlwbbihAk1bDzWmZnptjcPdZPty7IoPEgWsrbW5GmAA8DcLWULO
	 WS8+ZogLcVIET98ETRxt2WipNSx1ktLu6Dv0aCBkJVeE6UtrwiYQBJq5MA9d6uH+zc
	 FLlRnE6UbIbYg==
Date: Mon, 24 Nov 2025 10:50:29 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <aSQqZcW39Ze1IE74@ryzen>
References: <20251111105100.869997-8-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hello PCI maintainers,

Merge window is opening soon,
what is the status of this series?


Kind regards,
Niklas

