Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFEFC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqTJNNWNhmu+c4zwa/9k5wzIve3XJ9EwxSAymtNQwRk=; b=fhxDu+UpQpZqhuJrufLr5JF9x0
	C15vZJGu07DW5Ty/cgxqf68PySNcuKuf/uh9OLT6UW9FAnyo/55CjW16BndW3O8gkOV4EfMa8fQmY
	1oWbU4bHscPymCkq76jGnxErajQK4hIgzaulOiv10onyw2JBcG2hKkefJLaCBRksVIkkbOz2a4o8x
	C67LWwuZzJx0d1qiEsyQSdZEw1NhqNRHr/Y3UL/N12rqyZL/ClfhfIA/7GsblvDPtqejdptwYvpjZ
	9qkLpa11OfH6wGEGhAAYXjAAphuqCqRncLtLP3LkigWv05JlVlZOb8XB/DbkfHoWcOOdfywe3GNaA
	hXSJyfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIVF-00000009udk-03Qr;
	Fri, 25 Jul 2025 13:30:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufISl-00000009uII-2ebS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 13:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C2B95C6788;
	Fri, 25 Jul 2025 13:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9A8C4CEE7;
	Fri, 25 Jul 2025 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753450070;
	bh=lXb0UAkdLRBZEl2w236QgUTKNdJI4nqMaBIkSJhUt1A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Rxztm1Zg2BICuHOgdxuDU8E9XunHZYswcsJQky0leSQJM08JMEmbEaovz3Zcw9p0j
	 5mfj1jIkSKLGMNg0L82YL1dxB/BtBYatXGCCvpH9at9O9fLl5j0kgG/WEIN7y6y1XH
	 PTaYC43Cvv9GXvkxGo/uhMuJOgV0VQMpsB+GZm7FsnnIiAWqBzF1GNxzntz/+MFiBH
	 IC8tBuHIgCdKuRipxJPpKnUjaE3itoHmfUAGscGFSUgpQDcfhF2DqhV+MTz6zYF1WS
	 oV/qTCl+tLpQguthUMBDg3Mir5PfyXvTK/APP5UVVkWYPb5I9jf6Xuo6ue9JyApvYQ
	 TjPbM4i2uvlfQ==
Date: Fri, 25 Jul 2025 08:27:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>, 
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
Message-Id: <175345006903.1002291.4212198267952446360.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_062751_708757_234ED06F 
X-CRM114-Status: GOOD (  10.63  )
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


On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.example.dtb: backlight@6f (maxim,max25014): Unevaluated properties are not allowed ('bl-name' was unexpected)
	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-max25014-v1-1-0e8cce92078e@gocontroll.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


