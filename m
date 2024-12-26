Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A61EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amv9DzalnxwHOgeORxwQnJAnW4+z6Fobr3p7qJnJIXY=; b=I6IIKXSNNjLQppMdhoS2Ia4ZZI
	Zjpnb/YtRqujojKcTUrRZDNRbQ6Sxs5y0ZRGWcxF+Fgt6c8awjFSEJOX/PGWkhqTNgSuUBt96XOH5
	I239RkEBvt+KR1c/kuBnNrcxDKjFJOoQSI7fNiTCZhaBHPDigy3uJxylOJUV4SRhNatH3/883xWuv
	NqShF/bOnECOS3K6y3FQP0CL2ysAmYvCIYoWC8eqQk9kb3+3AGWRtFUBDdvP9tlvXSzj46gcdnboc
	Df8mYApI8ugQRslyC+5oSX0QbMmXejgXho5NmWKSMEKdnNUAAwEsQW5XqAl8JfqfIutRE/qcxa0Ab
	6X3+dAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQqXv-0000000G1ol-1dMY;
	Thu, 26 Dec 2024 16:17:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQqWi-0000000G1hO-1mI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 16:15:57 +0000
Received: from pendragon.ideasonboard.com (85-76-136-220-nat.elisa-mobile.fi [85.76.136.220])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 889ECC62;
	Thu, 26 Dec 2024 17:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735229707;
	bh=06nc+tg/4UKFLfBYN5nBlZntSO6n2nOqTRR922L+9gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNuTWzpO+NV6jThFUEyFTevR8A7JtDlja0Gx5dRVeTlETjo07XJu3yGTZWW5HKq9w
	 6NJ2VHN6AIoGBBH+QqPxDlKa+JrwSHVmYaKIxfQckW9EURh5bJo018KShjyNXnMK0j
	 wnbE/uvP83eDqTeARSttnsfurIwNQ/WsLc4awxMw=
Date: Thu, 26 Dec 2024 18:15:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yuji2.ishikawa@toshiba.co.jp, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Message-ID: <20241226161547.GB554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
 <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_081556_617391_87F293CF 
X-CRM114-Status: GOOD (  22.68  )
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

On Tue, Dec 17, 2024 at 06:44:58AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 00:57, yuji2.ishikawa@toshiba.co.jp wrote:
> >> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>> Adds the Device Tree binding documentation that allows to describe the
> >>> MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
> >>>
> >>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>
> >> How newly added patch can have already Rb tag? Was this review really, really
> >> performed internally or you just satisfy some internal managers requirements
> >> and fake the stats?
> >>
> > 
> > I added this Reviewed-by tag because the patch was reviewed internally.
> 
> What issues were identified by internal review, especially in the
> context of bindings?
> 
> >>> ---
> >>>
> >>> Changelog v12:
> >>> - Newly add bindings for CSI2RX driver
> >>>
> >>>  .../media/toshiba,visconti5-csi2rx.yaml       | 104
> >> ++++++++++++++++++
> >>>  1 file changed, 104 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
> >>> l
> >>> b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
> >>> l
> >>> new file mode 100644
> >>> index 000000000000..5488072bc82a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx
> >>> +++ .yaml
> >>> @@ -0,0 +1,104 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >>> +---
> >>> +$id:
> >>> +http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> >>> +
> >>> +maintainers:
> >>> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>> +
> >>> +description: |-
> >>
> >> Drop |-
> >>
> > 
> > I'll drop "|-"
> > 
> >>> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI
> >>> + CSI-2 video  stream. Use with VIIF device. T.B.D
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: toshiba,visconti5-csi2rx
> >>
> >> Why this is called "RX"? Can you have a TX? I had impression that one cannot.
> >>
> > 
> > VIIF has only MIPI CSI2 receiver (CSI2RX). There's no TX for it.
> 
> So this device cannot be anything else? Then drop rx.

It's a compatible string, it identifies the IP core. As the SoC also has
a CSI-2 transmitter (as mentioned by Ishikawa-san), it makes sense to
name the CSI-2 receiver csi2rx.

> > Visconti also has VOIF (Video Output Interface) hardware which has
> > MIPI CSI2 (not DSI) transmitter (CSI2TX).
> 
> Or this can be something else? Confusing.

In a camera capture pipeline the CSI-2 interface of the SoC is a CSI-2
receiver, but SoCs commonly have CSI-2 transmitters as well (even if
that's less common than receivers).

-- 
Regards,

Laurent Pinchart

