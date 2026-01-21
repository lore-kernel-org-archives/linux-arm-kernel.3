Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77FLW+hFAaPAiKNpklKaPeVzjA4aB/7X2TVtpwD5IuE=; b=0IrWvDP6ZI35aD/O+AOypLNtBu
	0F4FbApkzR5dLEytiGttiOQtBx2aQ/yZeD6uEb6s6OTjdDp3qjSbRxE2Kpgq8pKvB04OkZhT8JmVV
	gid8iIqOg+MtHRLaxHnRo0NI1I9l2EMWvg7F61tfhRJinMx5dIyM1Tb1Yn8tLkLjIraoBkizzzbh9
	XENjQgrTAZgyL4upMy7OqnpMCAoCni9HYA8xF0fiS95GsLN9L986jSFMNU/+JvY+H6LVplu4/w5/C
	ocpFEAYn+huSs2PDOY0kuP/00ztNsvuKvq53cWd1IAKGzT1TNykM56FHSTNB1Wi22a+VQjLcFUubJ
	xrMdQDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTlO-0000000573h-2k6m;
	Wed, 21 Jan 2026 08:40:30 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTlM-0000000573M-3Cj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768984828; x=1800520828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QIWNhkI3vNpRRJeiND+NuOqGf5F4BCHhNEQazA0NT4s=;
  b=iwUZeDVIraYRTFrNVXLp1WyRBEQH4lfWq+WkthWeMw1ljWFw0zgawfXG
   QM/iFUCZXSvvJAVRORlQrkB8vVaWLwHkgIWN7YGnzWt1Dnbs6Q/lJlN3l
   I32FDZgYLGbKbR6MEkLk7/M7izb4Zerobe/opHm6BiJo1rjsUbvswII1Y
   asUwjYsjHG5Jc4VGsYDRhB9n7vfXCHD4QprrAmAStfJedh1C1dXZ0ua61
   76mU1Z2lnCUOqJ68wrwXve/h25W2ja99uo3IMVQsb2JqeF+p4lQmv5lZ9
   agMSOMbICiSlAIuz4vXZKEhqa7gpItq7/fLt17IG/LuJOSl8stRi4TzGI
   A==;
X-CSE-ConnectionGUID: JYgeNQ36QmufBdJnXmA8og==
X-CSE-MsgGUID: LHH8zzP0S+WMMcctuSPZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81316363"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81316363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:40:28 -0800
X-CSE-ConnectionGUID: cPftjnRsTHem2pg/uuQD2g==
X-CSE-MsgGUID: SbSHcbw/R06YH6NTRflvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205527668"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.73])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:40:25 -0800
Date: Wed, 21 Jan 2026 10:40:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Mark Brown <broonie@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <aXCQ9jcpheMub8u3@smile.fi.intel.com>
References: <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
 <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
 <817bcc43-7f10-4329-8924-6c375eb73ff2@sirena.org.uk>
 <aW_zjaRLtewa_NV1@smile.fi.intel.com>
 <aW_1zlEdaPNwiXuI@smile.fi.intel.com>
 <6ad4387f-08b7-40e2-a2eb-1346d8af6ea3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ad4387f-08b7-40e2-a2eb-1346d8af6ea3@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_004028_907602_751929E6 
X-CRM114-Status: GOOD (  57.51  )
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

On Wed, Jan 21, 2026 at 09:11:04AM +0100, Michal Simek wrote:
> On 1/20/26 22:38, Andy Shevchenko wrote:
> > On Tue, Jan 20, 2026 at 11:28:50PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 20, 2026 at 09:04:58PM +0000, Mark Brown wrote:
> > > > On Tue, Jan 20, 2026 at 11:11:44AM -0800, Abdurrahman Hussain wrote:
> > > > > > On Jan 20, 2026, at 10:45 AM, Mark Brown <broonie@kernel.org> wrote:
> > > > > > On Mon, Jan 19, 2026 at 04:20:06PM -0800, Abdurrahman Hussain wrote:
> > > > 
> > > > Let me once more renew my plea:
> > > > 
> > > > > > To repeat once again:
> > > > 
> > > > > > | Please fix your mail client to word wrap within paragraphs at something
> > > > > > | substantially less than 80 columns.  Doing this makes your messages much
> > > > > > | easier to read and reply to.
> > > > 
> > > > > > To drivers that are used on ACPI systems, yes.  Many devices wouldn't be
> > > > > > used on ACPI systems, or would be expected to be exposed differently
> > > > > > (for example, hidden behind AML).
> > > > 
> > > > > This is not for a normal off the shelf server. In our case we are building an embedded
> > > > > switch with an AMD CPU and Xilinx FPGAs that happens to use EDK2 based BIOS and ACPI.
> > > > 
> > > > Sure, AFAICT it's mostly a PCI card with a bunch of stuff on it from a
> > > > software point of view.
> > > > 
> > > > > > > I am just trying to get this 2-line small change merged so we can start using the standard spi-xilinx driver today. I am not trying to boil the ocean.
> > > > 
> > > > > > I mean, adding a HID wouldn't take substantially more code.
> > > > 
> > > > > We could, but we don’t own the Xilinx IP blocks. Are we not justified in using PRP0001
> > > > > hack until the driver owner adds the HIDs? Wasn’t PRP0001 created as an escape hatch for
> > > > > these kind of scenarios?
> > > > 
> > > > No, it's more there for the cases where embedded ACPI systems need to
> > > > import non-trivial DT bindings so they can avoid having to respecify
> > > > things that ACPI really doesn't cope with or for local hacks.  See
> > > > Andy's reply earlier in the thread:
> > > > 
> > > >     https://lore.kernel.org/r/aW9JihlsjnJ-uBul@black.igk.intel.com
> > > > 
> > > > AFAICT for ACPI the HID assigment is a bit of a free for all in practice
> > > > - board vendors generally seem perfectly happy to just pick something if
> > > > the silicon vendor didn't do something.  Just look at all the parts with
> > > > INTxxxx IDs!  That said Michal is on the thread so hopefully that's not
> > > 
> > > INTxxxx was a (historical) mistake, but look at the correct one INTCxxxx
> > > which has listed several components Intel doesn't own. Because ACPI HID
> > > it's not only about the component in use, it's also about integration of
> > > that component in the platform environment. Hence it might require (platform)
> > > specific quirks.
> > 
> > Btw, you can look at the MIPI I3C HCI case. MIPI as an owner allocated generic
> > ID (which is usually represented as _CID in ACPI), AMD allocated their own one
> > _HID (compatible with _CID) exactly for the purpose of having platform quirks.
> > 
> > TL;DR: if you are 100% sure you have no HW integration issues, requirements, etc
> > and everything works as is, you can use Xilinx allocated id (assuming it will come)
> > for the given IP and use it directly as _HID, otherwise use that as _CID and
> > allocate your own for _HID.
> 
> I got in touch with respective AMD team about ACPI ID allocation. I also
> don't think it is going to be a problem to get unique one. And I expect
> device properties should pretty much match DT property names to be able to
> use the same device_property_read* helper function to read them. Andy:
> Correct?

Yes, the main issue I see is the enumeration by PRP0001 instead of by ACPI
_HID. Also note, whatever ACPI has supported in _CRS (resources) should be
used that way (memory, interrupts, DMA channels, etc).

> I am still trying to wrap my head around all these possible solutions for
> this problem or if we can solve it in a more generic way.
> 
> I can't see any problem with patches which are switching from
> of_property_read* to device_property_read.

Technically there is no issue with that, indeed.

> If driver also works without IRQ
> I think it is fine to make irq optional (which is 2/3 patch in this series).
> The patch 1/3 is the same as mine I sent in past
> https://lore.kernel.org/all/a527f5adffc6efe4c1ad2ccc40e1e095d73efe74.1749027112.git.michal.simek@amd.com/
> and it was rejected by Rob.

I think Rob is correct. But what's the problem to describe IRQ natively in _CRS
in ACPI via Interrupt() or GpioInt() resource? You mean there is no actual wire
connection to it?

> Andrew: thanks for sharing link to pcie driver with DT which is one solution
> which requires writing one PCIe driver and that's pretty much it.
> Obviously enable DT on x86 but that's not a problem for product based on
> embedded x86. But it can be a problem for standard distributions.
> 
> Then this ACPI way where it is not clear to me yet how to get information
> about clocks. The i2c Abdurrahman's patch is making clk optional
> https://lore.kernel.org/r/20260115002846.25389-1-abdurrahman@nexthop.ai
> But input_clk is used in reinit code that's why maybe it is working for the
> first time but in case of error not sure if driver really works properly.
> On PCIe clock for spi/i2c is likely only one and ACPI device property can be
> created to pass that information and call devm_clk_get_enabled() only in DT
> case.

On ACPI the clock are usually managed by firmware, but in new specification
we also have ClockInput() resource. I dunno if there is still a gap between
ACPICA and CCF to integrate that.

> And then you have DFL (drivers/fpga/dfl*) and aux bus
> (drivers/misc/keba/cp500.c) which pretty much targets similar setup.

-- 
With Best Regards,
Andy Shevchenko



