Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8701CC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWm5LxhKmrywMoCEYdgjN0BNytVEflb/JVj8EEYJYMo=; b=uxSzoNOo5/H5QZOl9skMRlpkr/
	MgJafmWlxwzFwUiFxz9QsWHV1GyH4vGUN7pR/7t7ysF/3IrTQQMWxHLX4DD+X+jqH3a7+U8+BIbrT
	N6KH3Zy8z8PBcGTpoaJb3nOJwlnF4mHgYH1KFvrnsUuuobP9wkt0iD8jk7tYrh+EDmtoMm+3nWjL9
	3ywpZyo1c3ISrGlVeC+19KmPFGzanVLc8s+8ITZmP6ESr34+3pLG34PdZKdmbQX9PZlfVf2YEGsg1
	WQxBei6+zxdutzjMzuBmPEjuDxa7zifLaB3o4DB1bEpkiTnbwbDFtUzkpprHxPc41024g/PFGyXLA
	TF1bS32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfee-00000001ZyB-2Ge5;
	Mon, 07 Jul 2025 06:48:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfcK-00000001ZnM-3ZJo;
	Mon, 07 Jul 2025 06:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0C54A53195;
	Mon,  7 Jul 2025 06:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF30BC4CEE3;
	Mon,  7 Jul 2025 06:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870779;
	bh=3mMLUGq667LvTYPmJqf0R3Fs9bpeNw58j22K0qFkatw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBWDFjlBJ1XYPU3rdiNgM8Sz93wOwSI2GhNllcVQXRUgUiW2QEbGCmiYBwdiHQd1/
	 jsw0Q8J7um77KQxSCaBIjIdC+a/UKSMaBrIXFFxtwCO18+lgfne/uOkWDS0uWs1Beu
	 RuJUTGziQHbZ6eVOUIIYTCPsYMpaWEnKkEYMNvehWs5TgNyaZDZwRjMivKYBu3KjGy
	 AtdT9vojGAL8kani6hqpd9cNH1vXQcETZdw53+WL0IAth22k15uZF2Jqsz4vcfaS+q
	 2VbBEfdHMIyBGZ73Jo6IRqsJAQU4DeGOYmhmtqG9Pf90X4wnBU2iZjuf2h+sVmMVzi
	 zkJFdUvQhiDhw==
Date: Mon, 7 Jul 2025 08:46:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jianjun.wang@mediatek.com, ryder.lee@mediatek.com, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, manivannan.sadhasivam@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT6991/MT8196
Message-ID: <20250707-large-nocturnal-dormouse-c93deb@krzk-bin>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
 <20250703120847.121826-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703120847.121826-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_234620_955607_D932561B 
X-CRM114-Status: UNSURE (   8.02  )
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

On Thu, Jul 03, 2025 at 02:08:46PM +0200, AngeloGioacchino Del Regno wrote:
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: bus
> +            - const: low_power
> +            - const: peri_26m
> +            - const: peri_mem
> +
> +        resets:

minItems: 2 is needed (that's a change since some time, comparing to
what was year or earlier)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


