Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26AD58E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bqm5QtIugIfwlM6hjvYetmqmCKIvboMlYA5DSg9NBsQ=; b=lN8+pYpY8gXLfcT8FAVh5GuykA
	MUZXGE9SIB6m0Hl6Cgjf+EjTB8gGj55lDZ/Rw/8W+f4wufdW+6U8ycIaf7OpGlhAQYxu0kef2h9GE
	dq1u043YVrrRYpTmG4rTsN2FOyXnWg0X6g9os50avfADYpTlYW/vNYmexFo55MOUZYfOT3VAsFXvB
	Trwzfpc5v5XPvre3ogxVZDMzRTSYJ73hQ2v0YetmtsABvctQp+QaoHS2lZLwEStnSV5LiPVzhWxNq
	gyowmGM8EsV95psj8yPdahKyn2l3YhzGqAfHFbJP2yFMyXY3aCD+opoAVx+87blMYu/s8ggs73h8l
	lj+DinTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxZc-0000000CP40-20yp;
	Mon, 02 Mar 2026 07:20:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxZZ-0000000CP3X-2gol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7D1D40338;
	Mon,  2 Mar 2026 07:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FF9C19423;
	Mon,  2 Mar 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436008;
	bh=aDIYRsp0TpIxZFNgF1g0ihmHMMwniaVYzKfwjHLo04A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dv0emQkyq8MxQqIAz2FtULYOzXKF2eQpsX1pa0SVsqLkuvmb4/R3hu+9FkU6nJiwV
	 P6LPvlHLEXMvXXsyjscyFeIclok5Zm1NVxV7mp5wyWW09uEaIR4JNwThnCeAx1hPei
	 v5qMSWMzpcGvJMRWQZS1DiK8qQ0u5Y4iR1vcs3cvfZ6sdWGthDWKX3JR0QvKgZTq60
	 iis1QtBK/+HNLfFWrnECeZkGueMlUWHLCaRJ1sKIWea8gAs3RD90NMCpcscSW+3jW+
	 MzzrNdKbXKU/iVTSgqVJMPgKVf1CWqUW+0LqQi4PtzN0hnaUI2a7enLZfYLvTFcGL9
	 Jrw5ZTgoGNwfg==
Date: Mon, 2 Mar 2026 08:20:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: andi.shyti@kernel.org, ychuang3@nuvoton.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C
 controller
Message-ID: <20260302-agile-mighty-cassowary-ed972e@quoll>
References: <20260302020822.13936-1-zychennvt@gmail.com>
 <20260302020822.13936-2-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302020822.13936-2-zychennvt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_232009_753178_379686F7 
X-CRM114-Status: GOOD (  15.36  )
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

On Mon, Mar 02, 2026 at 02:08:20AM +0000, Zi-Yu Chen wrote:
> Add device tree binding documentation for the I2C controller
> found in the Nuvoton MA35D1 SoC.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
> new file mode 100644
> index 000000000000..fa8b01e2c5b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 I2C Controller
> +
> +maintainers:
> +  - Zi-Yu Chen <zychennvt@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Nuvoton MA35D1 I2C controller supports master mode and optional
> +  slave mode operation. The controller is configured via Device Tree

Use modern naming, not master/slave.

> +  and supports interrupt-driven I2C transfers.

Drop "The controller is configured via Device Tree", because it is
completely irrelevant. Why telling in DT binding that you use DT? Can
you use ACPI here?

And with dropping this it could be one simple sentence.

With these changes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


