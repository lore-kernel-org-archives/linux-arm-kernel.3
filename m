Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB4D42BB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KnGx3ACBnnMv2BmaDE1d3Gtw8+1dg1ljAPNkRzxM8c=; b=UhLTyjZvq8V7rSYyJkKBZ6+Yy2
	kpjPiGhbzYk9x1/ZrBSvZBOfAbc3AcAQ6hx3+GcvH849M5KkO8FcW9PglAm9Wxnzq+0FK67d56udz
	uXS5ooLUZoUf3leGTHRcnEzqns8+GzS8z+sejGJlZ5Z9agUzU06ATJEkgVjYRn2AtUt1hpA4gt7vE
	iGwCVZv2O2RVbL1KvqOLGIn9QWCHHW7UM4L46VZlrlgQI++3cuAW5jpyiR9dyzmUkkCn1qnp9ZxHe
	+2i9/Rk/28rwaLOZkMUJhvke0E2r+PTjyuSEvCny6Zzn+LPIo5W+GYu+O7vTmq91+cKFR3hRgXtu/
	PiBQ1mMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuvX-00000004Pj9-3IE8;
	Tue, 12 Nov 2024 17:43:43 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuSi-00000004JdC-11rI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:13:57 +0000
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id AthFtRlojrKrbAuSgtShis; Tue, 12 Nov 2024 17:13:54 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id AuSdtLSYYaWWwAuSetY9wr; Tue, 12 Nov 2024 17:13:53 +0000
X-Authority-Analysis: v=2.4 cv=D/FBKORj c=1 sm=1 tr=0 ts=67338cd1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=oM_t_NHKBYUYTEO7nXEA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+KnGx3ACBnnMv2BmaDE1d3Gtw8+1dg1ljAPNkRzxM8c=; b=AozN/N0l9750TXxMIZV9dyrYzr
	pGPwMXEErQkZbfhuE2qJSjqeSI2GOs9LzqRhJEH5WTyajpDDai0UnZ+8/gsiQTPcKEv6hQRRLg/0s
	+7xHFVam1tSusiES8SgHsXFvRuI3b0orNqK4EI8x96i9NrCOiE0wckzlUPE/Dj0CVXyXdWMvJf6g3
	uBde9UXDm6TfRxDipncRac4MNAhLLPpl3QQ4sCps0Bd3XvDWMudY974mZj5fy8CUKOt8AaTxI0t7S
	OrMFf6kEML+ZhRAg4M/+KfEyr0iSPIO0yQCcgN9DsX5S4ejK5HFDkMrk2JqSUt7/KfMPRAf+1dAiO
	8e7zUG+Q==;
Received: from [122.165.245.213] (port=53470 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tAuSY-000Tbs-1d;
	Tue, 12 Nov 2024 22:43:46 +0530
Message-ID: <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com>
Date: Tue, 12 Nov 2024 22:43:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzNCsFiAiACFrQhE@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tAuSY-000Tbs-1d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:53470
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM1ENCwCdcjhHyvkAzaE6A7m1UKTJmAXTpC7cuHjgi/thLPl7NYD6PJBpVugFuYrkZNRFcO1mEAb82AyFoK96bgQ8pjmYk9AUnynS2K+CGCdZuRMbex6
 DFZDXYdq6OLB3KLOaZS4B16Pte3JRcntzsGBFFKS7DBQBPb+A4wJECLUyBFpvMEAleSszObeEOIpI/YJ6rxQC04VPc/MlIoeCIAPtHtnCfO2VN4WClajb56j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_091356_412659_EDC9F1F5 
X-CRM114-Status: GOOD (  30.27  )
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

On 11/12/24 5:27 PM, John Watts wrote:
> Hey everyone,
> 
> I'm not sure exactly where to add this but I discussed some of this with
> Parthiban on #linux-sunxi a few days ago, so I want to write it down
> before I work on the next version of the patch.
> 
> I had assumed for some reason in my mind that DE0 and DE1 here referred
> to mixers, but they actually refer to chips that have multiple DEs. It
> looks like at least with the A133 it has two DEs instead of two mixers.
> 
> This can be found by looking at the Allwinner BSP: SUN50IW10 requires
> CONFIG_INDEPENDENT_DE and has a device tree with an extra reg and clock:
> 
> <0x0 0x06800000 0x0 0x3fffff>,/*de1*/
> <&clk_dpss_top1>

Independent DE is unique to A133/A100 AFAIK.

> 
> However the tcon-top code seems to conflate mixers and DE in the
> mainline code and the Allwinner code. So ... It seems like 'DE0' and
> 'DE1' really do mean mixers in this case. It's probably best to note

#define TCON_TOP_PORT_DE0_MSK                   GENMASK(1, 0)
#define TCON_TOP_PORT_DE1_MSK                   GENMASK(5, 4)

references towards DE0 and DE1 is for DE itself, not the mixers in the
current implementation.

Handling for mixer0 <-> lcd1 and mixer1 <-> lcd0 also needs to set
DE2TCON_MUX in de clock, which is missing now.

> that down.
> 
> I thought a bit more about how to solve this properly- setting two
> mixers to the same output is something people probably won't do in
> practice, so the only way you could really arrive at this bugged state
> is by setting it as the default state. This patch may be the correct
> solution after all.

sun8i_tcon_top_set_hdmi_src for R40 already sets these values via quirks.
i.e controlling the port muxing. Also D1 quirks is same as R40. So the
original changes to make the DE1 point to TVx can also done in this quirk
without hardcoded value?

Thanks,
Parthiban

> 
> John Watts
> 
> On Sat, Nov 09, 2024 at 01:15:16AM +1100, John Watts wrote:
>> On Fri, Nov 08, 2024 at 07:36:16PM +0530, Parthiban wrote:
>>> To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
>>> R40) states the priority of the DE selection, which fails to work? Not sure,
>>> may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.
>>>
>>> With A133 following the same as T113 with single mixer without TV, still
>>> sets 0x20 in vendor kernel.
>>>
>>> copied from R40:
>>> Note: The priority of DE0 is higher than DE1.
>>> If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
>>> DE0 will be used for the source of TCON_LCD0.
>>
>> Hi there,
>>
>> Yes that was a pretty bad typo, I meant to say DE1 to TV0
>> The prioritization seems broken in the T113 at least, it's racy from
>> what I see in testing. I should note this in the patch too.
>>
>> I looked at the datasheets and kernel code briefly: I can't seem to
>> figure out what SCLK/HCLK gating does and I don't think the kernel
>> touches these registers which are gated by default.
>>
>>> Thanks,
>>> Parthiban
>>
>> John Watts


