Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F54C6369F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJPJzhjjRO1BmfUX3cSoMXKjm0XYeI0fKD9fAqmLGTQ=; b=14zh/mnqaOmCwD/aHd/c0rq4Hr
	CCmfcHUNudtF5Gu59B2yvmaN2Mgp5iOjBvDL7hilnOGjD6c09MEojHN1jNY7HfeG3T2jLPeuXgGV4
	UzmB3iJoEli/P6b7I0lhGAAfS26Ek8aE+FrxeKcCr5kTEX/CFLU+PaJAwjt/pkeLswc54Ee42vb3B
	98UepgSZ7PI/qeXJSnAzgfwlXlOW6F+6LBrHh2XOss7EVksM8JLONotd/yBwMg2L+i9xstKv/H/yk
	2WhdZA7g6ROPSxzEzvybStnbW0LbwOsZfKAiFB9IF4jN4+uYA+pL4dq/y3I+qJfHXIRDDG2ylvcAF
	K0B6Bd9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuAoU-0000000Gl31-1jQ1;
	Sun, 22 Feb 2026 14:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuAoN-0000000Gl1V-3NEj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 14:52:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ED2A339;
	Sun, 22 Feb 2026 06:51:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CB193F59E;
	Sun, 22 Feb 2026 06:51:46 -0800 (PST)
Date: Sun, 22 Feb 2026 14:51:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] firmware: arm_scmi: Increase SCMI_MAX_NUM_RATES to 64
Message-ID: <aZsX-oplR6fiLBBN@pluto>
References: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_065155_904599_E6371B64 
X-CRM114-Status: GOOD (  14.73  )
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

On Fri, Feb 20, 2026 at 10:53:31AM +0100, Geert Uytterhoeven wrote:
> Currently, the SCMI clock driver supports up to 16 clock rates.
> However, the SCMI specification v3.2 does not explicitly specify the
> maximum number of clock rates that can be returned (the theoretical
> maximum is 4095 in the first call of the CLOCK_DESCRIBE_RATES command,
> followed by 65535 remaining rates in subsequent calls).

Hi Geert,

> 
> In Renesas R-Car X5H SCP FW SDK v4.28.0, some clocks have 32 or 64
> rates, which are returned in blocks of maximum 27 entries.  When SCMI
> firmware returns more than 16 clock rates, Linux ignores all clock
> rates, this reducing functionality of the affected clocks.
> 
> Fix this by increasing the maximum number of clock rates to 64.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This does increase the size of each scmi_clock_info object by 384
> bytes, which is way too much on a system with nearly 2000 clocks.
> As currrently all scmi_clock_info structures are allocated together as a
> single array, the .rates[] member cannot just be converted to a flexible
> array, without splitting the allocation.
> 

Indeed the clock protocol does NOT dynamically allocate based on
discovery outcome, like other SCMI protocols do, so that's a waste
of resources that does NOT scale...I am gonna fix this, first, by
allocating dynamically strictly for the effectively discovered
resources (liek other protos do)

> An alternative solution would be to no longer store all rates, as
> proposed by Étienne Carrière in "[PATCH v2 1/2] firmware: arm_scmi: get
> only min/max clock rates"
> (https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com)

Yes, the other further optimization could be to just query for min/max that
are, indeed, the only rates needed currently, BUT Etienne series open code a
brand new SCMI enumeration instead of rework and use existing SCMI iterators...

...I have an old incomplete series of mine that rework this...not tesetd and
partially working of course :P...I think I will try to give it a respin to
put such optimization on top of the above rework...

I will try to post something this week...let's see

Thanks,
Cristian

