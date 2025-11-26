Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0853D10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joNFeCkdd3S4KenEQOGHKsnCh+9NeO00TItHMLiqyCc=; b=2g2rgv///iiuduZxJpu5/AlGP+
	idANVvqGePe/EzRt9t35lH0GB9QCzwF9G2zcPJiBD/Si6VqaznaC4gfkFg07i47iEgM0k/6g4REXU
	eSe41oYgmK5/QbCzPuVylLtwCA3wpXlgR05M6Tn3dI5urfq50VWMDaueH4K3jvvLdD8LvZWtQJaBk
	9lp1hklMCUrGtqOxsAjIz3s/EoXSxosiEnjyNiC6ZSRFnPdcyyW8L+a9GF7LlxjCN9QN0qukC8y4Y
	yR2zQ5GGIy89QEj1IDKXWhz7rBDjzTbNZ79nCpwkgzsi+2OZzRa20gLLx8a716nviuCa1W7MMYQwI
	f+dao88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE4L-0000000EwCH-16gd;
	Wed, 26 Nov 2025 11:52:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE4J-0000000EwBl-0i3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:52:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19960168F;
	Wed, 26 Nov 2025 03:52:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CE493F73B;
	Wed, 26 Nov 2025 03:52:16 -0800 (PST)
Date: Wed, 26 Nov 2025 11:52:13 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: <vincenzo.frascino@arm.com>, <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: morello: Add CMN PMU
Message-ID: <20251126-bipedal-lumpy-rabbit-d92d1d@sudeepholla>
References: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
 <f06636ed-c96f-4504-9706-9274cfd0c15b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f06636ed-c96f-4504-9706-9274cfd0c15b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_035219_248316_DB07F4A7 
X-CRM114-Status: GOOD (  13.07  )
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

On Mon, Nov 24, 2025 at 04:35:39PM +0000, Robin Murphy wrote:
> [ Trying to catch up with loose ends... ]
> 
> On 2025-05-27 1:55 pm, Robin Murphy wrote:
> > Although CMN-Skeena is mildly modified for the Morello hardware
> > architecture, it still identifies itself as CMN-600 r3p1. Since
> > there are also no documented changes to its PMU functionality,
> > we can make the PMU accessible via the standard CMN-600 binding.
> > In general, PMU registers are non-functional on CMN Fast Models,
> > so this is only meaningful for the real SDP hardware.
> 
> Vincenzo, Sudeep, any opinion on this? I believe it was considered useful by
> at least the one person who asked me about it :)
>

Sorry for missing it earlier and even this almost 😉. Anyways too late for
v6.19, will pick it up for following merge window.

-- 
Regards,
Sudeep

