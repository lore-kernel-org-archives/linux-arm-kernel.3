Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F9606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wnTWoRMd;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Tjb6TUCQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Msd07b8Kgx8v1VWINbHbc0sUGrkBbqikBSOBM45eS30=; b=wnTWoRMdzSHPmw
	Etus4w/xAlLpzGxbQZNCFumBEwY4WzmB+B1nWkz6JrA1T/0Yk4yNMaLQxAHeQY7K52iWbOsVS7jPF
	TJTAlTkGq4iAtmXi8RYY5PH9G2TRfB3ugvcbjrMkFz5aTk7YNrKCrgoj09mBXGdTitZy7XhyrSbJ/
	D/AruZNcRElGISbONWRQ92RJt3vlqy4PtvKVYLNEgCVw0k08JFkwzV3I+YNnrr1dMpEndIVzMNPOU
	NKAmb5DizmOSQh84HYYXItR7h0Dmy6pSRN4nIAtVl6sRVcePpHNvJHINHOjKL0i6bKvMztho9C8nt
	yRTf6/9E9e/7YdJONANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtCt-00000008Cf4-2d3w;
	Thu, 05 Nov 2026 08:52:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtCp-00000008CdJ-0mXX;
	Thu, 05 Nov 2026 08:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793868740;
	bh=zF4UneQYBw/Lw+DtqeKovavXzEG4vgp4Z2EEg+Ep6uw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tjb6TUCQv7G3DF8S0DUoHTXD4RBLtwXZXUNLb8OZDjnopzJw1gVPlztewE6DXF3UA
	 dyYleUyOOVLdxnw3YgsEVOFFUzqqlU8pz0IVngl7hqrT6UCw9vq3bo7l+yOZ+mfoMw
	 fxYbeEZrIoh+PAIOuOz0Fdyn+RrUnUNGwIaG/D64yZF/wy+7o2joauYl/br2M2dei5
	 pLEaRu/7XZG+xgenRXc2Fy9VZWkEyNTqTrrT4+K7MSNJyKymyHP6R3L07BXa736XpT
	 EayyMhup1elnmA0avhgBmDdRSYj+qe2eEMJqDyEJxRaEfZaBSPtx8BqrlG9/1Lv+rK
	 pU5dKp5/Xy5VA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D64B117E05D6;
	Thu, 05 Nov 2026 09:52:19 +0100 (CET)
Message-ID: <f21d912a-48ea-4f0d-bab4-526e617f1769@collabora.com>
Date: Thu, 5 Nov 2026 09:52:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] pmdomain: mediatek: Enable the GPU timestamp
 counter on MT8188
To: =?UTF-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Stone <daniel.stone@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, ulfh@kernel.org,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
References: <20261011184755.2058017-1-michal@nozomi.space>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261011184755.2058017-1-michal@nozomi.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005223_967114_C1006CC1 
X-CRM114-Status: GOOD (  33.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/26 20:47, Michał Kopeć wrote:
> On MT8188 the GPU timestamp counter reads zero until a register in the
> MFGCFG block feeds it the SoC system timer, and MFGCFG loses that
> setting whenever the MFG1 power domain is turned off. As a result, the
> SYSTEM_TIMESTAMP query and the timestamps written by GPU jobs are always
> zero, which breaks timestamp queries in userspace drivers.
> 
> v1 restored the register from panfrost through a new mediatek,mfgcfg
> phandle on the GPU node. As Krzysztof pointed out, the register is lost
> by the power domain, so v2 restores it there instead: the power

The register is not lost by the power domain, it's lost by the MFGCFG block
getting unpowered and (all) its registers being reset to the defaults, where
the defaults happen to be zero... and then the MFGCFG has a bus protection
block yes (unused for us), but that's at offset 0x20, so if you define that
as 0x130 it becomes plain wrong :-(

Besides, get this:

"MFG_TIMESTAMP_EN" is a register field that doesn't exist... so here are the
correct definitions ;')

#define MFG_TIMESTAMP		0x130
#  define TOP_TSVALUEB_EN	BIT(0)
#  define TIMER_SEL_SOC_TIMER	BIT(1) /* unset: MFG timer, set: SOC timer */

The issue that you're talking about here is not specific to MT8188, but to all
of the MediaTek SoCs with either Mali or PowerVR that are *not* using the GPUEB
firmware (so all Chromebooks and Genio boards before MT8196/MT6991/MT8894).

This doesn't belong to the power domain driver, as this is definitely not in any
way related to powering on the MediaTek Flexible Graphics (:'D) block, so this
has to be done somewhere else.

That said, let's see what a good solution could be here...

...so, the MFG Block has got a Hardware Timestamp Engine that needs to be kicked
from the MFG Configuration register area, specifically from the the MFG IP
Timestamp register.

Once the timestamp engine's timer source is selected (TIMER_SEL) and you made sure
that the actual timer source is running (eh, first make sure it's running, then
select), you enable the MFG-Top (Top==Global) TimeStampValueB (TOP_TSVALUEB_EN).

When those registers are set, your Hardware Timestamp Engine is fully ready and
will start running when frames/commands/etc come, adding a timer time to each of
the frames/commands/etc (which is why this is a timestamp engine) in a hardware
assisted manner (and this is why it's a *hardware* timestamp engine).

Now that we know what we're dealing with... we're pretty sure that this is a

H T E  .... (drivers/hte hello)

Documentation/devicetree/bindings/timestamp/hardware-timestamps-common.yaml

Panfrost needs a hardware timestamp engine to do timestamp counting, right?
Panthor would need the same.

That's not MediaTek specific, because there's a generic hardware timestamp engine
binding, so I'm sorry but you can go back implementing HTE support in Panfrost and
Panthor - in a very-very-very generic way - using the HTE APIs.

You'd have to write a (very small, really) HTE driver for the hte-mediatek-mfg.c
but that's not a big deal, a first version of that driver, which can be upstreamed
could do just:
  1. Make sure that the MFG-TOP power domain is on (not the cores domain, just the
     top one!), which is easy, it's just one line; and
  2. Set the register fields in MFG_TIMESTAMP to the correct value when Panfrost
     asks to start or initialize the HTE; and
  3. UNset TOP_TSVALUEB_EN when going to sleep, or when Panfrost asks to stop/deinit
     the HTE.

It's a 50 lines driver, nothing more (well, I didn't write anything so I don't know
but trust me it's going to be around that linecount).

That's how this matter can be resolved.

Btw, thanks for bringing this up, I didn't even realize this was an issue.

Cheers!
Angelo

> controller lists MFGCFG in access-controllers and writes the register
> every time MFG1 has been powered on.
> 
> Patch 4 converts mt8188.dtsi from the deprecated per-domain
> mediatek,infracfg phandles to access-controllers. A devicetree with it
> needs the driver changes of patches 2 and 3, because older kernels
> expect exactly one access controller on MT8188 and fail to probe the
> power controller otherwise. Older devicetrees keep working with the new
> driver, without the timestamp.
> 
> MT8370 uses the MT8188 power controller and mt8188.dtsi, so it is
> covered as well.
> 
> Tested on the Lenovo Chromebook Duet (MT8188): the timestamp counts at
> 13 MHz, also after suspend and resume.
> 
> Changes in v2:
> - Restore the register from the MFG1 power domain instead of panfrost,
>    and drop the GPU phandle (Krzysztof).
> - Drop the panfrost patch, which makes the review comments about error
>    propagation and MT8370 moot.
> 
> v1: https://lore.kernel.org/all/20261003200132.866240-1-michal@nozomi.space/
> 
> Michał Kopeć (4):
>    dt-bindings: power: mediatek: Add the MT8188 access controllers
>    pmdomain: mediatek: Restore a register after powering a domain on
>    pmdomain: mediatek: mt8188: Enable the GPU timestamp counter
>    arm64: dts: mediatek: mt8188: Use access-controllers in the power
>      controller
> 
>   .../power/mediatek,power-controller.yaml      | 16 +++++++++++++-
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 22 +------------------
>   drivers/pmdomain/mediatek/mt8188-pm-domains.h | 16 +++++++++++++-
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    | 19 ++++++++++++++++
>   drivers/pmdomain/mediatek/mtk-pm-domains.h    | 15 +++++++++++++
>   5 files changed, 65 insertions(+), 23 deletions(-)
> 


