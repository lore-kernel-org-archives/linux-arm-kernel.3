Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90748C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtZ+kJShlztap1ZiGnzVwpQlAtLPpwIUfh2jgrQu/2c=; b=tQwrna8bSyJKRtIU9zHHqgjMQx
	92By/2u3U9lcck1zp+AQQjTzybPDmdnDPHkhoP2Gp3fSMellKihWXZ9bDF8M0oID0THRqfX67zVGv
	iJEFzL3xr1lKwJ5aaxiW0G1QxVrE9WOczcpJswgWxdw8dcRM3TmEuEO3hCrSBR9CZ7tz7TjuhNXZE
	cc2UZ5iWRysfdwZRvkDRii3AxXHKl1MRZl2kENtt2tpYCnoxcb8JK/oibxpgYMF00YvF/H9/+C6FM
	E/OFBcyc2m+v6amPNfBFWNq1oTET73F+Z8QmcICyT3ivzebqUI4AQ3mQ0ydV1RllpWTqizlBS05c+
	PX4O60rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lfy-00000008Af7-1elW;
	Wed, 23 Sep 2026 12:02:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lfw-00000008Aek-2QHt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:02:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13FDF1570;
	Wed, 23 Sep 2026 05:02:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FDC63F86F;
	Wed, 23 Sep 2026 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790164931; bh=ZSA9NmHbOKoODpNc+Db6J+pL8NPkAuD5MPRRVnRkWak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnnDZKTk607Xz6jmhC3bEIAsMk9ckTgPQN8GF+0wt7oCRTSwavnSKYeYKg/XzFebi
	 wkC89TEd4T2cmzMg9dP5dR9s9O8pAwuL1BJEKRjUQO776fY8cp12btfjbzTgRFAhOP
	 CJelwlr/v83wl2gw/weTODamNHJ4YevZp89whv68=
Date: Wed, 23 Sep 2026 13:02:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v12 05/25] include: trace: Add Telemetry trace events
Message-ID: <arO_vXAptcW5nwSy@pluto>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
 <20260920091928.2014972-6-cristian.marussi@arm.com>
 <7a6fab99-618c-4180-b8b3-2d1371c90483@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a6fab99-618c-4180-b8b3-2d1371c90483@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_050212_658754_603876B2 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 22, 2026 at 03:48:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/20/26 11:19, Cristian Marussi wrote:
> > Add custom traces to report Telemetry failed accesses and to report when DE
> 
> You write here "failed accesses", but the tracepoint below is called
> "scmi_tlm_access". Is it supposed to be used for any accesses?
> 
Yes..this is definitely a stale commit message since the first iteration
of the series...

I'll fix.

Thanks,
Cristian

