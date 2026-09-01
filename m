Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F3C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hy0E/ezwSdd6yfoO7/lSW22XS0mfjgDyq2kZCgxDkk=; b=D86NsgdGrGAnYLYXd3VjY55jLC
	PIEy2LQLjvEf7YXZFPyS8HXTlsuWHp5ZaoFp/XfgNeiCyzXcOetecYgvHXtXIPgKOsiuFEUjhUG+n
	DTc4boHH/DhrBe4mOvY8zRI4rSu+M/iRfKjuhRwAYbmnECYXmLgFXiM/g+dluCkO+tP0Xf88SD6Kb
	e8pnlmMi58jMMj8lHsLfMZZGSsVIhAXgy5EyBQ37zIV4B0aVL3SKPjquVhTmEsJCY8mxeRV8zZ0Cf
	Ey2XB6oxp5BI8+0da9JXNTzKvBO+AuUgN+Q3SNB2FQGwIpIC4UnaV9bT/2rmeL4Gz+7f4D7DkuQj3
	dLDm69Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Td7-0000000D8UC-48iW;
	Tue, 01 Sep 2026 18:54:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbg-0000000D4vv-3bT4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42BF160207;
	Tue,  1 Sep 2026 18:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0FA1F00A3F;
	Tue,  1 Sep 2026 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788288796;
	bh=6hy0E/ezwSdd6yfoO7/lSW22XS0mfjgDyq2kZCgxDkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Lgi41B19SdUfJXJ66su8/5/5+V4L6xeprIRUzsEiHI4CpXfXKr0AexXn3E6fh8b2k
	 geMB1LeTkPHIHzdBVcc8hdnmojf7fZ2XfrHOx94QypDIj3X3nJuVbfeLj+gTNCUCBg
	 zirXjZd3i5ErVJ6MO9s0VZFk7xQO+NoIxJgHnzdo9+wBJJZoenmkfSMUXxVsSHo7ZT
	 yk3XbYOb1r0jT/nnk3Oc32jBPAFs6kVfdlsz46ROHEuTUsLeWXu/r5PrevgtCVVgAn
	 ZWI84MTayR7M7A9ceqdbR2Ayb+2XQPcKNUhZJRDJR+tg5XvNGTe2PwXZ4zgzeA/XiK
	 DDZgdzpDSeg8w==
Message-ID: <4d84884d-9848-46fb-b751-074c3cba8ffb@kernel.org>
Date: Tue, 1 Sep 2026 20:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] usb: typec: Add thunderbolt switch
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
 <apa0Ypc4xpaeHTBb@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <apa0Ypc4xpaeHTBb@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Heikki,

On 9/1/26 13:17, Heikki Krogerus wrote:
> Hi Sven,
>
> On Sun, Aug 30, 2026 at 10:19:20PM +0200, Sven Peter wrote:
>> On Apple Silicon the USB4/Thunderbolt host router can only be brought
>> up after the Type-C PHY has been configured and requires cable details
>> known only to the Type-C port controller.
>>
>> The existing orientation switch only forwards the cable orientation.
>> The mode switch also forwards most of the required details but
>> represents devices which configure or route the Type-C signal path. The
>> ACIO host router is a consumer of that path and has additional ordering
>> requirements: it has to be started after the PHY has been configured
>> and stopped again before the PHY is disabled.
>>
>> The mode switch code calls all handlers in the same order both when
>> entering and leaving a mode and cannot express this reverse teardown
>> order. Treating ACIO as another mode switch could therefore leave the
>> NHI active after its PHY has been disabled, which can result in an
>> asynchronous SError or a SoC watchdog reset.
>>
>> Add a separate Thunderbolt switch which Type-C port drivers can use to
>> forward the negotiated Thunderbolt or USB4 cable details and explicitly
>> order host router setup and teardown around the mode switch. This is
>> similar to a USB role switch: each connection has exactly one host
>> router and the callback controls the lifetime of that functional
>> controller instead of configuring a signal mux.
> You are bypassing and duplicating things that are already supported in
> the typec bus.
>
> Your typec port driver probable does not register the partner altmode
> that you need, so you just need to fix that. After that you should be
> able to get the details you need simply by registering a typec bus
> notifier in the thunderbolt driver. We can add a helper for that if
> needed - the DRM subsystem will use the same notifier with the DP
> altmode soon.

Thanks for the pointer, I think that can indeed work out just fine. The 
bus notifier isn't enough though, I need a notification specifically 
when typec_altmode_update_active() happens (and not when the partner is 
registered as a possible altmode) and that only triggers a sysfs_notify 
and a kobject_uevent unless I'm missing something. Adding a simple 
notifier call chain should be possible there though.


>
> USB4 is meant to be handled as an altmode too, but it looks like it is
> not supported yet - I need to check the status with that. This may
> still need to be fixed, but that should not be a problem.

It isn't, but that indeed should not be hard to add.

Best,


Sven


