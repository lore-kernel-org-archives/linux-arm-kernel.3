Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D314C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeZPAI+5DNFowOP/s77FbTm33gqbHOgOnaALZZXVwmg=; b=zfhXLyCsXRZEPame4rIO4kcAIx
	gq82yeV5buAGTWGnNvLaXMPUL21c8QRkbvYkl7nOYXJsXDNZn9y1L1vs0TncP+u8f4XVif3MyVInc
	zHwy5xhqMQH492kMukNIXBLnskxfRsIildZA9yWDTnc5RtsdI+DP6bv9/gL/yVJRCfEHkoUR2kaXu
	tMhTj5uKHIFVQJyg07VhvhHBJeoN4AV2hkaYVRFTBRCsUAx/uwjDxPz8oTLOFHmFS0ThYygc8HwJd
	BdEhBxbqWRsO0IyUu7YlCxMagjXWmqRi4fjWK4wLb8gmj64rrZKwKgSKwqOz3sPPSyS2AHnZLZ9mT
	GVRj/pEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0V9-00000008zFo-0Ot3;
	Wed, 02 Jul 2025 16:40:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzMp-00000008mtJ-3MCC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19A2A3024;
	Wed,  2 Jul 2025 08:27:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689C43F6A8;
	Wed,  2 Jul 2025 08:27:22 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:27:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
Message-ID: <20250702152720.GA794930@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-2-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620075412.952934-2-hejunhao3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082723_878669_0FA377DC 
X-CRM114-Status: GOOD (  19.64  )
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

On Fri, Jun 20, 2025 at 03:54:10PM +0800, Junhao He wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> tmc_drvdata::reading is used to indicate whether a reading process
> is performed through /dev/xyz.tmc. Document it.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..3ca0d40c580d 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>   * @pid:	Process ID of the process that owns the session that is using
>   *		this component. For example this would be the pid of the Perf
>   *		process.
> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry

Are you working on the latest code base? For example, the mainline
kernel or coresight next branch.

The latest code already has comment for reading, and I saw a duplicated
"reading" field in tmc_drvdata.

The tmc_resrv_buf structure does not have the fields "pid",
"stop_on_flush", "buf", etc. They have been moved into the tmc_drvdata
structure.

Thanks,
Leo

>   * @stop_on_flush: Stop on flush trigger user configuration.
>   * @buf:	Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:	details of buffer used in TMC-ETR
> -- 
> 2.33.0
> 

