Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4B1CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW+6iHYt4MuO7s+6o3BNEzcdf0RPXwZAyL0mWD/q/4o=; b=L/OoSdcOttsUiQfzROHbAYrX6o
	9AhjPkVadM4ptLuDT0cV7cqPNxKhoaG5AKWtwO3INjPyh05q7O5I4+ETw8IC2tLylgMY2RDzYafLO
	4irL8lXP22GAUpGwglG2cgIz3iW/dae0WdpXD3OyxnEQrGkFn8axyL+DMO8k7x27hEPE+SYiN4sLW
	TgWb3zBE7r2Lq1fVdtYO8j7kxv+9MA8mc/i7hhP8guck8dz5eUbSjs2BlYy7uO07xwN6lxSXF+MhJ
	EEHnFJzZCrIg8rZJNz/K9DGeNedNTkGbrYLz4DRUks1huoyaILzDacxOznwW8tB/p//gGMWnOwy/o
	tvlmcW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ7r-00000003Bfb-1cuY;
	Wed, 07 Oct 2026 21:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ7q-00000003BfR-1KHi;
	Wed, 07 Oct 2026 21:24:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE10D43731;
	Wed,  7 Oct 2026 21:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DC21F000FF;
	Wed,  7 Oct 2026 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791408273;
	bh=QW+6iHYt4MuO7s+6o3BNEzcdf0RPXwZAyL0mWD/q/4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O7Vi7+idujoI9ni54RgMBO2jR8mzrquJsOAiw1ci3uatQ+xCwgQBgMtYzA6HTv1FR
	 fyqrWEeAiwGs5I0/+XZXSl6RCfB8Kgxalfzp/hsepwuoJZqCVaMrbRSw6OOhMpVKlP
	 rq4tocQETWXIlbLPAo/cdtZedozjDeeKz4zRfA8okHxKoVyeeKGpE9czmRhmvZwQPQ
	 OAoN1JWZLx5JGvCE/5fVjt7BMdEY3kosSCfpLNE7kI810nSpO89XslD0FcyKiVrKFh
	 Xqx75gyys3gZvxjYO4+ZDRmleFpyEqBI9yk89H2C1qvgk4bqCq80GgLglD12ZZY/8K
	 pD2PBA5llvucg==
Date: Wed, 7 Oct 2026 16:24:32 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Message-ID: <20261007212432.GA381404-robh@kernel.org>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net>
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

On Tue, Oct 06, 2026 at 08:02:40PM +0400, Alexey Charkov wrote:
> Whatever program that acts on a reboot mode runs before a full OS, so it
> may lack the capability to enable the regulators it depends on, and a
> reset that preserves the mode register generally leaves the regulators as
> the previously running system left them.
> 
> Allow a reboot mode node to name such supplies, so that they can be
> turned on while the mode is being requested.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> index 79ffc78b23ea..5ed70c87269e 100644
> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
> @@ -36,6 +36,14 @@ patternProperties:
>    "^mode-.*$":
>      maxItems: 1
>  
> +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> +    description:
> +      Supply that has to be powered for whatever program acts on the mode.
> +      That could be a boot ROM with no access to regulators, and a warm reset
> +      leaves them as the previously running system left them and not necessarily
> +      what their expected out-of-reboot state is. Any supply described here is
> +      enabled when a mode is requested, and stays enabled.

Sorry, but no. If we allow this, then what next? clocks? power-domains? 
GPIO lines? The list is endless. Maybe if a not generic binding is used, 
but still pretty much pure configuration.

Rob

