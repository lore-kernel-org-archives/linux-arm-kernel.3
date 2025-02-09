Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6CEC021A3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJWJa5ZeCVr3ROeteBLhsE6vTZOh7QYqG2qEbuSP9/I=; b=ZAzbLlGMunKIm23j/+aKqlxVQL
	tNCjHkecQJJYFXBB564Zg0tjclCnCZmFqbe+Kg9mMnv5wEzEOhbw65Rw6C2uMSRM47zMO1GsAJ8Fj
	b8wmwrjVflF/keRHTGL2eogfsHM3VVHmqh7iEZ/6lmzXzDb9fHz3xqCDUjFQcwHKz3rSGQ9wW27JK
	dviUC8wOqsaixSsd4lGx7wA0ap1Z3GYbl7NN5rlyo6yBQlEL3Nwvl+pWFPFUNftl+JEj/ASH6FvhE
	Nm1P9zewu1pstH6T46ieEn1EDxRKwylMgHI3biVGAaPiUchajt0SMlGPnJ0FbYWgMqMQn0JEyjCOr
	WsC+L8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6cp-0000000Esqn-1xFW;
	Sun, 09 Feb 2025 12:41:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Ph-0000000EqbL-3YHr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D634A401F7;
	Sun,  9 Feb 2025 12:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93228C4CEE2;
	Sun,  9 Feb 2025 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739104072;
	bh=BSXNirLH3zvz2GV0XOlsh3+a7jUDmmAsutL9GmheFYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmvmaZbKGIDIztWxHMvUpjMTRqPZK8Rj6b3Q/rMF2jsOQv0Sqg9brnJQlKuA8KUXb
	 4ZOlnI2mj4b8+3W67c8dWEL5W5u4rJ2J1C2ZQ1CeA8cF0t+rUuf9voc9T1MItrRKd2
	 e4Skd25IfhS9nnzUwPCaBfhqBSnnqSrfr2GT8Y+LREV7JvOQlLU+NN41NeRn63keP1
	 IvtS0BLQl6WTFuysOT82FbzCXJ7COBLNJDiV5Q42tnhJSWZMn6VI0I+xZ+F/eFFjHe
	 ViySV4XWVUQpAtu5eD863ujlD5MnB9cnds6SrgHbjfatCbMTYp6Oi86K/NBMfSnufO
	 4tonCTVZYSaAA==
Date: Sun, 9 Feb 2025 13:27:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: T Pratham <t-pratham@ti.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>, 
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: crypto: Add binding for TI DTHE V2
 driver
Message-ID: <20250209-sincere-honored-vole-dda3c7@krzk-bin>
References: <20250206-dthe-v2-aes-v1-0-1e86cf683928@ti.com>
 <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_042754_015516_3E291CEB 
X-CRM114-Status: GOOD (  18.19  )
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

On Thu, Feb 06, 2025 at 02:44:30PM +0530, T Pratham wrote:
> Add new DT binding for Texas Instruments DTHE V2 crypto driver.

This was never tested so only limited review.

Subject and commit msg: Bindings are for hardware, not driver. Rephrase
to accurately describe the hardware.


> 
> DTHE V2 is introduced as a part of TI AM62L SoC and can currently be
> only found in it.
> 
> Signed-off-by: T Pratham <t-pratham@ti.com>
> ---
> PS: Please note that the dmas option in dt-bindings is subject to change in
> future as dma driver is not finalized yet. Any updated changes will be
> sent in the next version of the patch.
> 
>  .../devicetree/bindings/crypto/ti,dthev2.yaml      | 50 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml b/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9c871fe191ae0a3341d047d4565ec1e1bf1f21ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/ti,dthev2.yaml

Filename matching compatible.

> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/ti,dthev2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: K3 SoC DTHE V2 crypto module
> +
> +maintainers:
> +  - T Pratham <t-pratham@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dthe-v2

NAK, SoC-based compatible instead.


> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: 'AES Engine RX DMA Channel'
> +      - description: 'AES Engine TX DMA Channel'
> +      - description: 'SHA Engine TX DMA Channel'
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx1
> +      - const: tx2
> +
> +

Drop stray blank line

> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Drop stray blank line

> +    crypto: crypto@40800000 {

Drop label

> +		compatible = "ti,dthe-v2";
> +		reg = <0x00 0x40800000 0x00 0x10000>;
> +
> +		dmas = <&main_bcdma 0 0xc701 0>, <&main_bcdma 0 0x4700 0>, <&main_bcdma 0 0xc700 0>;

Wrap according to coding style.

Best regards,
Krzysztof


