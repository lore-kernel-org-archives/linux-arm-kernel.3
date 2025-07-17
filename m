Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041E0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 21:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kE0xuTesGcgPy6euyMVq6LIi3eufHViAJCfMR0eBfAg=; b=JYnRj4eIpRyM37
	t/Dbph58d6PxAClAI3nNOTKfiHe2xv2ee6PWnrBkaoB3BdtcVT+exWknz6Ab/kiDGXt7Z1/+OOpi3
	TQIId03vy7vNvefhGgYMVDxCkRa4iKvV+P3TdnK8ZOqG3Jp7/WD6ZHhkFVA7WqUZHTcVw0BUO6oRg
	ednDm9vFg4xyJNTPNex5DFzajQjDP3B7Rd36MATdzpdaE8N/9C/B/IncQfwyXsgtzY3TREH32j3nX
	1kDX9IxtUNDGR/1SgNQ8oI14yOUqLT22qOOtRGrxgGG0z7cWnMPZg7Hyrk4ZqxCPvtummhJ9zLOe9
	Fr0Rp3A7q0nDz2EOBNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVl6-0000000B8p0-0MNl;
	Thu, 17 Jul 2025 21:03:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVif-0000000B8ZU-0EcZ;
	Thu, 17 Jul 2025 21:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7223143AD0;
	Thu, 17 Jul 2025 21:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA08C4CEE3;
	Thu, 17 Jul 2025 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752786044;
	bh=/EjOlRgaOAKxQ/Fnx16PJ9ZVpkCp4GhVajGljGUfwlI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fWP1mnIrbJEQLgem/+IU3XUqtpSHOijqCm9SBr3S17fR5GtE5UlxwyLGZOgVCkEmS
	 HjP0rr46X76GQL+864wm4/EmpRLf1BwFJ7yC2CpWvgfnlUrJR4SLLOkpx++hQBzdHA
	 BFGvR1F5Aqr6sLxc7DE9vXe0yBQnqLVWSXYqLk0igTyzKKMQ4MAa7z+vglgjWPxZ4B
	 K5K/8d0uwGu0+0sec2F0vWF356dlAgAKib+mtXtKDhYOD84CBsJyc5dfn69LPBm/DF
	 NKS6+MR1DceNNPbgqxVxcST+cMpUeoj/SWvNG0XRxp3bcL2uVk8oAymmA4Vmzz5AsP
	 9pyRKfb2ZIkLA==
Date: Thu, 17 Jul 2025 16:00:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: brcmstb: Trivial changes
Message-ID: <20250717210043.GA2654580@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175275644815.7439.10347177721311626088.b4-ty@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_140045_116547_B4C749D2 
X-CRM114-Status: GOOD (  11.10  )
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

On Thu, Jul 17, 2025 at 06:17:28PM +0530, Manivannan Sadhasivam wrote:
> 
> On Tue, 24 Jun 2025 16:19:21 -0700, Florian Fainelli wrote:
> > The first patch removes Nicolas from the maintainers list since he has
> > not been active and the second patch uses an existing constant rather
> > than open code the value.
> > 
> > Florian Fainelli (2):
> >   MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
> >   PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
>       commit: fde41f282590b46e96864ae88da2e2c20a967b3a
> [2/2] PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
>       commit: e8e7c1e95d6d4ccdc53654a5966d2183532ab115

Thanks, I updated s/PCIE_T_RRS_READY_MS/PCIE_RESET_CONFIG_WAIT_MS/
when merging this branch to account for the removal of
PCIE_T_RRS_READY_MS by
https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=bbc6a829ad3f
("PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS")

