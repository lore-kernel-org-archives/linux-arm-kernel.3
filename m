Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F2CCF2E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwrYWDFPPZrtuzesaoniVRpKFbyRSf5/1heS7OUqe8A=; b=cg3KIaMAQvPt5j5bxQ6bJN3kdm
	ID9PGnApdb6cPN9dxR5cM4MzB2j+0W0QPZv21Ld51QaHr0HvI1CX1sFQ0LXgtV8EfbvfuYOkWZzh6
	lJ/KvHOfvPl1gjC9Q3PgKpOh7xQ9tmaanjlLLrFgRLHm68iwbx1Jb5RahEogxxquX/UKUx0gDRmYn
	WTJ+PYWt0QHATVHJoOJHad68sM1iqlFD2X9s7YHRemJGX1mHgG3q1y7Y60mtdVfebcUwRUPwFgXm5
	LfT/K9XV//7kdHiEwMTZfZNiNoADxuhLAMR6foEcKVIQ7tkW9J7WgrqoheZIda8fo3zQl9PDJYO4V
	RVpqraeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnKn-00000001sd8-2Shs;
	Mon, 19 Jan 2026 11:22:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnKk-00000001scS-40r8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:22:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B35B1517;
	Mon, 19 Jan 2026 03:22:03 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A62C3F740;
	Mon, 19 Jan 2026 03:22:09 -0800 (PST)
Date: Mon, 19 Jan 2026 11:22:07 +0000
From: Leo Yan <leo.yan@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stm class: Fix Kconfig symbols
Message-ID: <20260119112207.GE1286628@e132581.arm.com>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032211_220499_CBBED10E 
X-CRM114-Status: GOOD (  18.06  )
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

On Wed, Dec 17, 2025 at 09:39:20AM +0000, Leo Yan wrote:
> Kconfig symbols must not include the CONFIG_ prefix.  Remove the CONFIG_
> prefix for default values to work.

Gentle ping.

> Fixes: a02509f301c6 ("stm class: Factor out default framing protocol")
> Fixes: d69d5e83110f ("stm class: Add MIPI SyS-T protocol support")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/stm/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
> index eda6b11d40a1f9ab49a1ec1e6faae8ee178c5ed3..cd7f0b0f3fbebc74775d8835187e49e5bd21d646 100644
> --- a/drivers/hwtracing/stm/Kconfig
> +++ b/drivers/hwtracing/stm/Kconfig
> @@ -13,7 +13,7 @@ if STM
>  
>  config STM_PROTO_BASIC
>  	tristate "Basic STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is a simple framing protocol for sending data over STM
>  	  devices. This was the protocol that the STM framework used
> @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
>  
>  config STM_PROTO_SYS_T
>  	tristate "MIPI SyS-T STM framing protocol driver"
> -	default CONFIG_STM
> +	default STM
>  	help
>  	  This is an implementation of MIPI SyS-T protocol to be used
>  	  over the STP transport. In addition to the data payload, it
> 
> ---
> base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
> change-id: 20251216-fix_stm_kconfig-a72f40c7612c
> 
> Best regards,
> -- 
> Leo Yan <leo.yan@arm.com>
> 

