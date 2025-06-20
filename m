Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E691C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDnBVy0j4uCja073Cag+NZ+VuabbaY7i2eVJN3A6bdc=; b=wqamQVXHKv+yKbaeGrh98rSMYg
	+iLRIXkxbv6ZW98rfbR6kzv1T9EhX7txhQ0Rc506w6Ls6nz6E1EcvUJl8IhoTsMEamjMFCSzbtOVU
	A4NGdRfRmt4RYAlYjGBHrbhmnRFlDm6jY2rMKoSXzW4tq1nSuSjlNCES4OBA6oX58yGSWRTLOrXfd
	tfX9Z109BbjHuJl0Bcwj33naHOkIOx8e40LVJWh409VeplNJYtUdoCEJtwWbWYKUBHr7Wz9ZhB5Jn
	NUzWHiPjWwLF7UGEa8AsK9gBjGLhRW+PwnWS41Hbht722oBqp5zzo7wKX7aiO2S5JvWz8G/u6dvgO
	z794fIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSf8t-0000000GC5M-1zbO;
	Fri, 20 Jun 2025 17:03:07 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSege-0000000G8zO-3CGZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:33:58 +0000
Message-ID: <2abb8b06-960d-44d3-b2f1-b6d91f424a1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750437233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDnBVy0j4uCja073Cag+NZ+VuabbaY7i2eVJN3A6bdc=;
	b=xBvbzMTiiUh7ca29hegpZHXllXXE69lmTMxhvNKMpV77ymE7qvKufgg+3oHikqSy7X6Hp+
	h5gjRk9/eLpWIFN2f+GLHibm2yRLlUi1IyLJO+enBaGp0eUPczQP9yxyQ8U7C9riUHeDS3
	GG+Z4+Soc/nhStNZc7eFLa/Qwiz3OVE=
Date: Fri, 20 Jun 2025 12:33:48 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 1/4] auxiliary: Allow empty id
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-2-sean.anderson@linux.dev>
 <2025062004-essay-pecan-d5be@gregkh>
 <8b9662ab-580c-44ea-96ee-b3fe3d4672ff@linux.dev>
 <2025062006-detergent-spruce-5ae2@gregkh>
 <91a9e80a-1a45-470b-90cf-12faae67debd@linux.dev>
 <2025062045-velocity-finite-f31c@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062045-velocity-finite-f31c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_093357_838413_2464E3EF 
X-CRM114-Status: GOOD (  32.00  )
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

On 6/20/25 12:15, Greg Kroah-Hartman wrote:
> On Fri, Jun 20, 2025 at 12:09:29PM -0400, Sean Anderson wrote:
>> On 6/20/25 12:02, Greg Kroah-Hartman wrote:
>> > On Fri, Jun 20, 2025 at 11:37:40AM -0400, Sean Anderson wrote:
>> >> On 6/20/25 01:13, Greg Kroah-Hartman wrote:
>> >> > On Thu, Jun 19, 2025 at 04:05:34PM -0400, Sean Anderson wrote:
>> >> >> Support creating auxiliary devices with the id included as part of the
>> >> >> name. This allows for non-decimal ids, which may be more appropriate for
>> >> >> auxiliary devices created as children of memory-mapped devices. For
>> >> >> example, a name like "xilinx_emac.mac.802c0000" could be achieved by
>> >> >> setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.
>> >> > 
>> >> > I don't see the justification for this, sorry.  An id is just an id, it
>> >> > doesn't matter what is is and nothing should be relying on it to be the
>> >> > same across reboots or anywhere else.  The only requirement is that it
>> >> > be unique at this point in time in the system.
>> >> 
>> >> It identifies the device in log messages. Without this you have to read
>> >> sysfs to determine what device is (for example) producing an error.
>> > 
>> > That's fine, read sysfs :)
>> 
>> I should not have to read sysfs to decode boot output. If there is an
>> error during boot I should be able to determine the offending device.
>> This very important when the boot process fails before init is started,
>> and very convenient otherwise. 
> 
> The boot log will show you the name of the device that is having a
> problem.  And you get to pick a portion of that name to make it make
> some kind of sense to users if you want.

As noted below, I can't! The name has to be in a very particular format
which does not allow for any differentiation *except* in the "id" portion.
Really the only thing I want to do is print the id in hexadecimal rather
than decimal.

>> >> This
>> >> may be inconvenient to do if the error prevents the system from booting.
>> >> This series converts a platform device with a legible ID like
>> >> "802c0000.ethernet" to an auxiliary device, and I believe descriptive
>> >> device names produce a better developer experience.
>> > 
>> > You can still have 802c0000.ethernet be the prefix of the name, that's
>> > fine.
>> 
>> This is not possible due to how the auxiliary bus works. If device's
>> name is in the form "foo.id", then the driver must have an
>> auxiliary_device_id in its id_table with .name = "foo". So the address
>> *must* come after the last period in the name.
> 
> So what is the new name without this aux patch that looks so wrong?
> What is the current log line before and after the change you made?

Well, without this patch if you have multiple devices the subsequent
ones can't be created because they all have id 0 and this conflicts in sysfs.

With this patch it looks something like

[    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
[   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
[   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
[   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
[   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx

I also prototyped a version of PLATFORM_DEVID_AUTO which looks roughly
like:

[    5.424220] xilinx_axienet 80240000.ethernet: autodetected 64-bit DMA range
[  178.249494] xilinx_emac.mac xilinx_emac.mac.1-auto net4: renamed from eth0
[  178.714048] xilinx_emac.mac xilinx_emac.mac.1-auto net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
[  178.731272] xilinx_emac.mac xilinx_emac.mac.1-auto net4: configuring for inband/sgmii link mode
[  182.818831] xilinx_emac.mac xilinx_emac.mac.1-auto net4: Link is Up - 1Gbps/Full - flow control rx/tx

The only identifying part of the name is the "net4" part of the netdev.
However, if there's a failure before creating the netdev then userspace
will never have a chance to rename it. For example, you might get

[    4.947215] xilinx_emac.mac xilinx_emac.mac.1-auto (unnamed net_device) (uninitialized): incorrect link mode  for in-band status

which leaves you with no clue as to what device went wrong.

--Sean

