Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5677CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWL+71/1RKcCS0jbjJipjD66F33E97rGzkRTSMyfvpU=; b=1ZpWvIZWUV+hXe+wFW4ZeGVWJT
	RBKIEfJCjLAvwU2t7DOJwBqYC8P2NcBRbOcIDwxTSrIUW7/CM3wuV57tVdHrIrb07nMUaGwNNkBxZ
	40DdS4i+ua73PChYklRvVUB2y0Oov/6PpTpmKGM7oSx22mz5w20I+5Sh7G2cV+ELic3idlv31OWLW
	W+s0DhOE3huHaoJUFPMPPWxGro/j3FccRpLn+65q23pS3p3i7CylRa/sVbQv2BcWXx/3qNBT8m+Zm
	CzGdW+t/9lrN/GOrurU7cweIeh++VRQG1V4E+aOZCuVQu1HD2hhGOz9Y+uVB+l2KKnjdOpVWN7T0H
	Ex5vVuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwgz-00000005z8l-1eR4;
	Wed, 02 Apr 2025 11:55:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwY1-00000005xZu-2X91
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:46:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6526106F;
	Wed,  2 Apr 2025 04:46:23 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CBB53F694;
	Wed,  2 Apr 2025 04:46:17 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:46:14 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
 <20250402123503.GA23033@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402123503.GA23033@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_044621_727247_0414EF4A 
X-CRM114-Status: GOOD (  36.14  )
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

On Wed, Apr 02, 2025 at 08:35:03PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Thanks for reviewing the patch.
> 
> For comments that I am not very clear, I marked with [TODO] for easily
> jump to.
> 
> On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
> >On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
> >>  1 file changed, 801 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst

> >> +
> >> +PROTOCOL_MESSAGE_ATTRIBUTES
> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +message_id: 0x2
> >> +protocol_id: 0x80
> >> +This command is mandatory.
> >> +
> >
> >For completeness add parameters here for message_id as in the spec as it is
> >referred in the returned value and seems incomplete without it.
> 
> [TODO]
> Sorry, I may not get your point here. You mean below format?
> 
> +------------------+-----------------------------------------------------------+
> |message_id: 0x2
> |protocol_id: 0x80
> |This command is mandatory.
> +------------------+-----------------------------------------------------------+
> |Return values                                                                 |
> +------------------+-----------------------------------------------------------+
> |Name              |Description                                                |
> +------------------+-----------------------------------------------------------+
> |int32 status      |SUCCESS: in case the message is implemented and available  |
> |                  |to use.                                                    |
> |                  |NOT_FOUND: if the message identified by message_id is      |
> |                  |invalid or not implemented                                 |
> +------------------+-----------------------------------------------------------+
> |uint32 attributes |Flags that are associated with a specific function in the  |
> |                  |protocol. For all functions in this protocol, this         |
> 
> message_id is not put in the table, but it is list above just below
> the protocol name. I would prefer to keep current layout and align with
> the MISC and BBM protocol.
>

I meant why is the input parameter message_id not described in the table,
but is referred in the return values. For completeness, just add it even
though it may match the SCMI spec in terms of input parameter.


[...]

> >> +|                     |Bit[23] Valid err ID:                                   |
> >> +|                     |Set to 1 if the error ID field is valid.                |
> >> +|                     |Set to 0 if the error ID field is not valid.            |
> >> +|                     |Bits[22:8] Error ID(Agent ID of the system).            |
> >> +|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc)                |
> >
> >Is there a mapping for this ?
> 
> I will add a note in V4:
> See the SRESR register description in the System Reset Controller (SRC) section
> in SoC reference mannual.
>

A reference would be good here then. I would be hard to imagine what it means
otherwise.

> >> +
> >> +LMM_RESET_VECTOR_SET
> >> +~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +message_id: 0xC
> >> +protocol_id: 0x80
> >> +This command is mandatory.
> >> +
> >
> >I can't recall if I had asked this before. How is this different from
> >CPU_RESET_VECTOR_SET ? Why do you need this ? Why can't you use
> >CPU_RESET_VECTOR_SET with an additional LMM_* command.
> >
> >I am sure there is a valid reason. If so please document the same.
> 
> CPU_RESET_VECTOR_SET is for cases that M7 and A55 in the same LM.
> LMM_RESET_VECTOR_SET is for cases that M7 and A55 in different LM.
> M7 LM is under control of A55 LM
>

That still doesn't answer my question. I was asking why do you need this
extra interface ? If LMM_RESET_VECTOR_SET can take both cpu id and LM id,
it can be used even for cpus within same LM with current LM ID. Why the
need for separate interface ?

Other than these 2, I am fine with your response on all other comments.

-- 
Regards,
Sudeep

