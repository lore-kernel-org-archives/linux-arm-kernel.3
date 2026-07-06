Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A796C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+lATJnRQ7o/rbZhmJ9nDyBRy1H+M8W2CRQDVnlKZxk=; b=VwHHg4UbvZXotiGy7p+qfpke0d
	GJ7BZkzbigze+tbZLa0V8KyY4sSoENQMa7cCneVKYnpUryWQRz2bF8J4Y5l6xQU0HHmcbM4Iu3LcG
	mFuDUYaK9hof6uF9iGIr0v5WS2v2SefC+rsYbESiWx70uzHOVU8n/qeQ6Gsdz/PCd5JWlVzEAIw7h
	KE5MjW5Ft2NkGxewduweiWyTC3sa60hgddUTaDNQa6uCICOaBf5h69Cqa7FyawmejHxCOhOhs09F4
	xi8hYEkpy1dSir5l1j9zNk0rDK4XfYifk7jOPNKN+7vZVENWgN3vjf6t7+520bp3wMdOUCWOJ6WrG
	kp3QLFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdIX-0000000BgBm-3VZH;
	Mon, 06 Jul 2026 06:59:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdIV-0000000BgBH-2N6f;
	Mon, 06 Jul 2026 06:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BEE61832;
	Mon,  6 Jul 2026 06:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4BA1F000E9;
	Mon,  6 Jul 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321158;
	bh=y+lATJnRQ7o/rbZhmJ9nDyBRy1H+M8W2CRQDVnlKZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oL0ztYX+YNmtoYG/oyXLUbewaxBWatkFUwLtGfQ86IxklFQhTfIx26NBKNAS+OrrX
	 JP1c2umXnXGYQFDiE4fl9s5alDIRS0YuDD+GO/Op/k+MOoWQswTLgAvYD/vCkCkPri
	 oB3nLJmWKBMxGBqVmUObu9kNh/r1AHQJD5g2quRDfhhjJEU5mzVr2a9rlj//nto0Eh
	 RMxhojNjZ+hNQ1Wmo0lkcDxVIi3V7b/KxQUJmsE729kB8D98CCqJFwAf/Z1uiFXFB3
	 9vRX7wE8ZxPWVIy/vvABsFwe1jBDjqMLDIWpygLllZzlfrfHK0k1eX4sUuUZwOhCV2
	 97XS0lIkljExg==
Date: Mon, 6 Jul 2026 08:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Message-ID: <20260706-quantum-celadon-tench-c2f28d@quoll>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
 <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
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

On Mon, Jul 06, 2026 at 02:43:27AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


