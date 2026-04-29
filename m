Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AF7FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqNKCeyUYF9KWGCcnKzNyPUhOdM5wDMY1RTineHLakg=; b=Q3gabzQ4cH5Qhse1hwTt9rq5jA
	a2dGJe9kP+cHiOsqY2kyzwBY7FUnnnD5y/EGloCjH0F7OjT9FSl4YyGp2T4TDkW17OVE5jO2m8x/m
	VvGNE6as5gvftq52RTkl86jTUH9WJLvcF/ErEIGfQF7NRRGPSfbLuc7fEmcT4QLxej2A6m18hgSHF
	TpzOuvFEBXNkO33n8F3D1I2OtgyTamXoFHDMDo3SsBacRNS5fIcs1L9DkX/KOiaFGo+2JTQp7R7GO
	fyjfXpbrQatGyNxopDelaBSfCIhlH9VbbG1iU5euoirsr6l+60kjvkM3sdFvf7FltcZNl7P1zpKK5
	QODIse/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDgg-00000004HtG-129j;
	Wed, 29 Apr 2026 22:47:22 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIDgd-00000004Hsk-2ojR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 22:47:21 +0000
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id ICf1w2XBbjw8YIDgPwH3Gt; Wed, 29 Apr 2026 22:47:05 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id IDgNwrFSp7GclIDgNwHl5v; Wed, 29 Apr 2026 22:47:03 +0000
X-Authority-Analysis: v=2.4 cv=T6KMT+KQ c=1 sm=1 tr=0 ts=69f28a67
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=PHKDr0J8e_G5cKxf1GUA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wqNKCeyUYF9KWGCcnKzNyPUhOdM5wDMY1RTineHLakg=; b=lAUS+CFUPPdU60AN2e+W2W/R5/
	fD7XNhjoGBt+b3bub9TvdSDxZnCFkK624N6r8YeEj7MOgN1bcpP05iayQPbAqK18vLU7OT6uDMdIf
	8/Y/O9KjWDvcgEuDWD+7kNCe1yVTXLfypFiPFhnkI4I65fbgqW1VbVJ0IcfgvT9iE9zSDtiCVMy1x
	9QRKIB69ydD2kA6igr6f7eR2oxD1KRu7J042rdLTyQqrWgTlvdg9+2eoNaJ8WVqFRmhhJxBozdVNR
	b6lj5OpkEsY8w6fwBGdk7P4Trq5H4XzVZJNB0QAHhl/AwMF9RAZsd/0CcvJk6L+pQlt/PZPVQXHg/
	vOC/JyKQ==;
Received: from [177.238.19.10] (port=36338 helo=[192.168.0.36])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1wIDgL-00000000Vqp-3tbR;
	Wed, 29 Apr 2026 17:47:02 -0500
Message-ID: <fbc749e6-10ce-43c2-8985-020322ba4900@embeddedor.com>
Date: Wed, 29 Apr 2026 16:46:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] media: xilinx: Avoid -Wflex-array-member-not-at-end
 warning
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <afJiL-iZ4QbJ5v12@kspp>
 <20260429202449.GA132396@killaraus.ideasonboard.com>
 <20260429202801.GB132396@killaraus.ideasonboard.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260429202801.GB132396@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.19.10
X-Source-L: No
X-Exim-ID: 1wIDgL-00000000Vqp-3tbR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.36]) [177.238.19.10]:36338
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFykytCLuJuEnZjBIv0KH2snyYenwqZHQslxgM6XpVpc6fZRx8sXIrenVW+MRrOtnFQQonCZLWH3o63lGOZLBWgjLU8xXnHSbn58kccfKW3LH0VR29Te
 mbQ6UaLSJQEVps8NGN20kceGWrA61xjvshQf+ZWGVE2mdwTUGypn8+mHBFBTJ9rd1xWlgDZTsyLyD0zXNUm3rvDhJf5mpX37Fct92aYACzL4JQov/Z9pca4F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_154720_585129_1019B716 
X-CRM114-Status: GOOD (  13.16  )
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



On 4/29/26 14:28, Laurent Pinchart wrote:
> I forgot to ask, how do you want to get this merged? Will you collect
> all similar patches and send a tree-wide pull request, or should they be
> merged by individual subsystems ? In the latter case, Tomi, could you
> please handle this with other Xilinx patches ?

You folks can take this in your tree. :)

Thanks!
-Gustavo

> 
> On Wed, Apr 29, 2026 at 11:24:50PM +0300, Laurent Pinchart wrote:
>> CC'ing Tomi Valkeinen.
>>
>> On a side note, Tomi, can I send a patch to add you to the "XILINX VIDEO
>> IP CORES" section of MAINTAINERS ?
>>
>> On Wed, Apr 29, 2026 at 01:55:27PM -0600, Gustavo A. R. Silva wrote:
>>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>>> getting ready to enable it, globally.
>>>
>>> Use the TRAILING_OVERLAP() helper to fix the following warning:
>>>
>>> drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>>
>>> This helper creates a union between a flexible-array member (FAM)
>>> and a set of members that would otherwise follow it. This overlays
>>> the trailing members onto the FAM while preserving the original
>>> memory layout.
>>>
>>> Lastly, the static_assert() ensures the alignment between the FAM
>>> and struct data_chunk sgl; is not inadvertently changed, and it's
>>> intentionally placed inmediately after the related structure (that
>>> is, no blank line in between).
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> ---
>>>   drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
>>> index 18f77e1a7b39..65f6147ff6c6 100644
>>> --- a/drivers/media/platform/xilinx/xilinx-dma.h
>>> +++ b/drivers/media/platform/xilinx/xilinx-dma.h
>>> @@ -96,9 +96,14 @@ struct xvip_dma {
>>>   
>>>   	struct dma_chan *dma;
>>>   	unsigned int align;
>>> -	struct dma_interleaved_template xt;
>>> -	struct data_chunk sgl;
>>> +
>>> +	/* Must be last as it ends in a flexible-array member. */
>>> +	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
>>> +		struct data_chunk sgl;
>>> +	);
>>>   };
>>> +static_assert(offsetof(struct xvip_dma, xt.sgl) ==
>>> +	      offsetof(struct xvip_dma, sgl));
>>>   
>>>   #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
>>>   
> 


