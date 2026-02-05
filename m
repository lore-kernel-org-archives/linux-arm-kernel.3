Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4ABEC1EB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cn8/WpQj+G24M81vE4/ZS8/7axNt+LgcxT3DTLfW/I=; b=sf2mS1BeUDAF7ibbpKhGyARbLl
	hOl66OoiUFzsc1Nl3rGJHzrr6m5ognSBunH/bXy5yQRWYddFw7tnGyqawx+M0l+JLy7yvq1yg8mE1
	2Bg1M9UuefBWgsLrZosQUNIFOxzw+WVk+vEJ06ulR+TT/LAAf1iwdxlgofDxupL5UuYs0Yv0uCcZX
	hLBIceJnYr39ZRytRQZYwQJoWQtlIFvHdJr4iEpr7+U2rrVmedSWCpJQ03pYAcnFwa0PbpcEuH2rp
	gk3EASRrYWMNTsnXUe9U7oD+CWQJZ59ZN73kduS7Igggc1TpdKbbeB0JiFTe22jNXN/gwCTnOGK/5
	4yRuM7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzil-00000009ycu-0emG;
	Thu, 05 Feb 2026 13:48:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzii-00000009ybk-24BV;
	Thu, 05 Feb 2026 13:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A8843B5C;
	Thu,  5 Feb 2026 13:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B2CC4CEF7;
	Thu,  5 Feb 2026 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299311;
	bh=mpye6M0w12Zxd61wXX0YNHNqnAZ334IbwiSE40CJkjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvwFF0ov+HW1nMUWej1i7pfISvaZGlqZea6z7zqtd8buzSZ20VFdT8Vt6uUJUkHtw
	 2/XA28b0r0eXIFWzkUgf0gmCi7RDaiFG+Tkc8SxXleim18t0J13+PBHzfD09ekbcXw
	 L5ELra2RYrSwrtqH/ONrDh6DcftxOR+bqBi8kUjDCa44Pst1fsw1huALGyngUmJ5Dd
	 8VCWBdoUkHU6UfLTv0wGNdbOA6JePalz65i+SHVJfp35n5KG8Jw+j4W19Mcg6d5AGW
	 PXIhESri7WeIQEoF7A/vsmTbWwGy5JydCnXI7uyE1198c14I6n3Y+8n0oeNH6FiLBm
	 5Hi2qXSvjl17w==
Date: Thu, 5 Feb 2026 14:48:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
Message-ID: <20260205-wooden-invaluable-wildcat-cf93c6@quoll>
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
 <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_054832_590555_CC94F7AE 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, Feb 05, 2026 at 06:04:03AM +0000, Xianwei Zhao wrote:
> Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
> There is no need for an extra compatible line in the driver,
> but add A9 compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


