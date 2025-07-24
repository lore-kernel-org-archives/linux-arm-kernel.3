Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jM8k4Bpz7aYzlLA/z9EXbMpkEeWBpnurEqrN4qSICA=; b=E2hQtLwVyhNOkU3iERC2lg8DId
	wUuXlvfKmup+qBjwmhfPHoNLtLI0VskZJpLpG4Li1GAIxZnn/74pG0rI0IRAqa/gbpEV1aBwK6rVI
	G9IJWu7HYRdeso1+7ZyL5v0csfKBVsnt5IbaErQ4EDRrXxDYdRrcYvy6ZAEes//KSPvHa464HRGe0
	ioenUYKiuty/YEvCxFmQITNNH+U7lUx5UP8VM1nBRcWiDYfppary6h7hXRZT/ec0JWLuw3591Y5z9
	nIRxcYdKzVFOUbnoBcREuIrcKZlEaWYL1NKsB8VYMo7/dUPanQiQrQAkRmkvFKorkUZwnd7GAsl2T
	jyLXvu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer3R-00000006oTu-0vrL;
	Thu, 24 Jul 2025 08:11:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqmZ-00000006lCz-1Srm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C34016111F;
	Thu, 24 Jul 2025 07:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17996C4CEED;
	Thu, 24 Jul 2025 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343666;
	bh=i2i4FvAvcuu68l81dS/YVmY3OFVFW2LN9O82CoVKe7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQ1RJw1jj5vQdH0uQDIh+j8DzG4WT0pzw1BFCODaK/ai5Be+TDcZckKWh6m7BRM0X
	 Qc0N6jpaWb3Wp65fn5U8Fy1XO6H4Uexv+t5Z9AeZs0M1+6hzF9Ylb+z9LeDT8Ws/rN
	 mr8nkjmOgTlmFkOhMemTJ0VOjd0I7ylq92bPH+8q0ao28yYivPvYLpfRwDgQqFrvP/
	 7/jCbKR6hNfiLqmNh6DRmPgSYOqTEsWq7FYERfSrDMQmtSMWIoh3WL3K7VB6JgaJxb
	 wWau+MTJmlC1y0iWM2ky+Zwcru9Lc4oqIZxNneD2pcRcqIQ8BRtyxUt/1/c1Otvg1W
	 hzyyArKWXSZNA==
Date: Thu, 24 Jul 2025 09:54:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b
 board
Message-ID: <20250724-sweet-radiant-stoat-10d86d@kuoka>
References: <20250723222350.200094-1-donalds@nvidia.com>
 <20250723222350.200094-2-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723222350.200094-2-donalds@nvidia.com>
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

On Wed, Jul 23, 2025 at 03:23:49PM -0700, Donald Shannon wrote:
> This is an Aspeed AST2600 based unit testing platform for GB200.
> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> differences, additional gpio expanders, and voltage regulator gating
> some devices.
> 
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
> 
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
> Signed-off-by: Donald Shannon <donalds@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 456dbf7b5ec8..624581db2330 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -99,6 +99,7 @@ properties:
>                - inventec,starscream-bmc
>                - inventec,transformer-bmc
>                - jabil,rbp-bmc
> +              - nvidia,gb200-ut30b
>                - nvidia,gb200nvl-bmc
>                - qcom,dc-scm-v1-bmc
>                - quanta,s6q-bmc
> -- 
> 2.43.0
> 

