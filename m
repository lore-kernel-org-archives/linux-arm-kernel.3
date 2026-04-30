Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107E2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 21:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JymqtX6cYEvXiU1SW1Tf0ooVfiWxkVzzBbqlfyT7q7Y=; b=un758uAxFGLiQ02b60WZle1Bv6
	u0Hlj3pGTvqGamEo6lX3M4c3khjey9kmabhiYsou1/3K3TB8dAGTjzZ7Cf0XDDCrmHvzKLg8JqPUq
	ZkavEnMYcfeOh96fvbYNqWRgT7xkazJzFDPQ1GQoEtaX0BSWb3cQHHPEpTng6U5673CuYH99eNUyc
	KbMq4PWC6IdmnMwBI5S6XmeJVFDOMxUJvEPyZKOgkSiIGYgcBPX/QDUQK+ZiXQ5YqN2ACqBxO5UsA
	BBHntQ9dqrEXN4AkPWwZMAk3MCxe9BWpNHjNnxn04qHIjrcX18ewxgmxAfJLXQ1WQXQmAGIalClUk
	SzjNoDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZ8R-000000060GN-2FGA;
	Thu, 30 Apr 2026 21:41:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZ8Q-000000060GD-31nr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 21:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A49E60142;
	Thu, 30 Apr 2026 21:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C976C4AF09;
	Thu, 30 Apr 2026 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777585285;
	bh=6Uq6A0mV41CjUmZm/vm4w/OOWYrR+v7vH90TRC9z6Fo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=PsIch+r76xe72kDqHEkIy33zsA/upJwkYlyJcXfDyiRuR5To+68rQPGQMZYBuzk6g
	 OqKsk4CKKljGZ4QsKB2u9pHR3qC+IX6vPFXmk0WonrKsNlCPTW/caKB/I2PBU+4LYP
	 jem+yd5tvvCataumYlnJd4kg+44AFIs+4cCwip94FIUtHSB3+w5X3M4RiuBynLOKRg
	 LFgk5yyt5Amex8TZc/RETnZTXUmraT1ZvIun0VVLyobWM8QA1uJkkkHiNlOESXjrHN
	 LiYO8pmpOG5gEhCv1oMTGOjMZYcMbDng1jG/NpR9y53aghQnDaBBkh5ExRRHnlnHmr
	 NT0As/Hq251hA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 94594F40069;
	Thu, 30 Apr 2026 17:41:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 30 Apr 2026 17:41:23 -0400
X-ME-Sender: <xms:g8zzaXQgENWylzGXUzS7DIy7_MVtLBvpGnZlXC6l9lnbPza6jZNeIA>
    <xme:g8zzadrgxzQZ8WQG377jnrScN_1U5hCKalHb5bGZSKQ7lOm2Kt7jtomXEU8wzGdzW
    HI1uBlg8278mRPA6Bp-08Xca4RMYLU0UjuSX-RgCI3vwI0N0oPurZxC>
X-ME-Received: <xmr:g8zzaVbhYpXjrya_LEUA3uzHZjKUJzC0xXQq5VMswANFGQFxnzNmGCRQ_1pCJbKyq_Xx7LN_oSCk6TeC3Jsk1KBzRwNq69olvpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekkeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpedfffgrnhcuhghi
    lhhlihgrmhhsucdlnhhvihguihgrmddfuceoughjsgifsehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhepvdegheeikeetleeuffeuheefjeejvdejvdevteefgfffveeh
    vdeuvdffveffvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddujeej
    vdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvghlrdhorhhgsehfrg
    hsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnihgtohhlihhntgesnhhvihguihgrrdgtohhmpdhrtghpthhtoh
    epjhhgghesnhhvihguihgrrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhorhho
    seeksgihthgvshdrohhrghdprhgtphhtthhopehprhgrrghnsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopegsrgholhhurdhluheslhhinhhugidrihhnthgvlhdrtghomhdprhgt
    phhtthhopehkvghvihhnrdhtihgrnhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:g8zzaYSE2Jx2rmrznxwwijil_ZmrHDUyhv1L3KBMpWgsfpdh-pmukw>
    <xmx:g8zzaTfrAvo-mm8m-MnLVDxuPIDBNyMJjefbSFFwBffYMXtMvtg62g>
    <xmx:g8zzaXl6uO6HxKg7ZZ5PmEP7eTvxQ1ZgcCJmUc5_nR0WJ0X3CYUxaw>
    <xmx:g8zzaYiUjLOfhXDHc_GPQpF-MzkP6c3lJ6rNi8T8q18PotbHRkcXnA>
    <xmx:g8zzaYEECV6ZeJ-2SWMSsTalAYimtXj19iYzO4gXvViI0c_Q9VsuGDzS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Apr 2026 17:41:22 -0400 (EDT)
Date: Thu, 30 Apr 2026 14:41:22 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>, 
 jgg@nvidia.com, 
 will@kernel.org, 
 robin.murphy@arm.com, 
 bhelgaas@google.com
Cc: joro@8bytes.org, 
 praan@google.com, 
 baolu.lu@linux.intel.com, 
 kevin.tian@intel.com, 
 miko.lenczewski@arm.com, 
 linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 dan.j.williams@intel.com, 
 jonathan.cameron@huawei.com, 
 vsethi@nvidia.com, 
 linux-cxl@vger.kernel.org, 
 nirmoyd@nvidia.com
Message-ID: <69f3cc82926_3291a910039@djbw-dev.notmuch>
In-Reply-To: <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
References: <cover.1777269009.git.nicolinc@nvidia.com>
 <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
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

Nicolin Chen wrote:
> Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> given PASID on a device is attached to an I/O page table. This is working
> even when a device has no translation on its RID (i.e., the RID is IOMMU
> bypassed).
> 
> However, certain PCIe devices require non-PASID ATS on their RID even when
> the RID is IOMMU bypassed. Call this "always on".
> 
> For example, CXL spec r4.0 notes in sec 3.2.5.13 Memory Type on CXL.cache:
>  "To source requests on CXL.cache, devices need to get the Host Physical
>   Address (HPA) from the Host by means of an ATS request on CXL.io."
> 
> In other words, the CXL.cache capability requires ATS; otherwise, it can't
> access host physical memory.
> 
> Introduce a new pci_ats_always_on() helper for the IOMMU driver to scan a
> PCI device and shift ATS policies between "on demand" and "always on".
> 
> Add the support for CXL.cache devices first. Pre-CXL devices will be added
> in quirks.c file.
> 
> Note that pci_ats_always_on() validates against pci_ats_supported(), so we
> ensure that untrusted devices (e.g. external ports) will not be always on.
> This maintains the existing ATS security policy regarding potential side-
> channel attacks via ATS.
> 
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Vikram Sethi <vsethi@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Tested-by: Nirmoy Das <nirmoyd@nvidia.com>
> Acked-by: Nirmoy Das <nirmoyd@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/pci-ats.h       |  3 +++
>  include/uapi/linux/pci_regs.h |  1 +
>  drivers/pci/ats.c             | 43 +++++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index 75c6c86cf09dc..d14ba727d38b3 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -12,6 +12,7 @@ int pci_prepare_ats(struct pci_dev *dev, int ps);
>  void pci_disable_ats(struct pci_dev *dev);
>  int pci_ats_queue_depth(struct pci_dev *dev);
>  int pci_ats_page_aligned(struct pci_dev *dev);
> +bool pci_ats_always_on(struct pci_dev *dev);
>  #else /* CONFIG_PCI_ATS */
>  static inline bool pci_ats_supported(struct pci_dev *d)
>  { return false; }
> @@ -24,6 +25,8 @@ static inline int pci_ats_queue_depth(struct pci_dev *d)
>  { return -ENODEV; }
>  static inline int pci_ats_page_aligned(struct pci_dev *dev)
>  { return 0; }
> +static inline bool pci_ats_always_on(struct pci_dev *dev)
> +{ return false; }
>  #endif /* CONFIG_PCI_ATS */
>  
>  #ifdef CONFIG_PCI_PRI
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 14f634ab9350d..6ac45be1008b8 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -1349,6 +1349,7 @@
>  /* CXL r4.0, 8.1.3: PCIe DVSEC for CXL Device */
>  #define PCI_DVSEC_CXL_DEVICE				0
>  #define  PCI_DVSEC_CXL_CAP				0xA
> +#define   PCI_DVSEC_CXL_CACHE_CAPABLE			_BITUL(0)
>  #define   PCI_DVSEC_CXL_MEM_CAPABLE			_BITUL(2)
>  #define   PCI_DVSEC_CXL_HDM_COUNT			__GENMASK(5, 4)
>  #define  PCI_DVSEC_CXL_CTRL				0xC
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index ec6c8dbdc5e9c..fc871858b65bc 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -205,6 +205,49 @@ int pci_ats_page_aligned(struct pci_dev *pdev)
>  	return 0;
>  }
>  
> +/*
> + * CXL r4.0, sec 3.2.5.13 Memory Type on CXL.cache notes: to source requests on
> + * CXL.cache, devices need to get the Host Physical Address (HPA) from the Host
> + * by means of an ATS request on CXL.io.
> + *
> + * In other words, CXL.cache devices cannot access host physical memory without
> + * ATS.
> + */
> +static bool pci_cxl_ats_always_on(struct pci_dev *pdev)
> +{
> +	int offset;
> +	u16 cap;
> +
> +	offset = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
> +					   PCI_DVSEC_CXL_DEVICE);
> +	if (!offset)
> +		return false;
> +
> +	if (pci_read_config_word(pdev, offset + PCI_DVSEC_CXL_CAP, &cap))
> +		return false;
> +
> +	return cap & PCI_DVSEC_CXL_CACHE_CAPABLE;

Apologies for coming to this late and forgive me if the following has
already been asked and answered. Why not check for actual CXL.cache
protocol on the wire being present?

I.e. replace pci_cxl_ats_always_on() with a pdev->is_cxl_cache and this
incremental change (compile tested only):

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..45d87af4de63 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -483,7 +483,8 @@ struct pci_dev {
 	unsigned int	is_pciehp:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
-	unsigned int	is_cxl:1;               /* Compute Express Link (CXL) */
+	unsigned int	is_cxl_mem:1;           /* Compute Express Link (CXL.mem) */
+	unsigned int	is_cxl_cache:1;         /* Compute Express Link (CXL.cache) */
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
 	 * execute DMA attacks and similar. They are typically connected
@@ -809,7 +810,7 @@ static inline bool pci_is_display(struct pci_dev *pdev)
 
 static inline bool pcie_is_cxl(struct pci_dev *pci_dev)
 {
-	return pci_dev->is_cxl;
+	return pci_dev->is_cxl_mem || pci_dev->is_cxl_cache;
 }
 
 #define for_each_pci_bridge(dev, bus)				\
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b63cd0c310bc..c01f0e8362f1 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1733,9 +1733,8 @@ static void set_pcie_cxl(struct pci_dev *dev)
 	pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS,
 			     &cap);
 
-	dev->is_cxl = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_CACHE, cap) ||
-		FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_MEM, cap);
-
+	dev->is_cxl_cache = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_CACHE, cap);
+	dev->is_cxl_mem = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_MEM, cap);
 }
 
 static void set_pcie_untrusted(struct pci_dev *dev)

