Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01293C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 06:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOAP9mRHAXh/9Z10zpIVpYptP4wDPHvl/0FeEXfQ/J4=; b=jJKPXVIVwy2eSrRAjoFfkKye0u
	3Q/WHkdJo9GCTPuxFbL9MfGywhB5wCCig97DYTbce2hZwfef9Z1tZJtubp07fN2D5X7+Wt4swuKOX
	gJnfMBqAB/1zX18yVtBq0GW5zmf/zOVHzRkUVxXPWP6YaJXCyp33ZwJ4Yd7w5z9xQVfKTeGrkZnnH
	I42V32xIN3dbCzJLsu2kILl7uPIO+hEg9ubdCDe975Tj9WHS8DDqs8Qa4l9+wg564nSjMMVXAcHv5
	rdPNz11J751AJNqt2OPAH8g+n/nL5aGIKK+BklMk4b9QCgs0fr7JGF9h6np6UvVlQxhOcgJoInPj3
	HddV00Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyph-0000000DF0r-2sQM;
	Fri, 14 Mar 2025 06:47:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyo1-0000000DEqI-2asc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 06:46:06 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E6jtUS1566271
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Mar 2025 01:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741934755;
	bh=uOAP9mRHAXh/9Z10zpIVpYptP4wDPHvl/0FeEXfQ/J4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VnhxBSj5zPPVduDolbJosbiBpcZeIIDXwRdM/NBqE2CGjHMNXloSjmxb5Ci0hjzBT
	 12NbcYcbqZieAoxK2qx5UYDeuYmgrZQJYw4nHEDxM0dLDkAjhR/WKzw/u2Bx9+MXj1
	 SlJbiDk7lUz35VBSaBck1UYE7ulwMXx2Y15+a3oQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E6jtVJ118405;
	Fri, 14 Mar 2025 01:45:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 01:45:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 01:45:54 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E6jYiA084213;
	Fri, 14 Mar 2025 01:45:35 -0500
Message-ID: <c9e208e4-af14-424b-b09b-3e5068be2706@ti.com>
Date: Fri, 14 Mar 2025 12:15:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add ICSSG FW Stats
To: Jakub Kicinski <kuba@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Lee Trager <lee@trager.us>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Roger Quadros <rogerq@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Simon Horman <horms@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>
References: <20250305111608.520042-1-danishanwar@ti.com>
 <20250306165513.541ff46e@kernel.org>
 <3931a391-3967-4260-a104-4eb313810c0d@ti.com>
 <20250307083959.33098949@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250307083959.33098949@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_234605_750763_D9ACD973 
X-CRM114-Status: GOOD (  27.34  )
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



On 07/03/25 10:09 pm, Jakub Kicinski wrote:
> On Fri, 7 Mar 2025 16:00:40 +0530 MD Danish Anwar wrote:
>>> Thanks for the docs, it looks good. Now, do all of these get included
>>> in the standard stats returned by icssg_ndo_get_stats64 ?
>>> That's the primary source of information for the user regarding packet
>>> loss.  
>>
>> No, these are not reported via icssg_ndo_get_stats64.
>>
>> .ndo_get_stats64 populates stats that are part of `struct
>> rtnl_link_stats64`. icssg_ndo_get_stats64 populates those stats wherever
>> applicable. These firmware stats are not same as the ones defined in
>> `icssg_ndo_get_stats64` hence they are not populated. They are not
>> standard stats, they will be dumped by `ethtool -S`. Wherever there is a
>> standard stats, I will make sure it gets dumped from the standard
>> interface instead of `ethtool -S`
>>
>> Only below stats are included in the standard stats returned by
>> icssg_ndo_get_stats64
>> - rx_packets
>> - rx_bytes
>> - tx_packets
>> - tx_bytes
>> - rx_crc_errors
>> - rx_over_errors
>> - rx_multicast_frames
> 
> Yes, but if the stats you're adding here relate to packets sent /
> destined to the host which were lost you should include them
> in the aggregate rx_errors / rx_dropped / tx_errors / tx_dropped.
> I understand that there's unlikely to be a 1:1 match with specific
> stats.
> 

Sure, I will try to add such stats.

>>> This gets called by icssg_ndo_get_stats64() which is under RCU   
>>
>> Yes, this does get called by icssg_ndo_get_stats64(). Apart from that
>> there is a workqueue (`icssg_stats_work_handler`) that calls this API
>> periodically and updates the emac->stats and emac->pa_stats arrays.
>>
>>> protection and nothing else. I don't see any locking here, and  
>>
>> There is no locking here. I don't think this is related to the patch.
>> The API emac_update_hardware_stats() updates all the stats supported by
>> ICSSG not just standard stats.
> 
> Yes, I'm saying you should send a separate fix, not really related or
> blocking this patch (unless they conflict)
> 

Sure. I will send v3 of this and a fix to net to add spin_lock before
reading stats. I will try to make sure that they don't conflict so that
they can be merged parallelly.

>>> I hope the regmap doesn't sleep. cat /proc/net/dev to test.
>>> You probably need to send some fixes to net.  
>>
>> I checked cat /proc/net/dev and the stats shown there are not related to
>> the stats I am introducing in this series.
> 
> You misunderstood. I pointed that you so you can check on a debug
> kernel if there are any warnings (e.g. something tries to sleep
> since /proc/net/dev read is under RCU lock).
> 
>> The fix could be to add a lock in this function, but we have close to 90
>> stats and this function is called not only from icssg_ndo_get_stats64()
>> but from emac_get_ethtool_stats(). The function also gets called
>> periodically (Every 25 Seconds for 1G Link). I think every time locking
>> 90 regmap_reads() could result in performance degradation.
> 
> Correctness comes first.

Understood.

-- 
Thanks and Regards,
Danish

