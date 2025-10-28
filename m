Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AABDCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SabJRVn0JNohyzY4K40NzhYHLME+QEL5+1a7OcvzBdE=; b=GXXyOeVYjloLYyPwRZLje/ZGOm
	LmKMOSI6mSBX4IRaTjfl9gKQyK1nPNE48kjZhPgWpDLcyOJP4kFTI071umBcebyMlbdbELBqvO4zJ
	9AKtHmWaXIFBiXXUD30/5GqFs2rH84p9i+4O3QPgoG/JkyqCseQ8dfFeDgALKSTlZzQfBEM063X3G
	HeZR17/90DdjShCTvML594vP0GR951n+7JTYbrp3z3hHGLhmWmGr2QooCEWsk/4u2LqQXnRzP8MJa
	VoxM0u7aB9HttaDwMb4S8c+vrh4idiSEO3xaNRTLulezj9gZ0jfISu7PWB5Quzk2SKoMJlxCoH/ij
	XhPa0ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeV2-0000000FTqY-19iU;
	Tue, 28 Oct 2025 07:52:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeV1-0000000FTqL-1icb;
	Tue, 28 Oct 2025 07:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4323602D7;
	Tue, 28 Oct 2025 07:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF514C4CEE7;
	Tue, 28 Oct 2025 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637930;
	bh=lgCu1/5LkJDVUKGcQ1LJt6hU1F8MpL35/q8ICEa7ZPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eeZ0Tj72+n38VyiBnwzBzv1JPxT5YjRmABluQrQbslUPzrY4kOjj2dZbDJn+VKxVX
	 QE4fZj6gTStX4n5HsGpMaSXgVAhZ+8sC6W3k2yfrzQi/FS5BfbFSmqjNtPow4aVUkg
	 5DdvTG6gAECtFsUFZwk25O92EL6Ytj9Sf/i8d5n5tAvZb9+b9HIpIO2qNo6AoI1zbc
	 uj3JznohxOTHbhva7pBZea7/H0kbzXJxVEhRbWpRCEKWiO5oxrTRcBgBQYjbVQsXEo
	 U2OLHi4bSp94ssMT2o94756zksQZG9E2cv82F00lUI88X6OPvu6fGDPhE0qiZ7i57x
	 tJY3u1FKZhsLA==
Date: Tue, 28 Oct 2025 08:52:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com, 
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	huangtao@rock-chips.com, finley.xiao@rock-chips.com
Subject: Re: [PATCH v5 4/7] dt-bindings: clock: Add support for rockchip
 pvtpll
Message-ID: <20251028-hasty-amusing-guan-e57f62@kuoka>
References: <20251027084147.4148739-1-zhangqing@rock-chips.com>
 <20251027084147.4148739-5-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027084147.4148739-5-zhangqing@rock-chips.com>
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

On Mon, Oct 27, 2025 at 04:41:44PM +0800, Elaine Zhang wrote:
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  rockchip,cru:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the main Clock and Reset Unit (CRU) controller.
> +      Required for PVTPLLs that need to interact with the main CRU
> +      for clock management operations.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"

Missing clocks.

> +  - clock-output-names

Missing rockchip,cru

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pvtpll@20480000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +      compatible = "rockchip,rv1126b-core-pvtpll";
> +      reg = <0x20480000 0x100>;
> +      #clock-cells = <0>;
> +      clock-output-names = "clk_core_pvtpll";

Incomplete example - missing clock.

> +    };
> +
> +  - |
> +    pvtpll@21c60000 {

Drop all other examples, no need to repeat the same.

They weren't even here before!

Best regards,
Krzysztof


