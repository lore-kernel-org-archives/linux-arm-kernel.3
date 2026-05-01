Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A79CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUUvqHwaQs0FUF2M4uyyquBvWY6LIaOIgF+/swf02h0=; b=lOBDISzSoPSDkP9f0dW6EdoFX2
	q0bfEijhU7vb5nBUKHdQ4DFwNlYXlYvgDM0hbEFBZMx4X1NeS2fS+JBik2EL3L28Y7SuGyklfd3c+
	Pbc6Q0angLgIdtzrt/kuL6u/8smYswZG42C28xAMfif5zYsblSsgeXTxMuB1Jb+S5TW7ZDHXdHtSg
	rn+XK44Ui6WVoYCt36Te2AHVQEG5pXEQ4+YLeKZH4Vx6zDHYw9Cjf+XELCkOjxIvIrLSWwqg6gbCY
	X102Hg4/mvmXsdluFw5r+hsP8BD2Bg/MbpVF7yWdE3KaIs1VodkdEFkjYJhIyha65Bm2Iw82cRbac
	pCvSpUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxGt-00000007ohW-2xZr;
	Fri, 01 May 2026 23:27:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxGr-00000007ohK-2Rjv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 23:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91763600CB;
	Fri,  1 May 2026 23:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17CDC4AF09;
	Fri,  1 May 2026 23:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777678064;
	bh=2k5q00p8L2SCLrIAB5imsL6AkKQY6Gzh059g+5BeG2w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=s0uSP/yCn1UL3bPdLD/W/BCIjoWt3FOlHsijmAbt3e6fEvEK0QXXyr3FeOjXJ0Wsd
	 aYjhLg0SnQrcWGmNHKxYTfpa9nr1gZpQY3tXLlHUsw1tc8nMoVYINo38GRgkJrJZiB
	 RpSnq7XSuprhfKV0jsOvGpnGfzpTk5x2OpKxiWSnoucEvR+l59p/wUyMdQZCqYjD4e
	 eNsd8KvjwO2O0JOFQVrXHJ0HEdLQyS/ivuAMwfzAkZ0vI5+HrBdmyE1yOnFM+3C4CF
	 74fdvtxXaX1MNI4GNGHuXm7h6qKpAe6WOBk1nO++JFjD/aO9dhebaJ5TXn2T/xykHN
	 wmwGJjBbLc6OA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id A88FDF40068;
	Fri,  1 May 2026 19:27:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 01 May 2026 19:27:42 -0400
X-ME-Sender: <xms:7jb1acHY-tPHMvyM98Jqckvdort1JVM99gSyfPMsEDUEEqUbN5gJcQ>
    <xme:7jb1acZG05AiWaobmeQsjEXn-98j1WHrGb-VSSRg-QhDdU4c6ZbZ71W-zZCFNzgcP
    hsATR-XUCjE1wPvKH-tsF2n5eZQAociU5IiwePTIZ6RMgI-mJkYng4K>
X-ME-Received: <xmr:7jb1ad0n3Xd6f7-Z65FKboAL6YNLzkFObSdXGqjzz9Ahin0-X8SPDiE_MFwfOjxAph1BtznRROZL2BxS1XNUm2Ti32Gg4nCO8Zc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeludehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpedfffgrnhcuhghi
    lhhlihgrmhhsucdlnhhvihguihgrmddfuceoughjsgifsehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhepvdegheeikeetleeuffeuheefjeejvdejvdevteefgfffveeh
    vdeuvdffveffvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddujeej
    vdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvghlrdhorhhgsehfrg
    hsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnihgtohhlihhntgesnhhvihguihgrrdgtohhmpdhrtghpthhtoh
    epughjsgifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjghhgsehnvhhiughirgdr
    tghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprh
    hosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepsghhvghlghgrrghs
    sehgohhoghhlvgdrtghomhdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpd
    hrtghpthhtohepphhrrggrnhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsggrohhl
    uhdrlhhusehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:7jb1aUc7xep8-XO8N2WGdSLCmHALigT1u79gu81zGLEbTP19kskZDg>
    <xmx:7jb1afAUat8iHAecyPX4xjpsjKHL7MLEgoZRwuNvZJIdGN1dLsSPFw>
    <xmx:7jb1aW07DHrU6-JbKte1wiE-7EtcH2ze9v0pvjWzc_PNyAFr1HPPzg>
    <xmx:7jb1afM_RN63IDbTfXgJndsz4SEIBN-UAnwcJ9lMdpGEKCGKX38t5A>
    <xmx:7jb1aUc0Q01sB9YnmfYzZ1DP9YbWSwcXE7IeewNI6Ru4D3cN50Vq79pG>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 19:27:42 -0400 (EDT)
Date: Fri, 01 May 2026 16:27:41 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>, 
 "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: jgg@nvidia.com, 
 will@kernel.org, 
 robin.murphy@arm.com, 
 bhelgaas@google.com, 
 joro@8bytes.org, 
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
Message-ID: <69f536ed263dd_3291a910017@djbw-dev.notmuch>
In-Reply-To: <afPlkW5zlTSHwQCT@Asurada-Nvidia>
References: <cover.1777269009.git.nicolinc@nvidia.com>
 <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
 <69f3cc82926_3291a910039@djbw-dev.notmuch>
 <afPlkW5zlTSHwQCT@Asurada-Nvidia>
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
> On Thu, Apr 30, 2026 at 02:41:22PM -0700, Dan Williams (nvidia) wrote:
> > > +static bool pci_cxl_ats_always_on(struct pci_dev *pdev)
> > > +{
> > > +	int offset;
> > > +	u16 cap;
> > > +
> > > +	offset = pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_CXL,
> > > +					   PCI_DVSEC_CXL_DEVICE);
> > > +	if (!offset)
> > > +		return false;
> > > +
> > > +	if (pci_read_config_word(pdev, offset + PCI_DVSEC_CXL_CAP, &cap))
> > > +		return false;
> > > +
> > > +	return cap & PCI_DVSEC_CXL_CACHE_CAPABLE;
> [...]
> > Apologies for coming to this late and forgive me if the following has
> > already been asked and answered. Why not check for actual CXL.cache
> > protocol on the wire being present?
> 
> Actually it would make the patch smaller. The thing is that this
> is_cxl property wasn't added when I started the series. So, it's
> not using it. :)
> 
> > @@ -1733,9 +1733,8 @@ static void set_pcie_cxl(struct pci_dev *dev)
> >  	pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS,
> >  			     &cap);
> >  
> > -	dev->is_cxl = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_CACHE, cap) ||
> > -		FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_MEM, cap);
> > -
> > +	dev->is_cxl_cache = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_CACHE, cap);
> > +	dev->is_cxl_mem = FIELD_GET(PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS_MEM, cap);
> 
> One caveat is that:
> 
> Here it checks the cap from:
> 	PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS (0xE) via
> 		PCI_DVSEC_CXL_FLEXBUS_PORT_STATUS (0x7)
> 
> On the other hand, mine checks from:
> 	PCI_DVSEC_CXL_CAP (0xA) via
> 		PCI_DVSEC_CXL_DEVICE (0x0)
> 
> The spec mentions in 8.2.1.3.1 DVSEC Flex Bus Port Capability: "
>   Note: The Mem_Capable, IO_Capable, and Cache_Capable fields are
>   also present in the DVSEC Flex Bus for the device [which is the
>   legacy name for DVSEC 0x0]. This allows for future scalability
>   where multiple devices, each with potentially different
>   capabilities, may be populated behind a single Port.
> "
> 
> Not arguing that set_pcie_cxl() is wrong, but I am not sure if there
> would be any side effect to rely on the "legacy name" over DVSEC 0x0.
> 
> Is there any CXL expert who can help confirm?

You appear to be confusing Cache_Capable and Cache_Enabled.

"8.2.1.3.1 DVSEC Flex Bus Port Capability" != "8.2.1.3.3 DVSEC Flex Bus Port Status"

Cache_Capable is only a capability. To check that the device has
actually trained the CXL.cache alternate protocol you need to look at
the status register.

