Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70367CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edFXMRMFO6PnDBg221MKle/uhUCFjl2dlsKaZGRAvA4=; b=GVTeI+nvGqFtO5KJwxiVLxocjC
	glTtBlRh7ZQ+fMZMGmG/YelcLSxky5qz2RuxQv3jHGkGOcDjyYZdFFUxrVqT68KBa2X8TmM8c6/EM
	DU56vFHRjqhM0WaU8nAfya8WriP54QiewWKHRx+vA8LPsqPFdiWuOL/Rlhl9xdkc6WL1k9wEYySPX
	sQC8TlKpfNJO2v7k+M7ZrCJbpHBaBCRZ7CleVm8VsUEayiDiRyqSgVxC01XxcCgEIRHs2DMZB7Ryt
	MOkrqlvg/c/xbZLhpFcIWsMHoz3FellXyQlFdmkMlmJwi5+nP0lpKKxDt2bGpnImllIxgWUtPWSDF
	gEqRzJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9m9l-00000008ENV-1Kqn;
	Fri, 17 Oct 2025 15:14:13 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9m9i-00000008EM8-1GP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:14:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cp7c75Mc5z6K5Wg;
	Fri, 17 Oct 2025 23:12:55 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 20E0B1402FF;
	Fri, 17 Oct 2025 23:14:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Oct
 2025 16:14:03 +0100
Date: Fri, 17 Oct 2025 16:14:01 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 04/10] uapi: Add ARM SCMI definitions
Message-ID: <20251017161401.00002891@huawei.com>
In-Reply-To: <20250925203554.482371-5-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-5-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_081410_481417_5F2BDC4D 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu, 25 Sep 2025 21:35:48 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a number of structures and ioctls definitions used by the ARM
> SCMI Telemetry protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian,

Main thing in here is request to add __counted_by markings for the flexible array members.

>  SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX Extension Message Protocol drivers
> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 000000000000..b1a6d34fee4a
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h
> @@ -0,0 +1,286 @@

> +
> +/**
> + * scmi_tlm_config  - Whole instance or group configuration
> + *
> + * @enable: Enable/Disable Telemetry for the whole instance or the group
> + * @t_enable: Enable/Disable timestamping for all the DEs belonging to a group.
I'm fairly sure that even for reserved the kernel-doc script will complain if no
documentation.  (I haven't checked if it special cases that though!)
> + * @current_update_interval: Get/Set currently active update interval for the
> + *			     whole instance or a group.
> + *
> + * Used by:
> + *	RO - SCMI_TLM_GET_CFG
> + *	WO - SCMI_TLM_SET_CFG
> + *
> + * Supported by:
> + *	control/
> + *	groups/<N>/control
> + */
> +struct scmi_tlm_config {
> +	__u8 enable;
> +	__u8 t_enable;
> +	__u8 reserved[2];
> +	__u32 current_update_interval;
> +};

> +/**
> + * scmi_tlm_grps_list  - DE-groups List
> + *
> + * @num_grps: Number of entries returned in @grps
> + * @grps: An array containing descriptors for all defined DE Groups
> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_GRP_LIST
> + *
> + * Supported by:
> + *	control/
> + */
> +struct scmi_tlm_grps_list {
> +	__u32 num_grps;
> +	struct scmi_tlm_grp_info grps[];

As below on __counted_by

> +};
> +
> +/**
> + * scmi_tlm_grp_desc  - Group descriptor
> + *
> + * @num_des: Number of DEs part of this group
> + * @composing_des: An array containing the DE IDs that belongs to this group.
> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_GRP_DESC
> + *
> + * Supported by:
> + *	groups/<N>control/
> + */
> +struct scmi_tlm_grp_desc {
> +	__u32 num_des;
> +	__u32 composing_des[];

If we can give this a __counted_by marking please do.

> +};



