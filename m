Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5CBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEUThsSpCMUbwMYhQ5KetKy8D1sXeNWxSdmUlfQSjfQ=; b=3NORlaBZT7FeOuqS+HtdQpHiTi
	/7xxBO1L+c89C8mMHu8JPCGbgxttHxpSnjuKwRian4Pa8epASxFRfk6S66+V1Ys9gtTGZlsEDswzG
	MiwCb76KdjUuFOVEJTbHi6npTEPWsI/RUCrYZRAJAdIwntqpLUnZNVFhcVo4mIVceouYqvQlDLIo2
	6QtxQ+LQV3KrknaOpSNf2YhV9Bv27mgITja7qtrEILmSIJjsZV7GvpEuLQoDItthXmSWNPW1IyPeh
	bEWoSEReZYeMkN9pfH0vROncoT0xt67teeiOhSmmPNN3Y1+Ld8q4AP+lDVvtyx+SiksIhPnebwGcI
	h6ay6Ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbH-00000000C9g-2tIF;
	Mon, 21 Jul 2025 16:42:52 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrWP-0000000HX9q-0RSy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:29:42 +0000
Message-ID: <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753108177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEUThsSpCMUbwMYhQ5KetKy8D1sXeNWxSdmUlfQSjfQ=;
	b=gGKh0sByoEfCusDPYDneYqYDDtCK981D27SuDhdK1Ixp787h2480p0CgfM/vjALi68PWt0
	zP91EVutwm8w0xObTCjpJ2olmJx3SK3q8+WFB+Fep0wyQv4Fx+QwckhdeTVMgINSWDoBq0
	69KICTRAgIckMRGVMUmR9aWZqsf9IvY=
Date: Mon, 21 Jul 2025 10:29:32 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Ira Weiny <ira.weiny@intel.com>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
 <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
 <20250720081705.GE402218@unreal>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250720081705.GE402218@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_072941_292123_32A6F120 
X-CRM114-Status: GOOD (  11.46  )
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

On 7/20/25 04:17, Leon Romanovsky wrote:
> On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
>> On 7/17/25 12:33, Greg Kroah-Hartman wrote:
> 
> <...>
> 
>> Anyway, if you really think ids should be random or whatever, why not
>> just ida_alloc one in axiliary_device_init and ignore whatever's
>> provided? I'd say around half the auxiliary drivers just use 0 (or some
>> other constant), which is just as deterministic as using the device
>> address.
> 
> I would say that auxiliary bus is not right fit for such devices. This
> bus was introduced for more complex devices, like the one who has their
> own ida_alloc logic.

I'd say that around 2/3 of the auxiliary drivers that have non-constant
ids use ida_alloc solely for the auxiliary bus and for no other purpose.
I don't think that's the kind of complexity you're referring to.

>> Another third use ida_alloc (or xa_alloc) so all that could be
>> removed.
> 
> These ID numbers need to be per-device.

Why? They are arbitrary with no semantic meaning, right?

--Sean


