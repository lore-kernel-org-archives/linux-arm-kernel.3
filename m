Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6088CCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBvknfRADrFTmcYESe6FCG/DDohCJeCBYoa6CBvKIBU=; b=5DHdoP/AGN4FU/lANhX+fjAkaj
	Hk1QeVwSHnY11LoehJA3LvtUY5dEfeDjzlb/srbp3vD7q1bup502AjVcTH7nlucRFhyYNkacMvI4m
	4/AEkhgJD0AgIS5db6ntOIK5lGeeaxmVq0HXSGPLJ6Q0ncZIOVC92pKiX80CNcgbzJdA6ZeYzhtt/
	5eoUQlskECImYowfBxZ+3uXp8YqQQAtScgywML/5DNcDH1isZoJ7hsVReTH1zitgnKTSkS8NYXhRu
	eLjlox9qOV+z0UYILbfo6a/rLI5hVan83KjoWrJabzkZsXEP3wlc6ZEpFq7gnLHyPsNlB3xERn9fI
	qm+2VHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uusXG-00000007nGq-1695;
	Sat, 06 Sep 2025 13:00:54 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uusUP-00000007n8Z-3M1B;
	Sat, 06 Sep 2025 12:57:59 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1757163476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBvknfRADrFTmcYESe6FCG/DDohCJeCBYoa6CBvKIBU=;
	b=XkpDbGiOFHdQgB47WOPXPYIS3DTQy0c5jxkWEfob9EfgzYFSNRP9rSKd1v0AIi9ihAVPdx
	aZjIX4ENRCw9Qb+7f9vDATzWkRvOPjT3RqdIZ9/LYiXqGBX7fl5d4aBQh7ANwssBHKcWkL
	DzZQR3TYyHg0/PgBKf6mgXezWu2W4fPkYZlKZwbecZGYkWZEBi/NMhE8lcE1KAMN0f2M7W
	DK8rTMFX8t0t3ZfY44BlmrlUwtBULe4ON2qDeWalDoKKQj4Hh1Lz2oshs8X0s1jEzHIyZA
	KoMUppZZvNgrdQw9KCVfaqmHItrj6uqcIyPIBCSlTjgStWa0lLx0cKVZGml6kQ==
Date: Sat, 06 Sep 2025 14:57:55 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Diederik de Haas <didi.debian@cknow.org>,
 linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming
 uniform
In-Reply-To: <3169011.CbtlEUcBR6@diego>
References: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
 <DCLOTR9Y380M.22GZYL11XXZM2@cknow.org>
 <47cf50f2f497108a923815c12b1f8c9b@manjaro.org> <3169011.CbtlEUcBR6@diego>
Message-ID: <f34b6fad7768dd88b40284fa330af4f2@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_055758_185789_F3961683 
X-CRM114-Status: GOOD (  23.27  )
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

Hello Heiko,

On 2025-09-06 14:21, Heiko Stübner wrote:
> Am Samstag, 6. September 2025, 14:10:22 Mitteleuropäische Sommerzeit
> schrieb Dragan Simic:
>> On 2025-09-06 13:40, Diederik de Haas wrote:
>> > On Sat Sep 6, 2025 at 12:01 PM CEST, Dragan Simic wrote:
>> >> Unify the naming of the existing GPU OPP table nodes found in the
>> >> RK3588
>> >> and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes,
>> >> following
>> >> the more "modern" node naming scheme.
>> >
>> > Like we discussed in private (without an agreement), I think it would
>> > be
>> > beneficial if the (gpu) opp naming would be made consistent across SoC
>> > series as right now there are several different naming schemes applied.
>> > They're all valid, but inconsistent. And if consistency is improved,
>> > which I like, then let's go 'all the way'?
>> 
>> As we discussed it already in private, I fully agree about performing
>> the "opp-table-X => opp-table-{clusterX,gpu}" naming cleanup
>> consistently
>> for all Rockchip SoCs, but I'm afraid it would be seen as an 
>> unnecessary
>> "code churn" at this point, especially because my upcoming Rockchip 
>> SoC
>> binning patch series is a good candidate for such a cleanup.
>> 
>> On top of that, I'd be a bit weary about performing at least some of 
>> the
>> testing associated with such a platform-wide cleanup, despite actually
>> performing no functional changes and being a safe change.  On the 
>> other
>> hand, "bundling" such a cleanup with the Rockchip SoC binning patches
>> would get us detailed testing for free, so to speak.
>> 
>> Of course, if the maintainers see this as a good opportunity to 
>> perform
>> a platform-wide cleanup at this point, instead of seeing it as a "code
>> churn", I'll still be happy to extend this small patch into a 
>> platform-
>> wide naming cleanup of the "opp-table-X" nodes.  On the other hand, if
>> this patch remains as-is, it may hit a good balance between resolving
>> the currently present naming ambiguity and the amount of introduced
>> changes.
> 
> Personally I'm always for the "we strive to get there eventually" 
> thing.
> If there is an established goal to reach, steps can be incremental :-) 
> .
> 
> And also short and scope-limited patches are easier to review anyway.

I see.  After thinking a bit more about it, I'll turn this patch into
a small series, in which this patch becomes the 1/2, and the 2/2 is
a new, larger patch that extends the "opp-table-X" naming cleanup to
the entire platform.  That way, the 1/2 kind of fixes something, while
the 2/2 performs a cleanup, which may be helpful in the unlikely case
that some regression is found down the road.

