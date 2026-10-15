Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5EDCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R6C3otfPSRMB7sLJWxWEvrFS4WjHRVB+TeXnhUt7Q4=; b=Zny/MbNRvmHgtkTxkCpJIxW8np
	F/bt5KRd2rhPAYnMmyX3hu2CHGsrpvS+QS9MqbuZWTdgEDzVa7QZusWMw4OZYUzCBR6jNEIpgHpzN
	5UF2/6em3yG11QMlk6ZYneLZRD4iVCIvZj6D+xmEd3J6HR5o+iMNeZ8oCSf4+oL/mHC2lTDXFZWkU
	OtQ4baVb4PA03cJGeoJKdgvRhSriHELlUxVcg1c1JYM1brmSY+dXywnrWZgBDXIKmgZMlxVhcUJYO
	JS6E23EhhYkamK1WOnXVZ/PaDza4xYS11zqsAEXzcKeoIddBX8YzaL8W2PrhjFwMRZUXrmCzxY5BZ
	pUslxlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKub-00000000A7R-0sKb;
	Thu, 15 Oct 2026 12:50:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKuX-00000000A6a-0ygt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B3A260120;
	Thu, 15 Oct 2026 12:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245CE1F000C4;
	Thu, 15 Oct 2026 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068616;
	bh=4R6C3otfPSRMB7sLJWxWEvrFS4WjHRVB+TeXnhUt7Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvGzkhkXPC+gUqSIhDNIhuCk0U83Pnahsv8JWnqIZ3WPyxMgOfEb+v3pExjdpYNxe
	 W/DFwGWQw5PbXO5XkdnRnOfsq6fsX2h7zN6IbOl3Dv3OyhcLvvRchrsRr89oj7iBLb
	 ZpcdNGsIzKQzNngva2sZwFCck9DPcqkhDTGxN5BwUI+DuCS94HpNk5CyyRb81p0kLb
	 8Fi3S5FvPc9kIbhpwu2GLI1IO0sRIuJuHevOB6krAS18ddMyqvrQh4dhqljaWzkHod
	 SkVW+AnFQjrwb175AzOTl3IC51i8mb0xSa7+Y5X3jAleab7bsU3ETmJZmPs6JZVczB
	 ZxvRVUKkg4gfA==
Date: Thu, 15 Oct 2026 13:50:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 00/28] KVM: arm64: Add Statistical Profiling
 Extension (SPE) support
Message-ID: <atDLgcMeh7kizHGt@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <atCqFRdGzFq5dOdT@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCqFRdGzFq5dOdT@raptor>
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

On Thu, Oct 15, 2026 at 11:25:25AM +0100, Alexandru Elisei wrote:
> Hi Oliver, Marc,
>
> Gentle ping regarding this series. Is there something you want me to do to make
> reviewing easier? Do you want me to rebase it on top of v7.4-rc1 when it comes
> out? Something else?
>
> Thanks,
> Alex

Just to say that I'm planning to go through this series myself and can hopefully
help with the review workload here! :)

--
Cheers, Lorenzo

