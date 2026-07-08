Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF4EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1EJFaelHO7bNaahIRXhAl/2FMvk9KxgFAgA1vUqLzE=; b=M6S8awWqP8o0V4lKvo+b/HJm43
	tFLIAXgCWGUGkHmSbNDWSBr7UlElQ5ItMy5Gn8C6CRDrmnuj/RnFQOxzt+Vd0Z+pmpQzGHfZ+4NE6
	54K2oXtOcXQ/eK26t9MhV1DDzP3n5XsXXpjA7u9P7qS68T18gWPw6FNLr4V4lVI195+xW8D3aXgDz
	GSh934CeAbbP8yYQGNCO0SK8P1ucwSMquJNeoa4tU6hl4FKVlznkuv31Uk4E6a/ZWTjOzuI1u0yLU
	7qmxVVaPqUPD3P/RXCeVpRr1YpkAp+AldRBaGcvqu9SyrXR3hiGsobUTk0ephZ0ky388dO68iRhGh
	61BimTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYWn-00000000JzD-3gi3;
	Wed, 08 Jul 2026 20:05:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYWm-00000000Jz1-2DH9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:05:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D12186001A;
	Wed,  8 Jul 2026 20:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7901F00A3A;
	Wed,  8 Jul 2026 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783541151;
	bh=o1EJFaelHO7bNaahIRXhAl/2FMvk9KxgFAgA1vUqLzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PKe0TAYrF4r7bSEOsyphJGiu7RFb+OCdl1cxMhleIAf8qzIssF8tyfLlaD/cTpeKz
	 CyzrD4glps68+f+4G4ujEECxJ19TuLQXU0tnw874kRLitzzmxdpguy2daKpn3bHyJM
	 keIkQoQvte3U4KEGmyNSsfI/Ni+D4sl+W38LO/srGRm5iWh5A6TDax+D41222+hhvQ
	 CPocsSDISMEPpFBE76l5vy4S7CxVZ3hdpLm/jjUg0c00GzpNMeUZ+Vo1LPulgufLbs
	 3P9BXyDv9bwLKUrFGWVgVmrzJc1QsN6Vct75KTYIKaX6PPdMC+568D82faTwt902FH
	 CgCOX3KzzOzTQ==
Message-ID: <acf4d604-3081-463c-892f-12c01533c31d@kernel.org>
Date: Wed, 8 Jul 2026 22:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/23] Introduce SCMI Telemetry support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 sudeep.holla@kernel.org, james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
References: <20260703123601.381275-1-cristian.marussi@arm.com>
 <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260707063137.3222972-1-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 7/7/26 08:31, Subrahmanya Lingappa wrote:
> Hi Cristian,

Hi!

Thanks for having a look. Christian is out this week, so let me ask some
clarifying questions and raise some points.

> 
> Thanks for posting this. I think the direction of not forcing these
> Telemetry Data Events into hwmon/IIO/perf prematurely is the right one.

Good.

> The cover letter explains the core problem well: most DE IDs are
> platform-defined, and without external metadata the kernel cannot reliably
> know whether a DE is a thermal sensor, a performance counter, a power value,
> or something entirely platform-specific.

Right.

> 
> That said, I think the current layering is still too SCMI-shaped for the
> ABI it is trying to introduce.

Just to be clear: the data is exposed through /dev/scmi/ device nodes. It is
expected to be very, very SCMI specific as it stands :)

> 
> The thing being exposed here is not only "SCMI Telemetry"; it is a more
> general kernel concept of telemetry:
> 
>   - enumerate provider-specific data/event descriptors
>   - expose capabilities, units, data format and topology/grouping metadata
>   - configure collection rate and collection mode where supported
>   - collect samples with timestamp/freshness/validity information
>   - track generation/state changes
>   - optionally expose provider-private raw backing storage for debugging

Yes, there are some generic concepts there. However, when we talk about
generalizing, I suspect that other telemetry implementations might vary quite
already even on these generic points?

In particular when it comes about enumeration (as discussed previously, some
telemetry solutions might expose way more detailed information about events) and
configurations (and, in particular, things like configuration groups).

But also efficient ways to receive data in user space.

I mean, sure, if someone uses the exact same concept but instead of calling it
SCMI, calls it XXMI, that's one thing.

But a true generic telemetry concept would have to take way more options into
account.

So defining something actual generic and extensible might be rather challenging,
no? And for that, I would expect a pretty good reason to do so.

"Make tool X easier to implement" would not be a good reason in my option. I'm
sure you have something in mind, what would that be?

> 
> SCMI is one provider of that model. It happens to transport the data through
> SCMI v4.0 concepts such as DEs, groups, SHMTIs and TDCF.

Right.

> But another firmware
> or control-plane specification could show up later with the same broad
> telemetry model and a different wire format. Call it XXMI or YYMI: the

"could" is a bit vague. Do you have any concrete examples in mind? It will be
rather challenging to figure out what's generic without other real examples.

> protocol mechanics would differ, but the kernel consumers should not have to
> learn a new in-kernel and userspace ABI for each one.

So far, the tools that consume this data are expected to be very platform specific.

IOW, not your ordinary perf/top/whatever :)

Assuming there is some XXMI telemetry in the future, I would expect tools that
could operate across multiple platforms to build upon some generic user space
library that abstracts these things and knows how to talk to the different devices.

> 
> The common ABI should therefore avoid treating the DE numeric namespace or
> the wire/storage format as the abstraction. The useful common contract is
> closer to:
> 
>   - what is being measured: component/type/instance/name;
>   - how to interpret it: unit, exponent/rate unit, data width and signedness;
>   - how it behaves: instantaneous, accumulating, average, state/counter, etc.;
>   - how it is controlled: individual event vs group-wide collection;
>   - how fresh it is: timestamp, sequence/generation and validity/error flags.
> 
> So I would strongly consider inserting a generic telemetry layer above SCMI,
> with SCMI registering as a telemetry provider rather than owning the stable
> userspace ABI directly.

Again, I think that's rather hard. And it's not immediately clear to me why this
abstraction must be had in the kernel, instead of in user space?

So it would be good if you could elaborate on that.

> 
> Roughly:
> 
>   drivers/telemetry/
>       provider registration
>       descriptor/sample/config abstractions
>       generation tracking and poll support
>       common userspace ABI

That will be a struggle to define in a future-proof way I'm afraid.

> 
>   drivers/firmware/arm_scmi/telemetry.c
>       SCMI protocol implementation
>       TDCF/SHMTI/notification parsing
>       translation into generic telemetry descriptors/samples
> 
>   optional provider-private raw/debug path
>       SCMI SHMTI mmap or dumps, if kept, behind explicit privilege/debug
>       policy rather than as the baseline telemetry ABI

That makes the SCMI SHMTI mmap interface a second-class citizen, which IIUC is
rather bad performance wise.

> 
> With that shape, future in-kernel consumers could bind to generic telemetry
> objects and capabilities instead of SCMI internals. Architected/well-known
> DEs could later grow adapters into hwmon/IIO/perf where the semantics are
> clear, while platform-specific DEs remain available through the generic
> telemetry interface plus userspace metadata.
> 
> This would also help avoid making the SCMI protocol's internal resource
> storage part of the ABI. Right now the public protocol header exposes
> structures such as scmi_telemetry_res_info, scmi_telemetry_group and
> scmi_telemetry_de, and the chardev indexes those objects directly. That feels
> too tightly coupled for something that may need more consumers later. I would
> prefer copy-out or iterator-style provider ops instead, for example:
> 
>   info_get()
>   de_count_get()
>   de_info_get()
>   group_info_get()
>   intervals_get()
>   collection_set()
>   collection_get()
>   sample_read()
>   reset()
> 
> where the backing arrays, xarrays, lazy enumeration, SHMTI mappings and TDCF
> parsing remain private to the SCMI provider.
> 
> The sample side probably needs an explicit common result contract too. A
> sample is not only an integer value: it may have optional timestamping,
> provider data width, stale/not-yet-valid state, partial collection failures,
> hardware-fault indications, and a sequence/generation value that lets
> userspace detect races against reconfiguration or shared-memory updates. Those
> details can still be backed by SCMI-specific status codes and TDCF parsing
> internally, but I think the stable ABI should expose them in provider-neutral
> terms.
> 
> I would also be careful about freezing the raw SHMTI mmap part as a baseline
> ABI. It is useful for bring-up and high-performance tooling, but it exposes

Correct me if I'm wrong: most user space tools we expect will fall into the
category of "high-performance tooling"?

Or which tools do you have in mind that have different requirements?

> firmware-owned shared memory layout and TDCF parsing rules directly to
> userspace. If this stays, I think it should be clearly separated as a
> privileged/debug/raw provider facility, with a precise mmap contract:
> 
>   - required mmap length
>   - vm_pgoff semantics
>   - page alignment
>   - VMA flags
>   - cache/coherency expectations
>   - lifetime across reset/remove/reprobe
>   - required capability, if any
> 
> Even outside the raw mmap case, telemetry can be a sensitive high-rate view
> of system behavior. The ABI should make access policy explicit: who can
> enumerate, who can read, who can change collection state, and whether
> production systems can restrict sampling granularity or intervals
> independently of what firmware advertises.
> 
> For the stable telemetry ABI, I would start smaller: descriptor enumeration,
> sample reads with validity metadata, optional group-aware configuration, and a
> generation counter/poll mechanism so userspace can detect reconfiguration or
> partial re-enumeration races.
> 
> One other point related to this layering: configuration appears to be global
> to the SCMI instance. Any process opening /dev/scmi/tlm_N can change
> collection mode, sampling interval, DE enablement and timestamp state for
> other users. That may be OK, but it should be an explicit policy decision.
> A generic telemetry layer could make the model clearer: multi-reader with a
> privileged/single writer, or fully shared global controls, with instance-level
> locking and generation updates after each visible state change.
> 
> So my high-level suggestion for v6 would be:
> 
>   1. define the generic telemetry provider/consumer model first;
>   2. make SCMI Telemetry one provider of that model;
>   3. keep SCMI/TDCF/SHMTI details below the provider boundary;
>   4. keep raw SHMTI access separate from the stable ABI;
>   5. define common sample validity/freshness/error semantics;
>   6. add generation/poll semantics to the common ABI;
>   7. make lifetime, access policy and configuration concurrency explicit.
> 
> I do not think this invalidates the protocol work in the series. Most of the
> SCMI parsing and resource discovery can still be the provider implementation.
> The main question is where the stable kernel/userspace contract should sit.
> My preference would be that it sits at "telemetry", not at "SCMI Telemetry",
> so that SCMI, and any future XXMI/YYMI-style provider, can share one consumer
> interface.

Again, I'd like to understand why you think this abstraction should be had in
the kernel, when it could also be had in user space. I'm sure there is a good
reason you have in mind.

In particular, I am curious about tools you would expect to run across platforms
that would even care about this.

Last but not least, which other telemetry implementations do you have in mind
that are on the horizon?

In particular, I'm afraid a generic abstraction in the kernel for a handful of
specialized user space tools might take a rather long time to flesh out.

Finally, I wonder if something generic is really required when talking about an
ioctl interface. I would completely agree if we would be talking about something
like resctl, that actually exposes the data to user space in an abstracted,
easy-to-use fashion -- not just an ioctl interface to talk to a device

Thanks for taking the time to write all this up. I'll have to leave all the SCMI
details to Christian!

-- 
Cheers,

David

