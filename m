Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B785DC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4cjnEZHVqF64iKTgnAiV3FLLJ82RwZm/qh1EbR5VhY=; b=B7NnbifbolgD7mZfxlBpsLUOjX
	BhilFu2+9aDJzZrdKVgZsXaD3eyXjIt0PiNExH4NKyLOL0kiTTVw9NKCpCG3479apF54E83Jq+oJz
	RKt9dYCWJ7SwZX88UnDxxoVitTelGYR6ZZifjdSnnmvVlILrQG8ADsjJnxQsX8EU5e5f6/UDRfmFp
	0AP4oySGdyQudDnxWth9ZeT8znZSm32iGZkY5+ltWW6atsAHPxjUwi5tPif806UmCK4Yes8LgGY5k
	Y9N+sHD5NDbazUh6l0iihtgc3OXFJTaNYG4GCVLS2YvRG64Nk4KIrgQoR4m86RSOZuFhWrAgMczTU
	3X86ZrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gHc-0000000E5Rs-08Jq;
	Wed, 02 Sep 2026 08:25:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gHa-0000000E5RZ-20LF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:25:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FED4414C9;
	Wed,  2 Sep 2026 08:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39701F000E9;
	Wed,  2 Sep 2026 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337522;
	bh=V4cjnEZHVqF64iKTgnAiV3FLLJ82RwZm/qh1EbR5VhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSHjCpCOSziJ58UY/b8x/YAN0OUlrlTv+OxsWT9VE/ubKOWxLVQ/NlvDnTUs9YyoX
	 aeJ0qMF09xV/0lAedo/xJEjVsMG2Flf9nznaor0+zGRGPxHdhMFOlLqbS5/mZOOOv1
	 IitvzX/03CInPoKuYomZXLmzoCYwZzZ0BVCbMPQ83cCD/TcLc1JxUbYWaXlTVHfQ7J
	 8IsMu1TOghCiRSkWfMNsfJYIAVpXN8n0dyoJLQQLQueMTAEyJRev5M+/bBmOvpvFKy
	 wUcHPwJ2/MxD8JVuu6y+8bYLj22N0h1M22qeE4h0uafCqf/EUMnDtW+1BeIJn5/X9b
	 3aWpGTanNbXBQ==
Date: Wed, 2 Sep 2026 09:25:19 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
 <20260824132450.000045ca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824132450.000045ca@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:33:04 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Validate the PCC shared memory signature when setting up an SCMI PCC
> > channel.
> > 
> > Reject channels whose shared memory signature does not encode
> > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > firmware is caught before the transport starts using the shared memory
> > region.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Interesting there aren't more checks on this in the various PCC users.
> Question for another day perhaps.
> 

Tried cleaning up all but some platforms like Hisilicon kunpeng complained
it will break their platforms. So added a warning in the core but I want
to enforce stricter check here for SCMI PCC.

> Seems correct to me.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 

Thanks!

-- 
Regards,
Sudeep

