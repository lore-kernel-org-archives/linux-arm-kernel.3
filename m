Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E82D13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59kqX7iCt5azttU6rwySXkfPxOIsAlH1pH1H9UVtw2M=; b=Eno6JreCCZTLtkdVpfH64Bes8y
	ABEbhhO4WUMZ5JWOdyA/h4jtbhT5bieqOrTET51Z10y/KT+hQGNyVAjan7IeVmfYUWTekGEIFjYpc
	IGKzOvA8nmU4VCo2L4O8DAg6LO5a3ghmNpVd3Hx/Vcpawt+SYFeC13g6rFxnX2Z/+amKw//vV0oqG
	qgoqHOYgmAeirUy7gKwX5pQ4d2oOl3Xgk/50JMbGt+FAvP0K0m5qLq6kvskuuj7Cv5fchCJYcG00B
	Hg9DAn1dEN6HDI1JKF1V9Gu6OsEYyJXlZVLhLU7yFggv0Gh+O0beYTErPrFXOF7RLx4/WQ7+XeElH
	3oPJip6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59vJ-00000008qCd-1Yd3;
	Sun, 27 Oct 2024 20:31:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59ti-00000008q0Z-3gAl;
	Sun, 27 Oct 2024 20:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46616A4136B;
	Sun, 27 Oct 2024 20:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A76C4CEC3;
	Sun, 27 Oct 2024 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061000;
	bh=RBDRTpmoR7tK0vxcuHjvBDGbXIBaa+8Lb+u9fte4zhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rutxLgU/wTlndCeDb7HYLHZCODaBvWvV/qEdpaagQBcGr5ZTWtSXjhYHR0H39cFLe
	 qhJIBYhsNZ72/Ig1XyL1If0m5hzHP7Rgdra4LdJ7k90SzTY0DAiu8DPkg9OeuuVr1Q
	 nIexNmmU1PKO0FN0N6qkUmsq1x0LM1rl+TSi3FF0+h97I1nR2O8YuMZ8RvxvqJdZiW
	 ANWISnLvQSb8MIs63cEHtoefcR8j7cizxWPUN25DiKUy0B3/5ifZSiNnzwqplaKpKp
	 J92aiavCOpFCt8ZH7zy/YOuyqP2KYcthjHMjCdbsJpx6OfOhPiS3m4lrQczyNrMetr
	 HmRrcQS93/+4g==
Date: Sun, 27 Oct 2024 21:29:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Aring <alex.aring@gmail.com>, 
	Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3] dt-bindings: power: Convert raspberrypi,bcm2835-power
 to Dt schema
Message-ID: <tmxgkiso66gr62dlnnf4zij7oxtbyf3lkgtmbudiwzolbkuuff@y3l7kxr6rwyy>
References: <20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241026-raspberrypi-bcm2835-power-v3-1-6621e075d33f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_133003_273259_BDCCCDF6 
X-CRM114-Status: GOOD (  18.56  )
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

On Sat, Oct 26, 2024 at 01:59:13PM +0000, Karan Sanghavi wrote:
> Convert the raspberrypi,bcm2835-power binding to Dt schema
> 
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
> ---
> Changes in v3:
> - Applied changes as per the feedback received for title and description
> - Removed power label and renamed node to power-controller	
> - Moved the file from bindings/soc/bcm to bindings/power
> - Link to v2: https://lore.kernel.org/r/20241022-raspberrypi-bcm2835-power-v2-1-1a4a8a8a5737@gmail.com
> 
> Changes in v2:
> - Added original file maintainers
> - Removed unnecessary headers from example and formating from description 
> - Link to v1: https://lore.kernel.org/r/20241019-raspberrypi-bcm2835-power-v1-1-75e924dc3745@gmail.com
> ---
>  .../bindings/power/raspberrypi,bcm2835-power.yaml  | 44 ++++++++++++++++++++
>  .../bindings/soc/bcm/raspberrypi,bcm2835-power.txt | 47 ----------------------
>  2 files changed, 44 insertions(+), 47 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
> new file mode 100644
> index 000000000000..71b3fa41c495
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/raspberrypi,bcm2835-power.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +

Some random changes... this wasn't in previous version

> +---
> +

Neither this.

> +$id: http://devicetree.org/schemas/power/raspberrypi,bcm2835-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2835 power domain
> +
> +maintainers:
> +  - Alexander Aring <alex.aring@gmail.com>
> +  - Eric Anholt <eric@anholt.net>
> +
> +description:
> +  The Raspberry Pi power domain manages power for various subsystems
> +  in the Raspberry Pi BCM2835 SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - raspberrypi,bcm2835-power
> +
> +  firmware:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the RPi firmware device node
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - firmware
> +  - "#power-domain-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    power-controller {
> +      compatible = "raspberrypi,bcm2835-power";
> +      firmware = <&firmware>;
> +      #power-domain-cells = <1>;
> +      };

Nor this misindent.

Your task was to do 'mv', not rewrite the patch. How random differences
could appear here?

Best regards,
Krzysztof


