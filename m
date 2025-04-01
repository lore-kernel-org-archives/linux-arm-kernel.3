Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70205C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAZx0Q77a626X0mAZHiambKxmQIX6zwfbH34J1GYQug=; b=QukgOT3/ZhKCz4ezc+pVave+r/
	Qu7l3KB+WSJHq+kT6pzz1dlqcBBicR92RsO5znUlThgTwIDLVtqiSpjEz7sz06O9D3YFglRNlkI41
	5rPqKIL9T7Lxa18etsqX7GXonBZm4Ln+FBpeWnwLiYW7N9bnRhtOxzkPikfvTKL8XDUR+JdREEYIJ
	+uI9isliMVE4OknZSk9w6th6hF+YRLteM8CuZFk0rHE9kkfbSZc12W8PfyQD1x15sKyrlkAG/enZw
	3nI/x8ylQpNqGwQWblLuwahYTtre8HDK+u48veMWU2SCiEH/ewSOOZeEyVagA+YFbYuUSNndvbt6h
	nhG4jCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcmA-00000003bwp-3wlt;
	Tue, 01 Apr 2025 14:39:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcjM-00000003bZ5-44Ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 14:36:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA6E12FC;
	Tue,  1 Apr 2025 07:36:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAFE83F63F;
	Tue,  1 Apr 2025 07:36:40 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:36:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <Z-v579n5wuAqTuUW@pluto>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
 <20250401-magnetic-spaniel-of-influence-f3ee90@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-magnetic-spaniel-of-influence-f3ee90@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_073645_049429_0341B1DA 
X-CRM114-Status: GOOD (  14.76  )
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

On Tue, Apr 01, 2025 at 03:21:51PM +0100, Sudeep Holla wrote:
> On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > Add Logical Machine Management(LMM) protocol which is intended for boot,
> > shutdown, and reset of other logical machines (LM). It is usually used to
> > allow one LM to manager another used as an offload or accelerator engine.
> >
> 
> This and next patch LGTM. Just curious as why Cristian has given tags only
> for the drivers using these but not these changes.
> 
> Cristian, any specific concerns you had that had to be addressed or addressed
> in this version ?

I think I had some review comments on the previous version of this
series for Documentation and protocol....let me see wth I said about
this :D and if they have been addressed...

Thanks,
Cristian

