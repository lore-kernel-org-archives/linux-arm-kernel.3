Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCC5D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VuClUr8e97UDqsxOYCQTdF1MGALbHzkuwduCmZ5RuM=; b=urSJTWhjxLU4EpV1bQNJ35qeUh
	Yv/wYXJkHDZnnAtQ2z7tiZppMrPaacF1ga32+Wt/pC40t4nALiGcI7UV1JW8avH5fdaADU9QPNfrs
	44UKulZIu9zxCTPdzsfsRIs91niMwEsIW3ObMULQsuutSSTaEb7SKLKLOteUiDExXbBDfvRRdY9Cl
	W868cBsqg5vhaeQYVIN7WZyo/kWQ/wFgyhZpHjotN0js9aW4jjGtdQV2ni5eHOzJeZRf1P4H5THBk
	Y+u4sU5b0X/KMDePAjqvjg1iTg4a1Q5nEh9TpKlgXL23e3ikAJwVd/0Oby+046AKQ73Mi/Va4fWaL
	pOnMW81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrkj-00000002oBW-3BlQ;
	Sun, 28 Dec 2025 14:28:13 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrkf-00000002oB1-36zx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 14:28:12 +0000
Message-ID: <0c9456b1-d7c8-4a90-ac21-fa2e5ee4a170@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766932084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VuClUr8e97UDqsxOYCQTdF1MGALbHzkuwduCmZ5RuM=;
	b=aoX+1MhIXW/q8Z6OMUlwlbSPSfFoLxTEzwR426NgOpicdDsHwqbx2LARpcfsqTCC8Aeakr
	xn2srohVcw9gw95qGcxkq1WNCx/EX/OcoLDVibcmGCEYQjEU0HMsaIHMhOws6LbQlgKnqS
	Q69+QVYvy5M0qmswM3g6srs02cv9a/o=
Date: Sun, 28 Dec 2025 22:27:48 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: Add support for TSV110 Spectre-BHB mitigation
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangzhou1@hisilicon.com, shenjian15@huawei.com, linuxarm@huawei.com
References: <20251227092448.732059-1-yangjinqian1@huawei.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20251227092448.732059-1-yangjinqian1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_062810_571612_F21D0933 
X-CRM114-Status: GOOD (  12.89  )
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

On 2025/12/27 17:24, Jinqian Yang wrote:
> The TSV110 processor is vulnerable to the Spectre-BHB (Branch History
> Buffer) attack, which can be exploited to leak information through
> branch prediction side channels. This commit adds the MIDR of TSV110
> to the list for software mitigation.
> 
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
> ---
>  arch/arm64/kernel/proton-pack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index 80a580e019c5..b3801f532b10 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -887,6 +887,7 @@ static u8 spectre_bhb_loop_affected(void)
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
>  		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
>  		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +		MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
>  		{},
>  	};
>  	static const struct midr_range spectre_bhb_k24_list[] = {

Looks good, thanks!

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Zenghui

