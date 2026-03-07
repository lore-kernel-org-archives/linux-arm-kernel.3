Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1877BFC9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAvl/uexuwSDF67L5jNkH/FLAxAQ0QZTSrY80PukCik=; b=G1GTjyZp1TNjXI/WhNlnVsE7Tq
	9vCvgzvcuY7XuATEw4o+m/BTutdkR/GWmRC+RGaqc/x8mOrfcTO4EROGIKdJk2kReAb2HXY2UJNoY
	Ge8jVQdPH86oM5Xmc833jw/hpmn6wcguWOSzZUZWMDLZui6Wo9hIKqPf8/smd2rWQ4SG4QDJlXV+y
	ouJK/qa4zrWECSYQLDvM5MNn35KpntiFsYfxrDdUn91nq82lq7k4KozlHIFjHV45IlT7CO/NZqInW
	Tn7SIV4yWY83AbslKvt62GpZWScGeKAq3Jlngz4UE1ha5JN2ivrqU7FWLrCGI148pi6MoVTeDjMaa
	egYPhXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyr9t-00000005Clq-0v4u;
	Sat, 07 Mar 2026 12:53:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyr9r-00000005Cl6-0s9Y;
	Sat, 07 Mar 2026 12:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE3EF418E5;
	Sat,  7 Mar 2026 12:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A6C19422;
	Sat,  7 Mar 2026 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772888006;
	bh=NkU8Z7BJW6IMqFyOQfV2xg9wnLMdZ94S1srnXoDa+2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJa2mXujjMivItr7He25l3aRJMra5ArgA9ylye2kejRpGXXoaG+EdtHG44jdXLZ2U
	 xfnayY6gdJePSrCV1+FdCv5yMvUIvbOQ1sT0YyebUV/FbYYdtaAwdi5U3tQwdTRoAd
	 aAWZxrW11TKXeqlHb69RT/jIbDFeFEHJgD3DNBeHcT8XTkE/q2te3kXMox25ni8Sh2
	 BHm2/bBx5NiMzFzeiMPtsYUpkCo0En+uOY+MG/2penhTVFMVBzuXp6PGQ9kC2jJD+1
	 LtIWHuBthAlQoaHLa7QNLn8YI0p7mBXPbfzwNX7GSmcMPhvsLREa4B5NmSfFX2z19N
	 RXqCoJj+hOaOw==
Date: Sat, 7 Mar 2026 13:53:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Message-ID: <20260307-purring-kind-binturong-1fcb37@quoll>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306075244.1170399-10-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_045327_489466_CE0099D4 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, Mar 06, 2026 at 03:52:39PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
> 
> Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.
> 
> The previous name was misleading because this hardware block is not a PWM
> generator. It does not generate a signal with a specific frequency and
> duty ratio.
> 
> Instead, it provides a fixed nanosecond-level adjustment to the rising/
> falling edges of an existing signal.
> 
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml       | 9 ++++++---
>  .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml       | 9 ++++++---
>  .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml       | 9 ++++++---
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> index 90bd49d87d2e..7b3888b2cea8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
> @@ -133,10 +133,13 @@ patternProperties:
>          minimum: 0
>          maximum: 7
>  
> -      realtek,duty-cycle:
> +      realtek,pulse-width-adjust:

No, that's ABI break without explanation. "misleading" is not the
sufficient argument for breaking ABI.
You are stuck with the ABI you added back in 2023.

Best regards,
Krzysztof


