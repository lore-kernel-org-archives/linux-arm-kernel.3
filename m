Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D933BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4fG7+LZm+9XmXKevNOCmZmlRZdLEPXxyzNIAVBU6RY=; b=CSIU8zKyV0CYcLAx2tUJr5ruMO
	CXpIQqNX/Kq3ac7eimy1S6cjlZEwScOtYGVRrS/YVY5ep1xdjK5JWR99E9G6a8ropOn03HjM9kkiN
	D498FaYybPM/xYneKGn5/SIK+a4QOZCxAO4778LSr9sTfBdvjroEP4DzblqkqY8ANIzAeJQh3sKM2
	ZeZEaXdkLsJV0ifu7Y1aBXdupf9Xda23feeTphQ36vhRpJPFkvhX0TtH6reXKMCzkuuTAsS8Lrf2v
	R8+LJ1wwLDym2lgWJqNSDDenciLz8zNe8jnWoWlX2WA2Zh9mAg7zHur6rzZF2OGqu4gAiro0BSU8X
	tiJOrKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrdk-00000009bwQ-2vEb;
	Mon, 03 Nov 2025 10:18:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrdi-00000009bw1-1XH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F27C84020C;
	Mon,  3 Nov 2025 10:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49578C4CEE7;
	Mon,  3 Nov 2025 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165097;
	bh=C4QQnsShf5Y8+8Ho+Em1/waNjgFMK29LcwCRpg08oZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVYeexe/SU2kLqppXCrgZ12xr7hjWV4gFx+NZfTOAdfFor6bpyeLxkounCwgN/qH1
	 LRYYLPRWSnpjPD3aKriQF3S/6i2V87mzFy9vNbW33P0D7uFDsulFNvjSIQCILIZZ5H
	 3PASHPOla3AEYTYjO32t/kQRTMpVWu8qlUB4Ou5SfaDiSg0661FIdNngmD7/w6SlQ5
	 EHP2ds+29sKEYg1vhCMq8zaArngc0IU1vDd0XbvywyT3t5taiEFJQXyB2nEqepMQd5
	 stdql9iwef3g1gdXjfS1GhEgWCSvYxtAMJf2q0LOcOuXHHiC8OzyRdiIqrIC+cGWQK
	 Ce4WuDFhe9LOA==
Date: Mon, 3 Nov 2025 11:18:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
Message-ID: <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021818_420427_1B78773B 
X-CRM114-Status: GOOD (  14.41  )
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

On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
> Add the chipid node.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -467,6 +467,12 @@ opp-2802000000 {
>  		};
>  	};
>  
> +	chipid {
> +		compatible = "google,gs101-chipid";

That's not a real device, sorry.

I had some doubts when reading the bindings, then more when reading
driver - like chipid probe() was basically empty, no single device
access, except calling other kernel subsystem - and now here no single
actual hardware resource, except reference to other node.

Are you REALLY REALLY sure you have in your datasheet such device as
chipid?

It is damn basic question, which you should start with.


Best regards,
Krzysztof


