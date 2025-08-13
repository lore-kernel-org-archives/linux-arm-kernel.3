Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7535BCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=va1iWFb58hS7RAbK7e0FHh68Xc18EBZdhWQef4KXTY4=; b=S45wUS9l1iVq92paqU+LoGo4oi
	sdU/07WLnaFG3YrkRPopSB8BqMG9bb1D8BBNef8FXwPK8x97ImflS4Ijw6ebUPGv+3brc/CaF55nz
	9JfHURABYMLHIV+AHtTcLLUNpgDZkv4NdfHia8pFgB5/sbV0zD20YUD1lG/0MIBxmK+Muq8qM4ty8
	ZR6u60KZDSPUcMTWQr1lhBcTfiPV7X7SGIWVY9Vv3dVieq8+X4Yj1T9SeEjs5kBQlfnpIcMhYG5sP
	JEYiGiEcba4wgLwaLp55zPkZ80vq0Js3UVo4rLUKCUH86IAGwAO1ZVbmAgqlwaPch+VSq2qPkPPsR
	3QoalFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEyp-0000000EXuS-2VuV;
	Wed, 13 Aug 2025 17:09:39 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE0S-0000000EJmR-2uKJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755100536;
	bh=N4JCyCl3TMqGdxL8z8nyy4b0wwx4vjcVA+ne1uluhZo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iLZpmoWpVApJyh/MbWULYTT+MrxPWB884CI1fKVacIcDXp6PMJbZNxlv5xjj6s4EE
	 +V19nVSCemZ5TY9cj27OLG63WxO6hTKf96CxuDRjT8B7Gq+26M39qNVya6GxBnA0ny
	 87ap3K00EQEpcVZU4nqiP3VgHFPGZl1TSIwGWXEc=
Received: by gentwo.org (Postfix, from userid 1003)
	id 47644401FB; Wed, 13 Aug 2025 08:55:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 453694010E;
	Wed, 13 Aug 2025 08:55:36 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:55:36 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Sudeep Holla <sudeep.holla@arm.com>
cc: Jeremy Linton <jeremy.linton@arm.com>, 
    Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, patches@amperecomputing.com, 
    Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org, 
    bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de, 
    nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
In-Reply-To: <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
Message-ID: <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com> <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com> <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org> <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_090716_769055_30AFB9F2 
X-CRM114-Status: GOOD (  16.66  )
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

On Wed, 13 Aug 2025, Sudeep Holla wrote:

> > The problem is that this information is being sourced from the ACPI PPTT.
> > The ACPI specification (AFAIK) doesn't define a cluster, so the linux
> > cluster information is being 'invented' based on however the firmware vendor
> > choose to group CPU nodes in the PPTT. Which means its possible for them to
> > unknowingly create clusters, or also fail to create them when they make
> > sense.
>
> +1, completely agree. As Jeremy mentioned, it is hit or miss and cluster
> is loosely defined and IIRC Huawei pushed this based on their platform at
> the time and it did break some benchmarks on few other platforms. So it
> is not a good idea to make it default config IMO.

Can we figure out which platforms benchmarks were affected and why?

It seems the notion of a "cluster" on ARM64 is derived (I guess a better
word than "invented" hehe)  from sibling information instead of PPTT. But
using that information should work fine right?


