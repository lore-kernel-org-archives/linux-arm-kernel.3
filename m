Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF40C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLs9lHUthM0gsdydrntIf5pmH9hg4vZvmO/OJty44G0=; b=vbQtCRrcWCZMwVuJuKUQ7qf1Fa
	dhtXv2Io7fsXMRL1qz3C1BE59gdYgFbydcu5Q7MD+CLh/pa2t3cwzeOx5HU0ZBhLWqUJ+/qsnmUC1
	DNRJEhftNrnKbOqNddh4BkWIgWbxumNT1IHDZ1Oa6kXZXaLK6NVQVlOcHPDHiVd3xz4xeeCkrKhwo
	zs09X589udTvlUAZlLiHLg3s67c5dJdV69FpiLkhupyHLopM/FNW6aXDgqtweNz9zAMHG/DC/GFtj
	RiWdcVWQfhvJN6FCz4QbJQf40nX9wnXhBk25/THGy8uuDBC2orz+e7hIBP/O1osLO/Vm8kA7VubBX
	g6NI3CHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobEu-00000004Wts-0jjM;
	Tue, 28 Jul 2026 06:24:32 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobEq-00000004WtH-0qDl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 06:24:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DLs9lHUthM0gsdydrntIf5pmH9hg4vZvmO/OJty44G0=;
	b=cFifVkM5ZPj1zxVU6ibxKeqaP5y6yJq9qWNlKmCkAa7yiIjzr9YXPloSR9y+QmY1O5eEZZmj5
	2tbLvr0Yf6wWwemgOPO/NBEWC6HQFP6nsFXhzSmVzrYQn+wDgyUBQ/fSfBymwpfn6onR5oYRw6X
	Tk/MNxcGE54/uqin46nFZLw=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h8QD90nj2znTbJ;
	Tue, 28 Jul 2026 14:14:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 148C64056C;
	Tue, 28 Jul 2026 14:24:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 14:24:16 +0800
Message-ID: <c46ccf44-7414-42bf-9760-79200ac247ba@huawei.com>
Date: Tue, 28 Jul 2026 14:24:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 40/45] arm64: nmi: Add Kconfig for NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <mark.rutland@arm.com>, <maz@kernel.org>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <liaochang1@huawei.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-41-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260727163453.7969-41-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_232428_730255_9D4EB416 
X-CRM114-Status: GOOD (  14.88  )
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



在 2026/7/28 0:34, Vladimir Murzin 写道:
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
> index e36dc4831200..968a9d97549a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2195,6 +2195,24 @@ endmenu # "ARMv8.7 architectural features"
>  config AS_HAS_MOPS
>  	def_bool $(as-instr,.arch_extension mops)
>  
> +menu "ARMv8.8 architectural features"
> +
> +config ARM64_NMI
> +	bool "Enable support for Non-maskable Interrupts (NMI)"
> +	default y

I think we should select ARM_GIC_V3 here, as FEAT_GICv3_NMI need GICv3

> +	help
> +	  Non-maskable interrupts are an architecture and GIC feature

GICv3 feature

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


