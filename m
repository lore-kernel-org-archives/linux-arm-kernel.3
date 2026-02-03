Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F79E87859
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qul62GtCDsQZaOnqvry1ZplbnKvVjFpiZ9Xacrsftfw=; b=Y0Csf5Ptn/JRRURRKOd9ZDhyCW
	LnVaaouKLunsHyMFYZqE/76kAvDO6LFJkcWuy0As5NZrZ+rOKdar8kqxiEKhWcuaW0YdKefS5qlQL
	kbnFBJnvHFGhgnaPM6SoMyYdcu2SCJghmPVlEUdK/os7Bz7YssfxJH/FSDZja5nfnvus3DOIAS1OH
	S3UlRom6Bwdt3hopcOBidtmZxHFyQMhm7BQ6ZfLJKyhmJOTXQ9DAGALBebQ1n2Ehq80Dchifhnrc5
	VtR5VfI4lgkkmksSXvSMiszBhe8MSeyQaZYeA2CxivCIrA9lx1vR37hjBqjYDrouwfavBfNustaJV
	K5mUS5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMXz-00000007Gpb-0l58;
	Tue, 03 Feb 2026 19:58:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMXw-00000007Gog-2Z3b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 19:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=qul62GtCDsQZaOnqvry1ZplbnKvVjFpiZ9Xacrsftfw=; b=gT
	EutDCGk6vzh06S51sz6Yk8lO5i98esRV2XUpNLLw9ojyZCHmeknBNHQm+nVR+6S/qsePbHIhZicfJ
	FMZK6NmjZQNQctP02fDZznHj9XIoMDdlq9EdZhRy0RfrkKDZF4LElRg6762D6jWjATPfD8ifhB99h
	V790lNuV3oHNyd8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vnMXm-005zYN-PS; Tue, 03 Feb 2026 20:58:38 +0100
Date: Tue, 3 Feb 2026 20:58:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
Message-ID: <96adf8b2-da6e-491e-a20f-acccd988d585@lunn.ch>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
 <aYIYBheQgIN71os8@smile.fi.intel.com>
 <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
 <1ac7be34-22b1-4d93-9957-fc7ade9a2649@lunn.ch>
 <DF13B121-56F2-4987-A47B-99A20E18554E@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DF13B121-56F2-4987-A47B-99A20E18554E@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_115848_652099_57089BDA 
X-CRM114-Status: GOOD (  10.49  )
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

> Before, the driver was always doing the dynamic allocation due to
> i2c_add_adapter(). So there could not have been a system that relied on
> consistent i2c bus numbering. Even between reboots bus numbering could change.
> 
> The systems that did set pdev->id and were expecting a consistent i2c bus
> numbering were broken to begin with.
> 
> This patch won’t break any existing systems or cause regressions.

Great, now please add that to the commit message. These are the sort
of things reviewers want to know, is a change going to cause
regressions. If you have done your homework, mentioning it in the
commit message will help avoid the questions being asked.

       Andrew

