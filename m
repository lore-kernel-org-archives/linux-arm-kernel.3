Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06475C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D8DgSTg5gXLxmJVeeYAQYPwfPFr8bhZIitPlCKl35M=; b=w0PHm9GxOEWKpsrRCCf2AjAxsU
	Ms6OMJt6azwFFvfxggGkLvhZ/81B4XW5UfVYFQ5+j9T63blfEk+Sm3j8cXTxAfSvi/Sn9hqjX11q/
	3D9z9GOu0/qgu89cqvTR8Xxy8gbv9hX2wd5uafCXqyusbo0h4QZe/afccgOX36wCe3q+0HCQQH5O5
	ztVJucpRTcIaL681Tabr6+AqGDAghgAplEdHCte9NgAtjFScaGAnrCMLg8OCzqSC50hmI4f8RUhg6
	KWXEq25XvAWiDrDJR7PAHQESBCzq9bzUimF5HlYmrKD3IBRJSiTlOpHxrYZKM2itfIPd9JrkQDC3g
	TR6I9bIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCYr-00000001ZJP-0jjw;
	Tue, 04 Aug 2026 10:39:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCYo-00000001ZIl-2Gow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 10:39:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CCC61476;
	Tue,  4 Aug 2026 03:39:44 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9353F86F;
	Tue,  4 Aug 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785839988; bh=gVQqttvdXx3czP0D8ZQjf0BF0PNoIikglrJsh5tdPNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goM700ykIlZQZM3yxmueia6Ug+QFJAnVUCKicYMAmearzqG9V4D7+Rw2nlW5/Dgk4
	 Qu8Uc0VxTw/8peiOKj5HovqW8VmHkViEM3Vr/VGIgwLxICebfLSLbvTGM2W1UCWgsO
	 sdDsn2QY6n1qaEIsWmN60+caR5AicRYDT1rYEMcE=
Date: Tue, 4 Aug 2026 11:39:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v7 19/23] uapi: Add ARM SCMI Telemetry definitions
Message-ID: <anHBYe15lb-G3mqd@pluto>
References: <20260802145618.1952804-20-cristian.marussi@arm.com>
 <A113D0AA-C4C5-4694-B3AD-731D6D39666B@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A113D0AA-C4C5-4694-B3AD-731D6D39666B@contoso.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_033950_658851_401C984A 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, Aug 03, 2026 at 11:25:20PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,
> 

Hi,

> A few comments on the updated UAPI inline.
> 
> > struct scmi_tlm_batch {
> > 	__u32 num_items;
> > 	__u32 item_sz;
> > 	__u64 reserved;
> > 	__u64 states;
> > 	__u64 items;
> > };
> 
> Please define an upper bound for num_items. Without a common ABI limit,
> callers can request effectively unbounded allocation and iteration, and
> userspace does not know which sizes the kernel is expected to support.

This structure is meant to be a generic container of different kind of
objects, so the sensible upper bound depends on the contained object...
....num_des mostly, check which I forgot to add, anyway, in the IOCTl
handling...I'll do that and document this...

> 
> >  * @states: A reference to an arrays of u32 items representing the
> >  *	    outcome of the requests for each single item in @items: these are
> >  *	    ordered in the same order as the @items. - OUT
> 
> These statuses contain zero or a negative Linux errno, but the array is
> described as u32 while the implementation uses int *. Could this be
> specified as an array of __s32 so the signed error-value ABI is explicit?

Sure.

> 
> Is states == 0 explicitly supported? The driver treats it as optional and
> stops at the first error when it is absent, potentially after preceding
> configuration changes have succeeded. Please document both the optional
> pointer and the resulting partial-completion semantics.

I'll do.

> 
> > #define SCMI_TLM_SET_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x02, struct scmi_tlm_config)
> > [...]
> > #define SCMI_TLM_SET_DE_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x05, struct scmi_tlm_batch)
> > [...]
> > #define SCMI_TLM_SET_ALL_CFG	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x0A, struct scmi_tlm_de_config)
> 
> SET_DE_CFG now returns per-DE tracking information, so _IOWR makes sense
> for that command.
> 
> SET_CFG and SET_ALL_CFG, however, still only consume their arguments and
> do not copy a result back. Unless output is planned, should these two
> commands be _IOW before the ioctl numbers become ABI?
> 

I'll double check all of this.

> > #define SCMI_TLM_BATCH_READ	_IOWR(SCMI_TLM_IOCTL_MAGIC, 0x10, struct scmi_tlm_data_read)
> 
> SCMI_TLM_BATCH_READ is encoded with struct scmi_tlm_data_read, but
> scmi_tlm_des_batch_read_ioctl() copies and interprets struct
> scmi_tlm_batch. These structures are different sizes, so _IOC_SIZE(cmd)
> does not describe what the handler accesses.
> 
> Please use struct scmi_tlm_batch here and update the documentation example
> accordingly.

Indeed..some kind of leftover...the puzzling thing is that it worked fine
when tested even with such mismatched IOC_SIZE()...I'll fix

> 
> A few kerneldoc nits:
> 
> - scmi_tlm_abi_info documents @de_impl_version, but the member is named
>   primary_de_impl_version.
> - scmi_tlm_batch documents @items_sz, but the member is item_sz.
> - scmi_tlm_grp_info documents a reserved member that is not present in the
>   structure.
> 

...ok...so, beside all of the above bugs (and a few more from Sashiko) to be
certainly fixed in the upcoming series, at this point I assume, from the lack
of further comments, that from your userspace perspective the UAPI/ABI is now
sufficiently complete, feature-wise, and the usage model is acceptable.

Thanks,
Cristian

