Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01780D78788
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3+QoTlA8ORxX1oDv/P7OvtTdta+Hf1gxVm7xF4zeTA=; b=ng/LdWPL5AkFTLY4lrgXH56T32
	e3aOo9VFoyMaO0VGPRtE5HHkmzh9nkQ3+wheqXBvUhH0mxP0RFJngMuyjmr4aOXL6CEYDma0gtkQD
	4LKGPn9r0ov/96tggsYFYbhRzRvM28pItoT7yTnqb9LaivyfcKsZY5jhuoMwnobMk9X1dNrKA1wOn
	cfntFH7Q+qShfnasvZA5nC/ZIQqy8LoXzoImnt6bm8rFk7KkUk73rvIJ6cn0odUJQKkhpdo7X0fE7
	IjnCHlsuQXBmI9tkhJJLsV3oVkQA4qdxtXhdWeehyyXlhUKbWBLSb/Aed19PgchtMUPrIBx0ucAB0
	uONnSkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcDM-0000000AUjq-2OWC;
	Fri, 19 Dec 2025 15:16:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcDJ-0000000AUj5-0eQO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77573409F9;
	Fri, 19 Dec 2025 15:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7CEC4CEF1;
	Fri, 19 Dec 2025 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766157375;
	bh=rhfr+aR4wS/WaDXIAWbTZY95OZBHvwruftMFhRoSxAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsTj1KhISuVDW1SRlUkMcxfguARMuOiLCHlnHKCiGN0LBPMzw7QMzh6kzq8LuNfLO
	 QEH/OCcFuYhMU4ujFOnUhEtpYmxjd8w7YREZ3HgOoAgZeMqMQ8UaNvF5gTlptc1A0S
	 qNNZcO0KnziSDSOiWqXsQzDUoxTlfQcIJxXNJ5HVz8K4HzKg0ZwPpV5EFUgifviYbw
	 UI2S6PBBCvafroL5lCiMVG6nQ5L+pV7b2cmOqy1kAkhqwPu5/fLBf+ytNP6mr8mx/b
	 oiQqtpeL0Uk5Hq2v6m4IfdLq0NlkOvhYJFoy8+Ib6cE4fpsKIFbZkBpZ8F7gYB6a1h
	 Bax1/cTpB95GQ==
Date: Fri, 19 Dec 2025 16:16:09 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Hanjun Guo <guohanjun@huawei.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Update the maintainers for ARM64 ACPI
Message-ID: <aUVsOXF75Sb7wL7n@lpieralisi>
References: <20251219144906.348353-1-guohanjun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219144906.348353-1-guohanjun@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_071617_219477_8B797795 
X-CRM114-Status: GOOD (  17.32  )
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

On Fri, Dec 19, 2025 at 10:49:06PM +0800, Hanjun Guo wrote:
> ARM64 ACPI patches go via ARM64 tree, but the listed maintainers
> for ARM64 ACPI don't include Catalin and Will, and there is no
> F: line under the ARM64 architecture entry, so emails will not
> route to Catalin and Will in an automatic way.
> 
> Adding Catalin and Will to the maintainers entry for ARM64 ACPI
> to fix the problem, it will make life easy for merging ARM64 ACPI
> patches.
> 
> Adding new maintainer entries for ARM64 ACPI doesn't mean the review
> work will balance to the new maintainer, patches still need to be
> acked by currently listed folks (Lorenzo, Hanjun, Sudeep) before
> merging them.
> 
> Link: https://lore.kernel.org/linux-acpi/aS2ZTfS9YVO98Exe@willie-the-truck/
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..6050d94a50ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -335,6 +335,8 @@ ACPI FOR ARM64 (ACPI/arm64)
>  M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
>  M:	Hanjun Guo <guohanjun@huawei.com>
>  M:	Sudeep Holla <sudeep.holla@arm.com>
> +M:	Catalin Marinas <catalin.marinas@arm.com>
> +M:	Will Deacon <will@kernel.org>

:)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  L:	linux-acpi@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -- 
> 2.25.1
> 

