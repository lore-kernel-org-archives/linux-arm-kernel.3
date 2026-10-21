Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E64C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zOzN+GLa;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GSL4SX2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viVPNiO1h9d6x4944NBVmE7eQfOCbzUS1zFJo8DFT18=; b=zOzN+GLaZnxswMWpsOA0H2jsCR
	WfhaqCKphWttBCwYd9XeCRIYsw4Q7Az0Aozk0IhadCDWFxDngamZx12H4L03fmz8kSnWdRch9+ZZL
	VTy9IcA/K6VZO0+V2VnMhGRATR3z0bAfA9YT24I5otsmDQYQf5vTtCjZ3780HC0LrzYerFPpZGIbL
	+sntMP6xBvjRy4fSzeqGFHbBhf6RfGLJmRHbI4vjjnYjdgU9tcpKErT49BXTRX4AUVe6VUavBgieg
	SwCTk3YXVam4iFXWspOMTPY1oGQveIgro9u1BkBJmmWssDRR/xEAB8Ex1KtzLcWPnA72pZTI2X8jW
	/5sd9+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX8o-0000000C4UB-3Az7;
	Wed, 21 Oct 2026 14:18:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJX8m-0000000C4TV-2NIW;
	Wed, 21 Oct 2026 14:18:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D04116F8;
	Wed, 21 Oct 2026 07:17:59 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87AC3F7D8;
	Wed, 21 Oct 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792592282; bh=35GT5enIgjR3G0mGLGcskElDVX2rz4mcaIAbm4cF2TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSL4SX2qf4CN5QXvB+wvj8b0xDfdgXdSaWJenkWv2OXP6uHcg2mMSaUEenfCanmqw
	 waL3JQZHkksN2EplpGp9cTP9K2BYk/qHOT/mNylNJEhugn51c9sqozipMSVMbXJNVU
	 WD/XpwXx8b5tuTFXHOJje2t23dUHt2NZNquBmofc=
Date: Wed, 21 Oct 2026 15:17:56 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>, patches@lists.linux.dev,
	Piotr =?iso-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 15/15] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <atjJlBqysQmVVwI2@e129823.arm.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <athzBHFwyp0bFEu9@e129823.arm.com>
 <20261021140649.GO3008132@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021140649.GO3008132@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_071804_693398_9EF9967B 
X-CRM114-Status: GOOD (  15.89  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 11:06:49AM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 21, 2026 at 09:08:36AM +0100, Yeoreum Yun wrote:
> > > +	image_size = le64_to_cpu(header->image_size);
> > > +	measured_offset = info->drtm_measured_start;
> > > +	measured_size = info->dlme_measured_size;
> > > +	entry = info->drtm_entry;
> > > +	dlme_start = image_base + image_size;
> > > +	dlme_end = dlme_start + drtm_cfg.dlme_data_size;
> > > +	dce_end = dlme_end + drtm_cfg.nw_dce_size;
> > 
> > Suppose user boot the kernel via decompressed Image which is the
> > part of artifact of compressed image and use the drtm option (e.g.
> > booting via UEFI shell with decompressed Image).
> 
> Yep, it works fine:
> 
> EFI stub: DRTM: interface version 1.4
> EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
> EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
> EFI stub: Booting Linux Kernel...
> EFI stub: Generating empty DTB
> EFI stub: Exiting boot services...
> EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
> 
> Notice there is no "Decompressing Linux Kernel"
> 
> > Since the drtm extra memory is allocated only in efi_zboot_entry(),
> > I think the drtm extra memory wouldn't be allocated so it would corrupt
> > memory while setting the laucn parameter or by DRTM...
> 
> Patch "efi/libstub: Have efi_kaslr_relocate_kernel() handle
> extra_size" handles the Image case.

Thanks. I think i misread that patch. :)

-- 
Sincerely,
Yeoreum Yun

