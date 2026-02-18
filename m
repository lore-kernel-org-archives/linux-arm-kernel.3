Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB96E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfZi0zjHTQG/jvYux/2/tRjkg8n0Q6RVN3rQcA1wr78=; b=yxzyM9mk8h3lCfHTeYSgyC1N2I
	Lhdm316uFNzZVK3B2tebscld8Y1VH0yR5fb9CZr3/2OJh17IcQYK0MnYUFUau175ykYCtjxU5ehT3
	5mbLGmEZj+RGxjhRz3pTtgM1yZ6zt/wYoh4u5Bj9oeQDM38y0sdUVpmWD8lOJ81yrayCArgz3v7cU
	tESXniy6yOjwQaGXf70Ayj12X78viFJYiEswUhVecsWAlO41MkweReJTmG+yHCvrmo6H0NKn+giES
	CobOCSQIDuhMpn5h+F1SPHqXhE2jA7ec6LjGpLAEE7+NQmlx8oOG9c4Endsvvc5HfMZFsSE69y409
	7itrru4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskKe-0000000A4fU-0Yto;
	Wed, 18 Feb 2026 16:23:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskKb-0000000A4dt-0qpY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:23:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ADB8497;
	Wed, 18 Feb 2026 08:23:07 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D6753F62B;
	Wed, 18 Feb 2026 08:23:12 -0800 (PST)
Date: Wed, 18 Feb 2026 16:23:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: MAINTAINERS: Include resctrl MPAM driver
Message-ID: <aZXnbDZvzDnUKVoB@arm.com>
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_082317_290244_9BF7FD6A 
X-CRM114-Status: GOOD (  14.63  )
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

On Mon, Feb 16, 2026 at 12:02:42PM +0100, Krzysztof Kozlowski wrote:
> No maintainers handling the code (so subsystem maintainers) are shown with
> scripts/get_maintainers.pl on MPAM drivers in drivers/resctrl/.  It
> seems that there is no dedicated subsystem for resctrl and existing
> drivers went through ARM64 port maintainers, so make that explicit to
> avoid patches being lost/ignored.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index faa914a5f34d..199058abc152 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3822,6 +3822,8 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>  F:	Documentation/arch/arm64/
>  F:	arch/arm64/
> +F:	drivers/resctrl/*mpam_*
> +F:	include/linux/arm_mpam.h
>  F:	drivers/virt/coco/arm-cca-guest/
>  F:	drivers/virt/coco/pkvm-guest/
>  F:	tools/testing/selftests/arm64/

What's wrong with the current entry?

$ ./scripts/get_maintainer.pl -f drivers/resctrl/mpam_*
James Morse <james.morse@arm.com> (maintainer:MPAM DRIVER)
Ben Horgan <ben.horgan@arm.com> (maintainer:MPAM DRIVER)
Reinette Chatre <reinette.chatre@intel.com> (reviewer:MPAM DRIVER)
Fenghua Yu <fenghuay@nvidia.com> (reviewer:MPAM DRIVER)
linux-kernel@vger.kernel.org (open list)

-- 
Catalin

