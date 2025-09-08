Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08EECAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcR3l8/O8LRSAPd+LbEIyEmJcEWs9HVTUs22X8Fpny4=; b=JxeceSbfL/pIDtNGwyM703/Knz
	GMd0jGRjQ3HhUEo2YmQWyUlKvPdhL6wpNlDnYtcR7xB/7S6n7GJjHs3XU9wmkibhv72OFEF0N4NI8
	fpNNyE4+AhWP6SeMj++Yi9anuqk0beXolrENpU17a4jcFBY2LyXi44CMI1pDKIa2G65RxnPrqqd/z
	PSuzDSUAssITUPQWY6fhpV4C4ItbyNP6umi60OIxvulWQPt+CC+JUkyFXwl8yGqXOsqBv3Hq+C/K9
	Ip/jDbsyrA+X9TRCPZKlotCoeQkOGWyzVnO4pZNnhY2ebi5Ae/oRj68g8f4jf240mG09BUe8H0mgm
	4ajUQF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvatp-0000000GzGO-09aX;
	Mon, 08 Sep 2025 12:23:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZku-0000000GZ3E-2jwZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:09:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C02B01692;
	Mon,  8 Sep 2025 04:09:43 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37BA43F63F;
	Mon,  8 Sep 2025 04:09:50 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:09:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/6] firmware: arm_scmi: imx: Dump syslog and
 system_info
Message-ID: <20250908-brave-umber-spider-eb68bd@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_040952_734544_79AEE2D9 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu, Sep 04, 2025 at 06:40:41PM +0800, Peng Fan wrote:
> System Manager firmware provides API to dump board, silicon, firmware
> information. It also provides API to dump system sleep, wakeup
> information. So add the interface for Linux to retrieve the information:
> 
> patch 1 is to add doc for board information which was missed before.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Patch 1: Typo in commit log, state the attribute is set to 0 by firmware
>            add NOT SUPPORTED return value for syslog
> - Patch 2: rename to scmi_imx_misc_build_info_discover, add -EOPNOTSUPP check
> - Patch 3: rename to scmi_imx_misc_cfg_info_get, correct command order,
>            add -EOPNOTSUPP check.
> - Patch 4: correct command order, add -EOPNOTSUPP check.

I will queue 1-4/6 from this series as it is ready. So repost 5-6/6 when
ready. Also I notices some inconsistency with CONTROL vs CTRL in the code
and document. Please choose either CONTROL or CTRL and use the same
in both document and code for the command names and send a patch to fix
the inconsistency.

-- 
Regards,
Sudeep

