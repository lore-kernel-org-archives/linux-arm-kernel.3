Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C726C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdoKyF5MtOjlwYqwP/TZTUq2HvlCQbKw0m9+d8vGiZg=; b=2B6yCj0/STaP5YVwcFgUVGBtsV
	M62yj0hripinIp3HZKR/YHBT1EBOIPd71jyTM4HZfE+McJqB3K4UNjQ+mOZIWdlg4aMAtOUpn2Xhb
	dPzftL8Nk73O8A/zkbMQoaLI8aZs4hr1xuqLxt9Edwh+P0832rbp/rwVxBMEZR5uiD70Dun7srvFm
	6EY0qcncgsxNjzDZ4MwiecJkauEmgwfwjb5UYM2cX1vMTWjfK6PZ78tXk+gan1o4d3j6WnGNgYT5r
	Z6R+oMk/e0YVHDppR7IvyuYiRILh6WjmqIeCT0WTVp6dk8suWr9TFlEli5hdMPRSJsTTsUbuTWZYl
	MV5FgolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Cb-00000008vt5-2Hru;
	Wed, 02 Jul 2025 16:20:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzH9-00000008leF-1cz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:21:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C79B91424;
	Wed,  2 Jul 2025 08:21:14 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBA783F6A8;
	Wed,  2 Jul 2025 08:21:27 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:21:24 +0100
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
Subject: Re: [PATCH 1/7] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <aGVOdN6v9x7Pt-5n@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-1-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082131_469347_1387BD9C 
X-CRM114-Status: GOOD (  18.01  )
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

As suggested, please add current definition of the values.

> ++--------------------+---------------------------------------------------------+
> +|uint8 boardname[16] |Board name. Null terminated ASCII string of up           |
> +|                    |to 16 bytes in length                                    |

How does this match with the information from the DT ? Will they be in sync ?
I understand NXP being silicon vendor, wants to have vendor extensions. But
any board information comes from the OEMs/ODMs. Do you expect them to change
their SCMI firmware. That's not the general expectation, so I am bit puzzled
on this whole BOARD_INFO interface. Please help me understand the motivation
for this new interface.

-- 
Regards,
Sudeep

