Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7B1FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w9pGVYPHJfPh1XzkNUV0AqlY/okKU/Ok+6+rTmSuhk=; b=SNmnAxt0bfY4yR3FTizHnzorsQ
	WzJBT9AZxdMmyTBfYRI3XDxRMd6QAS10p1P/Z6SUm7W4R0OHkPcNCWg+E2+OG1zelyCBSUAPwVh35
	d7YvkkAlK7pb77EHTp6nQcjY49nhOmheRZ83VR4ODCQ9UZSoU2MwIhHQa4ULZ8EjCY2C6ZZHvVI9r
	cgVyBZT5eXAl4CVBJEcQyejO+L9V+m3pItLXKcTDkSZcO4+QEfPO8R+VRWzaX5NvoAevwC2kPs26K
	6MxvaKRK0J7yygmIZ1u3NsRMA+Cqls7KMwUactteOOqnM6Dcp+A2hZ48Awwg9nkIt5uXksYbm7P8t
	QAjAvtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINeG-000000055mx-0Hqq;
	Thu, 30 Apr 2026 09:25:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINeE-000000055mr-1kH9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78C6460142;
	Thu, 30 Apr 2026 09:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38C5C2BCB4;
	Thu, 30 Apr 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541129;
	bh=B853Eh9uk565MxVVpob3pa08VA0fsq5RODboe/BkwDg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iot/Czbj1UTXZtIKbuakUOJPEZf2jgEJsXUobkf3fTE6pxHY1WoYVSUKSdjGjweU2
	 uJCII7hbjhIouQ7z+4khXHPcxKRfaQKW5M8Ob7Ff/2xSIiteOAtptRQ6PRVkaTUlXR
	 m5hnmHC34YoQvr6bwwzWq2O9IDz3/7o6w2Ux/d7uBQOzrHFiHHPE6x5MGEwTHosl5Y
	 FtyWqlDWOsE2uTUmk93O2vMxDZkoZBQ9EeRqJitySRYcWBAmbfCmXMjl7Y98+WSE2j
	 s23YYEIaJkoJReZgcK3bIv8Gfrr3USg/F7iytFGSPEmXH9vDS7tcs9sL21B1DUkETF
	 aW/y9woiMNIXw==
Date: Thu, 30 Apr 2026 04:25:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christian Lamparter <chunkeey@gmail.com>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Eric Dumazet <edumazet@google.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-omap@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, 
 Linus Walleij <linusw@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20260430081242.3686993-2-arnd@kernel.org>
References: <20260430081242.3686993-1-arnd@kernel.org>
 <20260430081242.3686993-2-arnd@kernel.org>
Message-Id: <177754112702.3678889.4847926893667561974.robh@kernel.org>
Subject: Re: [PATCH v4 1/3 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
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


On Thu, 30 Apr 2026 10:12:40 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The SPI version of Prism54 was sold under a couple of different
> names and supported by the Linux p54spi driver, but there was
> never a DT binding for it.
> 
> Document the four known names of this device and the properties
> that are sufficient for its use on the Nokia N8x0 tablet.
> 
> As I don't have this hardware or documentation for it, this is
> purely based on existing usage in the driver.
> 
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v4: renamed file to st,stlc4560, matching the primary compatible string
>     require st,stlc4560 string
> ---
>  .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/net/wireless/st,stlc45xx.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
MAINTAINERS: Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

See https://patchwork.kernel.org/project/devicetree/patch/20260430081242.3686993-2-arnd@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


