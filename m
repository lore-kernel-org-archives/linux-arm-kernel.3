Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEF7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8Q6dD3iVzqaQtg7mhr6QjvHQeGgChnGEZtT+XdNDFo=; b=az37P+zpE0RVxSB+4tm7H98QLx
	yssz45e7iORMPIGqwe0kncs2J+PvjmdrRJiCHwunpaVjcOovLT+IZKl+KVQ8uqkKH7kuxG2kWirTD
	ukqJvMCHv1YMW9RFJFyUBM2+cbwXY/46qt0q7gsObrxpzy4JUiV7KZ/SN99k+pDfS/ZTW3a9sPZtr
	9ctp64LMsSJ1TT/w2TjrMbeHkm5Cf0esmAeLo+j3/0aTSxLlMG0L0gWCw8QDST6JO0ohSsJdGP7/d
	EBJ7aV9Zb7ZhRKT2xHoX5KWolR0npc4cpj0b76PjOG+pmtevV4f/NJoJWTiou+mPEi5LBcSMeyw6F
	rOPcNUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMTL-0000000HOmM-43Lc;
	Fri, 07 Nov 2025 13:25:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMTG-0000000HOkn-3SW8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:25:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSu-0003tF-Mg; Fri, 07 Nov 2025 14:25:20 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSu-007XJl-1d;
	Fri, 07 Nov 2025 14:25:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMSp-000000007QK-1nKx;
	Fri, 07 Nov 2025 14:25:15 +0100
Message-ID: <2841ae5f1f4ccafcbed6c70866d0237b9abdc338.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] dt-bindings: reset: add sky1 reset controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
Date: Fri, 07 Nov 2025 14:25:15 +0100
In-Reply-To: <20251107033819.587712-2-gary.yang@cixtech.com>
References: <20251107033819.587712-1-gary.yang@cixtech.com>
	 <20251107033819.587712-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052542_865364_389E7606 
X-CRM114-Status: GOOD (  16.52  )
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

On Fr, 2025-11-07 at 11:38 +0800, Gary Yang wrote:
> There are two reset controllers on Cix sky1 Soc.
> One is located in S0 domain, and the other is located
> in S5 domain.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/reset/cix,sky1-rst.yaml          |  48 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  45 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 167 ++++++++++++++++++
>  3 files changed, 260 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/cix,sky1-rst.=
yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
>=20
> diff --git a/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml b/=
Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> new file mode 100644
> index 000000000000..72de480b064c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cix,sky1-rst.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cix,sky1-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CIX Sky1 Reset Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description: |
> +  CIX Sky1 reset controller can be used to reset various set of peripher=
als.
> +  There are two reset controllers, one is located in S0 domain, the othe=
r
> +  is located in S5 domain.
> +
> +  See also:
> +  - dt-bindings/reset/cix,sky1-rst.h
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-rst
> +          - cix,sky1-rst-fch
> +      - const: syscon

Why is this syscon? Is there anything besides reset controls in the
register space?

regards
Philipp

