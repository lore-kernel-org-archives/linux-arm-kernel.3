Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD756CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OUP69zR8aHNAmQlT93cdQxLtLhdkhob28vAK60QH8A=; b=cLdS0VlM5uAC3eQgDSE0cmKBdI
	/6w7eEyrc4rmoM5EqrXvDOBPrBixaYlrpMzFx277DgKYOy/cvLnINi366vYriPZdrYfUWvAZ0/D2l
	iZvLAEC1npQY2uk3ElR1Cmz3kuSKgthM1tOV9tY1iNM6cr8PS1A7647DGMitzaUoB862jlgJOZB0G
	5cbQGR8be/9/Jnk6kDfYSk6myLjmvABQttg2Jv2SAYj8p3S6t4snpHFBaUNkZ+VV/Su/Y3A2nf/lv
	Z1XsKHDia6WFtYA62jMvfZ+PNqs3hD86YfLOXTFgcLkK94sZis8NdSTMw48GgNKcobOuspVQ/5IuS
	rLdhvRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7yG-0000000DFba-3NYF;
	Wed, 13 Aug 2025 09:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7mw-0000000DE8a-0HHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:28:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A614312FC;
	Wed, 13 Aug 2025 02:28:44 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6C003F63F;
	Wed, 13 Aug 2025 02:28:49 -0700 (PDT)
Date: Wed, 13 Aug 2025 10:28:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	catalin.marinas@arm.com, will@kernel.org,
	patches@amperecomputing.com, Shubhang@os.amperecomputing.com,
	krzysztof.kozlowski@linaro.org, bjorn.andersson@oss.qualcomm.com,
	geert+renesas@glider.be, arnd@arndb.de, nm@ti.com,
	ebiggers@kernel.org, nfraprado@collabora.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Message-ID: <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com>
 <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
 <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
 <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_022854_147149_9C198FEA 
X-CRM114-Status: GOOD (  24.38  )
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

On Tue, Aug 12, 2025 at 12:32:36PM -0500, Jeremy Linton wrote:
> On 8/12/25 11:33 AM, Christoph Lameter (Ampere) wrote:
> > On Mon, 11 Aug 2025, Jeremy Linton wrote:
> > 
> > >  From what I've seen, SCHED_CLUSTER seems to be a bit of give and take
> > > depending on benchmark and machine. I'm not sure if it should be default
> > > enabled or not, but it would really be nice to have at least a larger sweep of
> > > benchmarks/machines in order to be sure of the decision.
> > 
> > If the hardware provides a clusterid then I think this clusterid should be
> > used for the sched domains. CONFIG_SCHED_CLUSTER does that. So it should
> > be the default.
> 
> Hi,
> 
> The problem is that this information is being sourced from the ACPI PPTT.
> The ACPI specification (AFAIK) doesn't define a cluster, so the linux
> cluster information is being 'invented' based on however the firmware vendor
> choose to group CPU nodes in the PPTT. Which means its possible for them to
> unknowingly create clusters, or also fail to create them when they make
> sense.

+1, completely agree. As Jeremy mentioned, it is hit or miss and cluster
is loosely defined and IIRC Huawei pushed this based on their platform at
the time and it did break some benchmarks on few other platforms. So it
is not a good idea to make it default config IMO.

-- 
Regards,
Sudeep

