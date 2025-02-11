Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/53TyW6PFHjwSlFUtyUR+MCptHaQ6R/f5Sg+HxIlA8=; b=t+xvL4BcjCptvLxNZrneoojyJK
	PO+2aAGyhAmIrun1xRlh5rB5/tNSm/19VkFyt0Nc3PlJAMWoykWsW24X0G5dxxpB1XbJGwj2RkQfZ
	+lgbQ+rPilcB7nuqboq0KzcZg15fxJid9nJcKu+7mc0s/YjxMIXvWp+8Zw9nDtjW9jTfw8QEeztcM
	GSQiyRhIQBYdnymXyGfqYLqUg+W9C4TspaIRkWfbISgp/bia6AbUyTEeB034Gjv2IUme8ZV96enW9
	cLOlcCjQvN6PonqSFgOOHbpnS9e+AOMHBkbfsykrjV4Zj0pMapOLgBoFV7Ymvur5xdQZ50PfnGp2l
	vDeqWfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtP0-00000004Zd3-27lf;
	Tue, 11 Feb 2025 16:46:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsvp-00000004Syy-2uHA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B947A408A8;
	Tue, 11 Feb 2025 16:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F5FC4CEE5;
	Tue, 11 Feb 2025 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739290576;
	bh=1apOfVZ6LTpZYFLpFXmf153RBYS1MxNBPKu94D2rOWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1pXt6cd9/NtBdoxZPnnvpY/oFOXH3Jxv9rSmmrs21uhFjOpUfDWg8rbeAtZfbL+4
	 BVxN/UZCqGGAHACVhmGiYwSrAUlQrbq6DXvlEXKCqp5q4ZRzlyJWWNp+QvXax+hq7W
	 InRZ2k9VpICPC3EROPXxFhw5WqRpn8PAMM6h6wMUJChBz92QTpgtPF+KzTiCGqD7XN
	 YPme+lhIb7d98mXJ6+2IT+md14M2EuXfXQLbXcJv8Q1EnCpoTvBmTGt9ta7kb/4pbL
	 2cQGd37A46GtHtST1WcmxAfsB1eagOqEVwWkrf6xrmqsJ45LsaLED04DZ15pnkvfQl
	 PUfSlEtM/RtMw==
Date: Tue, 11 Feb 2025 10:16:15 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pwm: marvell,pxa-pwm: Update to use
 #pwm-cells = <3>
Message-ID: <20250211161615.GB354180-robh@kernel.org>
References: <cover.1738842938.git.u.kleine-koenig@baylibre.com>
 <cb799d8a5bb284cd861785a691b8d5e329300d99.1738842938.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb799d8a5bb284cd861785a691b8d5e329300d99.1738842938.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_081617_793798_331D5D2F 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, Feb 06, 2025 at 01:06:26PM +0100, Uwe Kleine-König wrote:
> The PXA PWM binding is the only one that doesn't pass the PWM line index
> as first parameter of the parameter cells. However this can be upgraded
> to the mandatory binding for all new PWM drivers without breaking
> compatibility for old device trees using #pwm-cells = <1>.
> 
> So bump #pwm-cells to 3 with the (undocumented) promise to keep the old
> behaviour for #pwm-cells = <1>.

Why make that undocumented?

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>
> Reviewed-by: Daniel Mack <daniel@zonque.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> index 9ee1946dc2e1..74f2d5964742 100644
> --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> @@ -25,8 +25,7 @@ properties:
>      maxItems: 1
>  
>    "#pwm-cells":
> -    # Used for specifying the period length in nanoseconds
> -    const: 1
> +    const: 3

Note that if we apply this and not the dts change, we'll add warnings.

You could instead do:

oneOf:
  - const: 1
    deprecated: true
  - const: 3


