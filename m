Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF93E7E0BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmkpHOSf+vtw8uWQ/8vbkjqK8buiMyqGtS9qqZCMvhQ=; b=CZeCYGYiBwL8IIEnlSolWYqA8m
	OtQOpUGzw36eMwHeqk+X13St1nqQiEgupBFvEW2ismL26XkgD7kpsSl82ro+9Jkcj0IYN+lFhg44c
	LH+ZOU/Kw3r8xNXkWRAde92hPIiQKoU4pLusulG6XJb+WB890z6pBDqCnbJt+ziA/qOQPhANEvf0e
	GY9iF1dyaxzGVA5ddHpGuEaIFwg8cMeegW3bgULpkceZz4EFbRk1P/wfUWCINJszY/C3KJz9Woskx
	O0FYzg4DkrIbKHpqz98wiro8VRj2775IesbH9ea/ICAlcl0Q00J0JgTkExhmbCjg1cNH2SKoQHLpV
	Zja6Znow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOFP-0000000FDv9-3sk7;
	Mon, 09 Feb 2026 10:12:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOFM-0000000FDul-3fFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:12:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vpOF8-00043y-LF; Mon, 09 Feb 2026 11:11:46 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vpOF8-004s58-30;
	Mon, 09 Feb 2026 11:11:46 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vpOF8-00000000928-0izY;
	Mon, 09 Feb 2026 11:11:46 +0100
Message-ID: <f5de5c3dde62d8cb6f1b373c8dbc89ab31edc111.camel@pengutronix.de>
Subject: Re: [PATCH v8 1/3] dt-bindings: soc: cix: document the simple-mfd
 syscon on Sky1 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.chen@cixtech.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, alchark@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
Date: Mon, 09 Feb 2026 11:11:46 +0100
In-Reply-To: <20260209093344.2013693-2-gary.yang@cixtech.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
	 <20260209093344.2013693-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_021200_952727_03FDA97C 
X-CRM114-Status: GOOD (  15.71  )
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

On Mo, 2026-02-09 at 17:33 +0800, Gary Yang wrote:
> There are two system control on Cix sky1 Soc. One is located in S0 domain=
,
> and the other is located in S0 and S5 domain. The system control contains
> resets, usb typeC and more.

What is "and more"? Does none of the remaining functionality besides
resets require any bindings?

> At this point, only the reset controller child
> is described as usb typeC uses it by phandle.

What do you mean by "child"? There is no child node for the reset
controller (which is correct).

> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  3 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-sy=
stem-control.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
>=20
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-co=
ntrol.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-cont=
rol.yaml
> new file mode 100644
> index 000000000000..5507deb54ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.y=
aml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-control.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 SoC system control register region
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  An wide assortment of registers of the system controller on Sky1 SoC,
> +  including resets, usb, wakeup sources and so on.

Will any of this (usb, wakeup, "so on") require further additions to
the binding documentation?

regards
Philipp

