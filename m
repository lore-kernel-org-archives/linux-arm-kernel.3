Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUjzIg3hDdiVhrlR4qnIwDlMQXX/LMBW/CGOCkGS9Tg=; b=2nxzyRE3iprT8lmYtE8rONssjP
	Gp4qcfWVIcnNeoADbBgxPJbDOW0/WaXHwlK4Df8UBEBM5kmBJgrxknJHEIUz1DDpT6wJMYmDp8A47
	tdcM9nH1O6w3YkG4JM+tBjBBdEfgymS83+C5iFwnqX0r+dCRhjiAp+hhSxTbOaQVOc7oItR7STyzZ
	4dqYsk7ZPHvdzlm971D7UF6DMZhbLvtFzUWh0R5UJFYRsuj3r0LkI+WLB5ARhU3J6QcvUnF4Twtwb
	DWigdc8tMvkG/mHXFlJWHgVsV4+HxUIWzDQbDtEk9al0BD7mF/xmsq6uNqv4/RN8x8IqldHNEXL9B
	OQcrsxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDCl-000000077Vh-0EeZ;
	Tue, 24 Jun 2025 23:37:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD49-000000076HS-2Zqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D340D60010;
	Tue, 24 Jun 2025 23:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A6EC4CEE3;
	Tue, 24 Jun 2025 23:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750807716;
	bh=1EXD87GVOxTxY31EJd1X2c2DJ9GuyuaxSW8pKSj+2S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw9XH5X2ljL4C8+SahCFq3xEWus2kg89JVYQrRzmaUPfkhSGILThfgscKj5tFrJTB
	 YvSKP0v5vpAKzLBOc5BJ7sZPHsAWNrT0fo5hZNp+QxAD8LJwaLU9PiTO9r2nVM4pJR
	 dSluju8i5+0u9aPzX/V3N/hVnuO82NEO8h7jMjjFRsZXRf/RCjjfI8x2OgonI9NlLh
	 ClUUbGS8/yuVK4v/CajweTIc/DxSz5P3BV06A6w+bQV3UgwKXMZCf9MW6HcjYa2d3e
	 4Fd1abk4GaR4lfrHa/g53Gy/vtZtqniSSxdbFLzFkApEDcjBe7yr6qffZwi5CFM4LH
	 ZqZCeoxanhCRA==
Date: Wed, 25 Jun 2025 02:28:33 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <aFs0of3uZdoMEJXc@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618102302.2379029-1-yeoreum.yun@arm.com>
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

On Wed, Jun 18, 2025 at 11:23:00AM +0100, Yeoreum Yun wrote:
> To ensure the TPM device operating over the FF-A protocol with
> the CRB interface is probed before IMA initialization,
> the following conditions must be met:
> 
>    1. The corresponding ffa_device must be registered,
>       which is done via ffa_init().
> 
>    2. The tpm_crb_driver must successfully probe this device via
>       tpm_crb_ffa_init().
> 
>    3. The tpm_crb driver using CRB over FF-A can then
>       be probed successfully. (See crb_acpi_add() and
>       tpm_crb_ffa_init() for reference.)
> 
> Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> all registered with device_initcall, which means crb_acpi_driver_init() may
> be invoked before ffa_init() and tpm_crb_ffa_init() are completed.

I get the ffa_init() part i.e, moving it earlier. However for
tpm_crb_ffa_init() and crb_acpi_driver_init(), modules.dep
takes care that they are loaded in order.

For IMA you will need the driver as built-in but that should
be handled via kernel config, not via code changes.

BR, Jarkko 

