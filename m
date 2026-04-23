Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A2F99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW/E1gWsBs4hu+A3rWx6gIicz2GWQK59Vi5Gj2yaV7Q=; b=ALpHfHegDdU0vZAem0glXWBtyx
	gKMezIEh1QZddGEUmk+LLdmwgSWQyJ7pyKO7JQQ4+zPDfYKQ8m08z/6vTLjo11p3YMsRk+WIUI596
	pr0ETOmehyC4CSxzPdSmNiGlRxwQa6DDw38t5tyLikofAVRpTFmRbSrwZRMtySFYR76Q15sunXKkP
	3zJlG3bhIQhHg2MepJDYF26slIr6gILaxMfj8OyJclR6All3O47Rll42p9Q2LCDB7jOSaadfYBZnt
	m55HPuo+6zvDcWtwf2MmoUThBr5KJIvShxJiPsKlReynLW/2YWIOqnJVjZZ9R1A9y0HLYpKRmvSbc
	G+R2SaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq3o-0000000BJR9-37s3;
	Thu, 23 Apr 2026 09:09:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq3o-0000000BJQw-0rSc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4C2860120;
	Thu, 23 Apr 2026 09:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C3EC2BCAF;
	Thu, 23 Apr 2026 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935363;
	bh=xSWjk1676Q7PCysPeHLGeMmNMeG0xoGyvTSMFNz3Dmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KldxjNFHOgQbD0Bp2CLICe0KM0aGgWZEv4FooxeTyEzXHYC3xEsRWVwbmCNUkAlIb
	 u7PgncyiiJWOB4EEANfTQruQh+cPT8GLrmdEYIPEImTBttaJympadFfzZTT9GNpc8P
	 WBuzkXj78WIOoI1E4GEnrI2j3JXfHVAREpxRezz3ovtku0i1PbAEDE+tazqGeEVwLX
	 vIY84yJxFgF/uHd1OpuCAHsjmRHjaJ/vW6VLjP6VtuZTNjc0JOf2RiknPy8iidrUYK
	 Ussol50+MndKh3lJIU5BHgayOP9wWdFVe/bOjnuMYY2OLAv564PWCrnVhHj+9eF7fk
	 rKudyJ4WUB2Gw==
Date: Thu, 23 Apr 2026 11:09:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Message-ID: <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422202558.2362971-2-tanmay.shah@amd.com>
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

On Wed, Apr 22, 2026 at 01:25:57PM -0700, Tanmay Shah wrote:
> Add auto-boot property to notify that remote processor is setup and
> ready to boot. Linux can attempt to boot or attach to already running
> remote processor. "firmware-name" property is used to mention default
> firmware to boot when linux starts the remote processor.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> index ee63c03949c9..0d27260e3baa 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -135,6 +135,14 @@ patternProperties:
>            - description: vring1
>          additionalItems: true
>  
> +      auto-boot:

Last months, I have been asking AMD to follow writing-bindings doc or
other DT guidelines way too many times.

Or you just sent us downstream... Do you see anywhere such property?
What properties do you see? How are they named?

> +        type: boolean
> +        description: remote core is either already running or ready to boot

And why is this property of a board?

> +
> +      firmware-name:
> +        maxItems: 1
> +        description: default firmware to load

Can you load non-default firmware later? IOW, why adding description
here, what is special?

Best regards,
Krzysztof


