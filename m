Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE6C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTUrZfp2RsdgZdGoGeKWpIo05ACzlb+iC+JSJ0rB/NA=; b=IIIpyxqjo6L+up/V+gfCujVTEX
	MzZB4fPOTWp32wyeezx2onxr4BPJhIYXp6e/mH5Z3PiR6g4XvJVGwZMOCViuzPJBtuLJ1UdoFWAGW
	il1GzdRXKkuLbq3zaC9S2E4qAg3WFZxz3MmTOHSiZIz5Hnoja2yDHJbCp0FGqrflSkZ4hCWW8g1Et
	58cmg8v19v4kpW/PBSRJodvahJU1tQ+9qtD+BiyWTHkGGuumfOd8ZxTStuzMeOfF9ojhM+VpvEgPI
	ZYuGtUQSI7whV7fWeHXXgAV1cSunfPP+KhktmAfpqP2JKSR7tPdFKjIR3a1QLdrzoR/Bjf6HE1/Xy
	S80hZ8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUC5-00000009Vv1-25kc;
	Wed, 25 Jun 2025 17:45:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQhx-00000008tVT-0ug2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:02:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 567D8106F;
	Wed, 25 Jun 2025 07:02:18 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDB7D3F66E;
	Wed, 25 Jun 2025 07:02:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:02:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <aFwBdjWQv6urIgq1@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
 <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_070237_292261_280D62D1 
X-CRM114-Status: GOOD (  13.43  )
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

On Fri, Jun 20, 2025 at 11:46:15PM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> > +static int
> > +scmi_telemetry_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> > +				       struct telemetry_info *ti)
> > +{

Hi Dan,

thanks for having a look.

> > +	int ret;
> > +	struct scmi_xfer *t;
> > +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> > +
> > +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
> > +				      0, sizeof(*resp), &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp = t->rx.buf;
> > +	ret = ph->xops->do_xfer(ph, t);
> > +	if (!ret) {
> > +		__le32 attr = resp->attributes;
> > +
> > +		ti->info.num_de = le32_to_cpu(resp->de_num);
> > +		ti->info.num_groups = le32_to_cpu(resp->groups_num);
> > +		for (int i = 0; i < SCMI_TLM_MAX_DWORD; i++)
> > +			ti->info.de_impl_version[i] =
> > +				le32_to_cpu(resp->de_implementation_rev_dword[i]);
> > +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> > +		ti->info.continuos_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> > +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> > +		ti->info.reset_support = SUPPORTS_RESET(attr);
> > +		ti->info.fc_support = SUPPORTS_FC(attr);
> > +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> > +		/* Allocate DEs descriptors */
> > +		ti->info.des = devm_kcalloc(ph->dev, ti->info.num_de,
> > +					    sizeof(*ti->info.des), GFP_KERNEL);
> > +		if (!ti->info.des)
> > +			ret = -ENOMEM;
> > +
> > +		/* Allocate DE GROUPS descriptors */
> > +		ti->info.des_groups = devm_kcalloc(ph->dev, ti->info.num_groups,
> > +						   sizeof(*ti->info.des_groups),
> > +						   GFP_KERNEL);
> > +		if (!ti->info.des_groups)
> > +			ret = -ENOMEM;
> 
> It the allocation fails we need to jump to the ->xfer_put
> 
> > +
> > +		for (int i = 0; i < ti->info.num_groups; i++)
> > +			ti->info.des_groups[i].id = i;
> 
> otherwise it leads to a NULL dereference.
>

Indeed...I will fix.

There are a few more of this bugs around probably being an RFC...bots also are
complaining a lot at this series indeed :D

Thanks,
Cristian


