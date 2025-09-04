Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D37CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uENlucYkOK+jy7BMNnzMMpf0QowE25p7A3vBs5YaH0w=; b=zAtO6o1WqyK1lH/UlvLgTxl1AS
	1NepDXs8N6uP45VF4p3oxK6OhqC3JWfqxCsiVBBkNA/g+/cJ/+S/v1IAOsp2ecD9I1iTb7TjkPtoT
	wc+HhL0OFhtRWVNNyIWGYrEpVEx3HwJLlc2Wc/ePOZNpQIj4NlDg0W6FCY/1FMOhdEYyQB5WToADQ
	x44o8FAZnUn3ZepbqPbPWaavg5QiDOAH2mOifKW4du8I4EHqyjNWfb3l4z2d4o6XliHlKpljUV/rh
	cGI1pL24z86MOC+Yb4Pr8vqkYg/16tCsdhTie6kzS6dY16Uf36guNENko++xKSQyK/AwkuNN3LdHq
	znazzpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEki-0000000Db2k-0Nfe;
	Thu, 04 Sep 2025 18:32:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAa6-0000000C4nS-08ip
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756994691;
	bh=6QoSyBbdtINchh/KfpXAbLxJBZNAu4kUO37s+5VC3OE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RflE5jopt5njlxGhDC3AQjyRyIPKw9BYjyVeuh8p3sZ4CxUB4DnPdESkuwkbUnwEk
	 r+f7FY7ipdHcA6nC1BMelz2e5gJVvDPGOWSXh2MUzsU7IRS4yoX9eQRFX2aRkVW9Eo
	 Zwz/C+PWPmLRiHE/jc9a4VqOElzxRM/FLuT/8hEYYd1iDtMfrMHLF51RfElfCbnfNF
	 +bgFxnfkWCFFqFWYI+Jileitn5LjWNWYHXSKp0kiFfqE+6qLwXYdVyRUhnpGmjbumr
	 kFK4IO9FVT4zOfEC0RfrLOl1Yt3inf1x8FWvzfj+QQppSoZlpsnvO4jfDQTb+D2l+m
	 Cta+AbMlTIrsw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8088E17E03B8;
	Thu,  4 Sep 2025 16:04:50 +0200 (CEST)
Date: Thu, 4 Sep 2025 16:04:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250904160445.1671f140@fedora>
In-Reply-To: <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
	<20250325153507.61d82e39@collabora.com>
	<4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
	<20250325155231.0d1b1000@collabora.com>
	<838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
	<20250904082224.113d0cd1@fedora>
	<7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_070454_229112_2D0D3054 
X-CRM114-Status: GOOD (  20.63  )
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

On Thu, 4 Sep 2025 15:49:31 +0200
Marek Vasut <marek.vasut@mailbox.org> wrote:

> >> I suspect the extra soft reset I did before "un-halted" the GPU and
> >> allowed it to proceed.  
> > 
> > Hm, not quite. I mean, you still need to explicitly boot the MCU after
> > a reset, which is what the write to MCU_CONTROL [1] does. What the
> > soft-reset does though, is reset all GPU blocks, including the MCU.
> > This means the MCU starts from a fresh state when you reach [1].  
> 
> I have a feeling the write to MCU_CONTROL does nothing in my case.

I believe it does, otherwise you wouldn't be able to kick the MCU
and get things working until the first runtime suspend happens. I gut
feeling is that there's something fishy in the FW or SoC integration
that causes the FW HALT request to put the MCU/GPU in a bad state
preventing further MCU_CONTROL(AUTO_START) from functioning correctly
after that point.

> 
> Is there some way to probe the MCU state before/after setting GLB_HALT, 
> and also before/after the MCU_CONTROL write, using 
> gpu_read()/gpu_write() register operations, to find out what is going on 
> with the MCU at each point ?

Yes, there's an MCU_STATUS register [1].

[1]https://elixir.bootlin.com/linux/v6.16.4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1045



