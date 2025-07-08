Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF7BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=C8WS1gLAmmyuOpddGgQlFxMLQeTVURFDThXk8kaCfbA=; b=Qu1hx/4CvVtxCi
	3twzvjndl7RTdgWLaHjYc+k6+saXvf68c+4BWlTg6Z9TLvcu5rPkeU8ZZ2luf6prptre8A7suEANY
	xBt9XAWgGuRpfI7HiORdLvjQ2hrZBIwvAKKn0d9GDamnz3OuuLpfd7AN3mnG2A0usTd24ftI/ohkY
	b4vLXxUzBRbxURX/VevUWlVTdqytRRzMLQ3IvZ0NdqwWY9Uo+Uowqs6ACY+CbRsRDFbcPyO3O+vYU
	xO3O2YUZJJRLC/Vv13oQDJstzdLJ1kzpH7BwIedRtRyAtaJjEtfHsLQ2KlibDnDEBI2mxiiauoPyc
	kqSHpLnObADa5Y38SO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBwB-000000065cH-3Dvw;
	Tue, 08 Jul 2025 17:16:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZApX-00000005uhT-1Lzb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCE043B19;
	Tue,  8 Jul 2025 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BD1C4CEED;
	Tue,  8 Jul 2025 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990762;
	bh=VoqXC5vS3jsIa1yFv0oPoDMiBok2AlhMwtNJQb0+QVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bm+GezH77xN1w6ikSayOdd/DgOLYB3Egij8qvNsjOVoHaI+xqsL38XPX4H3K1GeeU
	 FPQBVwShbzDpkvzmguPQjDdXexsaK8s4BJnm94pW9mnE3fn2wPJqnXOuB2/5B/tn0w
	 UhkNqdX4QZ3TmmwfssxJ8Z7wuovZdo/ZNtcOZ+TFV9+elpQuavsytBj6CUSsYVf4t0
	 T/1dh+Iy/RBAOsn6D67oTMk8AtB74jmoz+eNUfonfWh67pOro6KgVz/sHIOK1+lGPC
	 DiYO6KgVPtso/VoB+hN9vxmgQkm7bU7EFWMmyVmYeI+1rAWZ1HgI3+/+8sO/ZORU0t
	 HAzplkVeGB74g==
Date: Tue, 8 Jul 2025 11:06:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] PCI: iproc: Remove description of 'msi_domain' in struct
 iproc_msi
Message-ID: <20250708160600.GA2147978@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708053825.1803409-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090603_381420_9B2F2D72 
X-CRM114-Status: GOOD (  17.01  )
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

On Tue, Jul 08, 2025 at 07:38:25AM +0200, Nam Cao wrote:
> The member msi_domain of struct iproc_msi has been removed, but its
> description was left behind. Remove the description.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507080437.HQuYK7x8-lkp@intel.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Thanks for squashing this into the ("PCI: iproc: Switch to
msi_create_parent_irq_domain()") patch that removed the msi_domain
member, Mani.  No point in cluttering the history with extra commits
that clean up things we haven't merged upstream yet.

> ---
>  drivers/pci/controller/pcie-iproc-msi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
> index d0c7f004217f..9ba242ab9596 100644
> --- a/drivers/pci/controller/pcie-iproc-msi.c
> +++ b/drivers/pci/controller/pcie-iproc-msi.c
> @@ -82,7 +82,6 @@ struct iproc_msi_grp {
>   * @bitmap_lock: lock to protect access to the MSI bitmap
>   * @nr_msi_vecs: total number of MSI vectors
>   * @inner_domain: inner IRQ domain
> - * @msi_domain: MSI IRQ domain
>   * @nr_eq_region: required number of 4K aligned memory region for MSI event
>   * queues
>   * @nr_msi_region: required number of 4K aligned address region for MSI posted
> -- 
> 2.39.5
> 

