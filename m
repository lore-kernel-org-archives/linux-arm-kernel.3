Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A1CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5M6X3G55kF4dCEW9Gm74DMxN0Pg8vaNgLib92UCrPY4=; b=RW8cp1Ys6o2vpcWieJ0cpR+X0e
	fTQVDaCHbarppN2Lj2OZsrMoo03SDK3N1zfJGJMh+K1l4KUEuUUIrvZkR2IAfQrFQ3dAIXHtedTos
	bBNQgP2/inM84MVS+Mkcp4O1EubPl3ta2MwW2UmQLSBZflYJ+UpO9igJiUNSxOlKjYc+crzBnmJnL
	SLOR/kzZomQxoYAHPZqnt1i1VC/A20x6E3WpKZj+No1tfxueL23DzDik+X/lKjNo7f0PjxotLiKyh
	9/hETZjxIwbXkthK/BdPKUdyRbbBRaIv7822OlRVKPaWBFiAteTQ2zO0GdduC5wB/JX9tMXfC+JIr
	Wf9ZyCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrx0-00000008MkA-2CKF;
	Fri, 15 May 2026 12:47:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrwx-00000008MjM-3YEo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C489C4325F;
	Fri, 15 May 2026 12:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065FCC2BCB7;
	Fri, 15 May 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778849250;
	bh=RutxBLw/fTqyWYne9ALFxGxyYBTrKY4dBcGpCUx/QLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOqYLJxfBaT3DbXlN83O21rR2IWjpFpD16bBcbsEFx+OwTxbhNN8iNRxIdg03WBX2
	 g7HhVxvca6FcFAZc39BfEDW0kd2AvxAElL5X4jNDWx+6L0xYfbtYLasXHr4hOESWI6
	 50MLH7eiRkxoftXw93sMVQ5SOAM5SsRk0DExr2wJOyPWOa+75JWEviB1Edo/nSLOcD
	 skcDlEbcV+BFAdOUQmhVehP644dOep+jnmoWJSRd76omn+4GVHDDu38RU3hyvvTrBJ
	 unreLhq+tgTsVGEpkopvbOf6c476Fp8EMpAs56uI9rhnV6XEoFTYwX7B5BHeyx41LJ
	 rZhGMYQr2nmdA==
Date: Fri, 15 May 2026 18:17:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org, 
	skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, alistair@alistair23.me, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s-vadapalli@ti.com, 
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v3 3/4] PCI: endpoint: Add API for DOE initialization and
 setup in EPC core
Message-ID: <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-4-a-garg7@ti.com>
 <m4z3q3pe3ro5vkl4uq4zkewpjdqccgeact2hj4tjnkonttx4vr@ndan37zzwgxc>
 <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_054732_021964_344D82F3 
X-CRM114-Status: GOOD (  28.47  )
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

On Fri, May 15, 2026 at 10:21:52AM +0530, Aksh Garg wrote:
> 
> 
> On 14/05/26 13:38, Manivannan Sadhasivam wrote:
> > On Mon, Apr 27, 2026 at 10:47:24AM +0530, Aksh Garg wrote:
> > > Add pci_epc_setup_doe() API in EPC core driver to initialize and setup
> > > the DOE framework for an endpoint controller. The API discovers the DOE
> > > capabilities (extended capability ID 0x2E), and registers each discovered
> > > DOE mailbox for all the functions in the endpoint controller. This API
> > > should be invoked by the controller driver during probe based on the
> > > doe_capable feature.
> > > 
> > > Add pci_epc_destroy_doe() API in EPC core driver for cleanup of DOE
> > > resources, which should be invoked by the controller driver during
> > > controller cleanup based on the doe_capable feature.
> > > 
> > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Aksh Garg <a-garg7@ti.com>
> > > ---
> > > 
> > > Changes from v2 to v3:
> > > - Rebased on 7.1-rc1.
> > > 
> > > Changes since v1:
> > > - New patch added to v2 (not present in v1)
> > > 
> > > v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/
> > > 
> > > This patch is introduced based on the feedback provided by Manivannan
> > > Sadhasivam at [1].
> > > 
> > 
> > Sweet! But I was expecting you to add atleast one EPC driver implementation to
> > make use of these APIs.
> > 
> > Also, why can't you call these APIs from the EPC core directly? Maybe during
> > pci_epc_init_notify() once the register accesses become valid.
> 
> Can we add the DOE initialization API to pci_epc_init_notify()? This
> API seems to be called to notify the EPF drivers that the EPC device's
> initialization has been completed, as the name and description suggests.

That's correct. But there is no harm in calling something like
pci_epc_init_capabilities() inside its definition. Only concern would be that
pci_epc_init_notify() is mostly called from threaded IRQ handlers. So loading
the handler would not be recommended. But since it is threaded anyway and we
don't have a better place to call, it would be OK.

We could've called this from pci_epc_{create/start}, but some controllers won't
allow accessing CSRs without REFCLK. So only after pci_init_notify(), CSRs can
be accessed.

> As 'pci_epc_doe_setup' is a part of EPC initialization, I thought the
> EPC drivers should call this API before calling the pci_epc_init_notify().
> 
> However, I agree with your suggestion to call the DOE setup API directly
> from the EPC core instead of sprinkling over the EPC drivers. I would
> recommend renaming the pci_epc_init_notify() API (and hence the
> pci_epc_deinit_notify() as well) to something like pci_epc_init_complete(),
> and add the DOE setup API/logic just before the
> logic of notifying the EPF devices.
> 

No need to rename this API. Just use as is:

	pci_epc_init_notify()
		-> pci_epc_init_capabilities()
			-> pci_epc_init_doe()
		-> epf->event_ops->epc_init()

- Mani

-- 
மணிவண்ணன் சதாசிவம்

