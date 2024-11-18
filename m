Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AA2D49207
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZI0ToznCzhjHwYsDSDb01BcP4KuLMwEBrhHNS7BIoc=; b=Ql8aCgpZIstrUTJ1KBykmhAG3h
	NAqeKeJ7o/5eF0F/TZp0oxsRDk8So/MjJ+aj+V/ArQuG9Np9P/tPc09DgRHzGJgew2CwYihHJkfsL
	LlDiVKW8jY0eeJHXQEsaltGTZlGLpg15ezB8Octe+qi5ZC/aHQspB63/rb1Ze4UZOhXKppk/rAuFG
	KU5JlZJzSkH7UYvBUbOvL9zu6OEgorWwJXcTz+45LiP2bnUIFBWMi81lru5VYdiQPuHaV25RybluX
	MjjiPQbpOyu4nKXIbAWMFutEPN8RWJH4Ym4/bX+aiJbIlHOKjXjiB/CEyUwgemsksK62BMjuYr5EK
	9VppoRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4Bs-0000000A0ZC-14mX;
	Mon, 18 Nov 2024 16:01:28 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4Av-0000000A0MQ-2stu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 16:00:30 +0000
Message-ID: <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731945627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZI0ToznCzhjHwYsDSDb01BcP4KuLMwEBrhHNS7BIoc=;
	b=WRZ32geYK58tbEOuvHdtvVxm1DNs9niOmZol4nD0+3Mp8Dh6xJRI+uVBqTQza9gc5xn31a
	72onjs3SehhdwbFfty9nLDSfYnnlGGc+e29TYEanwsJgvAy5RVSwrmcCrNMPECyUdxetI4
	aEM2/YUCYARPqIpYkKl9Nf1sh+X0xtg=
Date: Mon, 18 Nov 2024 11:00:22 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 radhey.shyam.pandey@amd.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, harini.katakam@amd.com
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_080029_870155_F5AAFC21 
X-CRM114-Status: GOOD (  12.61  )
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

On 11/18/24 10:56, Russell King (Oracle) wrote:
> On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
>> Add AXI 2.5G MAC support, which is an incremental speed upgrade
>> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
>> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
>> If max-speed property is missing, 1G is assumed to support backward
>> compatibility.
>> 
>> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
>> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
>> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> ---
> 
> ...
> 
>> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
>> -		MAC_10FD | MAC_100FD | MAC_1000FD;
>> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
>> +
>> +	/* Set MAC capabilities based on MAC type */
>> +	if (lp->max_speed == SPEED_1000)
>> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
>> +	else
>> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;
> 
> The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?

It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
(2500Base-X). The MAC itself doesn't have this limitation AFAIK.

--Sean

> Normally, max speeds can be limited using phylink_limit_mac_speed()
> which will clear any MAC capabilities for speeds faster than the
> speed specified.
> 

