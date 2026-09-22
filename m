Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4E2C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=024UKuRDI5/VbeqGV5UeGGlIhQ+AaGozhVsQGZ0ZvBM=; b=h2pfEXrqBvelcQ9+pn6xzML3tW
	y2erNWMfSmyIpGSlTe3NFyjkxQporXWDjuGiuOxlmpQ8vVqHE76NWOhE3ovoHRoKKiSMh/EXl1VpL
	2SY0/6y2gLeYJgVqlsMr/xkIr+QTi9QiGLJ0+PZQEV4UTep7oaDN8efkHBafpSNywmm5yqSGPneXO
	GxQsanmYBRlS7fhlyQx21IAApyLZDlnjMIYNZifQElUNkpWqmWV3YI3tVskuY4ydper9xgb28NQ7a
	VqydlPiwTooTXgsEzgUCSRvUARgXP/twBMBcDfyGgwzDAiWRy8MsMMwXBK1fe96MfmJlZ+QRPBM5X
	oE5SBPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w9a-00000004kuD-18HJ;
	Tue, 22 Sep 2026 08:47:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w9Y-00000004ktd-3hOZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE4C560234;
	Tue, 22 Sep 2026 08:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6E71F00893;
	Tue, 22 Sep 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066823;
	bh=024UKuRDI5/VbeqGV5UeGGlIhQ+AaGozhVsQGZ0ZvBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b1/V7SqsQ1JPANMx2UcQSx/57Lolu5s3EBU52BsacvpU5aLebkSERqS0Hj9puN8Lj
	 yi+zNrXR9coPd+ABJnp1xayLl+DvfIYXt81k7omFsa2aN4YFVl83N9c9qMWqB/qNwF
	 kJ0xGy0EBnoitd252KTbSSOwm35vQtrg+d4Y7DOaQLsw0JbtC37HNhpVy5v4EUlRjd
	 hRySyzhjGGpjiDtHwpG3O0cDj1RdpK6fqfbO4HkRu4+FONJyos+TPVLFsck90sxqPn
	 SQAXyXlKyLO+vOhdOASbLYuM2SKZP8fAEv4WbN2km2y6LyK+bBixtqb0BXHH1uEo+z
	 JRdlLtsC75fmQ==
Date: Tue, 22 Sep 2026 09:46:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Dat Mach <dmach@nvidia.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for
 FF-A (offset 2)
Message-ID: <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901192906.133670-1-jamien@nvidia.com>
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

On Tue, Sep 01, 2026 at 12:29:03PM -0700, Jamie Nguyen wrote:
> Arm DEN0048D (Functional Fixed Hardware Specification v1.3), published in
> March 2026, adds a third FFH Operation Region flavour:
> 
>   https://developer.arm.com/documentation/den0048/latest/
> 
> An Operation Region declared with an Offset of 0x2 triggers an
> FFA_MSG_SEND_DIRECT_REQ2 call instead of a bare SMC or HVC:
> 
>   OperationRegion (AFFH, FFixedHW, 2, 40)
>   Field (AFFH, BufferAcc, NoLock, Preserve) { FFAD, 320 }
> 
> Each 64-bit field is one register, ordered from X0. X0 carries the call
> status on return, X1[15:0] the receiver endpoint ID (or zero, which asks
> OSPM to resolve it from the UUID), X2-X3 the service UUID written with
> ToUUID(), and X4-X17 the payload. The region Length is 32 + 8 * N bytes
> with 1 <= N <= 14, so X0-X4 at minimum and X0-X17 at most.
> 
> The spec recommends offset 0x2 for new platforms on the grounds that not
> every OSPM implements offsets 0x0 and 0x1. Linux has had both since v6.2
> but nothing for 0x2, so AML using the recommended encoding currently gets
> AE_ERROR back.
> 
> These patches implement it. I could not find any prior posting of this on
> linux-acpi or linux-arm-kernel, so apologies if I have missed one and
> duplicated someone's work.
> 
> All three patches are co-developed with Dat Mach.
> 
> Design
> ------
> 
> drivers/acpi/arm64/ffh.c holds the DEN0048D side: region length
> validation, the X0-X17 layout, the ToUUID() to FF-A UUID byte order
> conversion, and the table 3 status codes. drivers/firmware/arm_ffa/ holds
> the FF-A side: resolving a service UUID to an endpoint, and the call
> itself, including the FFA_YIELD and FFA_INTERRUPT re-invocation DEN0048D
> asks for.
>

I have concerns regarding the new dependency on the FF-A driver.

Could you clarify how the build and runtime behavior are protected when the
FF-A driver is disabled? The current patchset introduces a strict dependency
without explicit configuration checks or guards, which will likely cause
compilation or execution failures in environments where FF-A is not enabled.

> The two talk through an ops structure the FF-A driver registers rather
> than a direct call, because ffh.c is built in under a bool Kconfig symbol
> while CONFIG_ARM_FFA_TRANSPORT is a tristate. Unregistration takes the
> rwsem for writing, so it cannot race with an access already in flight.
> 

We need to explicitly document the reasons for establishing a hard dependency
between the ACPI FFH and the FF-A driver. In my view, this FFH mechanism (0x2)
simply issues an SMC call with the FFA_MSG_SEND_DIRECT_REQ2 FID. While I
understand the specification assigns extra responsibility to the OSPM to
populate the partition ID, are there any other technical justifications for
this tight coupling?

> None of what the handler needs was reachable through the existing
> ffa_device interface. ffa_sync_send_receive2() always addresses
> dev->vm_id, so a receiver endpoint ID supplied by AML cannot be honoured.
> UUID to endpoint resolution had no in-kernel user at all. And
> ffa_msg_send_direct_req2() throws away the response registers DEN0048D
> wants copied back to AML. Patch 1 splits those out, leaving what existing
> callers see unchanged.
>

I see above as one reason why they need to be separate.

> Testing
> -------
> 
> Built on arm64 with CONFIG_ACPI_FFH=y and CONFIG_ARM_FFA_TRANSPORT both =y
> and =m, and with CONFIG_ACPI_FFH=n, W=1 clean. Every patch builds on its
> own.
> 

How about CONFIG_ARM_FFA_TRANSPORT=n and CONFIG_ACPI_FFH=y ? Is that
blocked in someway I am failing to see ?

-- 
Regards,
Sudeep

