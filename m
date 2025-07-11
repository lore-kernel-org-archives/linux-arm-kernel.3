Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B608BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfAE9YojYDfZQCqfHN7agPmPOEsviLWnI2dg/u0vlFU=; b=aR32EXlpBUvOUdBju2C8WCc6yw
	dlYmYoPOaMGrSQU+XWI1ycmah9q+9Ty9/ow7n9pSSU2uekUk8h3cQ3iE0kMXTumsnsbAgkK9go41K
	j7kGXiDPHblxbKLIQcJTuo/H8F94UPhrAp2QT0WqbRGWS0CjycWm53QuY57/W+JqOILv+yBGE9cjh
	VGu84KB+dUHxYv+oSDh//2y0DcqkxKNSAQn92k3aikxhPJtnl+8yTLFRL5f53BXCWd04NLxFwltxY
	ogp/NHwvl2HdK6XGeISVRxWGL9BJEi8fAu9LPpjVFEnptcKY/bGi4CSCB8IzsJah4BqCv7q3+ilUf
	9OAdgpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDt6-0000000Etff-3wIT;
	Fri, 11 Jul 2025 13:34:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDbM-0000000Er1q-4Akc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95873461CA;
	Fri, 11 Jul 2025 13:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BFFC4CEED;
	Fri, 11 Jul 2025 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752239744;
	bh=it0bnDa8F7e60yuE2i2eFmsF5hMzpIwxDA3DtF27AzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qupdx5SpGRdyUvXe6gp/CdkpZYk4jUDMUEfFKPTc3yp9VLkQ9bBKAewo6b4ybZw8r
	 GRP0tkqKIRw9vdNdkgcynvPgPTXvVsBcEzjHldMZ76BdAxJAY//2S6iAmZwRpOApgv
	 lhguTjOq6EBm+OE8dTxPWOmI7u0G1TAIcKC306uBMZDbBTHVdI5ubpjFKqbglv+vd1
	 GqI897WmjIoqTgYEWEvCuGBlLh7xeeKd/WDdAT/9p8Ge8ICLIfOcp998B55rpTwv8r
	 GkjigXqyO+aSjrPnw8Qw37a7/Ynu0Pjw/tZfdUed221451RTZjl3/YTusE+sdIDsaa
	 3LGM0y9Ex54IA==
Date: Fri, 11 Jul 2025 15:15:36 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Toan Le <toan@os.amperecomputing.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 13/13] cpu/hotplug: Remove unused cpuhp_state
 CPUHP_PCI_XGENE_DEAD
Message-ID: <aHEOeF6PKl1xO7ZR@lpieralisi>
References: <20250708173404.1278635-1-maz@kernel.org>
 <20250708173404.1278635-14-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708173404.1278635-14-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_061545_048347_0758117A 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Jul 08, 2025 at 06:34:04PM +0100, Marc Zyngier wrote:
> Now that the XGene MSI driver has been mostly rewritten and doesn't
> use the CPU hotplug infrastructure, CPUHP_PCI_XGENE_DEAD is unused.
> 
> Remove it to reduce the size of cpuhp_hp_states[].
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/cpuhotplug.h | 1 -
>  1 file changed, 1 deletion(-)

Hi Thomas,

I would upstream this patch through the PCI tree please let me know if that's OK.

Thanks,
Lorenzo

> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index df366ee15456b..eaca70eb6136b 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -90,7 +90,6 @@ enum cpuhp_state {
>  	CPUHP_RADIX_DEAD,
>  	CPUHP_PAGE_ALLOC,
>  	CPUHP_NET_DEV_DEAD,
> -	CPUHP_PCI_XGENE_DEAD,
>  	CPUHP_IOMMU_IOVA_DEAD,
>  	CPUHP_AP_ARM_CACHE_B15_RAC_DEAD,
>  	CPUHP_PADATA_DEAD,
> -- 
> 2.39.2
> 

