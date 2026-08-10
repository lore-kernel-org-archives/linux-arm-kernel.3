Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F498C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TZM7Xx2MMl0vR7A+YnyV65FTuUl7J9XDdtRZ4q0zac=; b=mAVWx7mlqzUL5/gu7TZrk91179
	LSzMlJtIb406YSpv+Ds3m01MOMNiVt1LfsG/yvYP0fwzuCqDSa5uhMAqqH3ekme6EtNMWuhxhVm28
	6C4A0Ga4FExCVY/lapHF6hLkKxxL70wzPx4CB0li3ip3vLp0YTbKTUjCg81AxwKY+bCyF17S6npNO
	c6a+pyl2FxbgTEDXRXL1qdxcxeq0GV02iZUOaIcbsBcVLvvx+MFaMQZZX+K9NHx20hQOMmWsQGca4
	uXuAW7uZEwtGOSoxV6nh+jpySoP3x5eJU1uHFqPg2gBtQRViHvaPV9wyEsK1cb8kJVvtGRKutIKYO
	0jo+N8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKJH-0000000BBx6-47kw;
	Mon, 10 Aug 2026 07:20:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKJG-0000000BBwv-3ucw;
	Mon, 10 Aug 2026 07:20:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E740600B1;
	Mon, 10 Aug 2026 07:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABBD1F000E9;
	Mon, 10 Aug 2026 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346433;
	bh=6TZM7Xx2MMl0vR7A+YnyV65FTuUl7J9XDdtRZ4q0zac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQeirTPybiY5lkIgbLbTq0nTN0/UqMT1UObUALy8s0hOc5zCq4FNHvaQeWIOETJwN
	 vtA59HeF2ZhJtwEK/n3lQ6W+5mcHaeIqViITkp9Qv4ElfROHGYpXvt53nnFcdcQ8p/
	 ok2jjrwGReDcVhefAC/BdcHs4HxiTQ0bd31Ggr3NhbG2UhRBAhxbq4rvaOhg4CiuMQ
	 WEsoc1QiQoz7Se5/I3vrd9rlQ0cHnH95hDZe1U2khfqqo476ekyAF+IgwxfYzbv4lg
	 j8RK32pusfr4DXkF9Hy9XbdgjqIisEUOmmFjzELWiEKguPQegW7UqCcloUQv6gu6nk
	 7QK5TeyyRPhMw==
Date: Mon, 10 Aug 2026 09:20:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
Message-ID: <20260810-versatile-hissing-koel-7fd6e8@quoll>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-1-1860094486eb@linutronix.de>
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

On Tue, Aug 04, 2026 at 03:13:48PM +0200, Gregor Herburger wrote:
> Add the Raspberry Pi 5 d0 Stepping to the schema.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> index 2729a542c4f35..e2b32905c6a8f 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
> @@ -26,6 +26,7 @@ properties:
>        - description: BCM2712 based Boards
>          items:
>            - enum:
> +              - raspberrypi,5-model-b-d0
>                - raspberrypi,5-model-b
>            - const: brcm,bcm2712

As pointed out in other email - this is not bcm2712 but bcm2712-d0 which
supposedly is a different soc with different pins etc.

Best regards,
Krzysztof


