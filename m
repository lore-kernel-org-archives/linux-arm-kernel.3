Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A65C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/rtvz2OitzlkMvShH8dLU98BAHfJ20PcH98vTVmKWc=; b=tVfcBkDG3hm2MQHOa9pFh0v262
	uHP3IbnXBmsFpxg1VoEQRhkb4KHv5z4wKRg5EvL+/osTtuz33FOm7IczyZvjNazFesSyTg3MW6w0y
	PL5Q2oIs7GI4d+des2B+5tgAO9Um4W+RfO9ftceLCf8tByBeG71sENf1lvQ3jYru81PU/+jGXjtmM
	SzQt5RIntWTxWQYlTXiC4xxdCs3298XKoiqMO5Qr2LcAbWii9cfhxxIM2I6TJ19JLhF9bXr1tP63p
	FAen5Fi9z3CbcU1P5Tp8T4F1cqKqAqgbVPTsovB9pfQlz2/iX2jhJ0z7KF8wzVmKCGFSel1GwRgbq
	vR1b641A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wticP-0000000Dhzs-0yoq;
	Tue, 11 Aug 2026 09:17:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wticM-0000000DhzN-21r9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:17:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B7E81516;
	Tue, 11 Aug 2026 02:17:49 -0700 (PDT)
Received: from [10.57.45.152] (unknown [10.57.45.152])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417773F632;
	Tue, 11 Aug 2026 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786439873; bh=rGGi2yKj3HpDSJIWZQdi6DjXNQswIDWAPnt9OjTz0TI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eGJ9q7sU5vlcWlVIFIA5/275FSloVrTNCx0qUg/76qy5XO5qNeFxV0DAoHeqsi0NG
	 3KTDKCaDhD0YWOHqVT4sIRtfFpTjSERVug761wO7yfY4o9rqfrkIs98eWHjIXu7KiY
	 hH63U5CPMdD0gcVcWTaR49X5dPsuzK1nvg6c/2mA=
Message-ID: <e138019e-5c7b-4ae3-837a-97cc95edb836@arm.com>
Date: Tue, 11 Aug 2026 10:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
 <20260811090424.GD15499@e132581.arm.com>
 <7d4a7f0c-2b0e-471e-9c29-867bae981523@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7d4a7f0c-2b0e-471e-9c29-867bae981523@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_021754_650828_F5992E73 
X-CRM114-Status: GOOD (  15.71  )
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

On 11/08/2026 10:10, James Clark wrote:
> 
> 
> On 11/08/2026 10:04, Leo Yan wrote:
>> On Fri, Aug 07, 2026 at 11:13:22AM +0100, James Clark wrote:
>>> TRBE doesn't support sysfs mode, but the enable_sink file can still be
>>> successfully written to enable the device, and only attempting to enable
>>> the source would later fail.
>>>
>>> Avoid misleading users by adding a flag that devices can use to hide
>>> either the enable_sink or enable_source files, and set it for TRBE.
>>>
>>> Don't set it for ETE as it's possible that ETE could appear on the
>>> legacy bus and work with sysfs, and writing to enable_source already
>>> reports EINVAL if the device doesn't support sysfs mode.
>>
>> It is a pity that we cannot determine from the ETE registers whether ETE
>> is connected to the legacy bus or TRBE.
>>
> 
> We could determine it from the device tree. A path has to be built or 
> you can't use it on the legacy bus either. Maybe we can do a more 
> general change in the future to hide the flag for any non-connected CPU 
> source.


There must be a sink enabled before the source can be enabled. So, 
enable_source will fail. I would leave things as is, given the
sinks can be loaded with modules and it is all dynamic

Cheers
Suzuki


> 
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 


