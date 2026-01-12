Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2CD25059
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkmBcI1UOADYfrSITlIMcIkKaY5/HNtnegy7VXhTK7E=; b=Rmq48wnvRpAEeWKhIK6ICySfhI
	zJYBOU7oZ5L2ss1qLc46rbVgTpdcQ3+684n2u/N9QCWpWSOJGV7NeR09kWGxrNQwXDvW8STNJwdq9
	OGdB5K5y4Vd5ISGzRNXZphHE0BmaFSBBvgN7U8kdlowh1CfzwpHdTu76YjzNbpEl4gktG5COQYWJb
	ZiAk02wPAudAml+4LQA/fAzibwqUQ4FFf2E0b4HlFWHAbXQAKCEJL/UW+QTQVieRT/iPtHdDE9GPc
	XETRJqHQQmimpKoHYQ5qefMeIhI1MfDGb8kJyVYR1p5sSOTubqVYJXqS8KMCCnNWpBd5coDiqttST
	CU2KP8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDtF-000000053Fh-4AHU;
	Mon, 12 Jan 2026 09:07:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDtF-000000053FZ-0lqo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5022360159;
	Mon, 12 Jan 2026 09:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC10C116D0;
	Mon, 12 Jan 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768208828;
	bh=BTb8pbhyC1oJxM6pUV77pioSiIIHU6svZzVv7lDmZwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRvOj1aOZICX6wkNxoyeOInlzjC3lzEvrNN8V+0SRgrwJQFJGf0IITzeNHMGZJLdU
	 +gJFkxFgd12iyVBHC/eNIQwcTMepy5asPZdiz1bdvKjxIM4Oc4oytWcaSy4NzOYPv2
	 YdBy7gGRMDA7E9I60xKa+jCAeAKzAkBzAAnmIeubKhKCdCRey8DOtZVIYgm8xHhmAG
	 CsL2Dis20DQtZkcm2mV9wWWWaxfGa9aYaxmXPBRjJw4U4klQkVuRKR362efTQNKqeU
	 +zp+uP4rsUj5Q8cHccpwk/x+M8HlJYhaFAl/Ql9v2f7jDMnY4xsvQ9Y8Hmuo5Kz7+U
	 2Jb71OYfzmK+A==
Date: Mon, 12 Jan 2026 10:07:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chanho Min <chanho.min@lge.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Kael D'Alcamo <dev@kael-k.io>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2 v3] dt-bindings: arm: lg: Add compatible for LG1215
 SoC and reference board
Message-ID: <20260112-agile-elite-tuatara-dea08d@quoll>
References: <20260112053421.3185738-1-chanho.min@lge.com>
 <20260112053421.3185738-2-chanho.min@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112053421.3185738-2-chanho.min@lge.com>
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

On Mon, Jan 12, 2026 at 02:34:20PM +0900, Chanho Min wrote:
> Add compatible strings for the LG1215 SoC and its reference board
> (lg,lg1215 and lg,lg1215-ref).
> 
> This SoC is the next SoC following the LG1313 series, developed
> by LG Electronics.
> 
> Signed-off-by: Chanho Min <chanho.min@lge.com>
> ---
>  Documentation/devicetree/bindings/arm/lge.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/lge.yaml b/Documentation/devicetree/bindings/arm/lge.yaml
> index d983ef7fcbd6..0d0661470eaa 100644
> --- a/Documentation/devicetree/bindings/arm/lge.yaml
> +++ b/Documentation/devicetree/bindings/arm/lge.yaml
> @@ -24,5 +24,10 @@ properties:
>            - const: lge,lg1313-ref
>            - const: lge,lg1313
>  
> +      - description: Boards with LG1215 SoC

1215 < 1313, so this looks oddly sorted.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


