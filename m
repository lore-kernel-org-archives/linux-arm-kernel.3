Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1180BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwGMV4a9X4FHlmZDOMH2dajqR6kQLSlwsrYYTv4sK40=; b=4YoGb9EjWSoiooeI8vqg2G4Mq+
	8x+Gi9pun+TPEGj9D6bdIbiStB1GdCvdWExusZnLzoxkF6IyZ9XOUlbS68C7uH8Yr5q9I0nqRLNft
	9Kd4xJDXvaBlK/oxUeE7ERK5nty5/xbFq2DIpJdckPetihCOUIk0TpD7JORpiP8Fr2X3rdQM01PVE
	8kGzX1qAmYMXdRHCNWoLZlkepHNWzChQtIIMtLEcqNo/FliGjDwZFWeJXB/tUb/6hobUuoKzXmryS
	QNnfLuD9yjHgq2TVIJPvq0pDTFd0d/DuulHx0Swxn4Xt6Cqoj6//XQxoZ81C4s37D1QI6HTSzI/kz
	m6hvMa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8rb-0000000GUHF-0x2n;
	Tue, 21 Oct 2025 09:41:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8rZ-0000000GUGv-2V70
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:41:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 628911007;
	Tue, 21 Oct 2025 02:40:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5523F66E;
	Tue, 21 Oct 2025 02:41:00 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:40:58 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 04/10] uapi: Add ARM SCMI definitions
Message-ID: <aPdVKtKWNqB5dzkE@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-5-cristian.marussi@arm.com>
 <20251017161401.00002891@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017161401.00002891@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024105_673369_161B0AF4 
X-CRM114-Status: GOOD (  20.91  )
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

On Fri, Oct 17, 2025 at 04:14:01PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Sep 2025 21:35:48 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a number of structures and ioctls definitions used by the ARM
> > SCMI Telemetry protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
> 

Hi,

> Main thing in here is request to add __counted_by markings for the flexible array members.

...right...missed that completely...

> 
> >  SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
> > diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> > new file mode 100644
> > index 000000000000..b1a6d34fee4a
> > --- /dev/null
> > +++ b/include/uapi/linux/scmi.h
> > @@ -0,0 +1,286 @@
> 
> > +
> > +/**
> > + * scmi_tlm_config  - Whole instance or group configuration
> > + *
> > + * @enable: Enable/Disable Telemetry for the whole instance or the group
> > + * @t_enable: Enable/Disable timestamping for all the DEs belonging to a group.
> I'm fairly sure that even for reserved the kernel-doc script will complain if no
> documentation.  (I haven't checked if it special cases that though!)

Right..

> > + * @current_update_interval: Get/Set currently active update interval for the
> > + *			     whole instance or a group.
> > + *
> > + * Used by:
> > + *	RO - SCMI_TLM_GET_CFG
> > + *	WO - SCMI_TLM_SET_CFG
> > + *
> > + * Supported by:
> > + *	control/
> > + *	groups/<N>/control
> > + */
> > +struct scmi_tlm_config {
> > +	__u8 enable;
> > +	__u8 t_enable;
> > +	__u8 reserved[2];
> > +	__u32 current_update_interval;
> > +};
> 
> > +/**
> > + * scmi_tlm_grps_list  - DE-groups List
> > + *
> > + * @num_grps: Number of entries returned in @grps
> > + * @grps: An array containing descriptors for all defined DE Groups
> > + *
> > + * Used by:
> > + *	RW - SCMI_TLM_GET_GRP_LIST
> > + *
> > + * Supported by:
> > + *	control/
> > + */
> > +struct scmi_tlm_grps_list {
> > +	__u32 num_grps;
> > +	struct scmi_tlm_grp_info grps[];
> 
> As below on __counted_by

I will add.

> 
> > +};
> > +
> > +/**
> > + * scmi_tlm_grp_desc  - Group descriptor
> > + *
> > + * @num_des: Number of DEs part of this group
> > + * @composing_des: An array containing the DE IDs that belongs to this group.
> > + *
> > + * Used by:
> > + *	RW - SCMI_TLM_GET_GRP_DESC
> > + *
> > + * Supported by:
> > + *	groups/<N>control/
> > + */
> > +struct scmi_tlm_grp_desc {
> > +	__u32 num_des;
> > +	__u32 composing_des[];
> 
> If we can give this a __counted_by marking please do.
>

I will.

Thanks,
Cristian

