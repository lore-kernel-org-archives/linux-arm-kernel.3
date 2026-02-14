Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B82EF5852
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98yJ4CAKlM11HwsgKhx+15yVTSyEl+pRQE1kZQg+/8k=; b=1xSkXKVHLnUsX3UZOYOmdNiZcC
	AUpfs2yZjFcJHFHHHUMfTlot3ZpeEJLM4TMhjBJOqliUA6ITtEqKiwzTMAepYOPDdJRpXrXaFjE6/
	NRrRYDkLfGKlJGsMscXeTBqIy5soLEjSWcz+Lir+8YUVz8VVe0EbFni2MYoeva1jUrj/mYBQzlEj2
	vdfRRheVcNq2/NwPrt67C9/JDoxpxPIlXLN0IpEubqyfYxfG6/QMg7fBOsrirX2iHWnrbIjwo8fhW
	sTngrwKxuWk8m7dsPZP0y1mdAtxKvX5SJxy4Sn6A6sGV1a+WZURyX8+U56xwBmnurIobLTg9G+yyj
	WyavlccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMQv-00000004uha-1f09;
	Sat, 14 Feb 2026 20:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMQs-00000004uhE-0ERn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 20:40:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 066D540AD9;
	Sat, 14 Feb 2026 20:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC9FC16AAE;
	Sat, 14 Feb 2026 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101600;
	bh=uR9B4ebgelLywAoG/46ok9n3fnFnuoidR+Wpv1gOhNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9bDlOLdPKAoVeoLZchi1xERAHSh/HMGPvw2WhoicijUrpcuTvj/Fjo35OWZJkku1
	 gWBZLG/B0nqvtsGp0DatuSJokeroE0I0qXddcdYamghyj7T/ljUwd2ZhTFuOqrE+m3
	 o6/V/X2jucd/a/5txApq7bCgHIkx+gnwSD3BdSR9ezFoAVyp3Gs3O9+AJnF4WHT2Q6
	 Lh0eAxiQ1yO01RKjyPWPAM9335XTKnbGxIlIu54m1GUy8BjcRru+riYQUsM8qpbYpq
	 uswaw2YEYBfIH7SFm0dCcCs07olVWlnn1fXiJZFwtLd42p+1aHlO45HMCK528WYZIX
	 Rih/3aZ24+SxQ==
Date: Sat, 14 Feb 2026 21:39:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of
 user monitor interrupt
Message-ID: <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
References: <20260214180933.42143-1-hpausten@protonmail.com>
 <20260214180933.42143-2-hpausten@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-2-hpausten@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_124002_140947_41D0B0D5 
X-CRM114-Status: GOOD (  17.55  )
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

On Sat, Feb 14, 2026 at 06:10:16PM +0000, Harry Austen wrote:
> This Xilinx clocking wizard IP core outputs this interrupt signal to
> indicate when one of the four optional user clock inputs is either
> stopped, overruns, underruns or glitches.
> 
> This functionality was only added from version 6.0 onwards, so restrict
> it to particular compatible strings.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag

What exactly changed that you removed the tag? Rebase is not a reason.
You MUST be here specific about the reason, otherwise why would I like
to review if next time any rebase and slight rework will drop my tag?


> v2 -> v3: Add Krzysztof's R-b tag
> v1 -> v2: Fix binding errors by moving interrupts up front, restrict later
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> index b497c28e8094f..7688601f1f31b 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -38,6 +38,14 @@ properties:
>        - const: clk_in1
>        - const: s_axi_aclk
>  
> +  interrupts:
> +    items:
> +      - description: user clock monitor interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: monitor
> +
>    xlnx,static-config:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> @@ -66,12 +74,24 @@ required:
>    - xlnx,speed-grade
>    - xlnx,nr-outputs
>  
> +if:

Why isn't this in allOf? Code is fine, but why changing it?

Best regards,
Krzysztof


