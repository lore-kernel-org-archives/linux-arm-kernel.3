Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D5CCF2DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4OMYiiG3ut7MrExL3jhw5ap4nPHmzyK4fpnY5BaTSw=; b=IjBjJ/VEq+qP5NYKXeFV2SHxXT
	fXEkxoH5lZwn+DzqZBJQgKv4EpzsqOrO8TQduQUAoUmKhOYyFDQKv3UAq6qY+X0gZxdfdGRwFrB6Z
	VLMEAkpN/SM/+dGfkOQrR7VSkAIr4u26tDeWfdP5eFSB2o7d4+fcsywSySku/ogHE0e7mUl+Yqmff
	T5T1XsPteJfVQr9+yIxiyXdwt6ojiPWO4AvpsjUq8bt9ns3W+sm9yKdZ6CzYA49rEGa/FM2qEbB9n
	Qi/KvLsm2kUYL4Ir3C45Dm8lirwUPB5Un1uVw+7JQux+HLWoy0zN19MMOSQQ9sGog7LlorFCXmBhl
	/uz3uapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhBS-00000006itB-3Iiz;
	Mon, 19 Oct 2026 06:49:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhBR-00000006it1-1drS;
	Mon, 19 Oct 2026 06:49:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1FAC4160F;
	Mon, 19 Oct 2026 06:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0220D1F000C4;
	Mon, 19 Oct 2026 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792392560;
	bh=J4OMYiiG3ut7MrExL3jhw5ap4nPHmzyK4fpnY5BaTSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcHtS95v6TJqYLJjwqZL4FSWE2sJ4aSzOIb7ycKZjpBqYxiSxwHDR6Sk78w/Uk1b3
	 2QYnMlfrCZD9hEY5AS9fzZ3WW32aANmCxrhvjmYGyzwrpbfnm4QKFLl8c9e42vtkuG
	 /PFjgzg1Ejgjz0WPEc8kJ0H2T6wYKP0vGn5AuXpQvBoBmq561PxravxIKN0xL1gL02
	 LaWS9V0GRW8heVBUe9tTZR4v+SAJnnmIrxbNF0FjEg29vrM9jzm5ip9rg9XPJNWrXs
	 xfnUhsGWS7Pr8u8AULwpl/oPbNxSVBX9cDVS33OOQ5W9EGpeIQz49+/DlNI9J9drpe
	 FVKjDx/2XdRKg==
Date: Mon, 19 Oct 2026 08:49:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: net: rfkill-gpio: document
 reset-gpios property
Message-ID: <20261019-aggressive-frigatebird-of-courage-9cc7d6@quoll>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
 <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-ok3568-c-v2-1-068d68430e6d@gmail.com>
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

On Fri, Oct 16, 2026 at 03:29:33PM +0500, Dmitry Yashin wrote:
> rfkill-gpio driver requiers at-least one of the gpios to be defined:
> shutdown-gpios or reset-gpios. Document missing reset-gpios property.
> Also add example for wwan with both gpios.
> 
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  .../devicetree/bindings/net/rfkill-gpio.yaml       | 23 +++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
> index 4a706a41ab38..66f6ad2872ff 100644
> --- a/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
> +++ b/Documentation/devicetree/bindings/net/rfkill-gpio.yaml
> @@ -29,7 +29,12 @@ properties:
>        - wlan
>        - wwan
>  
> +  reset-gpios:
> +    description: GPIO connected to device's reset pin (RESET#)
> +    maxItems: 1
> +
>    shutdown-gpios:
> +    description: GPIO connected to device's shutdown pin (W_DISABLE1#, etc.)

That's the same pin. This was sent multiple times, why is this time
different?

Best regards,
Krzysztof


