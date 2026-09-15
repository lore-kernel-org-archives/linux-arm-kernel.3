Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E453C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXOczofUEvkrBqpcuYbGbpcliZ0gOlKLqfrv/EClXo0=; b=eIFaHvETuwqA/DDOR1swQVw4fX
	wjllp+8cl9QThCeQdrfwrLVDLiuT8nKe1XX0KzAPJoQmbi6NsFmwkGD2W0TsL9L2dcH2FR+1Mka7+
	X2nT/uS+hzn6iq0oJ3mmv+/FwOeCa8rj0oeipDAu8OhgKUhspGEDVZUOUygX0RuxrlIv8IOxPUY8W
	ac1OBglu31YoXrw3ZgDZeFoiU1D8JpTYruL4my/XL+LD3nmLF60FyylzDotvE0H7KIkSnm1HcZR4S
	7kxr6Zh9NbmwCMBI+Ppijwr/hphJs5wJ+7Q8tUQeztVwAfu8FFxLWRCXnSmoaem32+jY364h/CNeg
	WsCbiRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZB7-00000007tEF-0NIH;
	Tue, 15 Sep 2026 19:50:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZB5-00000007tE3-3Nut
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 19:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jXOczofUEvkrBqpcuYbGbpcliZ0gOlKLqfrv/EClXo0=; b=q1dYRAL6NHxop2iJXbDiskRUWq
	a1B9ohpQY1kOuocfamuNT0CR7N6VAwMRKfo+csB5sCuaSiIm16jzz1u+sbZPrLuUOYjYp9k9ioIB+
	DOFAtPJpRHv5iPEep/8OMJ/IwV8eo1ncBUXt/xYvgi9qpr/MH4XQZngQeiIMM+NALTWXXANM/cpIX
	HgVwrrLSA3h/p0T/lR1eTPKX/M12Cta8B8HUjd/pwmACYGq2vHfL77p2R0DMnTlZxNm8RaAnPFnK3
	739J9UzYMzWqFlK7QxtICnM1FT64seNGQRHmeUOzJTiVj76QgI0ngkAMh8VlrVDbnDL19nW70vx8I
	/mMWX9Yg==;
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6ZB2-00000007D7g-1pwE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:50:50 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EE69B408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501846; bh=jXOczofUEvkrBqpcuYbGbpcliZ0gOlKLqfrv/EClXo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WqxcUu3cx8hBBdXdwyYjkTITe55X2kp5l2yxw5xsZtUWp+hMBdYNe446ZB5AhJ1LD
	 CgWDVsvblGmUxsVOQFTt04CqVu23eeTqWMKywgBC1UkcbRcDHyoNTz/5BKUGLTyKpL
	 cVHIy5pznUuMgrqZyZUSl/XpYxAJ6TFjUFzJrbjCrkOQ9YV6CAMNOkuPGDtmZEpfHI
	 caa6EMrAGw1vPOTLhzJXHNdNX+xJO6ZaWPtY/aov6H6c9n3YyQYb3zrWwGSDEiMV3R
	 hraNXTl41LdPXlluVmbOKBuAG60VqSjB/Lo2KMD+Y/UbQQEl2J6JTGxqRMrBxtPM84
	 Yv40afzMGvgtw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EE69B408B4;
	Tue, 15 Sep 2026 19:50:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
In-Reply-To: <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
References: <20260914060615.1398531-1-rdunlap@infradead.org>
 <87ik469wd4.fsf@trenco.lwn.net>
 <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
Date: Tue, 15 Sep 2026 13:50:45 -0600
Message-ID: <87eceu70q2.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_205048_670845_60BB5012 
X-CRM114-Status: GOOD (  11.53  )
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

Randy Dunlap <rdunlap@infradead.org> writes:

> On 9/15/26 11:56 AM, Jonathan Corbet wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>>> Use literal blocks for 'cat' and 'echo' commands to separate them from
>>> the surrounding text. Otherwise the lines run together, without any
>>> clear break before or after the commands.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---
>>> Cc: Michal Simek <michal.simek@amd.com>
>>> Cc: Ronak Jain <ronak.jain@amd.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>>> Cc: linux-doc@vger.kernel.org
>>>
>>>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>>>  1 file changed, 50 insertions(+), 20 deletions(-)
>>>
>>> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>>> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>>> @@ -141,32 +141,44 @@ Description:
>>>  
>>>  		Usage:
>>>  
>>> -		Select over temperature config ID to enable/disable feature
>>> +		Select over temperature config ID to enable/disable feature::
>>> +
>>>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
>> 
>> I was sure that this wouldn't work, since the literal block is not
>> indented relative to the containing text.  Sphinx does the right thing,
>> though... so applied, thanks,
>
> Yeah, I did test it and looked at the output. :)

Heh...it's nice to know that at least one person does that...:)

jon

