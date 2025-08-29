Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA96CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkWXUwZl42hdlKQwTiQ/HC/bbvBsBBt5Y8KH/qQKEgQ=; b=eQTsqG1Vzom+3lqNTGJEi23xQF
	70FbEikRkgZL+gHnVEx9Vm30MzfIVuWLVb1NFlodkqaWwXBNxvfrBGOu09nvQETbjw2RJtkITL5BU
	hTaucofpfji5KrAp9iIMu5h1saCnU2Yee9Xn3d+Vbhpq9WIkyUHeZ2zTTs5IAen9CxzT8M2WlYd3O
	LPYPdA5x36zjLglgboPhXBHCAjrfiULc18j83ToXGl1FWdKW7xKHSDbKwv4ypidmQWgSX02Arpj49
	s6F+6KjCpE85/9hbIpij80Ts8isqWm5JYUnUyzF+JaAsH8iDcVGxisJyUfi/2W+/goK6ck9Fhofo6
	CRqB7hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzEq-00000005pMf-2uHD;
	Fri, 29 Aug 2025 13:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwfF-00000005NXg-3Tm8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:49:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E44C419F0;
	Fri, 29 Aug 2025 03:48:52 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 588D73F694;
	Fri, 29 Aug 2025 03:48:59 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <20250829-satisfied-carp-from-camelot-bddbfa@sudeepholla>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-2-82c982c1815a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-sm-misc-api-v1-v3-2-82c982c1815a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_034901_950637_B0CA4C4E 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Aug 27, 2025 at 12:59:14PM +0800, Peng Fan wrote:
> MISC protocol supports discovering the System Manager(SM) build
> information including build commit, build time and etc. Retrieve the
> information from SM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index a8915d3b4df518719d56bfff38922625ad9b70f6..464afeae8267d8c1eca4c4d5e008eca6d741c6ff 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -25,6 +25,7 @@
>  enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -65,6 +66,15 @@ struct scmi_imx_misc_ctrl_get_out {
>  	__le32 val[];
>  };
>  
> +struct scmi_imx_misc_buildinfo_out {
> +	__le32 buildnum;
> +	__le32 buildcommit;
> +#define MISC_MAX_BUILDDATE	16
> +	u8 builddate[MISC_MAX_BUILDDATE];
> +#define MISC_MAX_BUILDTIME	16
> +	u8 buildtime[MISC_MAX_BUILDTIME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -272,6 +282,33 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *ph)
> +{
> +	char date[MISC_MAX_BUILDDATE], time[MISC_MAX_BUILDTIME];
> +	struct scmi_imx_misc_buildinfo_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_DISCOVER_BUILDINFO, 0,
> +				      sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		strscpy(date, out->builddate, MISC_MAX_BUILDDATE);
> +		strscpy(time, out->buildtime, MISC_MAX_BUILDTIME);
> +		dev_info(ph->dev, "SM Version\t= Build %u, Commit %08x %s %s\n",
> +			le32_to_cpu(out->buildnum), le32_to_cpu(out->buildcommit),
> +			date, time);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
> @@ -299,6 +336,10 @@ static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
>  	if (ret)
>  		return ret;
>  
> +	ret = scmi_imx_misc_discover_build_info(ph);

To align with other naming,

s/scmi_imx_misc_discover_build_info/scmi_imx_misc_build_info_discover/

> +		return ret;

The document in 1/6 didn't state this as mandatory. IMO, it is not
fair to return error if the return is NOT_SUPPORTED.

-- 
Regards,
Sudeep

