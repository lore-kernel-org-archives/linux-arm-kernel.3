Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52CFC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SVVfmqYUx9yhfo4gZ1v82Vo4mmrNajJ5NwiYyJgg5g=; b=GoISrrjUPf1uGTCPx3+bBz8KE8
	wIWd1Sf3IPJQblcJ9SJRagDzrfXOrzBcNbz0H/s+VVmbD8MUBW//DaqbSlmRH3ByzUqiUlrIUNeoC
	FuJjtWiFCp0XvmCPskjAHkDn+v0P8sOPRZri1bnaKGUb4OlJrTCC4zQWJejTMrANwOI/WDyW9HO5o
	kAIj2JeQc2sEXFmi3LN59TyzZRKFcIw+y2LBtqplKQvpg3LLAQ6zB/W5HugtzW6WJYaFCKCu3IjnR
	tpLEbOKbRQt+WxxXkuKJ1azlkxsgG8u2dqb6fvB8BEiKySZ5c05JamiparqWIxHeh0q2Zljt+63kR
	fwZKuzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdr0-0000000G0ur-0HIm;
	Fri, 20 Jun 2025 15:40:34 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdoJ-0000000G0BH-2G9E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 15:37:48 +0000
Message-ID: <8b9662ab-580c-44ea-96ee-b3fe3d4672ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750433864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6SVVfmqYUx9yhfo4gZ1v82Vo4mmrNajJ5NwiYyJgg5g=;
	b=fUBGoJn5T5sJJrfCMSSK0BxRrjGIVoFA06mQnflCU6H5JBoMM3w1+D1JJS4wJq9G5Djznt
	ZwlJhqPs0Q7vaJS6kFLSK0na00By3yA+GKSl1BiYwUyg8vlTUNzixMR/Ve7pcYSSYO/aGd
	FcfgfJQbxH/QbKcRHNdi4HnP12r7T2Y=
Date: Fri, 20 Jun 2025 11:37:40 -0400
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062004-essay-pecan-d5be@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_083747_729685_DC78ED69 
X-CRM114-Status: GOOD (  15.73  )
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

On 6/20/25 01:13, Greg Kroah-Hartman wrote:
> On Thu, Jun 19, 2025 at 04:05:34PM -0400, Sean Anderson wrote:
>> Support creating auxiliary devices with the id included as part of the
>> name. This allows for non-decimal ids, which may be more appropriate for
>> auxiliary devices created as children of memory-mapped devices. For
>> example, a name like "xilinx_emac.mac.802c0000" could be achieved by
>> setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.
> 
> I don't see the justification for this, sorry.  An id is just an id, it
> doesn't matter what is is and nothing should be relying on it to be the
> same across reboots or anywhere else.  The only requirement is that it
> be unique at this point in time in the system.

It identifies the device in log messages. Without this you have to read
sysfs to determine what device is (for example) producing an error. This
may be inconvenient to do if the error prevents the system from booting.
This series converts a platform device with a legible ID like
"802c0000.ethernet" to an auxiliary device, and I believe descriptive
device names produce a better developer experience.

This is also shorter and simpler than auto-generated IDs.

--Sean

