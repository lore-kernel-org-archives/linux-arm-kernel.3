Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE38C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBLPNH6vEtDcW0OeMW8E9IPd4cE2lTMSKDShN6v0ee8=; b=Bx+Fc2CUf2bpiama15SE4qgQlV
	z92P8ZyKGvaDBX5VQPw9CyTRAbcHcIfQ8ioQGOmg7SxLkYfwOKgdTKKjnekKt829OVo3Q1S3Okz8A
	VRTxM9W60pEve8fd1Fogi0Ex5BagQWa1CspwIjsx8F9/+bemeOEQhVmL5xPx6iQoVO7+IeAck+zxW
	KMH36gCUDLW5krl+lPmK30GDvxYkrVt2PcXQ3QatFaLv3fJLjAP2xXYC3lEeCryVoP9mxQjGmQaBD
	ZqBjNeUUj5m2oX57RTobMsmLvmHxw8VQeffpo0XMKDr18Pf/qLUcr0kpzdoVeVfR1wplynMt8ESXK
	SkYSdLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcniX-0000000Bkq8-0VzS;
	Mon, 05 Jan 2026 16:46:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcniQ-0000000Bkoe-26wL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:46:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0BD339;
	Mon,  5 Jan 2026 08:45:50 -0800 (PST)
Received: from [10.57.65.127] (unknown [10.57.65.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722B33F6A8;
	Mon,  5 Jan 2026 08:45:55 -0800 (PST)
Message-ID: <53e92af3-67cb-425a-a9c0-5746ce349247@arm.com>
Date: Mon, 5 Jan 2026 16:45:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
To: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
 <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084559_032250_B9123128 
X-CRM114-Status: GOOD (  12.04  )
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

On 05/01/2026 16:39, Suzuki K Poulose wrote:
> 
> On Fri, 28 Nov 2025 11:55:12 +0000, James Clark wrote:
>> Do some cleanups then expand the timestamp format attribute from 1 bit
>> to 4 bits for ETMv4 in Perf mode. The current interval is too high for
>> most use cases, and particularly on the FVP the number of timestamps
>> generated is excessive. This change not only still allows disabling or
>> enabling timestamps, but also allows the interval to be configured.
>>
>> The old bit is kept deprecated and undocumented for now. There are known
>> broken versions of Perf that don't read the format attribute positions
>> from sysfs and instead hard code the timestamp bit. We can leave the old
>> bit in the driver until we need the bit for another feature or enough
>> time has passed that these old Perfs are unlikely to be used.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/13] coresight: Change syncfreq to be a u8
>          (no commit info)
> [02/13] coresight: Repack struct etmv4_drvdata
>          (no commit info)
> [03/13] coresight: Refactor etm4_config_timestamp_event()
>          (no commit info)
> [04/13] coresight: Hide unused ETMv3 format attributes
>          (no commit info)
> [05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
>          (no commit info)
> [06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [07/13] coresight: Don't reject unrecognized ETMv3 format attributes
>          (no commit info)
> [08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [10/13] coresight: Remove misleading definitions
>          (no commit info)
> [11/13] coresight: Prepare to allow setting the timestamp interval
>          (no commit info)
> [12/13] coresight: Extend width of timestamp format attribute
>          (no commit info)
> [13/13] coresight: docs: Document etm4x timestamp interval option
>          (no commit info)

Indeed they were applied, ;-)

https://git.kernel.org/coresight/c/19214ad0a4e3
https://git.kernel.org/coresight/c/6c75940eb76d
https://git.kernel.org/coresight/c/f4d2f5fec06a
https://git.kernel.org/coresight/c/3285c471d0c0
https://git.kernel.org/coresight/c/afed86e6e141
https://git.kernel.org/coresight/c/b945d3677754
https://git.kernel.org/coresight/c/d633fd22e810
https://git.kernel.org/coresight/c/a1d19cd2b1a6
https://git.kernel.org/coresight/c/458db6257149
https://git.kernel.org/coresight/c/20bc2ea23774
https://git.kernel.org/coresight/c/b02450de6ba6
https://git.kernel.org/coresight/c/38f4c4273499
https://git.kernel.org/coresight/c/10d4dbdc8fbc


Suzuki
> 
> Best regards,


