Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD4C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0tLEPLxHmg3zqDp21+/ni/sClIuCi/LkZOEiMOcP+g=; b=SHswqpNULAiwKCTTGL1Cj+E3Us
	GZOC4mdzZPaHMWIJEDH9HHjEiukKGQOjlKGy74vN4TGMzofO9hfnJ19IInSIuB7LQnfRepH7fiNoF
	VM8NT/qpHnfBSv71nWsus4/v6cYWRL9cgKrWiGe3iiJf5TViviq7RmM03K6uR/IySQRX3Uz9vnlgl
	5LJ8v1OAKGDQ5DwBV9Q+hk7IMbI7sVW6V1Veb25IP0zAouLp7hb8zBfCuUP7UzZ1rgzCniJzk/6WY
	pYSHOOoNE40i7OBy2yqwLdwag0l5BGZHds+ASIO2JVgQ0XJ9k68tyFNMRy2eTV0So7eGv48ffV4Gm
	pY3bU6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUs5-00000009Zqw-27h5;
	Wed, 25 Jun 2025 18:29:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURV9-0000000926f-3Zmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:53:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C070D106F;
	Wed, 25 Jun 2025 07:53:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F42D3F58B;
	Wed, 25 Jun 2025 07:53:24 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:53:21 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 0/7] Introduce SCMI Telemetry support
Message-ID: <aFwNYf2T8USGW2au@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250624102233.mdvffjvilozfz25f@lcpd911>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624102233.mdvffjvilozfz25f@lcpd911>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_075327_973887_DBDE98FD 
X-CRM114-Status: GOOD (  48.75  )
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

On Tue, Jun 24, 2025 at 03:52:33PM +0530, Dhruva Gole wrote:
> Hey Cristian,
> 

Hi Dhruva,

thanks for leaving your feedback.

> On Jun 20, 2025 at 20:28:06 +0100, Cristian Marussi wrote:
> > Hi all,
> > 

[snip]

> > 
> >  2. an alternative and surely more performant API based on chardev file_ops
> >    and IOCTLs as described fully in:
> > 
> > 	include/uapi/linux/scmi.h
> > 
> >    This, in a nutshell, creates one char-device /dec/scmi_tlm_0 for-each
> >    SCMI Telemetry instance found on the system and then:
> > 
> >    - uses some IOCTLs to configure a set of properties equivalent to the
> >      ones above in SysFS
> >    - uses some other IOCTLs for direct access to data in binary format
> >    - uses a .read file_operations to read back a human readable buffer
> >      containing all the enabled DEs using the same format as above
> > 	<DE_ID> <TIMESTAMP> <DATA_VALUE>
> >    - (TBD) uses .mmap file_operation to allow for the raw unfiltered access
> >      to the SCMI Telemetry binary data as provided by the platform
> > 
> > This initial RFC aims at first to explore and experiment to find the best
> > possible userspace API (or mix of APIs) that can provide simplicity of use
> > while also ensuring high performance from the user-space point of view.
> 
> I think the IOCTL based API and then a userspace tool that can use these
> sounds good for now.
>

Definitely better for performance...

> > 
> > IOW, nothing is set in stone as of now (clearly) some of the alternative
> > options going ahead are:
> > 
> >  A. shrinking the gigantic SysFS above to keep only a few of those knobs
> >     while keeping and extending the chardev API
> > 
> >  B. keeping the gigantic FS for readability, but moving to a real
> >     standalone Telemetry-FS to overcome the limitations/constraints of
> >     SysFS, while keeping the chardev/IOCTL API for performance
> >     (not sure anyway the gigantic FS would be acceptable or makes sense
> >     anyway)
> > 
> >  C. keeping the gigantic FS but move it to debugfs so as to provide it
> >     only for test/debug/devel, while keeping only the chardev/IOCTLs as
> >     the production interface
> 
> 
> As for this series, I would support the motion to move this to debugFS.
> Similar to how we have /sys/kernel/debug/scmi/0/raw ...
> I think grouping telemetry too under the same debug/ interface makes more
> sense to me.
> 

... indeed all of this was initially prototyped under debugfs in

	/sys/kernel/debug/scmi/0/telemetry

The thing is, of course, anything there is doomed to be axed in a
production system....so you would loose the human-readable and easily
scriptable API...while moving to sysfs is probably less of acceptable
for a number of reasons (like multi value files...)

... so for these reasons I would also be tempted by a variation of B:

 - a standlone full-fledged filesystem to overcome sysfs limitations,
   but stripped down a bit to avoid the full-depth of the above sysfs
   tree (say dropping the DEs dedicated subdirectories), and augmented
   with some dedicated file and related IOCTL/file_operations based binary
   interface as described in the current uapi, so as to avoid additional
   dedicated char-devices to cope with

> > 
> > ... moreover we could also additionally:
> > 
> >  D. generalize enough one of the above choices to make it abstract enough
> >     that other non-SCMI based telemetry can plug into some sort of geenric
> >     Telemetry subsystem
> 
> To my knowledge, I don't see that many users of firmware based telemetry similar to how
> SCMI telemetry is being proposed. So maybe at the moment a whole new
> telemetry subsystem might be an overkill.
>

Yes...and  indee  this would be a nice to have, BUT at the moment being SCMI
the one and only user of this new subsystem, I would NOT even have
enough non-SCMI use-cases to look at in order to generalize and abstract
some common features...
 
> > 
> >  E. explore completely different APIs to userspace (netlink ?)
> > 
> >  F. additionally serve some of the DEs in some existent Kernel subsystem
> >     (like HWMON/IIO/PERF...) under the constraint discussed above (i.e.
> >     userspace has to tell me which DEs can fit into which subsys)
> 
> Perhaps in the future...
> 
> As a user, having used hwmon in the past, and also looking at the SCMI spec example
> of capturing the output of a sensor which measures the temperature of a PE
> 
> Here's some points that support that:
> 
> * HWMON is a well-established interface for exposing sensor data (temperature,
> voltage, current, power, etc.) to userspace via sysfs.
> 
> * Many userspace tools (e.g., lm-sensors, monitoring dashboards) already 
> understand HWMON.
> 

Absolutely, but, just to be clear, here I am talking about adding some of
the discovered Telemetry DEs also as additional sensor devices to HWMON,
BUT any existing sensor discovered via the SCMI Sensor protocol (0x15)
which is currently fed into HWMON or IIO will STILL be handled by those
subsystems....

> * Well-known/architected SCMI DEs (like temperature, voltage, power)
> directly map to HWMON sensor types.
> 

...well the thing is, while you can be sure that a DE is a temperature
you cannot automatically be sure of WHAT it is really measuring (name is
also optional) OR if it fits (or you want it to fit) into HWMON or IIO
subsystems...IOW there are NO well-known/architected DE beside a few
general events in the 0xA000-0xA013 range...

> However I can see that we may hit a limitation with that with the amount
> of flexibility in SCMI telemetry, it may not always fit well in hwmon.
> 
> But, I think we can still leverage hwmon for telemetry related to power/
> sensor related info.
> 

Absolutely, but as of now I think Kernel needs some sort of feedback/config
info from userspace to identify WHAT is fine to be registered with HWMON/IIO/PERF
etc etc...since userspace is where the precise semantic decription of what-the-hell
0x1234 ID represents on the specific platform...
(so that is the reason for still NOT having this mechanism in this series...)

> The question about how do we differentiate between the above subsystems
> is still open. Do we expect telemetry to purely come from the firmware
> once the kernel is booted up already and is limited in the scope of what
> it knows about the system its running on?
> Or, can we somehow use DT to specify the subsystem we are interested in
> based on the telemetry "number" and some compatible?
> 

I dont think DT is a viable option for this kind of descriptions...I was
more thinking about an extension of (whatever we choose as) API which
a userspace app can use to select which DEs is approriate for a specific
kernel subsystem (f anything)

> > 
> >     NOTE THAT, this latter solution CANNOT be the only solution, because
> >     all of the above subsystem (beside PERF) expose a SysFS-based userspace
> >     interface (AFAIK), so, using their standard well-known interfaces WON'T
> >     solve the performance and scalability problem we have in our SysFS.
> > 
> > Beside all of the above, the specification is still in ALPHA_0 and some
> > features are still NOT supported by this series...
> > 
> > ...and of course any form of documentation is still missing :D
> > 
> > Based on V6.16-rc2.
> > 
> > Any feedback welcome,
> > 
> > For whoever had the gut to read till here :P ...
> 
> Hehe.. somehow managed to read it all :P
> 

...congratulations ! (I have no prizes to distribute, though :P)

Thanks
Cristian,

