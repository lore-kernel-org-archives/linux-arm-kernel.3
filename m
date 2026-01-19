Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BBDD29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBH4DNCYjryzuQ4KcH8Bshnz9cDuZwalFO1G55q8f/Q=; b=vy6o3s91n7cK6LCb/qnY467gbx
	RucjocSjFYNJnz8kyOmsDDZXin8zlsuqyyVQ9OU8/t/NlUK22X44HAOF0if74k7YqD7iab5hH6O0K
	7ZAqJUlO25qAdZBVdTwJpRo7zDEiERyovIufPWz5dtBDgWx2Sio10pZQq3pytOeli1/ps098+Iues
	CHTKPTb9Cp3TeS/q/lF6iPRj4fJfDOWwu+GJ9j02qXmlTKDGzuIphJXOlH82gayjo7W1hhj4fNn34
	z4QjHHHfCCb0+ITra8bI8KSyqoyWfXIAUegnSmOUvxkaWjvQCMlpDHu7Y8KH+FDxnsHObwP7euTNp
	Sm2UmX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrXd-00000002OaN-0x5T;
	Mon, 19 Jan 2026 15:51:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrXN-00000002OXz-2dDi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:51:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B96EDFEC;
	Mon, 19 Jan 2026 07:51:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 202AB3F694;
	Mon, 19 Jan 2026 07:51:26 -0800 (PST)
Date: Mon, 19 Jan 2026 15:51:23 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 04/17] uapi: Add ARM SCMI definitions
Message-ID: <aW5S--P1EoV3y9kU@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-5-cristian.marussi@arm.com>
 <20260119114343.00003f07@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119114343.00003f07@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_075131_559436_2CA8609F 
X-CRM114-Status: GOOD (  20.23  )
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

On Mon, Jan 19, 2026 at 11:43:43AM +0000, Jonathan Cameron wrote:
> On Wed, 14 Jan 2026 11:46:08 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a number of structures and ioctls definitions used by the ARM
> > SCMI Telemetry protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> A few drive by comments.

Hi,

> 
> > diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> > new file mode 100644
> > index 000000000000..e4e9939a1bf8
> > --- /dev/null
> > +++ b/include/uapi/linux/scmi.h
> > @@ -0,0 +1,287 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Copyright (C) 2026 ARM Ltd.
> > + */
> > +#ifndef _UAPI_LINUX_SCMI_H
> > +#define _UAPI_LINUX_SCMI_H
> > +
> > +/*
> > + * Userspace interface SCMI Telemetry
> > + */
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/types.h>
> 
> 
> > +/**
> > + * scmi_tlm_intervals  - Update intervals descriptor
> > + *
> > + * @discrete: Flag to indicate the nature of the intervals described in
> > + *	      @update_intervals.
> > + *	      When 'false' @update_intervals is a triplet: min/max/step
> > + * @pad: Padding fields to enforce alignment.
> > + * @num: Number of entries of @update_intervals
> > + * @update_intervals: A variably-sized array containing the update intervals
> > + *
> > + * Used by:
> > + *	RW - SCMI_TLM_GET_INTRVS
> > + *
> > + * Supported by:
> > + *	control/
> > + *	groups/<N>/control
> > + */
> > +struct scmi_tlm_intervals {
> > +	__u8 discrete;
> > +	__u8 pad[3];
> > +	__u32 num;
> 
> Trivial but this seems a little inconsistent. In other
> 'num' entries (e.g. num_des) below a more specific name
> is used.

Yes, agreed. I will fix.

> 
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_LOW	0
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_HIGH	1
> > +#define SCMI_TLM_UPDATE_INTVL_SEGMENT_STEP	2
> > +	__u32 update_intervals[] __counted_by(num);
> > +};
> 
> > +
> > +/**
> > + * scmi_tlm_des_list  - List of all defined DEs
> > + *
> > + * @num_des: Number of entries in @des
> > + * @des: An array containing descriptors for all defined DEs
> > + *
> > + * Used by:
> > + *	RW - SCMI_TLM_GET_DE_LIST
> > + *
> > + * Supported by:
> > + *	control/
> > + */
> > +struct scmi_tlm_des_list {
> > +	__u32 num_des;
> > +	struct scmi_tlm_de_info des[] __counted_by(num_des);
> > +};
> > +
> > +/**
> > + * scmi_tlm_de_sample - A DE reading
> > + *
> > + * @id: DE identifier
> > + * @tstamp: DE reading timestamp (equal 0 is NOT supported)
> > + * @val: Reading of the DE data value
> > + *
> > + * Used by:
> > + *	RW - SCMI_TLM_GET_DE_VALUE
> > + *
> > + * Supported by:
> > + *	control/
> > + */
> > +struct scmi_tlm_de_sample {
> > +	__u32 id;
> 
> Packing issues maybe if this ever ends up on 32 bit machines.
> Even more so once it's in an array below.
>

Oh yes, I missed this...
 
> > +	__u64 tstamp;
> > +	__u64 val;
> > +};
> > +

Thanks,
Cristian

