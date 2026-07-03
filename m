Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ACAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhfiHCKdYvrlYZO8ujaC1v3Y0eErVrUk0qO97RPQE08=; b=oS+9jSYRtJo3eiGuEYrDoGSTmW
	RZ41xI6h99Dim8Nl9qfNcNcdjfSlJ93oojA/jpjWJpYTOVY6OldxCy/MRTkyFTcpeytnDccn2WT7Z
	OmtsEswjzDgxbuUOa+fw1o3zLexM8J0COGWLNaK4cpTsHchGe3HMyThnfL5omGJF/4dFwwchhW2Bp
	YgVGpC288RxEiouN4mn/ErBGRmaLonak/1dFT4w4Bcv0barxh9d0EG7elW/SScC4FXchlQODbLu7n
	K6r0yWNvcYg2LtM5cAzlzOvGBPcJIYyctlQA48nq8rDXDywc7MLdfqqshKUydqwGDyiR9gneYMPQV
	RCk8jSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZ1-00000006jR1-28vU;
	Fri, 03 Jul 2026 10:56:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbZ0-00000006jQq-0dyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:56:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14B6D600E1;
	Fri,  3 Jul 2026 10:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C577F1F00A3A;
	Fri,  3 Jul 2026 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076164;
	bh=mhfiHCKdYvrlYZO8ujaC1v3Y0eErVrUk0qO97RPQE08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKi35CdVFHIEik2dQrgbSGfmmclJyVDVZtQeqE2EtxE5Am9uNMzvkasxkWaQRCA3D
	 GJ8UqFKmrqtmumL7Ce+KkcRmnNnuQFh8+u20PcceWaghv91cxJgmPcO1CCmeaQD3T/
	 1Ss869E2aDVXG3TxZu/3GO+GRUsQ+lQafRv0OGIsP+raTASS1UAVsm2M18cebtqJOw
	 /Uc4M0wHquEWB4q6+QhaH1beWx1PJIy8tKWJ4aAiGGD2RNtnymPE/UcB0OfkZtdBLt
	 ZE+QG9aa4S5/z1fD3mxghDvvprTnsRmk7T95D1apC44vXfpWW3UquSmWtrvw5lpR7l
	 qcK9Y8+wpXP4Q==
Date: Fri, 3 Jul 2026 12:56:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <20260703-versed-locust-of-agility-d76fda@quoll>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702214750.3428694-2-utilityemal77@gmail.com>
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

On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> It is not backwards-compatible with the A31 programming model: the
> control register has a pulse capture mode field (bits [7:6]) that
> resets to a value which captures no pulses at all, and the sample
> clock divider is now selectable via SPLCFG bits [1:0] instead of
> being fixed at the old module clock / 64.
> 
> Since a kernel driving it as an A31 CIR receives nothing, add the
> compatible as a standalone entry rather than under the
> allwinner,sun6i-a31-ir fallback.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> index 42dfe22ad5f1..06656058ce91 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> @@ -19,6 +19,7 @@ properties:
>        - const: allwinner,sun4i-a10-ir
>        - const: allwinner,sun5i-a13-ir
>        - const: allwinner,sun6i-a31-ir
> +      - const: allwinner,sun55i-a523-ir

I assume you are adding it in expected order that Allwinner is
following, not just randomly at the end of any list.

Also, please change all above entries to one enum, can be the same
commit.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


