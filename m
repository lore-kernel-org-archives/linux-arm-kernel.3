Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07547CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzhbVxm6PfzXUJZqfMwjQILtkohuzDxMcNEH8PqMZIQ=; b=XdhwBgoJdj5pZAVxBPWKz7BjVH
	P5DbYHql8FIJGZxbopf9VawugVuaep40ezIw1n4iIP6lpqN6jvBO2aRJ2cxJCgIx0n1RPePl8Mr5v
	L91EGJXgmxk3GLsEDV6gLHB23jDROqR1gZau5QmjFNCFFkFmLEMMfT1Nn5Im6timwS2cqo1+gZ6uA
	Hjc/A3zHuNqi42/SMAyLeFiyMJaZq30bnkyOUVb2uiQoBNUkIR3V8Ww0ad6o37MNi2eoqpzqzWQz9
	+FRWzQq6q05pQBywFhnsxtHyRUEsVgKdlJa5ScxFQ3kKYCmc9qBu4R7LKeLL00Tjbws4aoL3yvlEe
	aw0UYGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYOA-00000004Uo3-07ej;
	Mon, 22 Jun 2026 06:44:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYO9-00000004Unw-0QUA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:44:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7214403E6;
	Mon, 22 Jun 2026 06:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDFB1F000E9;
	Mon, 22 Jun 2026 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110648;
	bh=IzhbVxm6PfzXUJZqfMwjQILtkohuzDxMcNEH8PqMZIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEDWfZTu5VtMmv3V0jtFcGO1mgxPgVWo68B7BXJP6youKaLSbZJ022dddJFUzdPeB
	 3KWhpEa198kspPWcUz+KdP9UNJImpBkYfYNXlQlx9J67Ei+9C3/2KbhgPPNMwvKBD2
	 0fi6KDT8EpPyHlxY2LptzJoSYVcns9Hx8Nkcl3roDIBazMfKwsv7E1jLN+ntYUqqO7
	 MYu79Ahuto7atKjPaoDZpMARs3DWHVWLp3XXNxURl7sqKxxUd7Qe9jMv/pn65HDcV0
	 1I5HMoqIWGB7bpWQVUTlkg6T0BfBayEUbbRZrMiqKnMPWI3zWanApHCudOd3ljl1cj
	 oDFClYEoYQYqw==
Date: Mon, 22 Jun 2026 08:44:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 2/4] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260622-bold-spectral-muskrat-a8dcfc@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-2-f23830312ba5@oss.nxp.com>
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

On Thu, Jun 18, 2026 at 05:41:36PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v10:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


