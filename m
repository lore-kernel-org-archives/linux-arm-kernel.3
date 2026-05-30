Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE86CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9vLKWYG42FEGYkXWgIv3uwvb3u+dOyLKJzsNTX1l4A=; b=U6UGrJdC7rZZMk7qYy2z+0Z5nA
	wqWLf+Obp/4TjkbPltBTR1g2B4gFjiTyaynh0fn6WzmDX45wEwykhdhZ2kpVf4JDtM9D/MGHBP7G4
	4JrWYWiL6mfSD3t288Jpefv9W7pmeBVQ07vS51RkCoEz42F4sJH4zKXPLIlY36F73XfzwhhuKVDC2
	kL5819UaGXWiNtDSktIpmcS8v3tz5Rwors4DQBdlxRL07eVDXiEnvOQzW0AAIRJzBDH+LeRutQDIp
	UmzqYoKCFakRnaQqTFWgQdrv+Lx6XowjkwvYqbcI4cRiK5LLq7Kd5Kk+Oh4WJ5BfMU9bnCknf9lc0
	I3mDc5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQbl-000000093ml-0EQx;
	Sat, 30 May 2026 20:48:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTQbj-000000093mZ-1fc3;
	Sat, 30 May 2026 20:48:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60DAE60126;
	Sat, 30 May 2026 20:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87B51F00898;
	Sat, 30 May 2026 20:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780174113;
	bh=c9vLKWYG42FEGYkXWgIv3uwvb3u+dOyLKJzsNTX1l4A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=a2OtfUrlXutm5ZE8Fug07AhMbKv2H+ooDEDCNjWQj7Os/kjhxrbeJYEaGpLvKB/6a
	 YQbWhJ2wtFjeCMCUlHRkDZlkL3tyD8t+JLq6uYtmCQ2EskyuV1AUAfyhUezTSM9V6/
	 bG+Ak7oIy0lfr0iB9SM/FKwUXVq2ctDEzne16pGErdYjLE1JME6NAbujLTXfCFImph
	 VEFXOzAkfxac+bgbbn8iO9uOfdMbl7XoL+Z0kP38eElQC5NNbc9nJSA2IbPrZ/V0mB
	 qtS3v266kMpKxXZAFPoCvGXKpE5BubD9bBY83omk70CmdaXpy67bChnc8yx0BL9wna
	 Qul5ncVjOlGZQ==
Date: Sat, 30 May 2026 15:48:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, clabbe@baylibre.com, 
 linux-rockchip@lists.infradead.org, heiko@sntech.de, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au
To: Dawid Olesinski <dawidro@gmail.com>
In-Reply-To: <20260530160704.3453555-2-dawidro@gmail.com>
References: <20260530160704.3453555-1-dawidro@gmail.com>
 <20260530160704.3453555-2-dawidro@gmail.com>
Message-Id: <178017410969.3710466.3951554039156108335.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
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


On Sat, 30 May 2026 17:06:42 +0100, Dawid Olesinski wrote:
> Add a YAML device tree binding for the Rockchip second-generation (V2)
> cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.
> 
> The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
> SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
> with a hardware DMA engine controlled via linked-list descriptors.
> 
> The binding covers two compatible strings:
> 
>   - rockchip,rk3568-crypto: clocks and resets are driven directly by the
>     non-secure CRU (accessible to Linux at EL1).
>   - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
>     register bank sandboxed to TrustZone. Linux must request them through
>     the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
>     MMIO access to SECURECRU from EL1 triggers a bus fault.
> 
> Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> ---
>  .../crypto/rockchip,rk3588-crypto.yaml        | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.example.dts:30.33-49 Unexpected 'SCMI_CRYPTO_CORE'
Lexical error: Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.example.dts:31.33-52 Unexpected 'SCMI_ACLK_SECURE_NS'
Lexical error: Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.example.dts:32.33-52 Unexpected 'SCMI_HCLK_SECURE_NS'
Lexical error: Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.example.dts:34.35-56 Unexpected 'SCMI_SRST_CRYPTO_CORE'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1660: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260530160704.3453555-2-dawidro@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


