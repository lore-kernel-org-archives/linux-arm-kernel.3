Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A387CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/MzOo14X6J4VQjnqxLjM1URRr3Btk1wvMsDEU3KMFc=; b=w+pHQJ/aJkGTRQtaA2+pJDWxYI
	Ryh6iOGOPTDBo9zeNInGRcgkooeYOD9uM1ogVtl5FB4ziCK54SNMAxoTt5ZEKD8fkc35EJ375rElX
	WWGGRBZf0mhDu1ht5sQ9YT4PCddc+zRc8PnDd6o2dOAsXlxKETbgQpVBfnlzC+4EMjTu3oLswfBan
	VLAqJZM7jkyaGUU3+rjVOFYM+Dg7/aPHwcCIz9SlXDMBLBt0VRy9Kbhgb3LF8jv+W29aEMa1DG+Pn
	/uva+kAdMxPuU0eCok0Ht/PM4WOVEaxVEq17AdTMFRR5KLiIjwo/iqDkEb7JPyseiPqspjtCsNdci
	D3T7bxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91d2-00000001in7-0T2W;
	Wed, 15 Oct 2025 13:33:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91d0-00000001imj-0sCT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A371F44503;
	Wed, 15 Oct 2025 13:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559D5C4CEF8;
	Wed, 15 Oct 2025 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760535197;
	bh=3fz9KGNaQakjQB6EQzIxoVQtqjKXznasDpV8NOPgPuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rz/cv0jGa6pcHdPzjjI1OM8wpBajf6uLdiwhQUjIwwa/08P9M/cr0zt05mHYbGzUK
	 pap+MlEKcpQWolJ4vJYl77nEIi6aTDGVnrh2/dHbbz3AB2m0+CbqmYAeY+/43BXpAZ
	 nU1X0VzsbhDXvWvb/CKzy8DN1iM2qdMPqTvgWUXtZpeACYkz/ARmZBjUtMmi47peiv
	 HIbrkj584SyBB/tJYeQz/7Z2SJNMV281XhoF3xnBSGApzpfCfHsZEX+wQ2luvZxRhO
	 0qSJOTwfU95lhsoyRTxgYH8XXrdMTpt8r/jKCwtEGVd66+lDNjniYl0p3IppvQ0rca
	 pdMbGAjZ42upQ==
Date: Wed, 15 Oct 2025 08:33:15 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
Message-ID: <20251015133315.GA3263713-robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-39-marek.vasut@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_063318_283613_19502855 
X-CRM114-Status: GOOD (  14.17  )
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

On Sat, Oct 11, 2025 at 06:51:53PM +0200, Marek Vasut wrote:
> i.MX95 DISPLAY STREAM_CSR includes registers to control DSI PHY settings.
> Add dt-schema for it.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../imx/nxp,imx95-display-stream-csr.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> new file mode 100644
> index 0000000000000..61153120c9378
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx95-display-stream-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX95 Display Stream Block Control
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,imx95-display-stream-csr
> +          - nxp,imx95-master-stream-csr
> +          - nxp,imx95-mipi-tx-phy-csr

'-csr' seems redundant.

> +      - const: syscon

