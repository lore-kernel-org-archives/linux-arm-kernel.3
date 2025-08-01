Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3DEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGLTuCq5gyifcIhuKf69XTYD9F6AIomqVE0e+GKN8jM=; b=1H6YQNebiM4B+QFwXD4MwFIh/J
	dRUtNiwzNDwgjEx8smbu4CDUKx1glzYoCIpvX2GIGMLCynbZ1BuTtmZGNrK54h0d+TIiPH2n+/b1D
	A4oxFLsVGjPlYhfcmP2u34aXDa2E+IbH+ir4hHQLlyqG16ub0QDmrZ2VNJVP1s0Yz8E/B8N98iAw7
	BMlvm7cu/r0OeTRl03dp6oXIJ/lZwax15j/UU//zEs7oMziG4nJ3USociEO5DO5PnMXs7a9Hmu3/U
	MJ3G/UZ91ZjMVxutkIq/fpJi4u2Inzhm0yk4SlO+6u5Ge1IgK4Nua3UE0XWkpju8LCKTqhx1cDgrP
	SdZU3cUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhmU0-00000005PSc-3TEb;
	Fri, 01 Aug 2025 09:55:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhmP4-00000005P55-0x0Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:50:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bth0D3GsQz2Cfd1;
	Fri,  1 Aug 2025 17:45:48 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A67871A0174;
	Fri,  1 Aug 2025 17:50:02 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:49:57 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 17:49:56 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH 8/8] Documentation: hisi-pmu: Add introduction to
 HiSilicon V3 PMU
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
 <20250729153823.2026154-9-wangyushan12@huawei.com>
 <20250731134759.00000c74@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <faf78f69-312e-32d1-d0a2-fea908c73218@huawei.com>
Date: Fri, 1 Aug 2025 17:49:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250731134759.00000c74@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_025018_434375_EBED7A8C 
X-CRM114-Status: GOOD (  16.32  )
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

On 2025/7/31 20:47, Jonathan Cameron wrote:
> On Tue, 29 Jul 2025 23:38:23 +0800
> Yushan Wang <wangyushan12@huawei.com> wrote:
> 
>> Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
>> job of monitoring specific parts of a device.  Add description on that
>> as well as the newly added ext operand for L3C PMU.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> There is one fixlet hiding in here that maybe could have been done
> as a precursor.  I doubt anyone cares though!
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
>> ---
>>  Documentation/admin-guide/perf/hisi-pmu.rst | 43 +++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>> index 48992a0b8e94..4c7584fe3c1a 100644
>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>> @@ -12,15 +12,16 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
>>  called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
>>  two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
>>  
>> -HiSilicon SoC uncore PMU driver
>> --------------------------------
>> +HiSilicon SoC uncore PMU v1
>> +---------------------------
>>  
>>  Each device PMU has separate registers for event counting, control and
>>  interrupt, and the PMU driver shall register perf PMU drivers like L3C,
>>  HHA and DDRC etc. The available events and configuration options shall
>> -be described in the sysfs, see:
>> +be described in the sysfs, see::
>> +
>> +/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>
>>  
>> -/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.
> 
> This is fixing existing stuff so maybe should be a separate patch.
> 

maybe it's just a format change (paragraph text to block text) so not worth backporting.
that's why I didn't see any warnings when compile.

thanks.

