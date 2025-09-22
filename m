Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B191CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkGEIertZRf37oRBzGN0crNMbTEz3GQtag0/lMWFQL8=; b=Wdk71r/OcDUigTlBKhEcWAvFuU
	gUeraDMmdGiOGk1dEb8MiPpE52oR/TBY7qTOEdYdwoiQ3GfNXz/qYl1Q9uPzRyqC4XwypmPTR70/Q
	xBeQjwBKgYGLxcr9VHsOUi+ZSFrI8Qs1uj1h5ZVWII5AwkNKzbuKhJbBxwggobpC3/TFsc55XmE2i
	f41+4QP4aYsl7HjCo9dnXP9pGLeA5ZoOWP69S4KA/INdL1zq7BthnQT5NttIIAlM5LNbS1YL0mi5Q
	F5pX0ugGltkJFBZfRWMrzP5QY1zHigh2NU73nKQ3xIrcx4fSJAg/0plsKHN24k0di1P6ARa4Ld4je
	wQbxDQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bwe-00000009jtw-3zss;
	Mon, 22 Sep 2025 08:30:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bvK-00000009ig0-1cSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:29:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2641B150C;
	Mon, 22 Sep 2025 01:29:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA60A3F66E;
	Mon, 22 Sep 2025 01:29:22 -0700 (PDT)
Date: Mon, 22 Sep 2025 09:29:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
Message-ID: <20250922082920.GB516577@e132581.arm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012926_548773_37E80D89 
X-CRM114-Status: GOOD (  23.36  )
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

On Mon, Sep 22, 2025 at 03:31:39PM +0800, Jie Gan wrote:
> From: Carl Worth <carl@os.amperecomputing.com>
> 
> The handle is essential for retrieving the AUX_EVENT of each CPU and is
> required in perf mode. It has been added to the coresight_path so that
> dependent devices can access it from the path when needed.
> 
> Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c |  1 +
>  drivers/hwtracing/coresight/coresight-tmc-etr.c  |  3 ++-
>  include/linux/coresight.h                        | 10 ++++++----
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba..5c256af6e54a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -520,6 +520,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>  		goto out;
>  
>  	path = etm_event_cpu_path(event_data, cpu);
> +	path->handle = handle;
>  	/* We need a sink, no need to continue without one */
>  	sink = coresight_get_sink(path);
>  	if (WARN_ON_ONCE(!sink))
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..1040f73f0537 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1327,7 +1327,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>  				   enum cs_mode mode, void *data)
>  {
> -	struct perf_output_handle *handle = data;
> +	struct coresight_path *path = data;
> +	struct perf_output_handle *handle = path->handle;
>  	struct etr_perf_buffer *etr_perf;
>  
>  	switch (mode) {
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 6de59ce8ef8c..4591121ae1d4 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -332,12 +332,14 @@ static struct coresight_dev_list (var) = {				\
>  
>  /**
>   * struct coresight_path - data needed by enable/disable path
> - * @path_list:              path from source to sink.
> - * @trace_id:          trace_id of the whole path.
> + * @path_list:			path from source to sink.
> + * @trace_id:			trace_id of the whole path.
> + * struct perf_output_handle:	handle of the aux_event.

s/struct perf_output_handle/@handle/

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

>   */
>  struct coresight_path {
> -	struct list_head	path_list;
> -	u8			trace_id;
> +	struct list_head		path_list;
> +	u8				trace_id;
> +	struct perf_output_handle	*handle;
>  };
>  
>  enum cs_mode {
> 
> -- 
> 2.34.1
> 
> 

