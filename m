Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A87C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhN+tLSJDpxbREckTKlCXU6FSn5OeFEbCVF4F8nCdpc=; b=p4eOV4B4ixIw1jhqE2SBZ/Cbyw
	Teav9zuX+2kuUeawY6iO7CO+KGmBqTcV3/9xH2W0hkbst2cn2WeOtW5+KPCWv2/YTIvPh/8ti2n3x
	E/kpklsHnj8SVraymqBrBil1ZqYC2JhnqK2OJqNLAq6Mfe0YTzrGyjqvp5t4EGLOTuTexTioNnRhm
	UPU3i+TWUwrnjlX3BJM4rLjB6k2TRq3d6uP4mZdZeNy0HNZyuKCKveIDFv3wywPpZl0NenbIj9IR3
	LM2uV25n4FmjOkUgtPiiLthGU2g2niMiOBoVklLu1gTTUOQGuy8/hgGVyfLhtGsQZ0IwhfUXeAfTP
	82p37OvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaEw-0000000Agb8-0LRy;
	Mon, 12 May 2025 20:59:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaAt-0000000AfuC-1hFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D1F94ABA3;
	Mon, 12 May 2025 20:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0DBC4CEE9;
	Mon, 12 May 2025 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747083299;
	bh=4MnOPiXLyFGyvIj0JXxrByxbb5sHvTSxERBoVbP3jrI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L76NCfVVHHV1HoGV5ch5HkQi9AXePHnSPo+xJYB+NDcUqgB/ZLFx5ceZOcfev+iIk
	 FpmLkPuKeifbuSRKiVPxiL+LgcZ6VkZuvLrCkQWNV0VWwQMeS8ONMDldGzPW4sIfur
	 cy+oyufPgaaUZlDWKX34TlHoSTcZVAONqZKv+8EyxqnBhz9v8F5OIWwlhZWIbK51ew
	 lJmJYoA/bKnt0JlxCorWowwR3Cxh8C9p0iaepG+LaamucPP2cmfmx1kDaUJ1tX/rQa
	 3/mstXuPXX7X4cP0kcd/bYtuSQoM5cXtoVNIiHe/qKgd1IsjKopcaStQPFnHJtvyfd
	 wHtl58Dujkraw==
Date: Mon, 12 May 2025 15:54:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: herbert@gondor.apana.org.au, alexandre.belloni@bootlin.com, 
 linux-crypto@vger.kernel.org, claudiu.beznea@tuxon.dev, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 davem@davemloft.net, nicolas.ferre@microchip.com, 
 devicetree@vger.kernel.org, olivia@selenic.com
To: Ryan.Wanner@microchip.com
In-Reply-To: <5c87dd0c60e3ab295bf084cabb59199d5cb4d93b.1747077616.git.Ryan.Wanner@microchip.com>
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <5c87dd0c60e3ab295bf084cabb59199d5cb4d93b.1747077616.git.Ryan.Wanner@microchip.com>
Message-Id: <174708329386.4035852.2868529061240392113.robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: crypto: add sama7d65 in Atmel SHA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_135459_459037_61D71B5B 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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


On Mon, 12 May 2025 12:27:28 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC Atmel SHA.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/5c87dd0c60e3ab295bf084cabb59199d5cb4d93b.1747077616.git.Ryan.Wanner@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


