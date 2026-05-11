Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B83CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn+z4D0+ZpD+z36OH02hZ8OMnPCWx2BHD4GtAeDekKI=; b=yWqqYqg8BPC05RoZ79IwVRDABv
	AR8eKRGGqqkaiPdznLVfBBua0iB19v7kniFzIKBctqlM2Z6+ceIaiFgm7r6zI00qbqiGUq5hAgkLn
	vLHvAbJ5XSbrFhgKXD+2gnuFedOkEFNeWWLJsfVWk7Yjr8+sh4/iVNa3y+VEIEpTorjnOqtpp4VZE
	qjqjmzX/tzUbCzaeeYq5+BHirs1L3B00+XqUEWUDGoAqzcjZSUoVc7Yt5LQvF5QvMEH656ddpqEWL
	3IKfR4QQYcLW2/cbXoFL+Fox4luK52wFa668yBcC1C+k+vRJMsPCPb+GmKpD+Mabum9ysItDCdZwH
	adwE8TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPDR-0000000DPZx-0kaW;
	Mon, 11 May 2026 11:54:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPDQ-0000000DPZN-0ZPm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xn+z4D0+ZpD+z36OH02hZ8OMnPCWx2BHD4GtAeDekKI=; b=L5XCD41pm+IASgFuQHKhb5QCGZ
	BgG6ChlSLWC7WlqvlRRF0arIQnAVUYKZBAwkMIZh8XMaMaV8kgoArNV82lOsOUWOB2EjclIj7ynI1
	0n7dri56C7CBsnsHo4BX7eKWZRQro+7XXjyVqn6+S8UfRTbsZ+qc3n7gCMg0oOBOapvCvR+a/we5/
	FC2fG0ePDLxZrkRRSvX7QBKeg6ru61exc9Xmb/NzkmOpbDK8FrQja4nim/+6lHtjPuoTpuR5mbGrI
	yUrhPfYHsyXx5Qi6ukpByaRq4kvzLcONfRyrt0HCl2WziOzkSlKqpD58UBcp2zEmBjovTcqNF8x83
	dKj8TN6Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPDK-0000000BXDu-2GpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A50E4475F;
	Mon, 11 May 2026 11:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923C8C4AF11;
	Mon, 11 May 2026 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500457;
	bh=V70DY2MwjH9LqVCKwaELL1VguR4Hzd5EyVNfOgXJMYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NAN2BNIOdx09DOxNjKkym6xDjwQHkncU62HUnVB1+ovCxbkLPCE74Vts42sATGFi/
	 00vV1iS+ojXdaoXT5XAVmiNYc2UmAIVojyZv7nhM4TSeVTePanX6FkgnuclErJjjjT
	 GkO4SfyhOslrYXj/EtsiskQ+RLd7TSfzMS8JyBIqE6id83e0vGmGhw16908GMxJwoU
	 8RVjuwAIwlxKrsu1yhxJX6OV1OgJJfRdv4Ow3+OZNrfI/E4PpmY20u4TJgv9PxFCe9
	 UpYaFOUru82gjdkelgjeOPFuT0OSuVLVzdMf+A4CjwlwdiE6laolQdjO+0RDyAHvyz
	 ZzG76yVzr1MvA==
Message-ID: <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
Date: Mon, 11 May 2026 06:54:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_125423_773387_41B40A47 
X-CRM114-Status: GOOD (  14.91  )
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



On 5/8/26 02:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> ---
>   drivers/edac/altera_edac.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db..b30302198cd4 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Arria10 has a 2nd IRQ */
> -	irq2 = platform_get_irq(pdev, 1);
> +	if (of_machine_is_compatible("altr,socfpga-arria10"))
> +		irq2 = platform_get_irq(pdev, 1);
>   
>   	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>   	layers[0].size = 1;

Why? We already switch on arria10 later in the same function.

Sorry, but NAK.

Dinh

