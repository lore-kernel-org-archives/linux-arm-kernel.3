Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D34CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5lQoDIhzTDv7zL/Wr7291Vw2VJwRSmJ0Sc+3sfggjg=; b=gG8Vc5q91QT+I1BnhwVpoxe/1O
	OufPOoZsS8sKrYMGqPUyl65Ea+u9E8lzFl0ggVXqqZUzHOoCO1W4o62M5jEfRTk3ppV7hIjCueskD
	PHxEURD8eUzSI9No6wz53U1nMqJDb2/L3NJn1bADIjlkJ4MrvUZEX+XtYB+uAGRnoopXC3UsNjoIv
	vZihA6dDNdTuyahEy2swKaaFdPtr7ARjkmPt6ZLvLT9KBuFU17rpUC/emMc+zs/BMXKA3cs9rV6gq
	Ep5Tc2HXANY2Rv3jPjsQID7AYxNhLBFmLq93LXA1A8KLuO42YogN+QfIl1S2YV/as4zddy5ju+rS8
	SFgEThcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19GI-0000000EjEA-1i7r;
	Tue, 23 Sep 2025 20:05:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19GF-0000000EjDd-3Gsv;
	Tue, 23 Sep 2025 20:05:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDCFD44556;
	Tue, 23 Sep 2025 20:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A689C4CEF5;
	Tue, 23 Sep 2025 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758657913;
	bh=rsrgBnwzsmx18dRe94tVk/ZS06/IOql7vtHmkQyNJaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVY2GD6RaDoc8geaGUEE74kGg41XzODOyH4xFTPxgmnhFdNQQzet27xesRhdKZEcx
	 QiK29pOZNmWdWBOc9vsZgVn+O3GkXCz3ITcVsKk3Vg0TAZ3MacbUCEkuT8rsVmXNxd
	 sQvjNheRBw9sYh+8J5U24qHIQtp1oOSpCMaH0Xl99pX8vdIkBMrnUwn6DJWXTSbk0J
	 tdNLbt0C6Aad/0IJFowH0n/phTjMSv39Llf4LAeZxvlU2s7uLFfatUncdooz4+vnLI
	 a10AgF//iSH29ESZxwQMlkSb38IzNllj8zbfiZGQi/f6g1UswtMy9Lmg0cfKTw5u4u
	 UsyNjBKsV4XoQ==
Date: Tue, 23 Sep 2025 15:05:12 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/3] dt-bindings: arm: bcm:
 raspberrypi,bcm2835-firmware: Add touchscreen child node
Message-ID: <20250923200512.GA4080270-robh@kernel.org>
References: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
 <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_130515_846150_BB55ACA9 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, Sep 23, 2025 at 02:57:11PM +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v7:
> - Add $ref: /schemas/input/touchscreen/touchscreen.yaml#
> 
> Changes in v5:
> - Move bindings into raspberrypi,bcm2835-firmware.yaml
> - Remove raspberrypi,firmware-ts.yaml
> - Update the commit message
> 
> Changes in v3:
> - Drop firmware-rpi node and use only touchscreen node to fix warnings
>   you can see in
>   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/
> 
> Changes in v2:
> - Added in v2
> 
>  .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 28 +++++++++++++++++++
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------------
>  2 files changed, 28 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

