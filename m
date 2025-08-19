Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83D7CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmqOt1qwxreP164gTUMizrtv+rOPrzbBFfbunezxMlk=; b=mcIaP4ozEcrlxiQsJmBcFeztzy
	eGZv1cUlBu1dXg5aJh6T9jOq0c6THDGeEsiSGqt+J7IrzQmA4GpRbSSHh/+BtrhtDvTScZt08b4bf
	if5H8StyoCfq7km8lf0OQNOtl3EEX+i0cMlxsylpaKqWHkxwCfhepgF52q+3nTR+ZZ8kpdArJJ/4U
	CJ2OzEZxx/rCWb5s0kdeXBeucz1JL8CxirhGbYt/AQno/qj6CuZ3Zphmede3UDypSdh0R04Sz3Ntv
	Srf/KWHywmMPFQwyKc7A95bSO7/kV574WEq9bhNW2ftavs6ryDgqSsDZ1eFxk2Q0EaiVtZRymcp+G
	mMijHPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoL8A-0000000ANrv-2u6A;
	Tue, 19 Aug 2025 12:07:58 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJNO-0000000A6EW-1UDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:15:35 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JAFRD63379172;
	Tue, 19 Aug 2025 05:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755598527;
	bh=vmqOt1qwxreP164gTUMizrtv+rOPrzbBFfbunezxMlk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w6njBmZNGqy/ECKVZ8/lpw2s3Y0du4nFdlNVCcCVtBZybbPbvbEx2/UcJx1DY/xp5
	 SFzEQw+maoUpjTN/pTHqGpgLwAnRDifIiaNb3hiGndnWPq+01WmeVAAcyXVRJmvC7f
	 GxppNTMX0NYVx7l55R21K2n3n1reKvC76vSTRa+0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JAFQr1333086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:15:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:15:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:15:26 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JAFNTe2555595;
	Tue, 19 Aug 2025 05:15:24 -0500
Message-ID: <a92812be-7370-4c55-8c3b-728834bd83c1@ti.com>
Date: Tue, 19 Aug 2025 15:45:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Davis <afd@ti.com>,
        Udit
 Kumar <u-kumar1@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250806141808.4013462-1-b-padhi@ti.com>
 <133a5da2-d161-411c-9cc9-0bad46ab981d@app.fastmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <133a5da2-d161-411c-9cc9-0bad46ab981d@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_031534_491299_A61604D5 
X-CRM114-Status: GOOD (  21.20  )
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

Hi Arnd,

On 06/08/25 21:11, Arnd Bergmann wrote:
> On Wed, Aug 6, 2025, at 16:18, Beleswar Padhi wrote:
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> This allows us to enable various peripherals in the TI OMAP family
>> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
>> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
>> OMAP specific defconfigs.
> Hi Beleswar,
>
> It's fine to enable drivers that are only used on a specific
> platform, but those should generally be loadable modules, not
> built-in.


Sorry for the delay in getting back. I have sent out an v2 with your suggestions:
https://lore.kernel.org/all/20250819101137.2878336-1-b-padhi@ti.com/

Thanks,
Beleswar

>
> For the generic (platform-independent) options, I would
> suggest splitting them out into a separate patch, so you
> can describe better what the purpose is, since this is
> clearly not just for OMAP.
>
>> IKCONFIG*:
>> Allows reading the current kernel configuration through /proc/config.gz
> This one seems particularly unnecessary in a "defconfig" build
> since the configuration is already known based on the version.
>
>> THERMAL_EMULATION:
>> Adds emul_temp sysfs node under thermal zones to allow emulating
>> temperature changes.
> The documentation for this option suggests that we probably
> don't want it enabled.
>
>> FANOTIFY:
>> Allows sending open file descriptors to userspace listeners along with
>> file access events.
>>
>> USER_NS:
>> NAMESPACES:
>> Enable user NS to provide user info of different users for different
>> process.
>>
>> POSIX_MQUEUE:
>> Supports POSIX message queues for priority-based IPC.
>>
>> BSD_PROCESS_ACCT:
>> Enables BSD process accounting to allow user space program to write
>> process accounting information to a file.
> I assume these are all in order to run a particular userspace
> distro?
>
>       Arnd

