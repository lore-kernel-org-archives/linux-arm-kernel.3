Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B8C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vLL9qcbrtL+UxiwI8F5L04GN0C3qqDKt9sOE8S+tZA=; b=so5vyP3Zsz6NmiFIJre5aXDUmb
	DS/CRS8fFwYqknLtiCHH+Yx8ENqn7xcsa9ZZbr10uSwSUMS2PPkKFpZYH16mWwyV5MwmQqMFIC863
	GIAwODRlypa/RzPOu8O99fa9AHdOAMiIdbHrLDjTo7svZvnkUBKXOTRMNRK9WXGOdt0N/jVERk/JM
	ere7yjT8/OXrGUXmGJYCqwAYuFAY0X4K01anPku0DD938fM1eH+PSp0UYWBOKFUM6Cx6xJF792MJx
	DrZxxPQlUcblNfB8yQxjEqTyqjS6++A/OxouDEXWlrRg4GOw2idBh6YPePQmCZ/oDZgWVEd2aJbhH
	FSkREUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqVx-00000009wJM-0n90;
	Mon, 04 Aug 2025 08:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqBg-00000009taz-01CM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 08:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25354601F8;
	Mon,  4 Aug 2025 08:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42524C4CEE7;
	Mon,  4 Aug 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754294690;
	bh=0VuAiQf0Cv59dj4webRh41zL7rvvJGbD0h50qzSBf/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu2A4myVOFLEZ1l+8CKNrn6eHiM+py3XVDkIXHweOcOB2xEfwRq3CnMqqMvzUeyZh
	 RHSkh/v7PvGQ3FWm9gmm3qBW6PolqxOe/KOoLCm6KMCMAWgaShAapuFroT6C7prGdL
	 cOLydI5cnPK5/NaDfNgMzwg4GpUH0B4Niz+6oOsNF/3ljrgeQDMDY3hwBifM0cPEiz
	 MHIaEgwlOREY+Eba/7cemGZvqIDkB6gaT+fLHXhi5UxykVEr1DsMGjL72OZ+2MMxZ8
	 UVMGy3wZuTB8m7Yh98z+kivQSSVMDyvq7bL0NGazUu7m9KOfAh0tWbvJAV5h40REHf
	 XyNkWWVk+eTlg==
Date: Mon, 4 Aug 2025 10:04:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com, Jyri Sarha <jsarha@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
Message-ID: <20250804-industrious-neon-gorilla-2bbde6@kuoka>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-2-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250730-fix-edge-handling-v1-2-1bdfb3fe7922@bootlin.com>
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

On Wed, Jul 30, 2025 at 07:02:45PM +0200, Louis Chauvet wrote:
> The dt-bindings for the multi-function device (mfd) syscon need to include
> ti,am625-dss-clk-ctrl. On AM625 chips, the display controller (tidss) has
> external registers to control certain clock properties. These registers
> are located in the device configuration registers, so they need to be
> declared using syscon. They will later be used with a phandle in the tidss
> node.

I don't understand above commit msg. You add new compatible (new device)
but entire commit msg describes something else - some sort of a fix.

> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")

Heh? How? How adding a new driver needs fixes in the bindings?

This is just confusing.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> 
> Cc: stable@vger.kernel.org

That's not the way to add stable tag. See stable-kernel docs or any git
log history.


> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 27672adeb1fedb7c81b8ae86c35f4f3b26d5516f..afe4a2a19591e90c850c05ef5888f18bdb64eac9 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -121,6 +121,7 @@ select:
>            - ti,am62-opp-efuse-table
>            - ti,am62-usb-phy-ctrl
>            - ti,am625-dss-oldi-io-ctrl
> +          - ti,am625-dss-clk-ctrl

Don't break the order. o > c

>            - ti,am62p-cpsw-mac-efuse
>            - ti,am654-dss-oldi-io-ctrl
>            - ti,j784s4-acspcie-proxy-ctrl
> @@ -228,6 +229,7 @@ properties:
>            - ti,am62-opp-efuse-table
>            - ti,am62-usb-phy-ctrl
>            - ti,am625-dss-oldi-io-ctrl
> +          - ti,am625-dss-clk-ctrl

Same here

I don't understand also why you are adding clock to syscon. Clock
controllers have their own bindings.

Best regards,
Krzysztof


