Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2273CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbzqbqlxPmclpEn6OMrx0dx+v7lOsHLnpEPii/osaHQ=; b=mkGSP5QRzSJQi3k4pQjj8mPsAK
	Mv1F99ZkNAQjqqflzs9DhhoIcpjy3OxvDFxaVsW5OtLaFlkxYzQDjTeh+jNvWMaCMJ22fT7bZOvMB
	UVvpl+9vFVFMOiV8+YG2B1/uB5KLXhrkd7xF6+kh49P2jme6tIlfKLysuo5eCjE7rZiveYzXFPqtL
	Ov3pWweS2x99uf3hDRq1z6gxhvgBauW0hn36rxebJcX2N9y8v1vn9qUv4SralnwN7vPg5HzofJkWq
	9g22pjTzZDmXZc4S5Z21igv8sOSGO4GvGhco5r0yDOkjNb6uvnfBFkevk4XeQQrmE+pEEmYD/HqVT
	ZdG+N/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v5G-0000000045N-1mKf;
	Thu, 24 Oct 2024 10:28:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v3h-000000003sG-3fVP;
	Thu, 24 Oct 2024 10:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729765631;
	bh=GVoa/lCJ2pdfllPCWKL+/MbqTQi4UeFVGaIAtJ31GHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OmlyPAns36iyW1gjyZhueCp9W5XLw1NFgqZN/Mm4UWIQsSD0/ey7wbiwJsTRvI7LT
	 7X7iRpQriAOBptIhj83HQ4oFqurBheUb8BnpXMxdx9suEED0JToGar6kgWbzgxeiGK
	 nIgszf+09sdrO/FMduIK8sZGoDZubAJXYmoWmywzPv330aoab2sj0N1bMEhI9LXNjC
	 C6PLm3acDEBUzlv/Z0aiZVt/ShkYj8mjwD6iXRkZxe+HIYpG+ZS9f0VVeBPgf2qW7h
	 1X3xBtaGtkSsALRBmhefHZ8bTeUe4c76dr244/yR/hIRvT1Nu0I04wxzROFhlWRJ2x
	 8tfgaLeVPO32A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A51F17E1245;
	Thu, 24 Oct 2024 12:27:11 +0200 (CEST)
Message-ID: <9ace7c33-7e45-4d87-869c-8d45afb47750@collabora.com>
Date: Thu, 24 Oct 2024 12:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] soc: mediatek: Add command for APU SMC call
To: "Karl.Li" <karl.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chungying Lu
 <chungying.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241024092712.431605-1-karl.li@mediatek.com>
 <20241024092712.431605-2-karl.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241024092712.431605-2-karl.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_032714_130310_28D6EE2F 
X-CRM114-Status: GOOD (  16.06  )
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

Il 24/10/24 11:27, Karl.Li ha scritto:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add command for APU SMC call.
> The APU microprocess's start and stop sequence will process in ATF.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>
> ---
>   include/linux/soc/mediatek/mtk_apu_secure.h | 32 +++++++++++++++++++++

This is firmware stuff!

Please move this file to
include/linux/firmware/mediatek/apu.h or apusys.h

If you expect that the APU will *never* have any non-secure commands, then you
can add the "-secure" suffix (apu-secure.h) - but if there will ever be any
commands that aren't secured, you should not call it xxxx-secure.h

>   1 file changed, 32 insertions(+)
>   create mode 100644 include/linux/soc/mediatek/mtk_apu_secure.h
> 
> diff --git a/include/linux/soc/mediatek/mtk_apu_secure.h b/include/linux/soc/mediatek/mtk_apu_secure.h
> new file mode 100644
> index 000000000000..ea491bc24adb
> --- /dev/null
> +++ b/include/linux/soc/mediatek/mtk_apu_secure.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_APU_SECURE_H__
> +#define __MTK_APU_SECURE_H__

Please, __MTK --> __MEDIATEK (also because the folder is called "mediatek", anyway)

> +
> +enum mtk_apusys_kernel_op {

here you can keep the prefix as mtk_

> +	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_ON,			/*  0 */

and MTK_ is ok for those definitions too.

Cheers,
Angelo

> +	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_OFF,		/*  1 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_REVISER,		/*  2 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_RESET_MP,		/*  3 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_BOOT,		/*  4 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_START_MP,		/*  5 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_STOP_MP,			/*  6 */
> +	MTK_APUSYS_KERNEL_OP_DEVAPC_INIT_RCX,			/*  7 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_SEC_MEM,		/*  8 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_DISABLE_WDT_ISR,		/*  9 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CLEAR_WDT_ISR,		/* 10 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_GATING,		/* 11 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_UNGATING,		/* 12 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_APUMMU,		/* 13 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_DUMP,		/* 14 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_WRITE,		/* 15 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_W1C,		/* 16 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_COLD_BOOT_CLR_MBOX_DUMMY,	/* 17 */
> +	MTK_APUSYS_KERNEL_OP_APUSYS_SETUP_CE_BIN,		/* 18 */
> +	MTK_APUSYS_KERNEL_OP_NUM,
> +};
> +
> +#endif



