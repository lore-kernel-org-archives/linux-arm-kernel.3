Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7F6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NhOWysvQhf2PRkM8rGTXv3RWNRPBW2pV0hBsol8DFc=; b=iylPylZwA6zeE5pEiSPsMJPZzl
	OCwV3K9yqGUHAo9wOZEEp+BwUArE/uAJ5Y1EXtT61c+n29k93cIDa4H5oXj14J646lxVbQ+kickFl
	WW9jnDb2nyUon+MQwEIA/qu+tKdFoBI7brKPtmZdNlNtP8DweKW71iohv71Vp7iWVtyB2+Y23l3kh
	gqTlgd8C9pIBARBubL7kTnSsupsli6kGg6c6G9ByyqY67GkqP/0PM9lriIjj1tb9EaMOhr0F83HkT
	nnKnbecL9JTUCaQP6jbaMin6jZLOpQfGZTGi0RbGUCKXzlDb3+OsYQkYHzcst0CbMfag0H+COcSOT
	tQOblggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRBp-00000004ug3-2c4y;
	Thu, 14 May 2026 08:13:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNRBn-00000004ufj-3TTD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 08:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FB8B60129;
	Thu, 14 May 2026 08:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA51FC2BCB7;
	Thu, 14 May 2026 08:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778746382;
	bh=0FaoiUoXT987e1DSGb+y8srTS7Rpy0QVcgiD2b+Qq7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcDhzFcqJVdkU9IiBOB6T8yUdp8ChsZOkYMuWKzMKTVBEyr3JIuOXkoJn84riwsHR
	 N7wAH68F+Smii6qDQAawFgOmCoes/IYcqkkEgwBwgE1x/RZWQMC3x+96RiYt4PmGo0
	 X3q29uvrzntFYaCtM2uCUkvewSH3/N9HrwfxACoa6rD40JcJ5a+mAHkmiLzRqX5CtP
	 toMLjWnR6uVMcxIdrpGmgl17fotFjVdVE1DZP00tFgAcPEtpIgYXH/c3F1n8NaTl1/
	 NytfTxd1ABXxMilEUZ6GxDQ2VRKXqZ+8JUj/J2p30vo3nyZ8l92oU0CuNfMx9Y2is4
	 vtEup0/IGlfeQ==
Date: Thu, 14 May 2026 13:42:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org, 
	skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, alistair@alistair23.me, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s-vadapalli@ti.com, 
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v3 0/4] PCI: Add DOE support for endpoint
Message-ID: <bf3jf3vdrzclj5a3r7hmq2z4ghmub5ksrfr3ggumya4szl2vil@o5kpykemzt66>
References: <20260427051725.223704-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427051725.223704-1-a-garg7@ti.com>
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

On Mon, Apr 27, 2026 at 10:47:21AM +0530, Aksh Garg wrote:
> This patch series introduces the framework for supporting the Data
> Object Exchange (DOE) feature for PCIe endpoint devices. Please refer
> to the documentation added in patch 4 for details on the feature and
> implementation architecture.
> 
> The implementation provides a common framework for all PCIe endpoint
> controllers, not specific to any particular SoC vendor.
> 
> This patch series is the non-RFC version of the RFC series at 
> https://lore.kernel.org/all/20260213123603.420941-1-a-garg7@ti.com/
> 
> The changes since v1 are documented in the respective patch description.
> 

Thanks for the work! I left some comments, but the series look good from the
initial look. Once you add the callers as I suggested, I'll do a more thorough
review.

- Mani

> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> v2: https://lore.kernel.org/all/20260401073022.215805-1-a-garg7@ti.com/
> 
> Aksh Garg (4):
>   PCI/DOE: Move common definitions to the header file
>   PCI: endpoint: Add DOE mailbox support for endpoint functions
>   PCI: endpoint: Add API for DOE initialization and setup in EPC core
>   Documentation: PCI: Add documentation for DOE endpoint support
> 
>  Documentation/PCI/endpoint/index.rst          |   1 +
>  .../PCI/endpoint/pci-endpoint-doe.rst         | 318 ++++++++++
>  drivers/pci/doe.c                             |  11 -
>  drivers/pci/endpoint/Kconfig                  |  14 +
>  drivers/pci/endpoint/Makefile                 |   1 +
>  drivers/pci/endpoint/pci-ep-doe.c             | 552 ++++++++++++++++++
>  drivers/pci/endpoint/pci-epc-core.c           |  71 +++
>  drivers/pci/pci.h                             |  47 ++
>  include/linux/pci-doe.h                       |   8 +
>  include/linux/pci-epc.h                       |  24 +
>  10 files changed, 1036 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/PCI/endpoint/pci-endpoint-doe.rst
>  create mode 100644 drivers/pci/endpoint/pci-ep-doe.c
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

