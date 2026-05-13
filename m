Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA78CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w+Lwv/3yD6ITbesHduHO+VKPwheOro8pVVXLP3Yaiw=; b=3qCH30sSe7tcGU6f6wOnvzCJpD
	vVn8f5t3QB9AuTQS/PmzGZmGEQ1Rt4UaujwlmF/A64BO99IInR/Gya5Pu8sUH6J4apGfGztDGqgct
	ZYeWg0tyB/N9eDwYQ8hZd8SlNeHY6eESgPT9tr8j+lUYuMMToE+VqdEmrcbjqI+XcS8u3nRyMJEC0
	04zJmDhWtxaucwtoODCseVjMKgf/z05cFs90LUXozWUFpie+apj16D9p32NrRMxbA1+v7LQ4iHgvd
	jZkgf+R+Vsjbg9EfY82+2fq/tt80aDiCGg2F9Yar4evkVvPKKZgSkeg8IujU/5b+hTBB2Wf78uR/f
	joEbYYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3lF-00000001WrF-0iTY;
	Wed, 13 May 2026 07:12:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3lD-00000001Wqn-00BS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5433A443A6;
	Wed, 13 May 2026 07:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960E9C2BCB7;
	Wed, 13 May 2026 07:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778656322;
	bh=ocTceWbdCyIQe+/QSperWMAMz5uDG99LcuPJ/Mj7aa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfZ1+dGYGxKOdobj4UC5wARWbeKM4ZI0xRXzO1w0/GvtjWs4rKxm19I2eSR13zfMP
	 HlJN9bFQDZNy8U0CpUGR43Uth4iAGvKoaLfpDJvE96nUnW8PoZodnjbRFofz22e15Z
	 qrMFKwL9Qu+QsKmKGY7nt1/kgxqYymzKeUVYOEhY=
Date: Wed, 13 May 2026 09:11:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 2/2] coco: guest: arm64: Drop dummy RSI platform
 device stub
Message-ID: <2026051352-albatross-contents-7113@gregkh>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com>
 <yq5a7bp7u77f.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a7bp7u77f.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_001203_061215_566E2BBC 
X-CRM114-Status: GOOD (  19.28  )
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

On Wed, May 13, 2026 at 12:28:12PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > + Suzuki again
> >
> > On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> The SMCCC firmware driver now creates the `arm-smccc` platform device
> >> and also creates the CCA auxiliary devices once the RSI ABI is
> >> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
> >> helper redundant. Remove the arm-cca-dev platform device registration
> >> and let the SMCCC probe manage the RSI device.
> >> 
> >> systemd match on platform:arm-cca-dev for confidential vm detection [1].
> >> Losing the platform device registration can break that. Keeping this
> >> removal in its own change makes it easy to revert if that regression
> >> blocks the rollout.
> >> 
> >> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> >
> > I wouldn't merge this now given that systemd checks this file. Could we
> > have a symbolic link instead for some time until systemd eventually gets
> > updated (years?).
> >
> 
> I’ll add this in the next revision.
> 
> static int create_rsi_compat_link(struct device *target_dev)
> {
> 	struct kobject *platform_kobj;
> 	/*
> 	 * target_dev is:
> 	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
> 	 * Create compat link /sys/devices/platform/arm-cca-dev
> 	 */
> 	platform_kobj = target_dev->kobj.parent->parent;

What?  That is crazy, you don't know that is always going to be ok.

> 	return sysfs_create_link(platform_kobj,
> 				 &target_dev->kobj,
> 				 "arm-cca-dev");

No, don't do that, if a driver calls a sysfs* function, something is
almost always wrong.  Don't be making random sysfs symlinks please.

If userspace can not find the device anymore, that's fine, that's how
sysfs works, devices move around all the time.  Especially platform
devices as those are almost always not supposed to be platform devices :)

thanks,

greg k-h

