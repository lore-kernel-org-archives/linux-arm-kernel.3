Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2110CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6mCjmw3GG0SQzQZTO0NdI44Gksavv52MMbn5lbJaq0=; b=ia50okoNbJA+/cOP2E+zgg2xTJ
	hJUQuYMijnhwgn0t2mheW9LaDQRQeKJJ0VO8x4qUcrm2CVB+CFECaBY7qAAu0fcJ+TID/w9vXEgvE
	jA4qll0JHmqV/d4bH7edii0vXL5bX6Xk+48wLZr1of3C1+8yDldo5k9CNFM0ADpyzAYsMbX6WJSsh
	omQJlqxDRqKkXDljm58BtWSWHrua7l2fgqkVb6N2DluXniHYrZki+pnWTyWqf4GmoXjCxo1eKy51t
	Yo3CPOgvZo11rlRR+inlPdadJvRJLgHm+UOcbL8PglFYIenU8D0c2HNClDYnoFOwmrff+aD4RtjE+
	QGAq1+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYPK-00000001t8O-38F4;
	Mon, 10 Mar 2025 08:22:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYNg-00000001soT-38PL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6FA9A4502E;
	Mon, 10 Mar 2025 08:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8148C4CEEF;
	Mon, 10 Mar 2025 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741594859;
	bh=el1rL8iBygMhoB5kwTVvjfVwI/TFyrebUfurth93Vi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=domvwVM/UD6N2tud3bU+GjIibogzVm5H4DD9kZotdvjMLLpxNWBJWwM5Ed2l1vR3B
	 /ZxXQWc/H2/lYhr+/gd0JcOKA0lKAbY/16UdDxdgRN+f7fmwel79gbOp3jIw/kYfxC
	 El0HxTZ/vA0zShCM+VOYJXqx5hGAEpPivlrBz8mXAQ60SgUlmr2voSLAti7a835wLd
	 6xs2dYwCwctmyYXhzwjyKZjxzKllfcothJP1hmBfaitHW9DjtczA58NFjMGm6AfESd
	 zsgyeFWSUeWrdJ/XAYVbwIDkFP7pszRczcSx6uoPUrEkmpjXvqoV+4/f3BJe2skRHJ
	 o7oayTbuzU69Q==
Date: Mon, 10 Mar 2025 09:20:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	Kendall Willis <k-willis@ti.com>, linux-can@vger.kernel.org
Subject: Re: [PATCH v5 03/13] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <20250310-gifted-coati-of-sympathy-dabc5d@krzk-bin>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
 <20250306-topic-am62-partialio-v6-12-b4-v5-3-f9323d3744a2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-3-f9323d3744a2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_012100_849241_3179706D 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, Mar 06, 2025 at 12:14:41PM +0100, Markus Schneider-Pargmann wrote:
> +  pinctrl-names:
> +    description:
> +      When present should contain at least "default" describing the default pin
> +      states. The second state called "wakeup" describes the pins in their
> +      wakeup configuration required to exit sleep states.
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: wakeup
> +
>    power-domains:
>      description:
>        Power domain provider node and an args specifier containing
> @@ -122,6 +138,8 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  wakeup-source: true

If this patchset depends on dtschema pull, then this should be narrowed
to specific type, I think. Otherwise how exactly your drivers are going
to work if this is just "wakeup-source;"?

Best regards,
Krzysztof


