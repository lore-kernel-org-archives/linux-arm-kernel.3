Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905DACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+VEjA6kP3Q/QIolHWjnLGIRXdj/L9h4BU5oMppfv8A=; b=2COgri/UYSVfW/wgleCcLtxPEE
	LOM0ugAa6QkBM4UiT1MAqB20vJKeiltbPAuH7pTiAdK4D8EXoVUWU7vMwb/WYGfMutQSFScFihdTG
	5ohUct4TtQf9/OGRtEBrJ53UyBAzhEQ4UBNhaGaSFNyZS9R9VCiqfSIsxsgQI8esXaeYT61xTRkvV
	+CfDVu0/cQZkJveDwMIF/cmwZmIDmDcigXbVxtOrW904yCH+rv7r12Iv81M+cANTSoAlum4tWZ5tC
	MXd7k39oaLFtlL4JEKKsJMJqvKv9y3OBJfhIPENCEgFSsCCOKb751xjgEDfhztlrPMRdGZMbydgr2
	SXG31MTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTL-00000004Kay-2QNZ;
	Sat, 23 Aug 2025 08:19:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXYo-00000003OAh-3k3N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 160DBA58AE2;
	Fri, 22 Aug 2025 19:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C97EC4CEED;
	Fri, 22 Aug 2025 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891385;
	bh=zUCHNRR29X2q9YcEgJs3tXfAiU46otyD1jNMg85M99Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCsrNgGlw9/U8/bb96FmiCm0e7GCnSOxo2e73LWwl7l4/OVe3lBJSmgheBA3wLb4p
	 ztRSODRu6eLqie2tbnSD/eKWGhnDOzOJkb7VrjYLSDJkZQGl+AZGOfsJYtmu7zKqq0
	 25ykW8pS5oX4v1Lmh4YFYI4qONxivNNHghtLus1xvDWSJOY0AlylaAWJenmU8XDzbK
	 /YLxDPEm05uZqeftxy14lqO6DZC0FglHvw9JCscmhCLlRKfESVh4Dbk40NfaYIrMPV
	 JDzKMK3jbHP8NVAPQaSrpAkLf57lNF5AVfB2/gWXFJb0T1jTn+3GuM8k0H7J+WTJOu
	 BdTgWPpypKi0Q==
Date: Fri, 22 Aug 2025 14:36:24 -0500
From: Rob Herring <robh@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: power: Add Marvell PXA1908 domains
Message-ID: <20250822193624.GA187008-robh@kernel.org>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
 <20250821-pxa1908-genpd-v2-2-eba413edd526@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-pxa1908-genpd-v2-2-eba413edd526@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_123626_997831_6F9522FD 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, Aug 21, 2025 at 01:17:44PM +0200, Duje Mihanović wrote:
> Add device tree bindings for Marvell PXA1908's power domains.
> 
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
> ---
> v2:
> - Drop schema
> ---
>  include/dt-bindings/power/marvell,pxa1908-power.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

This should be squashed into the previous patch. The Reviewed-by stands 
with that.

> 
> diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
> --- /dev/null
> +++ b/include/dt-bindings/power/marvell,pxa1908-power.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Marvell PXA1908 power domains
> + *
> + * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
> + */
> +
> +#ifndef __DTS_MARVELL_PXA1908_POWER_H
> +#define __DTS_MARVELL_PXA1908_POWER_H
> +
> +#define PXA1908_POWER_DOMAIN_VPU	0
> +#define PXA1908_POWER_DOMAIN_GPU	1
> +#define PXA1908_POWER_DOMAIN_GPU2D	2
> +#define PXA1908_POWER_DOMAIN_DSI	3
> +#define PXA1908_POWER_DOMAIN_ISP	4
> +
> +#endif
> 
> -- 
> 2.50.1
> 

