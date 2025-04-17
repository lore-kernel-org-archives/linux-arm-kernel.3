Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D3C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgqfxqMs7RAerErubuijnoOaZAs70qCfciS228FqSpw=; b=U1eyNpS3qvIL/QwDc0FSOCS6TJ
	MZ2dUxY0jx2m61NJxJee7ysGytira+rz1OHJYA1gXC/+aMW66EuG2eIkOGa6ed+HB1yX8jt0q13ba
	V1Jn3AWf3vuXYUOsp+zWvkKHphxTIvLAdbEjwG1Szunc6NZzBeWrJ7b/D1gMHSXawZXF7lFDbJOSx
	StJnMnTb8JAUGbg+YGbeetZD8AHuQhiVWjLPf3zFEGOor2OqQcUVHn/+2m+X1/RA8SGwwLNI/r8vh
	BeRq/JsgpE5hs5dNFbEdPYNo1p7wciG0t5jJAAvaXnUIE5R/9+NbXOG0EkpMYVsXEDHxgoxRQ2Yrp
	ndeWL51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NDM-0000000ClEc-325l;
	Thu, 17 Apr 2025 11:15:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5N8Y-0000000CjwW-05Dw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 11:10:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA3871515;
	Thu, 17 Apr 2025 04:10:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D1533F59E;
	Thu, 17 Apr 2025 04:10:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:10:25 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aADhoX4Rkx8Eu_er@pluto>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_041030_162226_148B5F66 
X-CRM114-Status: GOOD (  29.98  )
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

On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> 
> > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > +{
> > > > +	struct scmi_revision_info *rev = &info->version;
> > > > +	const char *compatible = NULL;
> > > > +	struct device_node *root;
> > > > +
> > > > +	root = of_find_node_by_path("/");
> > > > +	if (root) {
> > > > +		of_property_read_string(root, "compatible", &compatible);
> > > 
> > > Looks like you still only allow matching on the most specific compatible
> > > string.
> > > 
> > > As we discussed in the RFC thread, this will result in one quirk entry
> > > for each machine in a SoC family in case the issue is not machine
> > > specific.
> > 
> > Well, yes but the solution would be to add multiple compatible on the
> > same quirk line, which is definitely less cumbersome than adding
> > multiple quirk defs for the same quirk but does NOT scale anyway....
> > 
> > ...anyway I will add that possibility..or I am missing something more ?
> 
> I was referring to the need to match on other compatible strings than
> the most specific one. For the ThinkPad T14s the strings are:
> 
> 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> 	"qcom,x1e78100", "qcom,x1e80100"
> 
> Here you most certainly would not want to match on
> "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> of the SoC compatibles.
> 
> For the FC quirk we may have to match on compatible and then a single
> SoC entry could cover tens of machines (and their SKU variants).
> 
> of_machine_is_compatible() can be used to match on any compatible
> string, but not sure if that fits with your current implementation.
>  

Yes I know, it will need a bit of rework on my side...the problem is
that anyway does not scale at all, even though matching on SoC could be
less cumbersome ... and the reason is that it is fundamentally wrong
to match SCMI Quirks on anything different from the SCMI vendor/subv/impl_ver
since these are fixes/workarounds against quirks that are completely Vendor
and fw-version specific...

...instead now we are considering using compatibles to overcome the fact
that the vendor probably messed (or will mess up) also the side of
the story related to SCMI fw versions management ... "quirking" SCMI stuff
on platform/sku compatibles is basically a quirk against their broken
fw release process...

...moreover this kind of carpet-quirking that hides the issue on any possible
fw version gives ZERO incentives to the aforementioned vendor to fix its
firmware...(or it fw-release process)...

Indeed, cross posting from your other mail thread, as of now we cannot
even be sure if the Vendor has somehow already updated the SCMI-related
firmware NEITHER we can be sure about this in the future since it has not
even confirmed how they are (or they will) be handling the Impl_Version field...

Having said that, I would add that in this specific case (FC quirk) since the
only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
is having working FCs and, since it's clear that our lovely vendor wont
certainly break this other lovely OS way of working with SCMI, MAYBE it could
be safe to just apply the quirk to this Vendor forever no matter what the
platform or FW version will be in the future...(so not using compats at all)

...but I will be very happy to leave all of these political/phylosophycal
decisions to Sudeep :P

Thanks,
Cristian

