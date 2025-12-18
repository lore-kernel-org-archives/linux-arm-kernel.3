Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EE6D6ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPevCW7psI+L/N76SvZrEOm+nUa7ue/0Fvi/NIm1aNo=; b=RmCVXoNAKqwox/Rid7ToRgqj2g
	J4M7UqBtApgSyL6K/uJzU+9Ng2aU2MslNf66vInEHD5a9I+uMAPL7Tpp2uWfF9oCCsZJ33Syylnx0
	FUp5xvSdR3w2Oc5LgP/x84WaFmf70fWGfhvKeWJ63bdIt/GbB2VUiWgUCOd3kprXMqVn704n2izbM
	aC0jFtr8tzHGOYHl2fGeCXQoYiqXzQJCK0S+nzmh9kGcwh9vqwhInTA3A2B+v7cy2t54SkMvSlJqa
	7eI768jfhDqKZmVTkLUwnfJA664qdF1NAh2bvssFxHTDGFIlJl7bLwGcE3kd3S1qtJf4Qozn2d+Th
	mhzwJpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCsw-00000008PWc-0ROF;
	Thu, 18 Dec 2025 12:13:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCsu-00000008PW9-2Fde
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E19C4177E;
	Thu, 18 Dec 2025 12:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB30C4CEFB;
	Thu, 18 Dec 2025 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766060011;
	bh=QjcyqYgAAiCVwktzssjIvKksa8RRHKln7unjqaGozug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqTCY3LZvoQPHjGcorl9DXffWz6ePn53FCjtqjWN+Lk3rtHtrsab4QLd2aT+Tygv7
	 UZHbk8n4YTGjKfSaiN+Sk6tDk3Rr5Z4amciKYFjyj0vf9FO8o8ZMpZJwiVTr5xPJK/
	 iXhqbj82swpKH+BwHcMtpl9MoZpOapQu822X4DvBynPxv75i9eCiaAEyZkQXyJ1KjB
	 lh4BbbWNQGFcXUyxFS0Lq/fgY8gBENJ7fdLqIrIo8HrFEgfNUnz8h8ci5ty8B60W75
	 arKbFNHHlyfpLosVXe6kUxPRFwSoHeTVPtaVohyLzY4ek7B6h5wt4depCLldeyIjks
	 8OGMl3sx8v09w==
Date: Thu, 18 Dec 2025 12:13:25 +0000
From: Will Deacon <will@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, bp@alien8.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Message-ID: <aUPv5UfBByVoLbRV@willie-the-truck>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
 <20251217112845.1814119-12-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217112845.1814119-12-ahmed.tiba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_041332_597375_E5774694 
X-CRM114-Status: GOOD (  19.33  )
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

On Wed, Dec 17, 2025 at 11:28:44AM +0000, Ahmed Tiba wrote:
> Introduce a platform driver that maps the CPER status block described
> in DeviceTree, feeds it into the estatus core and handles either IRQ- or
> poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
> driver can safely map the shared buffer while copying records.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  MAINTAINERS                     |   1 +
>  arch/arm64/include/asm/fixmap.h |   5 +
>  drivers/ras/Kconfig             |  14 ++
>  drivers/ras/Makefile            |   1 +
>  drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
>  include/linux/estatus.h         |   3 +-
>  6 files changed, 341 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/ras/estatus-dt.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b2ef2ddc0c7..5567d5e82053 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21761,6 +21761,7 @@ RAS ERROR STATUS
>  M:	Ahmed Tiba <ahmed.tiba@arm.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
> +F:	drivers/ras/estatus-dt.c
>  F:	drivers/firmware/efi/estatus.c
>  F:	include/linux/estatus.h
>  
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 65555284446e..85ffba87bab9 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -64,6 +64,11 @@ enum fixed_addresses {
>  #endif
>  #endif /* CONFIG_ACPI_APEI_GHES */
>  
> +#ifdef CONFIG_RAS_ESTATUS_DT
> +	/* Used for ESTATUS mapping from assorted contexts */
> +	FIX_ESTATUS_IRQ,
> +#endif /* CONFIG_RAS_ESTATUS_DT */

Why do we need this in addition to the four existing GHES slots? The DT
code doesn't use it and I was assuming that the ACPI code would continue
to use the existing irq; is that not the case?

Will

