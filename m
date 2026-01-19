Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F749CCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY2RAAyyRPcyj0OJTVqPrwEJ1qKA4qroeiSM6ixy7bM=; b=02iKURDjAdN/JAtHcZ4Nd4+UzI
	A1tIFcy9K7G8Eu0gqF2kvXYe07I/Fc8gkXJobPUbTxNkMJ4/dzmyf7A0m0jMDoaJB71rFWYD7TTZn
	IeOw16hFwLOQi7LdcesNXv9xZKOulSrBQDxAnNk46RYFhjUTvMia+y/jfYmvZSvD3ygoULaelhyIn
	nWiLHo48v3YpNUalTW+O16JsFIJ0m6bBsZVBxGQ3NZUoISxHiK/DcumWwhFXCvPFaadtrlitDzBgJ
	M55iZfReTXLNaTmWGTraP/Fls1+RAZg15EjhQFYBpHH5pZGONPxXenTJV54lZzJB0ktu8mnHZ0+lw
	amyfNUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnfo-00000001uox-1ppb;
	Mon, 19 Jan 2026 11:43:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnfj-00000001uoc-1tNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:43:55 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dvpVz2PSvzJ46mQ;
	Mon, 19 Jan 2026 19:43:23 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 1719340569;
	Mon, 19 Jan 2026 19:43:46 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 11:43:45 +0000
Date: Mon, 19 Jan 2026 11:43:43 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<sudeep.holla@arm.com>, <james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<d-gole@ti.com>, <elif.topuz@arm.com>, <lukasz.luba@arm.com>,
	<philip.radford@arm.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH v2 04/17] uapi: Add ARM SCMI definitions
Message-ID: <20260119114343.00003f07@huawei.com>
In-Reply-To: <20260114114638.2290765-5-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
	<20260114114638.2290765-5-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_034351_803213_6AADF671 
X-CRM114-Status: GOOD (  14.68  )
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

On Wed, 14 Jan 2026 11:46:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a number of structures and ioctls definitions used by the ARM
> SCMI Telemetry protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few drive by comments.

> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 000000000000..e4e9939a1bf8
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h
> @@ -0,0 +1,287 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +#ifndef _UAPI_LINUX_SCMI_H
> +#define _UAPI_LINUX_SCMI_H
> +
> +/*
> + * Userspace interface SCMI Telemetry
> + */
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>


> +/**
> + * scmi_tlm_intervals  - Update intervals descriptor
> + *
> + * @discrete: Flag to indicate the nature of the intervals described in
> + *	      @update_intervals.
> + *	      When 'false' @update_intervals is a triplet: min/max/step
> + * @pad: Padding fields to enforce alignment.
> + * @num: Number of entries of @update_intervals
> + * @update_intervals: A variably-sized array containing the update intervals
> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_INTRVS
> + *
> + * Supported by:
> + *	control/
> + *	groups/<N>/control
> + */
> +struct scmi_tlm_intervals {
> +	__u8 discrete;
> +	__u8 pad[3];
> +	__u32 num;

Trivial but this seems a little inconsistent. In other
'num' entries (e.g. num_des) below a more specific name
is used.

> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> +	__u32 update_intervals[] __counted_by(num);
> +};

> +
> +/**
> + * scmi_tlm_des_list  - List of all defined DEs
> + *
> + * @num_des: Number of entries in @des
> + * @des: An array containing descriptors for all defined DEs
> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_DE_LIST
> + *
> + * Supported by:
> + *	control/
> + */
> +struct scmi_tlm_des_list {
> +	__u32 num_des;
> +	struct scmi_tlm_de_info des[] __counted_by(num_des);
> +};
> +
> +/**
> + * scmi_tlm_de_sample - A DE reading
> + *
> + * @id: DE identifier
> + * @tstamp: DE reading timestamp (equal 0 is NOT supported)
> + * @val: Reading of the DE data value
> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_DE_VALUE
> + *
> + * Supported by:
> + *	control/
> + */
> +struct scmi_tlm_de_sample {
> +	__u32 id;

Packing issues maybe if this ever ends up on 32 bit machines.
Even more so once it's in an array below.

> +	__u64 tstamp;
> +	__u64 val;
> +};
> +
> +/**
> + * scmi_tlm_data_read - Bulk read of multiple DEs
> + *
> + * @num_samples: Number of entries returned in @samples
> + * @samples: An array of samples containing an entry for each DE that was
> + *	     enabled when the single sample read request was issued.
> + *
> + * Used by:
> + *	RW - SCMI_TLM_SINGLE_SAMPLE
> + *	RW - SCMI_TLM_BULK_READ
> + *
> + * Supported by:
> + *	control/
> + *	groups/<N>/control
> + */
> +struct scmi_tlm_data_read {
> +	__u32 num_samples;
> +	struct scmi_tlm_de_sample samples[] __counted_by(num_samples);
> +};

