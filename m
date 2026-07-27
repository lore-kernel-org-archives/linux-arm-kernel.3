Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CAFC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdGrPMBWB2LDmXiMYyHKbIkWVWxI4vvKCqzpo1Iv3yE=; b=x42gFmr+I92L1DLlcJs2aqJfTM
	WW1smGdmmAkau0MSjJr1e3deMI+qTVTKmV5RqUyli2OM30u+GgEC51CnY4R3MV5XbckMmSqbBUiQ9
	9z/jGriOrl1vqQOuDmttwiEkv/ejETs9e4PFRPnh60zwkxF2TQdvMkNNMJk7cw04Ct71TnurIe2AG
	Us0wkwu8wOn1oj7XtZP9I/n9xZEsNfpvSp483FAEhb6uNFmt5ZHW8wAcP1bcqswSX+X6H5AD0TTf+
	HSIN1y1fXAELk9WTh4xucSOvkwWMk5khyVwoCIr0XaqnRSz+JVyz8xgXXmOhvWdSpJpOt1ZaTspaw
	yd+u0zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHf7-00000002Kuy-1LEC;
	Mon, 27 Jul 2026 09:30:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHf5-00000002Kum-0zqL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E34AB43CEF;
	Mon, 27 Jul 2026 09:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771AA1F00A3D;
	Mon, 27 Jul 2026 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144614;
	bh=PdGrPMBWB2LDmXiMYyHKbIkWVWxI4vvKCqzpo1Iv3yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdhuBLkm12U0d92Il/G3+5x/ZajmJ8DOiOO8RjRG2Nxfh23LkYInSAPTYe64YQvvo
	 Guq4C8R5g5CwHLSERW8Vp/qR4+rbG+IkeRaNYq0EPrThQb04dnDZNGhRePj1bSxCL2
	 8+ErJ8pFBniY5nw7DsR6oJVh5DG9CpjbLnjAmtgTNDccU0oV0NpKPRnhOGegMBkUXe
	 45+6bdynidYy6EpxWFIQvOe+MgxwQOsd43yJ8RH5Wd6WYkDYfY8CWaR8aagXcpL1hI
	 j7VfsLWZeLM7S7iypho7SRI1NDnNJ/J24nPnLahZBid4ZZ0znsSyd3PeC1C8dNRCxO
	 o0O/jmGvYE0Jw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AEBB0F40066;
	Mon, 27 Jul 2026 05:30:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 27 Jul 2026 05:30:13 -0400
X-ME-Sender: <xms:JSVnaoI7xWg9sf3DzyTsAS_O8dJXfuAs1HXKzKbM2FEt7hmk3iGCKg>
    <xme:JSVnajk0kmat5QhCYyc2AFH8ZxvRQ_w2Wdhug49PPNdC9-2sHdwOY1rqOVpEimazj
    ztNE4SrHfkzaSNKyPPhrcHLJXYtwxmGqpYTLdGXjJCf6pBAR1vSmPs>
X-ME-Received: <xmr:JSVnanaYqOloQ-NLHOGxj2FLbFMAGd0boxoWsbVPTFCcrx9tPAlUV7pCTPaaVA>
X-ME-Proxy-Cause: dmFkZTEp59gp+mIw67XKk3VpC7CscDwzAHUZZc6/vn9e4uj9zL3YXG77/COa2kzCp966FG
    vFTSPHv4n8gUZrmEJaptzPrYYNVDiUOxZsevH3QK1SGY4t2HOpALnBl4jW8+UxBDusXjJF
    ByJOZ2EOqoHM/RjvP++FkTMSVHoNDkZ6ktSGSsqG69ESfEMv9ZAIciQM4Isui+2dRocaA5
    PE02S3q90iNncVG17rbmg7AE843URlwRNvI/Wla4wpmmgOp/Tzyl7nwuCHFcPvQkiqlO/N
    oJ2YSlsXRLmNV7RtUcVLbgSED7Z9tY8lQjSF/c9WOmfaJyqO+9efy907tHub3jpGgbETDK
    n3aTlDcALhC2HAsJP26l9RzjVesIvFkDNxMDuwVhS4tKDqyTRwqgtISV1Y/zzz3lbItq4e
    5kkrN9Pm1egfO7AQ/jBvq78YtoyxJOXjabvuRhlqCBlR0lmAxsj9e0BpaGx+UjBjFIwIqO
    4Eu1xJuMDiUzJZ97opcGNDrTdw7sb89ssaxiAQls8RfKNzAuJKofZRcDF2J4MDppVxfxUx
    J16siyx8xKhpi7B5xcOk13KcBYZFAZ2MB1Luao+fJjIpinvMEgc7Q+hKonZNHhJy53rW+C
    Uo16GkegGPghvjxPYyA77sXcwaXI65OA0BZkfR9qpJJYZGIQFhOHiyGjtemA
X-ME-Proxy: <xmx:JSVnaigdLS9Qr7twyrJfCiGOIQ0Tkl6WHxM38sY-nBC7SOtd11azNQ>
    <xmx:JSVnalymkVfHLJ6rSpXEDVytfAzg0MKuEe9Bg5D9tMuwykadLXKX9g>
    <xmx:JSVnam8Yp9xsBSvre_czzViFPHJXVw7Gk6yb1DOIcw7Fc-vzAjldMw>
    <xmx:JSVnaizSa9j9fH7_28tW4H4VRysxAkCOCH8hAVjUoq2SGVI3BqGaig>
    <xmx:JSVnanX6ukYFh3q7-mukFSehVWm1ryT-mcqhplTplVm8pwk7VHkmvg91>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 05:30:13 -0400 (EDT)
Date: Mon, 27 Jul 2026 10:30:12 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <amckPkwKmZlqBQR6@thinkstation>
References: <20260706084708.8072-1-kas@kernel.org>
 <aldy9NMY1dRgJii7@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aldy9NMY1dRgJii7@thinkstation>
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

On Wed, Jul 15, 2026 at 12:46:13PM +0100, Kiryl Shutsemau wrote:
> On Mon, Jul 06, 2026 at 09:47:08AM +0100, Kiryl Shutsemau (Meta) wrote:
> > All SMMU queues are sized from the maxima the hardware advertises in IDR1,
> > which can be several megabytes each, and are allocated at probe. The kdump
> > kernel already disables the event and PRI queues (arm_smmu_device_reset()
> > drops CR0_EVTQEN/CR0_PRIQEN) but still allocates them at full size. On
> > systems with many SMMUv3 instances that cost is paid per instance and adds
> > up to tens of megabytes of coherent DMA in the capture kernel.
> > 
> > A kdump capture kernel runs from a small crashkernel reservation and only
> > has to drive the few devices used to save the dump, so deep queues serve
> > no purpose. The queues are not on the DMA data path, so dump throughput is
> > unaffected; a shallower command queue only bounds how many commands may be
> > in flight before a sync, which does not matter for the capture kernel's
> > small device count and modest I/O.
> > 
> > Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> > it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> > in one place. The command queue still holds at least one batch plus a sync
> > (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> > command batching keeps working.
> > 
> > Suggested-by: Kyle McMartin <jkkm@meta.com>
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > Reviewed-by: Breno Leitao <leitao@debian.org>
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> Gentle ping?

Hey folks,

Can we get the patch applied?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

