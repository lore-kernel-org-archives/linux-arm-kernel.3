Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB459C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0AD+yfRRB8kFuS3umG0hhMkgfqhZmRwgX2ATJd2Akg=; b=TPcBrl3bK3k9rWKUjCsS5oXTEG
	uToTZTRe/2ZyDHxCIP6+N1eKR8GEIPbW0iw6QVX5vxvEEuXqe/0yNo2WqNVWGNBIO2GI7uo/LVs2t
	YiFThBEgJtLqC0aRBGtCOTA5bzpuV7Ti98nJ6nCm6JYX3sLEZi6ZC8VFh0Gtv5rNw5PGrcK1OeiAW
	V98nyosxkIex02pgN4iurbiWtJJZp/BF5FDhfBrg7hrvCZt8tDhLu8yx0hnNzzs301U0VCy+r1uTa
	Vl95+SwcFYc/n43XB8TRZWEc8ZzlSdx12Xmtk7M8wzo0LRli7cM5sc2tTBcmk32/2gki3Gun9B5AX
	7/szbJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryBr-00000005ud9-1w4p;
	Thu, 06 Aug 2026 13:31:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryBq-00000005ud0-0ybt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:31:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FF3860A5C;
	Thu,  6 Aug 2026 13:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1DA1F000E9;
	Thu,  6 Aug 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023077;
	bh=Y0AD+yfRRB8kFuS3umG0hhMkgfqhZmRwgX2ATJd2Akg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJTV5ehoIEF8y7Kgco+X0NK8DYm3FHIb5dwVRUwRJ+mDkIY67nsnTkvehjQzkyyOE
	 +lU0FGL1ltpTL5CrMMW5U/tDWHoyh6M2NA48HP662X36/fOLJ4+d5+Q4aq3USy6AxH
	 jr/gGrVQkNanDlcErJfMkiKmeNFK0mBr4gAbfG2WrInh7LbSdlW8JhZtT4oAZGVHPv
	 SmNcAUbJTJ/7JUHNGXIIhiPOzEkoGNYMl0YB+1AFQREPucGLLpdar0eSPnma2ZuwdJ
	 txnNntcMTSk6DP5HprY8bQtNAHroh8k6MbILqDlN8MN6TBWGUpLBWQkQ4RRVsA/sb1
	 rildWmczV4maA==
Date: Thu, 6 Aug 2026 14:31:11 +0100
From: Lee Jones <lee@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Corey Minyard <corey@minyard.net>, Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN
 alias for multi-instance SoCs
Message-ID: <20260806133111.GF2869284@google.com>
References: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
 <20260723-upstream_kcs_multiple_lpc-v1-1-d918b5270b86@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-upstream_kcs_multiple_lpc-v1-1-d918b5270b86@aspeedtech.com>
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

On Thu, 23 Jul 2026, Yu-Che Hsieh wrote:

> Some SoCs (e.g. AST2700) expose more than one physical LPC controller
> instance. Downstream devices such as KCS channels need a stable,
> globally-unique index derived from which LPC controller instance they
> belong to, so document the "lpcN" alias convention on the LPC
> controller node that lets DT authors assign a fixed index per
> instance, mirroring the existing alias-based numbering convention used
> by mmc/i2c/spi/serial.
> 
> Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

Why is this RFC?  What's stopping me from applying this now?

> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> index cbc3a2485a2f..81c12e0fb312 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> @@ -35,6 +35,13 @@ description:
>    configuration, therefore the host portion of the controller is exposed as a
>    syscon as a means to arbitrate access.
>  
> +  On SoCs that expose more than one LPC controller instance, it is possible to
> +  assign a fixed index to a given instance (and thus to downstream devices
> +  such as KCS channels that must be uniquely identified system-wide) by
> +  defining an "lpcN" alias for it in the /aliases device tree node. If no such
> +  alias is present, the SoC is treated as having a single LPC controller
> +  instance.
> +
>  properties:
>    compatible:
>      items:
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones

