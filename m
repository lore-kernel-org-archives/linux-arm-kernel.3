Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6456EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSmQOhQx8jXna303TMh4SX/9QUR6aHz50NXqzzJHsDU=; b=v74UFxhZHiPHhYEJHAdzr7/tgE
	j3/lcEyuWMfvJPPvP4mFaT7eJGpZTBcOv/EfxMNRJCpdjXK5Y15hxIxxJVcYgvxRSgPJ3/cwGTXt4
	bZnFTTvHWLqziZpAUeNjeGSyG1qUMDUjoqcUuJI2m8pvUkI3Wiwy53s2yH+6CNrZ96j4nHB92fxKr
	dShybsoD3aHqMajWA5vFoRleHhB5ljLccCrjLnnVw5ZiTC24tXgxzNZhwy+1kROESdKTJIOSrD5iC
	LXnogEV1l77bnHvnWrqIpRalr5xGedmSEl7e96OJrR7qmf7EdYk7K3eq7qtXLB6E6uklVnXc8+G7F
	vDsG/SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twuO7-00000004i9N-01F5;
	Tue, 25 Mar 2025 02:51:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twuMO-00000004i0j-0dRu;
	Tue, 25 Mar 2025 02:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7409E5C585E;
	Tue, 25 Mar 2025 02:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F37C4CEDD;
	Tue, 25 Mar 2025 02:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742870987;
	bh=kzEDoLXYoRLg4bIFcw01+2FmmdfSHx/Mqfyj4i5mSJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G6k6WhZwnR8EXCsrq4/rrPLd3oVKgxxPC4tvPKQ/220SRREdm3++oCCG3eE6gDe4m
	 M8p6zv3nKFNSdTFGJWndCQOYPYyZTi7LziREVsW+nH27li4kSdLTMDJbu8OtGTET9p
	 l5ckX40XxsIqwBxkAEEwf5B5bdtmkUWqnFY5LWGvNHSyFUpAXQCEDzFU649/Z9x+z3
	 2KGeK1ZhKt9ZKPCZmxv9E8/SiFBuQD9vp+J1FJvGW+CZS+w+Jr3DgAwmzJn/s3+yEO
	 +BFgNPQTmbGXy7oQ+dq2G5D4Q7ZylEGLxTZeY5WIU6aDxsnyobIhdqcNWeCGWSCuDk
	 n1sDAvEUO1QaQ==
Date: Mon, 24 Mar 2025 21:49:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
Message-ID: <20250325024946.GA1544352-robh@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
 <20250324-rock5bp-for-upstream-v1-3-6217edf15b19@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-rock5bp-for-upstream-v1-3-6217edf15b19@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_194948_231748_45E12566 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, Mar 24, 2025 at 06:04:24PM +0100, Sebastian Reichel wrote:
> The Radxa ROCK 5B+ is an improved version of the ROCK 5B.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Same patch has already been acked here:

https://lore.kernel.org/all/20241226005845.46473-1-naoki@radxa.com/

> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 650fb833d96ef67ea1bba33c0767777378a38fa7..fe1fe8fe52fa3594a0da8e0263cb46949436a021 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -946,6 +946,11 @@ properties:
>            - const: radxa,rock-5b
>            - const: rockchip,rk3588
>  
> +      - description: Radxa ROCK 5B+
> +        items:
> +          - const: radxa,rock-5b-plus
> +          - const: rockchip,rk3588
> +
>        - description: Radxa ROCK 5C
>          items:
>            - const: radxa,rock-5c
> 
> -- 
> 2.47.2
> 

