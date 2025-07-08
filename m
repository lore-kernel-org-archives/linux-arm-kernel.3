Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EA1C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1rJXzvtMBbQl6xx+nJryzYS7VV+lk9NQuNQJgNsH7U=; b=EK0zqKlZsIJ41lMBJNWaWJp0vC
	yfiYmDdTmi3kNyO+WML76xFXh7aeEFCoNVLtpYE/qtckcc//qCh1voQYrxV4OU/h6iw5fWtanrBLa
	WrCtQi+mYt7QAYSAj1Tx0di8l+WG03dAQnuPDeqNLHANSKs5dVngnN9l3e8C7wZyhwrJWAFpCXXJT
	hAHqyVzcGuf8xPI8ZQbX6fE0RHBl86b9evvo9Y2RS0S+XlD9S0/WF3JiZhWOhba9wK91NMYaEh8AI
	kEMXH7BETeq/Xvs3bdDtzIi1+q6dP+k5DvTOSjkSJmd88W0LvhGOE32mPXDDY/naEdUDD1IX+WBVQ
	a6w3xjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAyu-00000005waF-1IYu;
	Tue, 08 Jul 2025 16:15:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAOe-00000005pvz-16FB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:38:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44D92153B;
	Tue,  8 Jul 2025 08:38:03 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F603F738;
	Tue,  8 Jul 2025 08:38:12 -0700 (PDT)
Date: Tue, 8 Jul 2025 16:38:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Chuck Cannon <chuck.cannon@nxp.com>,
	Souvik Chakravarty <souvik.chakravarty@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <20250708-spirited-pelican-of-renovation-f4218d@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
 <aGVOhMr7vg9Sl7Z2@bogus>
 <20250704051204.GB4525@nxa18884-linux>
 <aGeX5NQycd5WFxZ8@bogus>
 <20250708161006.GA13177@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708161006.GA13177@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_083816_390981_6595A221 
X-CRM114-Status: GOOD (  38.80  )
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

On Wed, Jul 09, 2025 at 12:10:06AM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Sorry for late reply.
> On Fri, Jul 04, 2025 at 09:59:16AM +0100, Sudeep Holla wrote:
> >On Fri, Jul 04, 2025 at 01:12:04PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> On Wed, Jul 02, 2025 at 04:21:40PM +0100, Sudeep Holla wrote:
> >> >On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
> >> >> MISC protocol supports discovering the System Manager(SM) build
> >> >> information including build commit, build time and etc. Add the API
> >> >> for user to retrieve the information from SM.
> >> >> 
> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> >> ---
> >> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
> >> >>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
> >> >>  2 files changed, 47 insertions(+)
> >> >> 
> >> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> >> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
> >> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> >> @@ -25,6 +25,7 @@
> >> >>  enum scmi_imx_misc_protocol_cmd {
> >> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >> >> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >> >
> >> >I clearly missed to raise this point when the documentation for this command
> >> >was added. Anyways I assume, you had explored all the options before adding
> >> >this as generic tools may not be able to pick this up. Instead, I would have
> >> >just stuck with vendor version in the standard protocol with build number
> >> >embedded into it. The date and other info must be implicit from the build.
> >> >
> >> >I try to be more cautious and ask questions in the future as I don't want
> >> >vendor extensions to be dumping ground for really random things like this.
> >> 
> >> +Souvik
> >> 
> >> And Loop our firmware owner to help comment. I just add what the firmware
> >> supports here and allow linux to see the information when the firmware
> >> does not have uart output in some builds.
> >> 
> >> From SCMI spec, it does not restrict what vendor extensions should be like
> >> as I know. So I am not sure what we should do when we define vendor
> >> extensions and what I should do next for this patch.
> >> 
> >
> >Just to be clear, I am not against vendor extensions. I am just saying
> >this interface is not strictly needed. The vendor version could encode
> >this nicely and you could have a map. The only and main concern is having
> >such extensions will not help generic tools as these are very vendor specific.
> >
> >It is good to have firmware version and other related details in a standard
> >format that anyone can understand without the need to dig deeper into vendor
> >specific extensions.
> >
> >Again I am not saying to drop these interfaces, but you will get questioned
> >for its use in the kernel if that doesn't seem like the right approach.
> 
> This is mostly for debug purpose to export the build information to linux,
> such as firmware commit hash.
> 
> Should I still keep current patch, or do you have any suggestions
> with current SM API?  I think there is little chance to update SM to encode
> vendor version to include build date, build num, and commit hash.
> 

I am against using this in the way you are doing in 7/7(i.e. exposing to
the userspace). Just dump the info on the serial port from the init code.
You don't need to expose it scmi_imx_misc_proto_ops as well.

-- 
Regards,
Sudeep

