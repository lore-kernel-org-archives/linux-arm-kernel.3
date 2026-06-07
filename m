Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D6FCD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nme6DkeNMvq66PlrbVMiDJSupvuXFgDWckEwUU/+8TY=; b=rVow4MCbtAQlSs36AXgTLJIB0f
	pBK2XzDQvGJVV5/rwQq++NqOttt7CMlaerOXAtF73BX6DgR27ZXqHWzbBWPXcRf0AzLnwHN6v4j9w
	8Sjam4NygDH+RE7C8Oj9Q4gKSJS4/V0KfAUui7iaG2jwpOelrYPdvTkfnqW+zbcJ5js3R54rvc6iT
	6TZQ4+waMQpvR+VN944fTS/SAUv9yb9h2i12fbgcUQggiobQSMNI9F0tFEYYvLzZpxK6JFy9B5Q90
	lK77N5Y/XuvubHduc0x/IE0zcG+0eHI+BA4GTlKEEpB0yBmHmAagjnsGpIzQYeUqzaf/ZGVg1QA3F
	+hw1Dd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8on-000000028Tk-1Ijx;
	Sun, 07 Jun 2026 08:25:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8ol-000000028TY-3tG5;
	Sun, 07 Jun 2026 08:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35E5A442DA;
	Sun,  7 Jun 2026 08:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4521F00893;
	Sun,  7 Jun 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780820715;
	bh=Nme6DkeNMvq66PlrbVMiDJSupvuXFgDWckEwUU/+8TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1AO3HCeUr109sZRmHIY6gggMQmycclyA7xZscmS0oykzBrzCMZ6wXZFeKi524FOL
	 L4cj6YDmjU+QhZjPRO1rnLc52AE1gAQGyREV015tG6mmECqbgc1UnvoRuOU/mbhgrV
	 GP7wXmQtIJcugGZkqxN1cegoyCoF4KA5eotvE3FtX1lTPbo61XbIof4NDz8aO/nc1H
	 HpNW4pW71edaAZPAQj4j6whEWqYsMqxWouvBJoMuy8FSYBvyMCSKP8JfVbBhTc0L/E
	 BjsYSHG/hbaWRgTUckFdIw6o3uV2EMN0zjGtCOgrGSBtvHMRvNHwlu1L8CxJgqvfqh
	 8QYjQVyHHv5qA==
Date: Sun, 7 Jun 2026 10:25:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: Add NetCube Systems
 OpenNMC (dobermann)
Message-ID: <20260607-fractal-turtle-of-valor-db1c13@quoll>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-2-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260606205452.2386930-2-lukas.schmid@netcube.li>
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

On Sat, Jun 06, 2026 at 10:54:41PM +0200, Lukas Schmid wrote:
> The OpenNMC is an open replacement for APC SmartSlot management cards
> based on the Nagami System-on-Module.
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


