Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88650C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TF3cgO1992Iy24QdBwtHSw1Hxgp1nyyojSeUB69tKVQ=; b=wqTLijf/+3OrlcuVh9JZI1Ou60
	zCBRYNW0mvGyedb1Nn4LH7Y04AJ2NrDUTF3RhrrcQ4yrFz3F3bar+e6Mzu4cC/PX9gPHyPK49g6ki
	xVal9RAS9d6XRkFoLXKqat5b6QmDSYuYpGEIE+fa2GEAxJC01tkHKPHANdzy1k+vfQp4CH5UnH+1s
	hVdJEFu3b9j4qjsl6fRNBOvmIl5/pSdRaYNuUy0fJXuRm//P0l9AzE96o3yX2S6Tbp06869GcwzKg
	cZ5/szf99HOGW2IXW1Ss5yKeJF2aJS+QwOSCmngHlpg1F1nWwBg3rF1xDfIba0ZsrPXhUsfkMwuE0
	n/oKUWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1PFU-0000000FJjz-1G5l;
	Sun, 06 Apr 2025 12:37:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1PDj-0000000FJZy-0dKu;
	Sun, 06 Apr 2025 12:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E1645C5782;
	Sun,  6 Apr 2025 12:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C096C4CEE3;
	Sun,  6 Apr 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743942926;
	bh=jwd+CvfEDtZfTHG883yK1HMa8fhxAm1AgPY9/b8O4E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDAv+VQjV32fa0VTCth67L1pHqocRPfalVuaguxSlhz7dMCa6jJEGf2w1HoPZ8crz
	 3pYO/ZY1rw9g3iiC/1EQPrtaflzmEc/19hjeBCujk39sHiDPrKtELopBzyW9l+3586
	 +vz4w38aaalkrFwZGZWvxR9nJjNgssTYHOWv2P5r8njUAzAK9sD3z5x8T3DMv9QAXe
	 c/2NkYFLi28JbbFonA2rH5z4PMp0mOe4zhP304q8FEqoljhJ7cOoc0hOrQ7utJw08L
	 8Wf2R+XAaZe+oLR/vjF2wWO6M7GkT/diwM3zZI141hhTmhVHYGWKJ6BZJnaTY/H01a
	 1ZDgmopnsbKZg==
Date: Sun, 6 Apr 2025 14:35:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek
 DRAM controller interface
Message-ID: <20250406-hasty-saffron-flamingo-5c1dae@shite>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403065030.22761-2-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_053527_629132_4D4C2B68 
X-CRM114-Status: UNSURE (   8.23  )
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

On Thu, Apr 03, 2025 at 02:48:47PM GMT, Crystal Guo wrote:
> +maintainers:
> +  - Crystal Guo <crystal.guo@mediatek.com>
> +
> +description:
> +  A MediaTek DRAM controller interface to provide the current data rate of DRAM.

DRAM controller does not offer scaling? Or PHY/timing configuration?
This binding looks pretty incomplete.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-dramc
> +
> +  reg:
> +    items:
> +      - description: anaphy registers
> +      - description: ddrphy registers
> +
> +additionalProperties: false

If there is going to be any resend then this goes after required: block.

> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof


