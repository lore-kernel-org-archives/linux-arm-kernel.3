Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B53DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 03:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU0SdmXsEzHgqpbX73XSZ4zO4NZW5hNHEdCOWX2C1xo=; b=I0lTfS6fMdXDf1ZrdrlrfODolq
	YQxMhknDoqAszonJ1mXUvEO4LJps4bTXbRSfaNLYyoTU97kpkKx30dWQfEQADyMz5qR/IPu7fhyt3
	5aui8h/Tx3ch34FOPDS5V/K8T7DYpaAGDvWChGvcTc2UFi2Bg64h9xs9Yg55wUqNO8FmUTrRxGV64
	M0P6uALHsnv2MPe31k20EiaaFCzpb2BWjhyQWFqH2A8frfrr/JVXmI6Dvvvk98PrxKW4LcHt9Ollb
	EbXmh6B7dCGSN/uJ91fAu3i64A8jHT8WAXd3bBCNTuj3Rp8ENmrXIT/zcQVDI3EFeGduVKu4n240q
	PERNOnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrtY-000000038o1-24GC;
	Mon, 17 Feb 2025 03:34:08 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrs5-000000038hK-1rhU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 03:32:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Yx7RC1spNz1wn6r;
	Mon, 17 Feb 2025 11:28:39 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id AC2231401F1;
	Mon, 17 Feb 2025 11:32:31 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 17 Feb 2025 11:32:30 +0800
Message-ID: <9360c637-203a-fef8-71b3-66eee10b9490@huawei.com>
Date: Mon, 17 Feb 2025 11:32:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v4 3/5] arm_mpam: Provide
 conversion method for new closid/rmid pairs
Content-Language: en-US
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250104101224.873926-1-zengheng4@huawei.com>
 <20250104101224.873926-4-zengheng4@huawei.com>
In-Reply-To: <20250104101224.873926-4-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.24]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_193237_661848_87C79D68 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Martin,

On 2025/1/4 18:12, Zeng Heng wrote:
> The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
> For the new rmid allocation strategy, it will check if there is an
> available rmid of any reqPARTID which belongs to the input closid, not just
> the rmids belonging to the closid.
> 
> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
> expanding the monitoring groups.
> 
> In order to keep the existing resctrl API interface, the rmid contains both
> req_idx and PMG information instead of PMG only under the MPAM driver. The
> req_idx represents the req_idx-th sub-monitoring group under the control
> group. The new rmid would be like:
> 
>      rmid = (req_idx << shift | pmg).

To consider future compatibility with dynamically allocated reqpartid,
should I refactor the rmid?

Instead of defining rmid.req_idx, we could place the entire reqpartid
directly within rmid. In This way, the allocation of reqpartid will no
longer be constrained by the static allocation of closid, facilitating
future compatibility with dynamic allocation mechanisms. In this way,
it needs to refactor the resctrl_arch_rmid_idx_encode() and 
resctrl_arch_rmid_idx_decode(), and we can simplify
closid_rmid2reqpartid() to rmid2reqpartid().

What are your thoughts on this idea? Thank you in advance for your
reply.

Best regards,
Zeng Heng

