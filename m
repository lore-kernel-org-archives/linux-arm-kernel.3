Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1704DFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvdUOKUna6iztOMMmLoi48ESW5uoT2sS7k6a136EZRk=; b=Q4PNSo8sARddmXwgMQmlyM7Jru
	4Ee98m7ow8j8+TeGjLvSI6unGOgmfeldE2rV89B+1KEs65b0sNJyceKe+CLAwyPrY5cPcGgOtyjFy
	t3ia+UPyaHgIcBVUnn6grEMw7IXcX+ELy7B1viBdKrvviCzN3nDZmjDAjYdDO7spkg30L2l3rIT1T
	AcNql16qt+o0IEZ9Hv7/RXFDCo3u8R8a5MgAT6k51TwB8hejT9kNStUtXvTDvbE9mgFmT50gwAkTO
	S2ZDhBb8PoAhh8bLrsjPIF8QkL0Lh6Y+kXFS7FPGg0mBUBLDbgv5QnQDzDiTKx5UCF2gRg4JjxaMA
	CqGMMY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZeZ-0000000EJYI-12lc;
	Sat, 25 Apr 2026 09:50:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZeW-0000000EJXI-270c;
	Sat, 25 Apr 2026 09:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ACAF42B95;
	Sat, 25 Apr 2026 09:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4F1C2BCB2;
	Sat, 25 Apr 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110619;
	bh=4f6t3Sb+5WpOwg7rfE2gwJx2q9oS7oSz10XpoMjqoIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGo9EEqimnVTSOHr9uENOHFVomTqo6i9d+urODiMlEPqWC/aRn+WI2++B6vs5DWzZ
	 RtmUH8GNf5EpZcCNqp6ADd1X5j6tQPFpoW/xGTsxL4aqhu96yQ6xRsm/7W7qaiIhMw
	 ZIq/5/Y5c0d0d5gLa2Xrg5shDr9NUVVl+U9vbBd3PUYVNWC92/bHhut/ze+UM/U9eZ
	 9Vc+RfuFF7aeIVH0mEndBj052fVtyVQnM6ymTpgYgQpLuJ4K6W79YayEBjKoum8utE
	 pi4AhTYkOO8+0NeV1tEBEa/M66VMmfvti/Dn3zwkF6/JN5zTWN2rwUO9B54tdi9fB3
	 GLzrJBVTTDmkQ==
Date: Sat, 25 Apr 2026 11:50:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 6/7] media: dt-bindings: add NXP i.MX95 compatible
 string
Message-ID: <20260425-ninja-labrador-of-authority-0bc1bb@quoll>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
 <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_025020_563651_88897D0F 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, Apr 23, 2026 at 04:23:01PM +0800, Guoniu Zhou wrote:
> The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
> main difference being the data output interface:
> 
> i.MX93 use IPI (Image Pixel Interface), which requires:
> - Pixel clock input
> - Software configuration through registers
> 
> i.MX95 uses IDI (Image Data Interface), which:
> - Does not require pixel clock
> - Is software transparent (no register configuration needed)
> 
> Due to these differences in register layout and initialization needs,
> the two variants cannot share the same compatible string. The driver
> needs to distinguish between them to handle the interface correctly.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add dedicated constraint block for i.MX95 to reflect different clock
>   requirements (only per clock needed vs i.MX93 which needs both per
>   and pixel clocks)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


