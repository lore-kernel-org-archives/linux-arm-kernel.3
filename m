Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5770FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7Z1WGoZ6pGE+GJYePikH7LrX0g0EF/J3QK1tukUmPY=; b=YONTnodLnwAYIF8Yd+4KAkAU73
	45FDUtYeg10z/vrplQ8/yTdYK4wBvK6mt2v92f3vuhW3zHTxi5XgkDhJ7j0qO8/lZw4wDBfQCI0f2
	16jz4v6vOlWgNcM2BbPU0P6jDdmkjDy9M9Do24JJpBobKOxWg0xUhRR9QJuj3zG82gyiB3LNHpr3j
	Xg97FptddklNEnKW2K8h7nHmodiPqYXKdzKnRHIG/+YBrBzSrMWKDZZ2WJ/6Or8mkRIPnfOO+1YL2
	Gai4a5K6Yjf8WbOfoVR1EVLzOQBIE36XRg3U1jV3jq0Bpbvl9C+uO+dyZR/0vJOXLX1WuaUq4ro7f
	7VkEQCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0byk-00000009kX3-36Lt;
	Mon, 22 Sep 2025 08:32:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0byi-00000009kVl-0DoR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5457E44CD2;
	Mon, 22 Sep 2025 08:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1FDC4CEF0;
	Mon, 22 Sep 2025 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529975;
	bh=e4T4XJtILjw3AWw7ksxXP2XAAsN4pB2E1LrEQPZKKeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGW/pN/Nc8u6WGuyuaDQQtAJjQTFBK/gPiG754tikHXuBFbLcQLqNF1LrO96YKYYR
	 Ux+rbMUD8vYAYlMKX6y4A86wxUTjHFOexdXUUCy3nuFgqi33mWmR6uGJQk2H4fHJur
	 LV7+UQfQrEiCyV6tlsEmnLft4QWdjvztTi9MoJU6et5siqBqyw65XlBMuNIOPbKGmj
	 dbEBn2ArMC8h4fexKLrFc/HIhrfwcXpOoEUDiKgR1QqpERnMnZA5zsqkgkMgARyj/i
	 nmOLH7Mr0W3KdSfhq90VBQu4b2IMIsfXx9vzlLhP+SGQhv4BOu3kxRD2343pBiQSV3
	 aZx5A/+9kLzSg==
Date: Mon, 22 Sep 2025 14:02:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	quic_wenbyao@quicinc.com, inochiama@gmail.com, mayank.rana@oss.qualcomm.com, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, cassel@kernel.org, kishon@kernel.org, 
	sergio.paracuellos@gmail.com, 18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3 0/4] PCI: Keystone: Enable loadable module support
Message-ID: <3sjuplupmdoxqhyz2i2p4he5vw7krqokixoy6ddoiox6p536n6@xzfcyhwjx3hv>
References: <20250922071222.2814937-1-s-vadapalli@ti.com>
 <175852954905.18749.5091036983349477093.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175852954905.18749.5091036983349477093.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_013256_110666_6B23E2FC 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, Sep 22, 2025 at 01:56:08PM +0530, Manivannan Sadhasivam wrote:
> 
> On Mon, 22 Sep 2025 12:42:12 +0530, Siddharth Vadapalli wrote:
> > This series enables support for the 'pci-keystone.c' driver to be built
> > as a loadable module. The motivation for the series is that PCIe is not
> > a necessity for booting Linux due to which the 'pci-keystone.c' driver
> > does not need to be built-in.
> > 
> > Series is based on commit
> > dc72930fe22e Merge branch 'pci/misc'
> > of pci/next.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] PCI: Export pci_get_host_bridge_device() for use by pci-keystone
>       commit: c514ba0fa8938ae09370beecb77257868c1568a7
> [2/4] PCI: dwc: Export dw_pcie_allocate_domains() and dw_pcie_ep_raise_msix_irq()
>       commit: db9ff606a5535aee94bf41682f03aba500ff3ad6
> [3/4] PCI: keystone: Exit ks_pcie_probe() for invalid mode
>       commit: 76d23c87a3e06af003ae3a08053279d06141c716
> [4/4] PCI: keystone: Add support to build as a loadable module
>       commit: e82d56b5f3844189f2b2240b1c3eaeeafc8f1fd2
> 

I just noticed the build dependency mentioned in the cover letter after applying
the series. This is problematic since there is no guarantee that the dependent
commit will reach mainline first. So if this series gets applied by Linus first,
then building this driver as module will break the build. We should not have the
build error at any cost.

So I'm dropping this series now. Please repost once the fix is in mainline
(which will be next cycle).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

