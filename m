Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D14ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV2GNsQObfs0vMx88qViAlIkAmtpbvg27Zv5rOZIbbM=; b=j5qO23D4wTJ6kmF2so1Vlbv2qw
	rLe3RnraNuVEfUIq5xtsKXz7p/mk1x6Oynkds4+g+QsnH315nfhi6y21n28JO/Dgijiwp/Vb9roHl
	qpJpcqymhR3pPiDy34VawjHlyl6eNfoLUQvSxCB0t+JwKSIRGDooz287O3SSv4jWsW+Mgpak3MIsW
	afVdlRkgTrZB6tenz8OfrrKGuRlP0ah0wt5jlKM+BxeLxqEw68aoW/AasNlwBZ35NSCHJT64+Rfi2
	eTJc7ZO2v2XsKw0h4lef76uxpsj9lEyJ/xZkkXuKz1iWCEy48VVISAb6JSKJmptSlZ+UEB9eqS5C1
	WrWT5xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSKM-0000000BSyW-3NV0;
	Tue, 19 Aug 2025 19:49:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPqR-0000000B4g9-0X4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 17:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52824152B;
	Tue, 19 Aug 2025 10:09:49 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A26B3F738;
	Tue, 19 Aug 2025 10:09:55 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:09:52 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <aKSv4NrDfC33Niqs@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-5-c3e953e34be6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-5-c3e953e34be6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_100959_284880_32FA0EA8 
X-CRM114-Status: GOOD (  22.56  )
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

On Thu, Jul 10, 2025 at 04:33:30PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 78 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 19 ++++++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 6b86c35c192d02e13f0d2a7d713bc447886b84bf..193a862cf9b807232f04a6dbbd6a8efd1b40ff73 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -27,6 +27,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
> +	SCMI_IMX_MISC_SYSLOG = 0xD,
>  	SCMI_IMX_MISC_BOARD_INFO = 0xE,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
> @@ -89,6 +90,19 @@ struct scmi_imx_misc_cfg_info_out {
>  	u8 cfgname[MISC_MAX_CFGNAME];
>  };

Hi,

one consideration down below...

>  
> +struct scmi_imx_misc_syslog_in {
> +	__le32 flags;
> +	__le32 index;
> +};
> +
> +#define REMAINING(x)	le32_get_bits((x), GENMASK(31, 20))
> +#define RETURNED(x)	le32_get_bits((x), GENMASK(11, 0))
> +
> +struct scmi_imx_misc_syslog_out {
> +	__le32 numlogflags;
> +	__le32 syslog[];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -372,10 +386,74 @@ static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph)
>  	return ret;
>  }
>  
> +struct scmi_imx_misc_syslog_ipriv {
> +	u32 *array;
> +};
> +

So, AFAIU, you basically use this generic u32 array to retrieve data words from
your FW in a generic way....

> +static void iter_misc_syslog_prepare_message(void *message, u32 desc_index,
> +					     const void *priv)
> +{
> +	struct scmi_imx_misc_syslog_in *msg = message;
> +
> +	msg->flags = cpu_to_le32(0);
> +	msg->index = cpu_to_le32(desc_index);
> +}
> +
> +static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
> +					 const void *response, void *priv)
> +{
> +	const struct scmi_imx_misc_syslog_out *r = response;
> +
> +	st->num_returned = RETURNED(r->numlogflags);
> +	st->num_remaining = REMAINING(r->numlogflags);
> +
> +	return 0;
> +}
> +
> +static int
> +iter_misc_syslog_process_response(const struct scmi_protocol_handle *ph,
> +				  const void *response,
> +				  struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_imx_misc_syslog_out *r = response;
> +	struct scmi_imx_misc_syslog_ipriv *p = priv;
> +
> +	p->array[st->desc_index + st->loop_idx] =
> +		le32_to_cpu(r->syslog[st->loop_idx]);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
> +				void *array)

...and you provide a output array param and its size to use in the
iterators to retrieve your data...

...so you can use size to properly let iterators check bounds...

...so far so good BUT...

...is it not a possibility, especially with different FW versions in the
future, that the platform will return LESS than size data, because maybe
different platform can return different log data...I deduce this from
the fact that you are using a generic u32 array...

...so in this scenario wouldn't be useful to have the above size param as
being both an input and an output parameter using a pointer ? 

So that you can...

	static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph,
					u16 *size, void *array)

...use *size as the max_resources for iterators as of now BUT also pass
it down to the iterators in ipriv->size so that you can easily once for
all in prepare_message

	*(ipriv->size) = st->num_returned + st->num_remaining;

...so that you can KNOW if the specific FW has returned less items than
the maximum *size slots provided in *array ?

I maybe overthinking...and also this scenario will assume that the FW
can return less items, BUT still contiguos items...i.e. no holes in the
array....

...thoughts ?

Thanks,
Cristian

