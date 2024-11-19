Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC0AD44167
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWSbFUx2xGk80b42aBRdXXKoJH6db6ZMOCOwwIwKZXc=; b=aneiH1oFhBMLHegqn5xhg1qX4+
	X0YU4STgHGnuTOwZNvBK8oPgyqjj3F8RYBmvvSEhfz8z5Ts/bwFWQfEqquMG5Qi9w49CWFvkg9SOT
	LlLI0PGhUQDvPqcaVgb8Mx4ywf/Bevh919kNCfFvZs/52lJWgVOQO+0ItOoKIDf5s/YiQ7iQYcHbU
	2bh8MqE+orJLsdMzJ1FxcvJsTTclLlwsZYfZ8xWDPvKyKtoZhSNbi4KZnQErIzTwBFNS+xQta1Kk8
	JySWbzQy2/5GuYGgOPX7fGU6D8bFcfuco17jxAfipLwWto+Y+tx4kaNhLnnqvL1xuSi8k+0wdizQA
	peccYzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ9A-0000000CrFg-3oSR;
	Tue, 19 Nov 2024 15:28:08 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ8E-0000000Cr7f-1lQH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:27:12 +0000
Message-ID: <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732030022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWSbFUx2xGk80b42aBRdXXKoJH6db6ZMOCOwwIwKZXc=;
	b=NE0GPwwTEBuMqj0fiOfOLYCHp464B1uP7TmgAZ8Fem4JrdRsJmM1XhJ/sFOkZXkDsg05FE
	N0gSw1hiUqF76rqmEbREn0/u7Y2ILOzOokQ1PHn2RJiz51YcqWdOzuzR3wtwfXrQsjYWiI
	iwUQoACvsJfoEflxgC8FRHlEGNS9fSQ=
Date: Tue, 19 Nov 2024 10:26:52 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, harini.katakam@amd.com
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_072710_751166_623AC462 
X-CRM114-Status: GOOD (  17.20  )
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

On 11/18/24 20:35, Andrew Lunn wrote:
> On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
>> On 11/18/24 10:56, Russell King (Oracle) wrote:
>> > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
>> >> Add AXI 2.5G MAC support, which is an incremental speed upgrade
>> >> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
>> >> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
>> >> If max-speed property is missing, 1G is assumed to support backward
>> >> compatibility.
>> >> 
>> >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
>> >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
>> >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> >> ---
>> > 
>> > ...
>> > 
>> >> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
>> >> -		MAC_10FD | MAC_100FD | MAC_1000FD;
>> >> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
>> >> +
>> >> +	/* Set MAC capabilities based on MAC type */
>> >> +	if (lp->max_speed == SPEED_1000)
>> >> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
>> >> +	else
>> >> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;
>> > 
>> > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
>> 
>> It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
>> (2500Base-X). The MAC itself doesn't have this limitation AFAIK.
> 
> 
> And can the PCS change between these modes? It is pretty typical to
> use SGMII for 10/100/1G and then swap to 2500BaseX for 2.5G.

Not AFAIK. There's only a bit for switching between 1000Base-X and
SGMII. 2500Base-X is selected at synthesis time, and AIUI the serdes
settings are different.

--Sean

