Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E4BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUYtQpgBPLuj7yRytKfvp24wERJMCxuXVbcvj5Jm6oI=; b=VOZBrRmDMkQj1D2k8OYqcPylCS
	S33PCBtMCS5ByEGNQ1QznJrVGqpuvtU6Hk1mCqkvMXOXFozqAMM5F/HAb+FCJwvaOBWTH+K3SVMyZ
	zWYswP87N3D6J4/YeBNyuJOoRhbpJcX1SGxdKFoRWsP6Y1O3CnLDqwLrTIgjtxHCopuf+VgMB5CuM
	/jnMy5T4D8VfA5DdiaWo2kvAmu/lcyecFrwvosyw9p53GVLWvFpdh/34wseSUnfiQNjYzSC9zZMHu
	XJDO4AovW9CmKjsC9S7AQ3H/wB80N1Q0JJiqXJLWtXn4DjQO5bOIpjqe7XPUQSLgeCRux+Y1uYmdk
	Z+/DHZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YUL-00000007pOA-2BqB;
	Tue, 15 Sep 2026 19:06:41 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YUK-00000007pNq-0fGX;
	Tue, 15 Sep 2026 19:06:40 +0000
Message-ID: <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
Date: Tue, 15 Sep 2026 12:06:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260914060615.1398531-1-rdunlap@infradead.org>
 <87ik469wd4.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ik469wd4.fsf@trenco.lwn.net>
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



On 9/15/26 11:56 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Use literal blocks for 'cat' and 'echo' commands to separate them from
>> the surrounding text. Otherwise the lines run together, without any
>> clear break before or after the commands.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Michal Simek <michal.simek@amd.com>
>> Cc: Ronak Jain <ronak.jain@amd.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>>  1 file changed, 50 insertions(+), 20 deletions(-)
>>
>> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>> @@ -141,32 +141,44 @@ Description:
>>  
>>  		Usage:
>>  
>> -		Select over temperature config ID to enable/disable feature
>> +		Select over temperature config ID to enable/disable feature::
>> +
>>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
> 
> I was sure that this wouldn't work, since the literal block is not
> indented relative to the containing text.  Sphinx does the right thing,
> though... so applied, thanks,

Yeah, I did test it and looked at the output. :)

-- 
~Randy


