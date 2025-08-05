Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB78BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIuZOfW+jWPffO9thDyKQ34p5fYRMH4rexipRCj8AX0=; b=jbCgSb/+zsHzdgiLwZFTLrznGA
	o41HbPvYovwYUYGuiR1ZrHP4Ml32DLWzcSzvzt+IMK9rIHcx1gfa/OE6lmlRWRffAK/4QG0yFVxAC
	tUvb1Tl1QKvW1CqO+0yN/ybGn63Mo311onbKQMylwOtNZte6ezz1l5LYZC3pOuGHv2dXghlN4byg0
	17005rFiHg1p+vIQ5rKmfV1C2sLMar5h1fGnbg9JXSRgE2TnzOBkXRAZe4XXlNfDwuIDjrAHo+vrZ
	Hmty3CdAxA+s89lNWGMHQMzyMfa6Ff33QsKrrFtclho0RD0eJ/BJyGjv3iw3hB8ZwGnN3tj6tlkb5
	0bTBGmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBpO-0000000BznQ-2AjI;
	Tue, 05 Aug 2025 07:11:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBfs-0000000Bycv-0zIo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D3915C579D;
	Tue,  5 Aug 2025 07:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CB2C4CEF4;
	Tue,  5 Aug 2025 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754377287;
	bh=JC1N8+EDHFSvpQmSWYP4IQBCKd4LuqodETgoH4R7NJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ar9ji4xRtlUqcDAwsHuBWUNlxjyu681opyVGK5UyqWJZhuLYNNNBsQ+/ZN2+elZLe
	 aZtUhbs2A8YMj77XDSJ3dV+0Ry61v9NCfdH+dlFAlcbXWkaPEOkBO4Ol5nR0TYqat5
	 MQORFDAutzwQv1tfuRxqGAAoG4j2dScNl8wFKgsuia2wG94uOmVckNYPsS32bfV8Nz
	 lV1zcYh2lV5c5Ns/T6AObeT7LwnDHO2y7qdXGvkNFsho5STMSi83UjUK/3+wFUOPCf
	 bmmLMB17PNGOUVoevocn+MaFmfgNcI2LYkAYRd5tNkyH9KF8GJAuuFKIST6frG0DRM
	 APQ1fABVfbDCw==
Date: Tue, 5 Aug 2025 09:01:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/7] dt-bindings: reset: imx8ulp: add SIM LPAV reset ID
 definitions
Message-ID: <20250805-efficient-amigurumi-kingfisher-ffdb56@kuoka>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804155407.285353-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_000128_318700_8F97ECA1 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 04, 2025 at 11:54:01AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add ID definitions for i.MX8ULP's SIM LPAV reset lines.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../dt-bindings/reset/imx8ulp-reset-sim-lpav.h   | 16 ++++++++++++++++

This belongs to the bindings patch.

Also, use proper filename - compatible.

Best regards,
Krzysztof


