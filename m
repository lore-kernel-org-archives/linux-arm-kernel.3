Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U6tbTBte;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Dz1W2m1m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x3TamlaaK9V9PCuBZqg1dttpYbp4NHVNda75j19VEs=; b=U6tbTBter9Ur+Af89Mey7x3IQH
	CkJiNczLnxjKT2rr/OgZ4f0quBu61sn9CEmFKeyJLEUdDhA1uLl4RM36ZT9KP0TRNgxLzmq4h5Lwd
	WPoHAGrSvY0XgA7HF9ivCUCwpM4D2ljsr27gTbjs0lnlUM+CS/oWsf3VnxL2Yld5koKQe/NM5Tn6d
	1iOmYh4S/xr103rV+KoYKM4BBqDW6MnnDWM3rbfZB7ha3Yh3S5a2+rMDQl4pOlcosiJiSMzPb2EQI
	2yuHhn5LYKsyKJYaFZz9lhNoXYJ5bPuSHz/RtWzGj+L7gimc+imh0lWF7UEo7bVbqIWTKdpAyxTQY
	2yALE7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPb5-0000000B9oT-457K;
	Wed, 21 Oct 2026 06:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPb3-0000000B9nl-36My;
	Wed, 21 Oct 2026 06:14:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9A815A1;
	Tue, 20 Oct 2026 23:14:37 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D69D3F673;
	Tue, 20 Oct 2026 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792563281; bh=bY7eaKmWXeEGJZPv0klJ3mm9fvB9sa6YQ58K0dGT+DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz1W2m1mtqieAvvcHZ0PElJP5ck781BRAil8keCt0J0xDmnmsvOtE2z2M/5OD8bJT
	 x0mY2JIMQy/68/SPz8OHAETC2GSRyy6i0mXuMcfrF0pwBi7AW/wwQj2YV7ClSyJ7P8
	 z7NHuQtFqmTF4JQhakFU6b9pfZaA/t3mKW3YduKY=
Date: Wed, 21 Oct 2026 07:14:33 +0100
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
Message-ID: <athYSbJXA96DZK-X@e129823.arm.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <15-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
 <atf4ONRM3xbs877y@e129823.arm.com>
 <20261020233435.GJ3008132@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020233435.GJ3008132@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_231446_069675_C03705C8 
X-CRM114-Status: GOOD (  20.94  )
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

On Tue, Oct 20, 2026 at 08:34:35PM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 21, 2026 at 12:24:40AM +0100, Yeoreum Yun wrote:
> > One small question...
> > 
> > [..snipped..]
> > 
> > > +void efi_drtm_launch(void)
> > > +{
> > > +	if (efi_drtm_policy == EFI_DRTM_OFF)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * No cache maintenance is required before the launch. v1.4B R42130 in
> > > +	 * Table 22 "DCE preamble requirements" requires the DRTM_PARAMETERS to
> > > +	 * be accessible as Normal Write-Back Cacheable, Inner Shareable memory,
> > > +	 * so the DCE reads them coherently with the writes made above.  R45220
> > > +	 * in Table 30 "DCE requirements for the DLME" then has the DCE clean
> > > +	 * and invalidate the whole DLME region to the Point of Coherency before
> > > +	 * it measures the DLME image, which covers both the Image itself and
> > > +	 * the handoff struct placed in the DLME region. Thus once we jump into
> > > +	 * the kernel with MMU and caches off the CPU will see everything the
> > > +	 * stub wrote.
> > > +	 */
> > > +	arm_drtm_dynamic_launch(drtm_cfg.params_addr);
> > 
> > After launching, How to get eventlogs for measurement of DLEM if
> > tpm_read_log_efi() is used? Doesn't it need to concatenate those
> > event logs from DRTM eventlog in returned DLEM data?
> 
> My plan is a future series will return them as a discrete log bundle
> through attestation subsystem. All of the logs will be available
> consistently that way, CCGL, the EFI and ACPI ones..
> 
> And it will be logically linked to the ROT the DRTM uses in some
> future ROT agile DRTM flow. So we can tell the difference between a
> TPM bare metal launch into PCRs and something like a realm launch into
> REMs.

Make sense. Thanks!

-- 
Sincerely,
Yeoreum Yun

