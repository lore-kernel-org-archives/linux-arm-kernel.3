Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9780CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3wcRUmSikoBCQF+CNPeyDv9XIbbyyW5j915+lHAQNs=; b=sNRt73PXSHRc/Za0hxOvxfP4x7
	vTEsj/35q8dfp6VdMez5Rg6ER0uxVIKUwmf8CV3fq0tFJDqCzA142FE2zc5OFC3alWcKYqElq7B2A
	7k909Nhg+PNBGAPmbuePQdMuZhT/owzuiGwsNT/E2izxtYlKQtBlto4kqjlNa23t0yftzbqI+WBT3
	ndgU6XupULM5STYiQUNUgSd58DtzayO37DL0e1CnWjyn8JDGMgdN1yx0MVaT/akOQzTPwUZ/NJDM+
	Tyo4ygQt2Uczht8oNkh+p7tcdiU4EWGQjf9v2+6V2ahTjth0HRWHVoHJ9dyreARgfYzQXadSTcRTZ
	TX1AEIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaoT-0000000GxcE-1nPV;
	Mon, 08 Sep 2025 12:17:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZfV-0000000GXfn-1tBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:04:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B7961692;
	Mon,  8 Sep 2025 04:04:08 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA1C53F63F;
	Mon,  8 Sep 2025 04:04:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:04:12 +0100
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
Subject: Re: [PATCH v4 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250908-sparkling-owl-of-judgment-f17eeb@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
 <20250904-sm-misc-api-v1-v4-5-0bf10eaabdf1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-sm-misc-api-v1-v4-5-0bf10eaabdf1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_040417_522898_B510482E 
X-CRM114-Status: GOOD (  17.50  )
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

On Thu, Sep 04, 2025 at 06:40:46PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 83 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 23 ++++++
>  2 files changed, 106 insertions(+)
> 

[...]

> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 27bd372cbfb142b6acb0b1cf4b82f061529d0d45..ed78660d2f51c554e782b2f665e5bc5046678fd1 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -52,6 +52,27 @@ struct scmi_imx_misc_ctrl_notify_report {
>  	unsigned int		flags;
>  };
>  
> +/*
> + * For more detailed information, need check i.MX SM firmware file:
> + * devices/{SOC}/sm/dev_sm_system.h
> + */
> +struct scmi_imx_misc_sys_sleep_rec {
> +	u32 sleepentryusec;	/* System sleep entry latency */
> +	u32 sleepexitusec;	/* System sleep exit latency */
> +	u32 sleepcnt;		/* System sleep counter */
> +	u32 wakesource;		/* IRQ/exception causing system wake */
> +	u32 mixpwrstat;		/* MIX power status */
> +	u32 mempwrstat;		/* MEM power status */
> +	u32 pllpwrstat;		/* PLL power status */
> +	u32 syssleepmode;	/* System sleep mode */
> +	u32 syssleepflags;	/* System sleep flags */
> +};
> +

Much better now. But I am still thinking if this must go to the document to
make sure it remains ABI and firmware can't reorder the as we might have no
way to deal with that. That's the reason I was asking for raw dump so that
you need not put all these details in the spec/document.

> +struct scmi_imx_misc_syslog {
> +	struct scmi_imx_misc_sys_sleep_rec syssleeprecord;
> +	u32 deverrlog; /* device err log: timers, clocks, console and etc */

This is open ended, please add this to the document and make it more precise.

-- 
Regards,
Sudeep

