Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2283CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7my33tHkcnAh5NzGYvJklT1PtJEphsrY3nRhIAu2WEM=; b=qcMP1oq49wAeDkzmI7h3m4atT1
	1MCU5KaTH+yXbwsqpkL00lOyykiDAFQ8IGZj4wIgBzAanSL7CZkPik1OUGu+pcerx9itUtVm8UTT5
	fw44GUQeQb7AnM9xQMDIPbJba7WIYVA0ioRZFMhx71Q8NQ4ythB0+CLWepxTGw0D4lV/hoYDneph5
	COw1yZXUwlCGFuJl5UI/KQlpRoDttli5iN0O44wWBAbVY/nvzZt5X96F12HAmyHs3E/67peTfV1Ak
	hFXxPUj2p+LsLQGHl8ZkA6YkGM6FJ9n6PUNjEzCVqZGQj8J0rUx7qTtf+iWo91J217vYcINquR7qE
	zId5jtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUD0-00000002y8O-3D45;
	Tue, 29 Sep 2026 09:33:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUCx-00000002y7U-2pOL;
	Tue, 29 Sep 2026 09:33:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE7E560008;
	Tue, 29 Sep 2026 09:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EC61F000FF;
	Tue, 29 Sep 2026 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674386;
	bh=7my33tHkcnAh5NzGYvJklT1PtJEphsrY3nRhIAu2WEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1fEQqx6q9GJjmXIa4fL4LunigoQ8sYi2oCnV0YG6aD4gqsX6MV47f2rOQBdyupOR
	 ZDxf/muo0fXP9Ml6XxfjgNPPwvXz2a3H/ma4tOKFvuPcDQp8QRg5hb5NjKMDWi7qHN
	 lJ5bX1GB8/u+X5Kk26FqdWLRuotq6M/89CVYEYjsPQ/VvOgAd6e8A7qefsNexpVjbO
	 pv29vxAcIhf798lWkQL0VXtsEuguV0bopYfBjxfp9H9xT7akHCUxNpl3QDa6NuaIPU
	 masy6oFHXPWXl/kzWZSoL3BEHwMMMMrWOs9IwXJaDxiz865Aa/NxzzudsvYWCX5F3t
	 SZ/A6FUd2Y6uQ==
Date: Tue, 29 Sep 2026 11:32:57 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <aruD5kwOEsvFhW2e@beelink>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
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

On Sep 29 2026, Jani Nikula wrote:
> On Mon, 28 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> > Panels in general, and MIPI-DSI panels in particular, are pretty
> > difficult to support and require pretty much a panel driver for each
> > panel produced. Most of them are pretty simple, and require an opaque
> > initialization sequence that is usually poorly documented.
> >
> > This creates a tension between OEMs and distros because OEMs will
> > typically get a new panel to react to a sourcing issue during
> > production, and thus need some swift turnaround between getting their
> > new panel and it being operational in the OS. Distributions on the other
> > hand can take years to ship a kernel with that new panel driver.
> >
> > To solve this, I followed the example of HID-BPF and wrote a panel
> > driver that will rely on BPF programs to perform the panel
> > initialization. That way, we can ship the programs separately from the
> > kernel, and with a different lifecycle. If this driver is accepted, the
> > plan is to have a userspace component started by udev to identify and
> > load the right BPF program for the panels found on the device.
> 
> I'd think for most panels it would suffice to have a declarative
> language describing what to do at what points in time. For example, at
> poweron, enable this GPIO, wait a little, write this set of DSI
> commands, etc. You rarely need actual programming, or even ability to
> read-modify-write something.

TBH, that's exactly how Maxime presented the idea to me before
submitting this.

> 
> It could be, say, YAML converted to some binary representation. Maybe
> that could be in the DT, or maybe you could override it with the
> firmware loader. And obviously any vendor "blob" could be trivially
> converted back to YAML and upstreamed.

Ouch. This immediately raises the "let's implement a parser in the
kernel" flag, or "let's create a new langage".

That's exactly what BPF is: ou have a source file (in C, rust, whatever)
that is converted to a binary blob that the kernel already knows how to
use and that is safe to load, and we can easily go back to the sources.

> 
> Where that falls short, you could always have a dedicated driver, or
> extend the declarative stuff.

See Maxime's answers: yes, falling back to dedicated driver is still
encouraged.

> 
> Now, the question is, how much more BPF solves over that, without
> requiring a dedicated driver, and is the added complexity worth it?

You'd still need a dedicated driver for your new blob parser, with far
fewer people who had had a look at it than BPF who has been working on
for several years.

The integration of BPF and the kernel is honestly transparent nowaday:
calling a struct_ops BPF function is just a function call away, and from
the bpf calling anything in the kernel is also just a call away.

> 
> FWIW, on the Intel platforms that support DSI, all of the
> initialization, poweron/poweroff, backlight on/off etc. sequences like
> that are stored in the BIOS, defined by the OEM. A plethora of DSI
> panels, one driver. Don't look at it for examples how to implement it,
> but I think the basic idea is workable.

Isn't that what Maxime wants to have? One driver for a plethora of DSI
panels, with the same ability the BIOS has to also do function calls to
set things up?

Cheers,
Benjamin

