Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B272C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPtBm9B4YEX566wj/N9TktYWEpBugmzzi/2EOjd9yXY=; b=zqPeMApTAbcphrNcsYhQW7xA3T
	zZDiYI7E0JTThHPiyfbdZrLiUTCmq6FTmYS6I5qnMFb+zpmohwtvinVyKiuXTplnZrrSX+urU10XA
	KvkgFmvYFj8PCfwHozH4Gn7Ks8zCoxZ3ZuzLz9gKDZcQvNrMM14d7yDIROCX63jwf5Q7G3fgqFpoi
	teJ4oCqEJePQ+93x0/o9pWnG/V2cFlz3mFUEBp6I1y9lC/siVPqYM/h4nVOcjzgAvCIVJjjs18C+N
	JDqvqN85yp2zG5TzvzTrnIGo0yzv/rC5VbdRVgL3S3OHMhWDUDF54oHxCWSdrtY9gJOwnqJHi5p6J
	2ecKjI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOPz-00000002uwg-3mWv;
	Tue, 04 Aug 2026 23:19:31 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOPy-00000002uwH-0ggP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 23:19:31 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.225])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wrOPh-0006Bl-UH; Tue, 04 Aug 2026 23:19:14 +0000
Message-ID: <78890db3-f5e3-402b-a604-a79394141fbd@trager.us>
Date: Tue, 4 Aug 2026 16:19:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/11] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Ritwick Sharma <ritwick.sharma@arm.com>,
 Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260804100627.3217149-1-andre.przywara@arm.com>
 <20260804100627.3217149-12-andre.przywara@arm.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260804100627.3217149-12-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_161930_208499_11D3AC94 
X-CRM114-Status: GOOD (  13.65  )
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

On 8/4/26 3:06 AM, Andre Przywara wrote:

>   /*
>    * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>    * can be enabled.
> @@ -2275,6 +2362,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   {
>   	struct mpam_msc *msc = platform_get_drvdata(pdev);
>   
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>   	mutex_lock(&mpam_list_lock);
>   	mpam_msc_destroy(msc);
>   	mutex_unlock(&mpam_list_lock);

I think the PCC channel lifetime needs to follow the MSC's deferred 
lifetime.


mpam_msc_drv_remove() currently drops the PCC channel reference before 
removing the MSC from SRCU-protected lists. If this is the final 
reference, an existing SRCU reader can still enter 
mpam_fb_send_request() through the retained MSC and access the freed 
channel. A new reader could also find the MSC before list_del_rcu().


Moving mpam_pcc_chan_put() after mpam_free_garbage() is not sufficient 
because the garbage list is global and can be drained concurrently. e.g

1. One caller queues the MSC.

2. Another caller claims it with llist_del_all() and waits in 
synchronize_srcu()

3. The first caller finds the garbage list empty and returns without 
performing a grace period.

4. The first caller releases the channel while the reader blocking the 
other collector can still be using it.


Would it make sense to associate an optional release callback for each 
garbage entry? An MSC entry could use that callback to drop its PCC 
reference after the collector that claimed the entry completes 
synchronize_srcu(), but before the MSC is freed. This would keep the 
grace period and channel release under the ownership of the same 
collector. This would also handle mpam_disable(), which currently 
destroys and frees PCC-backed MSCs without dropping their PCC channel 
references.


