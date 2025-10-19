Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F252CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxlN28x+5gJxNJVHdK9WapGpiwux4ojfMtJWdMgLLFI=; b=UJguw6LHEfrNEUAKQBqW33nfGU
	mQPf+d40QNplZFTo7zQZE4mcgr23I1bHcEyOGpxM/tOhbeDneI25cydt8I0sSDZ72cea9hcdh/hUR
	52xPi8koRivr57mcZcc64JoXnYNRTpIREVGOHPNK/en63/wp5E6kcFJWFfyPm8olSk2jHLZXniTtt
	qqf3nazf6bPWzNyiXm83X8d6goQp4vk1DEJiQqgjpHT4UzbgOk+WX8RNHbopX6qz081wjiLA3+E+X
	Zc9M/BPmq4VRkBnNvqVZAx6GkXZTlJDQ/bwoA+9LB8fn40rjGlwHtPpdhUztjDOMTmZ2QXBoqjDWB
	ypHyi2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANZ6-0000000Alqw-3lBd;
	Sun, 19 Oct 2025 07:10:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANZ4-0000000AlqK-3VwS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 07:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CB3744FCB;
	Sun, 19 Oct 2025 07:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C71C4CEE7;
	Sun, 19 Oct 2025 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760857840;
	bh=WDqVVyRyQr+FH8+6XQnjBusK3qxbfBk4dcq13t/IdEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIaAxIju/58TL3RFmbl6lKGP1EV96wzk5L9mzMVqHif0ZFQDHs9ZzIHR0WmmZX7tF
	 G7YHjWDl4SlPkWHhGaJy+iEALoY6Iuthmx8mFg3ladxAl//K92pb+3hWJK+z3MDoF2
	 QPMwrH2TZg0Rru7ZnPm5qx0oO5lhZafyPfIN1a5kUtH59oEN/aiKBRkBh4rEECIXlG
	 3wT1ejF5kgaBgyFIzEHOHOBMPxbAoBUA14APBB7XrBmcmXA7L8MPmvrO3lZQg86vkZ
	 Yg8fz8wJU5lTyu5MxuLbzglkW1975mO0JEZ2ENw0qbnfbnrJRfjdlGs6kZmtcX6Yjw
	 Z9qSabLbbuZEw==
Date: Sun, 19 Oct 2025 12:40:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ravi Kumar Bandi <ravib@amazon.com>, thippeswamy.havalige@amd.com
Cc: lpieralisi@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
Message-ID: <akia22ulvkho753escdkhmunx3wdkgzk4hoosbrdpg3flfucxd@clwwh2hkt6wl>
References: <C47CF283-C0C4-4ACF-BE07-3E87153D6EC6@amazon.com>
 <20250920225232.18757-1-ravib@amazon.com>
 <ffnsnm67kc546xrx673yvuepolafapueyfboykmcfododbpb2o@cjcmlqcvu76v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffnsnm67kc546xrx673yvuepolafapueyfboykmcfododbpb2o@cjcmlqcvu76v>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_001050_892841_C2F15080 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, Sep 29, 2025 at 07:38:01PM +0530, Manivannan Sadhasivam wrote:
> On Sat, Sep 20, 2025 at 10:52:32PM +0000, Ravi Kumar Bandi wrote:
> > The pcie-xilinx-dma-pl driver does not enable INTx interrupts
> > after initializing the port, preventing INTx interrupts from
> > PCIe endpoints from flowing through the Xilinx XDMA root port
> > bridge. This issue affects kernel 6.6.0 and later versions.
> > 
> > This patch allows INTx interrupts generated by PCIe endpoints
> > to flow through the root port. Tested the fix on a board with
> > two endpoints generating INTx interrupts. Interrupts are
> > properly detected and serviced. The /proc/interrupts output
> > shows:
> > 
> > [...]
> > 32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
> > 52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
> > [...]
> > 
> > Changes since v1::
> > - Fixed commit message per reviewer's comments
> > 
> > Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>
> 
> Thippeswamy, are you fine with this change?
> 

Since there was no reply for a while and the change looked good to me, I've
merged this patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

