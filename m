Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1DAC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHlIoht654BHYI7ITwfSJSOjwMuDe0gRbI84Q1/Mu4s=; b=11428QV94yxCN+/3gm60u2w253
	Zy+xzK9sPWdKDj7ZJdvxcTdxaGWl3uCcKNsJql/MztgPf0fvqe8kuqodknuM6Lj3fII4C0pH4/Bgx
	d5NeAfNsRhESe46GkQu3EcpEXSECK9K/0j9P7cxCFKHJ192rvOEjwMpSgUnQCG/n71hZO21PdnNw/
	PQ6hnjUBPQ3PxTkUiM+nxUyuDiH+ppKbmfakcwk/39pVtTzWquC6PG7Lsts1JEF2/92ZyxAODo77e
	07C/HEtp3ShwMWbu7vFPHRxr1iZKmMq/6Yl5q8X1FSY7lY03bG8QZEDDmcyWsRtJk+U6TUZ+pg+o2
	+dG6DUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV95C-0000000Elji-3JfU;
	Fri, 27 Jun 2025 13:25:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8T8-0000000EgEn-2SeI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:46:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80BC71A00;
	Fri, 27 Jun 2025 05:45:56 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBE523F58B;
	Fri, 27 Jun 2025 05:46:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:46:03 +0100
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
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <aF6Si846xCR5_z-z@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_054614_660485_ECB207AE 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, Jun 27, 2025 at 02:03:44PM +0800, Peng Fan wrote:
> System Manager Firmware supports getting board information, add
> documentation for this API
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index 4e246a78a042a79eb81be35632079c7626bbbe57..ac82da0d1e5ce5fa65a5771286aaebb748c8a4e6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -1670,6 +1670,26 @@ protocol_id: 0x84
>  |uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
>  +--------------------+---------------------------------------------------------+
>  
> +MISC_BOARD_INFO
> +~~~~~~~~~~~~~~~
> +
> +message_id: 0xE
> +protocol_id: 0x84
> +
> ++--------------------+---------------------------------------------------------+
> +|Return values                                                                 |
> ++--------------------+---------------------------------------------------------+
> +|Name                |Description                                              |
> ++--------------------+---------------------------------------------------------+
> +|int32 status        |SUCCESS: config name return                              |
> +|                    |NOT_SUPPORTED: name not available                        |
> ++--------------------+---------------------------------------------------------+
> +|uint32 attributes   |Board specific attributes                                |

..what's in here ?

> ++--------------------+---------------------------------------------------------+
> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
> +|                    |to 16 bytes in length                                    |
> ++--------------------+---------------------------------------------------------+
> +
>  NEGOTIATE_PROTOCOL_VERSION
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>

..other than this, LGTM.
  
Reviewed;by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

