Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EE5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4muf8Q9Z/zFpZYejUjNdqgp9qaE7Uo8rr4SaE21UVuA=; b=MSAhfkTcvmVg6aB0+S3DzhjQDJ
	yzMcPu6mp5R/iCKLVSzgIm3X8qNMU/6hGeJeK5KCDcl3hCmcrQHuIat+Q5A+P5NU8AezZkGjLzMYN
	khwQLPgtDlIf9FT2zrhrJgABEaYUIHPGCl60rV3rCtfo7akxlerg5WfSw/UsrW96wzVLftXjl1Dt6
	QdAf+8lDSAEHk0bDN1cnDUtk/B8IxT3pUwVkm8cEa0lCKGYMgd2xBRD0/7g7VCWKziPjwoOb/VkEM
	zCJh4FSs/Z8PzVfcD8b245bU/uZARKEi69U7e7RORNJnlWN0RUXjM3K8NxPLzWcGZ0sDnWuOvq91Y
	Whl0macA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdnT-000000074S0-3Rkq;
	Fri, 03 Jul 2026 13:19:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdnR-000000074RD-03NL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:19:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B91C34637;
	Fri,  3 Jul 2026 06:19:02 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C30E3F85F;
	Fri,  3 Jul 2026 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783084747; bh=4xaNfFJ1zK6y0+CI9eOfDRmk44YI3NT0haxRqu9/c20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7eJzjqWFx1rsXxl6dzZC0aLr3CyxaiBao13LHNAdZkOf8hNRH6saaZRCg1ldRlfi
	 VvldnmTgvtAxrRthwtdjn7UlMpztDiyN9sL5KmZmBmiD+5Gmcc18zR9bRpf9t07Imp
	 l/xNDCsi/+55AvTR6Iq/emEikn6aNOSZGgXmS2EU=
Date: Fri, 3 Jul 2026 14:18:56 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jic23@kernel.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, souvik.chakravarty@arm.com,
	leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
	usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v4 00/31] Introduce SCMI Telemetry FS support
Message-ID: <ake2wFSSxD2Dnvyr@pluto>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260617-waten-allabendlich-zueinander-93d4b1367b8c@brauner>
 <ajLVW1eHzbGDm4yn@pluto>
 <29a304f0-1e62-418a-b84f-aabdc4c0de8d@kernel.org>
 <ajR_FBWOoXJKSeoH@pluto>
 <0025b907-27b9-4a51-b78f-f8ad413644d0@kernel.org>
 <ajU7UqwPZBlwRGkf@pluto>
 <eba18827-5ef5-464c-90f0-2444a996acac@kernel.org>
 <20260629-rangfolge-intellektuell-flagrant-2814268b9d66@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629-rangfolge-intellektuell-flagrant-2814268b9d66@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061909_471886_FCC304C0 
X-CRM114-Status: GOOD (  48.39  )
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

On Mon, Jun 29, 2026 at 10:22:46AM +0200, Christian Brauner wrote:
> > > Thanks a lot, David !
> > 
> > Let's hope for some guidance regarding the FS side soon.
> > 
> > But yeah, avoiding the in-kernel FS sounds completely reasonable at this point.
> 
> Afaiu, David wanted me to add a few comments on the viability of a
> character device for this.

Hi Christian,

thanks for Your feedback on this.

> 
> I think you usually have at least the following options:
> 
> (1) character device
> (2) notification pipe
> (3) netlink
> (4) well-known AF_UNIX socket
> 
> You then need to consider your constraints. David added a few:
> 
> (i) root can set properties (enable/disable events)
> (ii) non-root can only retrieve properties/events
> 
> I assume you mean real root, i.e., root on the host system or more
> specifically anyone with CAP_SYS_ADMIN or some other relevant
> capability.

Yes.

> 
> This is a rather simple model and gets a lot of head-scratching out of
> the way.
> 
> But root could also mean "root in a users namespace" which makes this
> more complicated as it effectively means that an unprivileged container
> would be enable/disable events. This makes sense if there's a subset of
> events that naturally lends itself to be charged to a container and that
> the container might have a genuine use for.

I had already ruled out any container support with the defunct FS
interface idea, since it does NOT really make any sense with SCMI
telemetry.

> 
> This touches on another design question which decides how complicated
> the whole implementation is going to be: What consumer-producer
> relationship does this need?
> 
> The process subscribing to the telemetry stream might have exclusive
> access. IOW, once you have subscribed to the telemetry stream the
> connect is busy and no new subscribers are allowed. This is a very
> simple model ofc which has advantages.
> 
> On the other end you have the uevent model. Uevents are broadcast to all
> subscribers who have a uevent netlink socket open (glossing over some
> namespacing details that are irrelevant here).

Stream mode is only one of the possible collection mode in SCMI, and
I am not implementing that immediately out of the box, since by the spec
the asynchronous SCMI notification support needed by a reasonably
performant streaming mode implementation is...optional.

At first I will only implement 'polled' mechanims, i.e. in which the
platform updates the Telemetry data as required by the configuration
chosen and the users go and read the data at the known locations when
they see fit.

> 
> You need to figure out what you really need here. The choice of
> transport also has quality of life implications. 
> 
>   (1):
>   A character device is somewhat simple but it means it's all inherently
>   tied to devtmpfs and namespacing it retroactively is not possible. If
>   you ever want to namespace it, i.e., delegate it to unprivileged
>   sandboxes, userspace needs to bind-mount the character device into the
>   container at container startup or have a mechanism to inject said
>   character devices later via the new mount api. It's all possible I'm
>   just pointing out that you're tied to a rather rigid kernel object. But
>   I think in general it is ok.

No containerization support. I am going for a chardev+IOCTLs approach with
the possibility of an alternative RAW direct mmap access to the Telemetry
shared areas from userspace.

> 
>   (2):
>   A while ago David Howells extended pipes with the concept of a
>   watchqueue. A watchqueue is just a pipe with some special properties. It
>   can be created by passing O_NOTIFICATION to pipe(2) "meticulously
>   undocumented" as Jon would say...) into which the kernel splices small,
>   fixed-format notification records:
> 
>   int fds[2];
>   pipe2(fds, O_NOTIFICATION_PIPE);
>   ioctl(fds[0], IOC_WATCH_QUEUE_SET_SIZE, nr_notes);   /* preallocate, 1..512 */
>   ioctl(fds[0], IOC_WATCH_QUEUE_SET_FILTER, &filter);  /* optional */
>   keyctl(KEYCTL_WATCH_KEY, KEY_SPEC_SESSION_KEYRING, fds[0], 0x01); /* subscribe a source */
> 
>   If the ring is full or no free note exists, the record is dropped and
>   PIPE_BUF_FLAG_LOSS is set on the last buffer. So consumers always learn
>   that they missed something — but not what.
> 
>   IOC_WATCH_QUEUE_SET_FILTER takes struct watch_notification_filter with
>   up to 16 watch_notification_type_filter entries. With a filter installed
>   the default is reject and only the type bit + subtype bit + info match
>   let a record through. Passing NULL removes all filters (everything
>   passes).
> 

These are good to know possibilities that I will explore better..thanks !

>   Kinda like a ringbuffer might be something to consider.
>   O_NOTIFICATION_PIPE works from all contexts (hence the preallocation).
> 
>   (3):
>   No.
> 
>   (4):
>   A while ago I added the "coredump socket" to the kernel. Basically,
>   userspace listens on a well-known AF_UNIX socket address (in this case
>   configured via /proc/sys/kernel/core_pattern). The kernel connects to it
>   and sends the coredump data via this socket (with some protocol
>   negotiation at the beginning).
> 
> If you really want to transform the data stream you're receiving into a
> FUSE filesystem I think any of the referenced methods is compatible with
> that. You just refresh the various files when new events come in and
> otherwise show the data that you already have.
> 
> In other words, if you allow multiple consumers the following scenario
> may happen: Consumer A consumes event E_1 and consumer B consumes E_2,
> consumer A now gets E_3. If consumer A is what funnels the data into a
> filesystem then consumer A misses data. That might be fine or might not
> be.
> 

No we already dropped the FUSE extensions idea...the performance hit would
be too much and it just make more sense for the existing libs to
interface with the new IOCTLs interface.

Thanks again !
Cristian



