Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE5EFD0061
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tmrwnz2Zq+NZ/X1xvQackeo4k+TkJ9NC1fC4Cpv+JQ=; b=v+Yf8cLNBWMPjWZN32TeMjWeGp
	eWKVUCZDlEpvIgiPG3T7CL/4+CNyUXBkVY1v/bXvDKklZwVSu9AhOQc/daqY6IEcbia7tOt32nwon
	AU5z0SAoFjXbwh7lCJq5Uw5f2hurnwxPN41s/qhn7rxMTO46DWVaXI7trF5pAt3TzNTAgTHXvWbxY
	FwkIXimSyliPo4L44qKcA58q515C9wiR8XMApNge5oLTW+JQ+Sf02+WXNaCpcnuxdcyZ/HYjj9oCg
	3efe+l2HWzH9XEBDSdSf5s6nSzUVxqgtYJuqDqQb8PL09ngC1Dl7FZTIGBBuCmHJioI4coVPS/xZy
	e84HArkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwebK-0000000B3Cg-12Cs;
	Sun, 01 Mar 2026 11:04:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwebH-0000000B3Bt-3gtD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 11:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5157E43522;
	Sun,  1 Mar 2026 11:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC04C116C6;
	Sun,  1 Mar 2026 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772363078;
	bh=ylmTjATbvHfZga1k1dOK+qTWjLVm2OYkgeB75RI/xTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWAAaZ5of/44uYkxrocd9pXgKinzb3iMXGqlETfd97TEXApMesZ+oCcTn2KstjkBZ
	 mt668pLJWQqJ6V2O8TqmekHLb38Rv5+0VYVJZZMtTGIanWecpVKvxxfz0NYAHRywlt
	 8coZbkAfUUqEMz+efP9DW5CxKTkbMQCSR0iYtjz41OegFbC5SJmbmzIeasBF5VtNnG
	 A1C6jXvOO8mk90LI40TSJrnOFtkxZ5WeriLb77TgoNDz8RsDb/LUTkx6v3w3nhIGSR
	 cUQx+lUCphY4g+0HPGVwj+Jlm45lB5AP6G1ursG2E+2pjPhkrAi3gvjaLqy8hLZV7Y
	 WRMd53M6y0eXg==
Date: Sun, 1 Mar 2026 12:04:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	Gary Yang <gary.yang@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
Message-ID: <20260301-capable-elated-squid-ad2be7@quoll>
References: <20260301070910.6169-1-xueyuan.chen21@gmail.com>
 <20260301070910.6169-2-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301070910.6169-2-xueyuan.chen21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_030439_960882_280AC2DF 
X-CRM114-Status: GOOD (  18.39  )
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

On Sun, Mar 01, 2026 at 03:09:08PM +0800, Xueyuan Chen wrote:
> From: Gary Yang <gary.yang@cixtech.com>
> 
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S5 domain.
> 
> [Xueyuan Chen: Refactored to a flat syscon architecture to fix v3 review issues]
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Co-developed-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  .../bindings/reset/cix,sky1-rst.yaml          |  51 ++++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..27b6df71c3e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Reset Register Region
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +  - Xueyuan Chen <xueyuan.chen21@gmail.com>
> +
> +description: |
> +  An assortment of registers that control elements of the CIX Sky1 SoC,
> +  including resets, clocks, among others.
> +  The Reset block acts as a system controller (syscon) and provides
> +  reset capabilities to various peripherals.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-src-s5
> +          - cix,sky1-src-fch
> +      - const: syscon

I don't understand what is happening here.

Something VERY similar was sent as v9 and this is v4. Compatibles look
different, yet similar.

It looks like you just duplicated a lot bypassing 5 rounds of comments.

That would not be acceptable, we don't review just to be ignored.

Best regards,
Krzysztof


