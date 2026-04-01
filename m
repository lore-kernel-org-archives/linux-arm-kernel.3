Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D210F6FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19WL8u/FtwADOPiw/Q8BZVbKe3GSxsmUiIiiOWNEybY=; b=dsJOMHDh8O31mceKxWm40wlmoP
	udHu/4GpERNsnkLIkhT80UdxncRvG8tNVM5ZDPYFFRtJJBNALM9xK+tZHQWOIvGBSwVh86hrM5WwU
	yptXCU89jAHtU9a21Be4q92k/PfyQZT5qkb+pnx+oHNkfZfvgkUz7TSkthbqNeM6SX2b6i/oWctXO
	z66Mv6peIjTRxPPw9nG5BFkhsmS8ny+bfHMeAGVT6Uq5gYlqvtOe/HQgppDXW56WlA1A6Xop0wmL1
	6lmb0KOSQpdvo+Ea7szjs2DINOw7/brGLCw5sK1OT1OUuzjH2xXmbi0kZnfPfmQkIVXlhc8MunrDl
	XsyPEzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xTW-0000000FdJH-0AtF;
	Wed, 01 Apr 2026 15:27:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xTV-0000000FdIo-0OVA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 15:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=19WL8u/FtwADOPiw/Q8BZVbKe3GSxsmUiIiiOWNEybY=; b=j6ARsSn/0C7K19tfKZsSlyEQ7e
	KPDAn2Xes96T6oRKqCBgRerNN9dELZ247Ia0kWklzKfjXF4SvfPDoNcopbxLU1yyLmzOrQUWTRNv1
	aD3x2ScwVV6nTkGllPsWrmAF3vBWiczgz0lns5SXrolb1/KHbUj6G5trBxvrZy3EcsRPCgTaShPGD
	hfg1QzeYrz4KwgFRtG9/o1CPC15hQPmAAbKXXnbdAKrmDN6PE6B0Mq4BeE+gMKLkSZS1OKgkOo7cU
	jlAZtc/bNxFe94fSqB1UwDZN9bwQHId9o82saLe6x/Va1KwPSB50SSPwjYpdi7RQeQptvat1wAqQq
	ghKAjRBA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xTR-00000000lJW-3rnh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 15:27:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6923832AC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 08:27:10 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 068573F641
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775057236; bh=y+MhPjsu8qOsmSPWBWTYc0aedsaAPB/kfVjv0IQGfi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yeb/1CDq0iPMwi9ea05PTfH88DUfOwPLAEH2XMfimw84CF2SLdL/gaNgJRwebTqYu
	 YfVUABfzLeTknhOo40M64IV4DLW5GGp10LDfKiLlKHVGBm2bp5xwXWq++BxEu8+lsz
	 0NI9IHrip1PIBTrs8aNtnnCwpVQiLSw5O/N2LoVo=
Date: Wed, 1 Apr 2026 16:26:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: Re: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX952 support
Message-ID: <ac05OpEMjKMd8CXy@e142607>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
 <acva1Xt8V4k9-uG8@e142607>
 <AM0PR04MB47073E9E8B5C704BCF5D9F72F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
 <99a1da55-d6e5-4d11-abaa-8c85283ab5f2@oss.nxp.com>
 <AM0PR04MB4707B3E37DFE7AEE587DBA2AF350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
 <aczv0R0aQRmHKdvt@e142607>
 <AM0PR04MB4707335CC7035232D44E6ED9F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB4707335CC7035232D44E6ED9F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_162718_211442_B29D2E4B 
X-CRM114-Status: GOOD (  46.25  )
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

On Wed, Apr 01, 2026 at 10:31:01AM +0000, Guangliu Ding wrote:
> Hi Liviu
> 
> > On Wed, Apr 01, 2026 at 09:43:12AM +0000, Guangliu Ding wrote:
> > > Hi Daniel
> > >
> > > > On 4/1/26 11:48, Guangliu Ding wrote:
> > > > > [You don't often get email from guangliu.ding@nxp.com. Learn why
> > > > > this is important at https://aka.ms/LearnAboutSenderIdentification
> > > > > ]
> > > > >
> > > > > Hi Liviu
> > > > >
> > > > > Thanks for your review. Please refer to my comments below:
> > > > >
> > > > >> On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> > > > >>> Add compatible string of Mali G310 GPU on i.MX952 board.
> > > > >>>
> > > > >>> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> > > > >>> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>
> > > > >>> ---
> > > > >>>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > >>> | 1
> > > > >>> +
> > > > >>>  1 file changed, 1 insertion(+)
> > > > >>>
> > > > >>> diff --git
> > > > >>> a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yam
> > > > >>> l
> > > > >> b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > >>> index 8eccd4338a2b..6a10843a26e2 100644
> > > > >>> ---
> > > > >>> a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yam
> > > > >>> l
> > > > >>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf
> > > > >>> +++ .yam
> > > > >>> +++ l
> > > > >>> @@ -20,6 +20,7 @@ properties:
> > > > >>>            - enum:
> > > > >>>                - mediatek,mt8196-mali
> > > > >>>                - nxp,imx95-mali            # G310
> > > > >>> +              - nxp,imx952-mali           # G310
> > > > >> Can you explain why this is needed? Can it not be covered by the
> > > > >> existing compatible?
> > > > > There are functional differences in GPU module (GPUMIX) between
> > > > > i.MX95 and i.MX952. So they cannot be fully covered by a single existing
> > compatible.
> > > > > On i.MX952, The GPU clock is controlled by hardware GPU auto
> > > > > clock-gating mechanism, while the GPU clock is managed explicitly
> > > > > by the
> > > > driver on i.MX95.
> > > > > Because of these behavioral differences, separate compatible
> > > > > strings "nxp,imx95-mali" and "nxp,imx952-mali" are needed to allow
> > > > > the driver to handle the two variants independently and to keep
> > > > > room for future
> > > > divergence.
> > > >
> > > >
> > > > This information should be added in the commit message explaining
> > > > why
> > > >
> > > > the change is needed.
> > > >
> > > >
> > > > But then where is the driver code taking care of these diferences?
> > > >
> > >
> > > Yes. Currently the driver does not require "nxp,imx952-mali" string.
> > > However, when GPU ipa_counters are enabled to calculate the GPU
> > > busy_time/idle_time for GPU DVFS feature, they will conflict with the
> > > hardware GPU auto clock‑gating mechanism, causing GPU clock to remain
> > always on.
> > > In such cases, ipa_counters need to be disabled so that the GPU auto
> > > clock‑gating mechanism can operate normally, using "nxp,imx952-mali"
> > string.
> > 
> > OK, I understand that you're following guidance from some other senior
> > people on how to upstream patches so you've tried to create the smallest
> > patchset to ensure that it gets reviewed and accepted, but in this case we need
> > to see the other patches as well to decide if your approach is the right one and
> > we do need a separate compatible string.
> > 
> > If enabling GPU ipa_counters causes the clocks to get stuck active, that feels
> > like a hardware bug, so figuring out how to handle that is more important than
> > adding a compatible string.
> > 
> > Either add the patch(es) that use the compatible to this series in v2, or put a
> > comment in the commit message on where we can see the driver changes.
> > 
> 
> According to discussions with the GPU vendor, this is a hardware limitation 
> of Mali-G310 rather than a hardware bug, and it has been addressed in newer
> Mali GPU families.

I represent the said GPU vendor and I think I know what you're talking about, but you're
taking the wrong approach. All G310s have a problem where in order to enable access to
the ipa_counters the automatic clock gating gets disabled. So the solution that needs
to be implemented when we add support for IPA_COUNTERs will apply to all GPUs, not just
MX952.

> 
> In addition, ipa_counters are not enabled in the current Panthor driver. We observed
> this issue with the private Mali DDK where ipa_counters were enabled.
> Therefore, keeping the compatible string is necessary to allow for future divergence.

This is not an MX952 issue only. You might be aware of it on your SoC, but it's not just
for it.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

