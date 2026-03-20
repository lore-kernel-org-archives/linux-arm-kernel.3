Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50451098784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdghUPigXgAiN4GE/7Na10kf5cTjIUitM3/aJKcENXs=; b=sNXsRnlc3yy/g7EwXCC66Z6ofp
	4lB68QKzI87P8XdxK/kTRHwcR1wqgBFD66RgcLc3v66BGmFpZeI1VFCY/SBpAISEiGDAn58cIUb3u
	RJvf13LdFoVT5CuMPan2nEQH+g0o50kvvIpYPjGPYOeGYlaYuB7jKOCw/2V7hqOCuJ3OFVa8pSUkl
	XF7TwParoAQY50ITj67Ea3kTBEaHwcceP6HoFsS9TlGWf74Ta7zwtwFrVAqKw6i0ALWL/dtrI6+rr
	bErTgIafHHBhNJ7wrk8JhvCMgcWC/mAMcjxPerSCAHk0/eu4pLo3aHsLLuZuJiDKIrr7nR166VlgR
	bwViJ3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a8u-0000000CsX5-2skb;
	Fri, 20 Mar 2026 13:44:00 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a8q-0000000CsTv-1AVJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:43:59 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260320134346epoutp02be9fa1f8c8b243abaf17574f9fc7507f~ekIpHsU7_1088610886epoutp02c
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:43:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260320134346epoutp02be9fa1f8c8b243abaf17574f9fc7507f~ekIpHsU7_1088610886epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774014226;
	bh=MdghUPigXgAiN4GE/7Na10kf5cTjIUitM3/aJKcENXs=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
	b=QMxTm4lEL7LZwvqdO42KN7MlalX8KctIsCp9gZSqSSV2pANF0+Yh6LLoJub9iL0o2
	 nae4/1W/8Mh6B9VZhHy/VmdDNUWLsxZz04BqlPe5ugW026eyFmX5nNA/yuzBcKCBLN
	 PNHu7Kfvhymk5NQgBqeVtw59EsbKiFI2hzedtuyE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260320134345epcas5p4d620667c0fa53957456ee6ab431b74be~ekIoV4r-j2223622236epcas5p4C;
	Fri, 20 Mar 2026 13:43:45 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fckL86bmPz3hhT3; Fri, 20 Mar
	2026 13:43:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260320134344epcas5p2a47663a9878904f47ac842e234b5d3b1~ekImvLOVo1040510405epcas5p20;
	Fri, 20 Mar 2026 13:43:44 +0000 (GMT)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260320134340epsmtip1d05d29f64a4175bad458c87c0cf02519~ekIjPQ7Rf0949609496epsmtip1f;
	Fri, 20 Mar 2026 13:43:39 +0000 (GMT)
Message-ID: <981ab856-9c79-4e08-9906-a81ec298a688@samsung.com>
Date: Fri, 20 Mar 2026 19:13:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kanchan Joshi <joshi.k@samsung.com>
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
To: hmi.jeon@samsung.com, "kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>
Cc: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "justin.tee@broadcom.com"
	<justin.tee@broadcom.com>, "nareshgottumukkala83@gmail.com"
	<nareshgottumukkala83@gmail.com>, "paul.ely@broadcom.com"
	<paul.ely@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260320134344epcas5p2a47663a9878904f47ac842e234b5d3b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_064356_991910_95AC3A72 
X-CRM114-Status: GOOD (  13.67  )
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

On 3/20/2026 10:51 AM, 전민식 wrote:
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index b78ba239c8ea..ad0363f7e681 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1376,10 +1376,6 @@ static blk_status_t nvme_prep_rq(struct request *req)
>   	iod->meta_total_len = 0;
>   	iod->nr_dma_vecs = 0;
>   
> -	ret = nvme_setup_cmd(req->q->queuedata, req);
> -	if (ret)
> -		return ret;
> -
>   	if (blk_rq_nr_phys_segments(req)) {
>   		ret = nvme_map_data(req);
>   		if (ret)
> @@ -1418,6 +1414,10 @@ static blk_status_t nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
>   	if (unlikely(!test_bit(NVMEQ_ENABLED, &nvmeq->flags)))
>   		return BLK_STS_IOERR;
>   
> +	ret = nvme_setup_cmd(req->q->queuedata, req);
> +	if (ret)
> +		return ret;
> +
>   	if (unlikely(!nvme_check_ready(&dev->ctrl, req, true)))
>   		return nvme_fail_nonready_command(&dev->ctrl, req);

The intent is to improve the observability in case controller was not 
ready, but the patch may need rework so that it does not cause the 
memory leak for this scenario.

Currently nvme_prep_rq() calls nvme_setup_cmd(), and in case failure 
occurs after that, it also does explicit cleanup with 
nvme_cleanup_cmd(). For discard request, this cleanup involves freeing 
memory that was allocated.

This patch moves nvme_setup_cmd() to caller (i.e. nvme_queue_rq), checks 
for controller not being ready and asks block-layer to retry without 
ever freeing the resource.

