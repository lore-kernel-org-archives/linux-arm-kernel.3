Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B072C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7AXBe2nBsZac3Ps2hZ0XISjLmnUGKdRnAnvM4vXFww=; b=wJEwjADGXnuEu3X+ZG5TFJQZ1I
	DpcpzcHxZ/7Yynq4TnuF8pK3d84xULgfuTUtgKuqjhcOgSK8nLRunRrVnvSNrRlTXvJi38cI1WrxP
	X24RfLRa3Uzy58iCrLUNWTDL/02Veno88Yrq5VULt3EkXzJBZ/4WFCHW6XgDc3EIcVsO80y6c8aBg
	BeSTvKepMNwvcYX4JfSQY5XcS27qEWuTvz0bsvSAgB2D8044A4ncdx+xhxks4zpwfqlF6XapBPQrS
	eFS8g3DB5mTfp7phO/fmDpwYTQFMXKq2lxR2VxQmbW8svcrFoPn+HjOYaXC7hue0hS5J5q3UDL57i
	D79s0Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yVx-00000009cI4-1mbi;
	Tue, 08 Sep 2026 16:17:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yVw-00000009cHx-0hqj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I7AXBe2nBsZac3Ps2hZ0XISjLmnUGKdRnAnvM4vXFww=; b=Tpw89ndtq1vg++U6C6oY1IH/HA
	hFjj38JkXg12Ds560z9hxnz9/LBvEvKwDOxWILci/Wcmt8YeopxuKsy4dWR2ipAJRxr8TYzL15MX+
	cry9ufK2QCKZDctuvwwT+pDtSgSRj6h81CPPbFbxf2Okji1K1UVxXA404qvFl8TZ4tlrpzgMs43k9
	vswpf5oiAGMR4lcUvu9EemT2gDYq0eICUa2u7orYoZci01i9ki83MM+Y2lodIVuymN3Ca7zLeulEu
	UWqfhQZzO5eeHJiIJAzGrDqGqvLp8EAbyzUowOKFFK+fLBf1doUgIkyllsmV1rXKlP7ts4K+8Fuob
	GjhCQWDA==;
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yVt-000000004nb-0Rv3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:17:39 +0000
Received: from L10892.iliad.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7B22478050A;
	Tue,  8 Sep 2026 18:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1788884253;
	bh=g0TrRds+CsCyqh5G5x4Il7gz6nNDRLvdGFk0lOmfFKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhycqMCja6XUqSTHOaKuk5pWKhkMHc9yA81KgHFBtM1o2jz/PwpjEaVCMPokgt0eG
	 Jmcy6ETkgBZuhZZVpyigiOtajFYryciPjWD9RAQvHkYn/Ax0/AXh/IQnxfY6hTz5Jv
	 /15XxibscZQMzz7A86oZTCEd/rT9FOb0d7hBx+XnPQ8GrnoF1s3//pAWhd6vAZJTfq
	 jTLrip+RXI0QC6hMP0dJHIql42rRmNLLFCXLDPXk6MsAIaTugrG0IcAUvY/K+bim2T
	 FlQhR/cDSNSg4PvNr8DnsJSKWPd/WNBqSG3u6cZlRtfyoHjIJzaaufkXsnJaZgE+Qq
	 p+ZBK7vEkin5g==
Date: Tue, 8 Sep 2026 18:17:24 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH] bus: fsl-mc: register the object drivers after
 misc_class exists
Message-ID: <aqA1FKnhAA6iIuyH@L10892.iliad.local>
References: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
 <fmmf72ypmmooyxszz3l47xabdhvetowgvbmbjmvj6bumuh5onh@pntmny63urbg>
 <ap7mmR_4QV0k88dK@L30177.local>
 <dvnnk7fnk57x7gf4mc25codec62xtpbe4v7omhjguqxd25ssmu@pqqjwe5xif4q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dvnnk7fnk57x7gf4mc25codec62xtpbe4v7omhjguqxd25ssmu@pqqjwe5xif4q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_171737_323862_CCB46D17 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Ioana,

> I am indeed in the case in which the uapi support is builtin but the
> dprc.1 probing is deferred, thus it will get executed after misc_init()
> had a chance to run.
> 
> The deferral happens because of_dma_configure_id() returns EPROBE_DEFER
> since it waits for arm-ssmu to probe. How did you get past this
> deferral?

I think I isolated the difference: I guess you have smmu enabled while I
did disable it. I checked and when smmu is enabled back, the issue does
not show up anymore. But it is not my goal.

I do have with my dts,
        &smmu {
                status = "disabled";
        };

for the mc to load, you need:
        fsl_mc: fsl-mc@80c000000 {
                compatible = "fsl,qoriq-mc";
                ...
                iommu-map = <0 &smmu 0 0>;
                dma-coherent;
        };

it seems due to,
of_dma_configure_id() -> of_iommu_configure() ends up with "no IOMMU" and
it returns 0 instead of -EPROBE_DEFER.

So the root DPRC, populated at arch_initcall_sync, probes now
synchronously, before misc_init() registers misc_class at subsys_initcall
and so dprc.1 is created classless. (I hope I did not miss something).

> > I started to face this issue when I did try to restart
> > the MC from Linux userland instead of uboot in order to be able to adapt
> > with some DPC changes during the runtime.
> >  see https://github.com/vjardin/lx2160-sdx/blob/main/src/lx2160-mc.c
> > But I guess this issue should be quite generic.
> 
> Can you reproduce it without restarting the MC: boot to prompt, echo
> dprc.1 > .../unbind, echo dprc.1 > ..../bind ?

Yes, see below, even without restarting the MC.

smmu disabled / without the patch of this serie:
   # grep dprc /proc/misc
   256 dprc.1
   # ls /sys/class/misc/ | grep dprc # nothing: not in the class
   # ls -l /sys/dev/char/10:256
   ... /sys/dev/char/10:256 -> ../../devices/dprc.1  <- not under devices/virtual/misc

Unbind: the minor is freed but the char link leaks:

   # echo dprc.1 > /sys/bus/fsl-mc/drivers/fsl_mc_dprc/unbind
   [  201.633695] fsl_mc_dprc dprc.1: DPRC device unbound from driver
   # grep dprc /proc/misc    <- gone (minor 256 freed)
   # ls -l /sys/dev/char/10:256
   ... /sys/dev/char/10:256 -> ../../devices/dprc.1  <- still here: leaked

Bind:

    # echo dprc.1 > /sys/bus/fsl-mc/drivers/fsl_mc_dprc/bind
    sh: write error: Resource temporarily unavailable
    [  203.306315] sysfs: cannot create duplicate filename '/dev/char/10:256'
    [  203.306356] Call trace:
     ...
    [  203.306440]  misc_register+0xcc/0x158
    [  203.306449]  fsl_mc_uapi_create_device_file+0x44/0x74
    [  203.306462]  dprc_setup+0x134/0x214
    [  203.306471]  dprc_probe+0x18/0xec
    [  203.306480]  fsl_mc_probe+0x1c/0x30
      ...
    [  203.306517]  bind_store+0xa8/0xc4

With the patch applied on the same board, smmu disabled, then, it is fine.

This apply patch should be ok for smmu and not smmu in order to cover any cases now.

best regards,
  Vincent

