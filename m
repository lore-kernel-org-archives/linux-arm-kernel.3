Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F44C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wz5Z6umuTpfHzEWQwcRpdbEj4l7TnAg8LFKGkSkVxQ=; b=DyqSCpdJ1Bs1zkS45zFc+7dNWH
	HKhBSXiNzFMQY0eMsgmXijC448WERujVgn6cOqa63vxrjYdOBrPefuhO5G2Mqlq8X7dAshgNaI3oZ
	zhSG8nYg7szXdxM+8zK/HUTp2LtmAvd7zAVY20n8MODb7pheK/kt5/0aVX+o4fjmQiZ59FwXu35Wp
	wk7IO2Ue/26AEyrqc9qihV0tOThCpH7+j04CAI9P4GLNIp2j9OuQCtRx+BdqfvZ5Vi3uhyIQ2pxBI
	5kLDbRtAppUJJvpYt/Kd9xH9xGYnLuyG5mYSK2vFr7VDvpYJaByzg26x8rh3PM7UbYQZnM44TnEP8
	DmNt5vtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36L5-00000004kmO-0Mv7;
	Sun, 06 Sep 2026 06:26:51 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36L0-00000004km2-2VVd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788676002; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=0Wz5Z6umuTpfHzEWQwcRpdbEj4l7TnAg8LFKGkSkVxQ=;
	b=wPtfxU8oAWyTOZozNLeghuhIK4Y+BYqf3IFQ1OFTBxuRf6sAsY4bVKH3meamCh67YYlhyZJfgRIoAe1JoE9ACjrbINGzBxeCqk0E6H4CDtybHcVPqJ0P0Vm8dOD4ZSSF4zKyOUwPiJ7NeRMbzrX70AlIklvYku4Kv2H3cEVoysY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XAMUagL_1788675998;
Received: from 30.100.134.114(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAMUagL_1788675998 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 06 Sep 2026 14:26:39 +0800
Message-ID: <8cd50103-6e7c-4389-b29a-da159b7e62fb@linux.alibaba.com>
Date: Sun, 6 Sep 2026 14:26:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf: fix typo "binded" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
 <20260904123541.38602-3-hemanth.selam@gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260904123541.38602-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_232647_331645_965A71D5 
X-CRM114-Status: GOOD (  13.74  )
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



On 9/4/26 8:35 PM, Hemanth Selam wrote:
> Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/perf/dwc_pcie_pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 6b9ed59de26e..e2435ccc04ca 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -639,7 +639,7 @@ static void dwc_pcie_pmu_remove_cpuhp_instance(void *hotplug_node)
>   }
>   
>   /*
> - * Find the binded DES capability device info of a PCI device.
> + * Find the bound DES capability device info of a PCI device.
>    * @pdev: The PCI device.
>    */
>   static struct dwc_pcie_dev_info *dwc_pcie_find_dev_info(struct pci_dev *pdev)

LGTM.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

