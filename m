Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759B8E677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrThYgcr0Uc0e/MvEh2q+4g7sMwdZgq7+vE/+PGa9is=; b=3xcbsRHZGpFlBIEp3ELoAK43Rt
	GozDqq2qUfKolwuxvg7sKGyCl4YihZh584vPMz+XkCCgn1Narq+scFjwyv9RBJdVgxb8L6zxk36h4
	POardHPVLy5CknCLBNwzQ89n9By1J3vPtk7c7gqls6UA3JxlmlfdJpH1DqfjZLMPESXJ/hjcGO8Aw
	ObHPSdTOUFcFIJgUD62cWozI66QhOhUYi0XnqIWO8/cGpwIkjeYICuotYRG1+O0ggtDf125gJ07Z5
	qFM2g80s4hz+tqADf2SXhEKJ8JFZJ+WVDM9Y9sETchMrl1sdzhGo1SoKUhymLWXa/3oUsoS//WJv+
	EplDoaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7A7k-00000009MNH-232S;
	Sat, 02 Nov 2024 09:08:48 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7A64-00000009MEi-40B2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 09:07:06 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 34713A0B13;
	Sat,  2 Nov 2024 10:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=QrThYgcr0Uc0e/MvEh2q
	+4g7sMwdZgq7+vE/+PGa9is=; b=gTdkGl0H3jGDoSnwSbNOV3/fk/4oLSkeT7pG
	1NidGSwe6iJPmPnLMiALUGP+qnaN7qjWgI1jDz7JCrUXKuHzi2XHR90OVI41EOn9
	eUzLCcey/dwNQUnFCA6ExGI4NWXVbQl04AcnjplHdqUg7aohMUc42MfquRESmK9I
	hOhJnjK4qSgxa1JMjQ3eGIOEft1ZDX/evjLLyPy4A9aUto3o7m60V+9N7sgmQ3wV
	yEhyl2ZPy24txQyPKL+MDQGGgiNQ8zecvcM2JofggpigutC0z1BkOrv8KXGAUfVS
	La3UqMLEgCT2Pp5WHFup6IHQ5WStMMU5oTHCI+zdV6uZoHci+Y14UnHx2HzW62Hq
	oGaabzy+Yjd+wADGMn3wsRcjtcd8jBDUelmn+J2B6RTcCBkue+OLMOjwY6ak7FTF
	oXCKaVO/Xr4uycnYItQY1U65dngfx8PE1iwJxaBXcUWWgZkmwqlsPrfT+T/K3sx/
	b0H/Tp5Az0tfn20c+sb7rDJXr5HlyBrvGxpNYXBzpIatAYd4f6jOsbxB1qPpzMvi
	qMSQLaaon9Ko1UxqHdo77JG+uPsEeqnEwQNhOSfAZAbWpiGytJ52UVFy+JkbzVa5
	uQH0ZFgLg0VNAUDh0l3hTq3gQvyOhxDZRGyTxrE27xAoKswNvUzFl+SaD0TH/mAQ
	NoMxf/s=
Message-ID: <4a52cf8b-dd55-4bf8-8c37-29c07749bee0@prolan.hu>
Date: Sat, 2 Nov 2024 10:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] dma-engine: sun4i: Add support for Allwinner
 suniv F1C100s
To: Amit Singh Tomar <amitsinght@marvell.com>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
 <20241031123538.2582675-4-csokas.bence@prolan.hu>
 <53df7ebb-d6bf-4b34-98b6-442fdbd5d348@marvell.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <53df7ebb-d6bf-4b34-98b6-442fdbd5d348@marvell.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.8]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_020705_173316_B19080CF 
X-CRM114-Status: UNSURE (   5.38  )
X-CRM114-Notice: Please train this message.
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

On 2024. 10. 31. 20:05, Amit Singh Tomar wrote:
>>    #define SUN4I_DMA_CFG_SRC_ADDR_MODE(mode)    ((mode) << 5)
>>    #define SUN4I_DMA_CFG_SRC_DRQ_TYPE(type)    (type)
>> +#define SUNIV_DMA_CFG_DST_DATA_WIDTH(width)    ((width) << 24)
>> +#define SUNIV_DMA_CFG_SRC_DATA_WIDTH(width)    ((width) << 8)
> 
> nit: Are the extra parentheses around width truly necessary? They seem 
> to be used throughout the file.

It's macro safety. So for instance if someone writes 
~SUNIV_DMA_CFG_DST_DATA_WIDTH(1 + 2), which would expand to ~1 + 2 << 24 
it doesn't get mis-interpreted as (~1) + (2 << 24) for instance. So 
yeah, I sure hope that _all code_ that has macros with parameters did 
not forget to wrap everything in parentheses, and not just "throughout 
[this] file".

Bence


