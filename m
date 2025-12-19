Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E57DD767CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7insHclYPPLZDnO8ETKR/47qAByg5PQzeCn4ONLjkJc=; b=enA6cuIAKPNYw641MxUeikIZgt
	y9aR6CeiytehfcTwRLIn4aGlGGUS3+2Bd8cqIgPwE6j6T+k+JA1JYqM2ZwWWyFXciPTmtxYQnU76c
	Yy/hRoc2dSdYXMIFGuw+6Og90J/nrM9+P9phhMNEYoKeHaB5nne6qruVxVnfVK/uPmqfT7lSElYgC
	SlFf3yUzhibgkg5w3o3sw5QYdOFvoptoSc5nth14u/0lpXp9IPu54u54P7VtS83BwpGk0E+cTGizL
	FTtouK+/+tg0mCIscpvmQGA0LWlnwAKxbIQczT+L2xkLEaM6bALUQ+oyEGpj/SN70LaKfuVMyFlIi
	Ani5aBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXuk-0000000A8lM-01Ka;
	Fri, 19 Dec 2025 10:40:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXug-0000000A8kl-20NM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:40:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30EE4106F;
	Fri, 19 Dec 2025 02:40:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED14D3F5CA;
	Fri, 19 Dec 2025 02:40:42 -0800 (PST)
Date: Fri, 19 Dec 2025 10:40:40 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
Cc: <salman.nabi@arm.com>, <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<mark.rutland@arm.com>, <ardb@kernel.org>, <chao.gao@intel.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sdonthineni@nvidia.com>, <vsethi@nvidia.com>,
	<vwadekar@nvidia.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Message-ID: <20251219-hairy-mighty-scorpion-fbed46@sudeepholla>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
 <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
 <29248f8c-b57d-4818-851c-7905dc9f8317@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29248f8c-b57d-4818-851c-7905dc9f8317@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_024046_554521_0C89D9EF 
X-CRM114-Status: GOOD (  25.54  )
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

On Fri, Dec 19, 2025 at 12:26:30AM -0800, Vedashree Vidwans wrote:
> 
> On 12/9/25 03:47, Sudeep Holla wrote:
> > On Mon, Dec 08, 2025 at 10:13:14PM +0000, Vedashree Vidwans wrote:
> > > - Update driver to be in-built kernel module. This will ensure driver is
> > > installed in kernel and would not require any user intervention.
> > > - Register the LFA driver as a platform driver corresponding to
> > > 'armhf000' device. The driver will be invoked when the device is
> > > detected on a platform.
> > > - Add functionality to register LFA interrupt in the driver probe().
> > > This LFA IRQ number will be retrived from the LFA device node.
> > > - On IRQ, driver will query FW component details and trigger activation
> > > of capable and pending FW component. The driver will loop to update FW
> > > component details after every successful FW component activation.
> > > - Mutex synchronization is implemented to avoid concurrent LFA updates
> > > through interrupt and sysfs interfaces.
> > > 
> > > Device node snippet from LFA spec[1]:
> > > fwu0 {
> > >      compatible = "arm,armhf000";
> > >      memory-region = <&fwu_payload>;
> > >      interrupt-parent = <&ic>;
> > >      interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
> > > };
> > > 
> > 
> > This will be gone in the latest beta of LFA, so please discuss and get
> > an agreement for the LFA device tree bindings.
> > 
> > We don't just use ACPI HID as devicetree compatibles. There are more
> > aligned with ACPI CID IIUC but I don't expect you to use ACPI CID just to
> > match DT compatible as ACPI HID will be defined for LFA.
> > 
> Thank you for your comment.
> Sorry I haven't completely understood the concern here. I am using the ACPI
> HID and device node compatible string provided by the LFA spec.

Yes I know, but take a look at updated specification please [1].

> Please find below ACPI and device tree node from the spec for reference.

Yes they are obsolete as they no longer align with the latest specification.

> In case the LFA spec is updated, I will revise the driver implementation.

Indeed, that is the expectation. That's exactly what I meant.

-- 
Regards,
Sudeep

[1] https://developer.arm.com/documentation/den0147/1-0bet1

