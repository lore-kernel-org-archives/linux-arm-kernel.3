Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6BACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 00:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9rFrlluPJSf51OkYlL1oSfNpm+CTZ8MH9aeygcwdmE=; b=XBm5whzB94w4IkVLOdcAobBeFH
	yzu38ZkZ8OLWEgYtyeVTYXNeFOkXHZJUAZ1AOTZFdjl/VEHSOojtSYVxuDbfNK/Mfer6Qbr9z/lI5
	7rZhQIRRsyP2IxxiGI8kfFzlmYN7P6offTwBYN3R9u76EPP7hrhS0CoHaanIlLj49wuB+3zezvfdH
	d8HDaWgA47ZKLd+YBZ+TxT55wm0jCEvdyKCRhe595dn/lzLc0Je6+MEKGQ19rQEdWJ7qPjfNszLJc
	vhDqYjhsOYeztLnYf8Y8KzYIJE0f+g8jQ1zhlZGZoBdqatqaSExlaUGNX7pWdgX6C4jfjQByIT7c+
	s+ugJkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIy4f-00000007tyb-2Y6j;
	Sat, 02 May 2026 00:19:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIy4d-00000007txI-2JKB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 00:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37D4244485;
	Sat,  2 May 2026 00:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479FBC2BCC6;
	Sat,  2 May 2026 00:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777681150;
	bh=AP5JtaG8I7D1v0LgQNhGuJZhUd8kwkp1E37feztWb0M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UR5aMexr6sdKEpwcxwp2PWNNLGHpodQxZUsycKLv5k9Aiwltm4OIgt0Iu2Tggp7NN
	 l4PeqiYs6ppWS/417FP8hl33FbwukLTvJ33RUctkIaLEdFI4gM15w1L/kBrHXAmXJ6
	 UgisGLMMlM3sFFrMupWBS6XMJ90/90yssI3tVIJkBW/qhWFtY3GBNqgT9DEwxN19dr
	 KdMl5Wk3IOJTDI8CtRwsRMdAQ1pcyB4SKiYyFoL8JCamH5TBInEvOtRM0sXMccLvsW
	 LbUsdvSvUFxS8av/iwJOiWRnatx/UXVubRRS2aAfmwUZ3ezemGsVN2UPfLLy3BmD+Z
	 XAIkMNbj0PTlQ==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D4DBF4008A;
	Fri,  1 May 2026 20:19:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 01 May 2026 20:19:08 -0400
X-ME-Sender: <xms:_EL1ab8UvC2-9pbbO2KQYSRWWigYdGEX84B4fmvQ_i8d6fw95U6xRQ>
    <xme:_EL1aeKQlj9hLPCJrQgGNG8WqSS5p7etufmdMAUscppgic_Yav88H1XcPxC0eSRkM
    Q26nqQqD3MKoA35QHlE1f3OU7MupB53NNx0PU40x3kUdGI9KSpT_o8>
X-ME-Received: <xmr:_EL1aWhwra82VRDbo5ui8t1JWLDI1_fliQo6rhn3FgwR_-a-hDs8OR5oer8DVyejU2NeA8cyCvVVd-nnzvWRr7ACFRjmZG370VI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeludeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpedfffgrnhcuhghi
    lhhlihgrmhhsucdlnhhvihguihgrmddfuceoughjsgifsehkvghrnhgvlhdrohhrgheqne
    cuggftrfgrthhtvghrnhepvdegheeikeetleeuffeuheefjeejvdejvdevteefgfffveeh
    vdeuvdffveffvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddujeej
    vdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvghlrdhorhhgsehfrg
    hsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjghhgsehnvhhiughirgdrtghomhdprhgtphhtthhopegujhgsfi
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhhinhgtsehnvhhiughirgdr
    tghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprh
    hosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepsghhvghlghgrrghs
    sehgohhoghhlvgdrtghomhdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpd
    hrtghpthhtohepphhrrggrnhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsggrohhl
    uhdrlhhusehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:_EL1af1ZcO5-YpE38i02isp_4d3w_hFixKhXCSrW96L-ciuBrGBDrw>
    <xmx:_EL1afZPvW9E4Amn80J9eH2GpDZzyt8By6wclunVRO8D0olRXeMtDg>
    <xmx:_EL1aUgUaU-zz0xg4mi6T_A2g8cgIF2nO-JMwfoAIj99ioRfK0Pi2A>
    <xmx:_EL1aXj6EQX90dPENstW4VruevvnCZqNYkgo_1rcL1SHGY71Q0ZM1w>
    <xmx:_EL1aZASdYzR3rwLJK-YLv5dzahm4FdEOnUJs64EcSQObA-3BwprAE-8>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 20:19:06 -0400 (EDT)
Date: Fri, 01 May 2026 17:19:05 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, 
 "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, 
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
Message-ID: <69f542f92e36e_3291a910052@djbw-dev.notmuch>
In-Reply-To: <20260501234641.GB1381708@nvidia.com>
References: <cover.1777269009.git.nicolinc@nvidia.com>
 <f6734b9dad0050138676f11ecd14e9db1cf6b697.1777269009.git.nicolinc@nvidia.com>
 <69f3cc82926_3291a910039@djbw-dev.notmuch>
 <afPlkW5zlTSHwQCT@Asurada-Nvidia>
 <69f536ed263dd_3291a910017@djbw-dev.notmuch>
 <20260501234641.GB1381708@nvidia.com>
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_171911_638246_026CA37E 
X-CRM114-Status: GOOD (  15.42  )
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

Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 04:27:41PM -0700, Dan Williams (nvidia) wrote:
> 
> > You appear to be confusing Cache_Capable and Cache_Enabled.
> > 
> > "8.2.1.3.1 DVSEC Flex Bus Port Capability" != "8.2.1.3.3 DVSEC Flex Bus Port Status"
> > 
> > Cache_Capable is only a capability. To check that the device has
> > actually trained the CXL.cache alternate protocol you need to look at
> > the status register.
> 
> The capable is probably a reasonable choice here unless you are
> confident the status will never change after the device is first
> discovered? ATS is being set early in the boot sequence.
> 
> It is pretty safe to be over eager with the ATS enablement, less safe
> to get it off when it needs to be on.

True, a reset could turn on CXL.cache. Ok, stick with what you have.

The present state of alternate protocol negotiation is still relevant
though for distinguishing CXL protocol errors from other PCIe AER
"internal" errors.

Need a bit of fixup work for that to refresh the status bit after reset.

