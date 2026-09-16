Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977EAC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsY47ZHVBk+xnShayVgIM8uxx3XU0jhz6YujtnB6ZVo=; b=qu5cA1jstw5yhi1agEWvKCc7a3
	5itxcZX694omLwJZShJ0RvmCO9FivwifxxkyTqTjBH/pmoxNezerNC5eKTQthe5jsVB8MnlPtbt1i
	CWR1IlwV3Pfh0lEXMmn01EuM/WhdXBGn0VnUXmBhePfg2m5FErDIYGPEpPvW7Eav+QISgAbqi2cyj
	PG+hw9j1nhg1rozBMW2QuoznCwuVRvsXrKS14yhleHzj3qET7tTqsenaZlvML5VSJn9a8AX7gxmeA
	dKpZSBlJZ6zQXazA3kYchKqsTyIaf97nZDgvaIJA5hpda6KO67P8wyRVRvXFnZJQ5Yb5U1+sjKW0H
	NCo63m7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lbX-00000008nYU-2P5b;
	Wed, 16 Sep 2026 09:06:59 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lbV-00000008nXi-13HO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:06:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LsY47ZHVBk+xnShayVgIM8uxx3XU0jhz6YujtnB6ZVo=;
	b=Bu08H0VKagF+CgSOWdWA5oFIAnpqMF35EOahBxRS9Uagr7emyb23aKjHhvadC629qCHJOobEm
	xRVBIOMn8W7I4PTVabFAOX0L66FwkRimxVlyHM5F4lhptcdqwGS5ERxVnMpS7yKMNzOEnYqt4Xm
	2dRWn1bE+ZOQk/zgTtRerF8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hlCQq6cYZzLlSh;
	Wed, 16 Sep 2026 16:55:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9214240572;
	Wed, 16 Sep 2026 17:06:46 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 17:06:45 +0800
Message-ID: <c02d298b-4e2d-412a-908a-16c017799c45@huawei.com>
Date: Wed, 16 Sep 2026 17:06:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm64: nmi: Add Kconfig for NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-33-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-33-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_020657_637001_9A73D6BB 
X-CRM114-Status: GOOD (  14.15  )
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



在 2026/9/14 18:20, Vladimir Murzin 写道:
> From: Mark Brown <broonie@kernel.org>
> 
> Since NMI handling is in some fairly hot paths we provide a Kconfig
> option which allows support to be compiled out when not needed.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/Kconfig | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 2738637ccb92..df5ff59715d1 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2251,6 +2251,24 @@ endmenu # "ARMv8.7 architectural features"
>  config AS_HAS_MOPS
>  	def_bool $(as-instr,.arch_extension mops)
>  
> +menu "ARMv8.8 architectural features"
> +
> +config ARM64_NMI
> +	bool "Enable support for Non-maskable Interrupts (NMI)"
> +	default y

We should select HAVE_PERF_EVENTS_NMI to enable perf-NMI-based
hardlockup detector as pseudo NMI do.

arch/arm64/Kconfig:     select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
|| ARM64_NMI

> +	help
> +	  Non-maskable interrupts are an architecture and GIC feature
> +	  which allow the system to configure some interrupts to be
> +	  configured to have superpriority, allowing them to be handled
> +	  before other interrupts and masked for shorter periods of time.
> +
> +	  The feature is detected at runtime, and will remain disabled
> +	  if the cpu does not implement the feature. It will also be
> +	  disabled if pseudo NMIs are enabled at runtime.
> +
> +endmenu # "ARMv8.8 architectural features"
> +
> +
>  menu "ARMv8.9 architectural features"
>  
>  config ARM64_POE


