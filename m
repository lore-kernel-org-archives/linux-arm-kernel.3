Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F767CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afXYt3L6qX8mO6fIBb3bx8iD1xtsMPHhnZMi54PeTQo=; b=y3iUiS9zcZ7uJXuq67i0YgBnCi
	EEIhpw9jy2DMaDA+VbRqp8CMyjlU4wN5Oc1cg45E2IqpPXrDuVQzeIwTkOYpNzi4oy276XMhp/L5j
	6EgMvUGVC8p8uh9xxDkKX+2ux/hYjoP1XU831t7b+oH+KC/PCSJpAP3N9aGEBKDMutuSPJ165/2iN
	hqw4a5LIZQUpLU8hs4G941bUAk1HYP2liD+QA0Sh8vwaA336+dWk0N+9Rz5gZ//Dd98r9KkB8sDPh
	5UnxNpuK3mqgWGdhPXCCUhVsqa9YDvrfp6kevICBeTHu1v17hNTP/IMNndlpjwu7vYDm9aOZvfG+a
	RBuhucgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urz9U-00000005otZ-06dM;
	Fri, 29 Aug 2025 13:28:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwaA-00000005Mw7-2YL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:43:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6341758;
	Fri, 29 Aug 2025 03:43:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F773F694;
	Fri, 29 Aug 2025 03:43:44 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:43:41 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <20250829-handsome-fast-clam-a35afd@sudeepholla>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-1-82c982c1815a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-sm-misc-api-v1-v3-1-82c982c1815a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_034346_686492_E9B31CA8 
X-CRM114-Status: GOOD (  14.78  )
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

On Wed, Aug 27, 2025 at 12:59:13PM +0800, Peng Fan wrote:
> System Manager Firmware supports getting board information, add
> documentation for this API

s/API/MISC_BOARD_INFO command/

> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> index 4e246a78a042a79eb81be35632079c7626bbbe57..0a4d157b3ea12c7735aa19d8d6c64ae8504d0c71 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> @@ -1670,6 +1670,28 @@ protocol_id: 0x84
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
> +|uint32 attributes   |Board specific attributes reserved for future expansion  |
> +|                    |without breaking backwards compatibility                 |

Is 0 the expected value in this version of the spec as it is just reserved ?
Please state the same explicitly here.

-- 
Regards,
Sudeep

