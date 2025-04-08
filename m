Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D44C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFBV6Yc7yAoNdiMBu71/EuLePU7j1NLfoVrLHBXuwk0=; b=EPFiQBe/KpA5cRXBH7cS19Ab6f
	E6Nhxkko6aD7F0IohYJ3TijWifUaBljVyoDFO+EW9DlPI8/YlVvy6irYxNI2A/KZnJUruqv0jSt5R
	SRzaYNPaypmgiYYdmuU/qcY2mH36q+5eEP9vzVJzgJTVQq3I37rm6Uhm4H/qbVCfeBZQLz5KkRute
	IN+OKiZSP/oiaYrU1QtQwfb4dJf8sGMUtSV8TtqGshZZJAAxyvEP63f3SiYcHACjyvV1maQ1OepOh
	D1293OUVuGlqmgVzHGTqJNjcYaomE7DE46FavxXPc0a4vGjZj1DRvaV9aTOKvaJUlS7wylIF2Paru
	GDA/WO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22je-00000002x02-1dcp;
	Tue, 08 Apr 2025 06:47:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22hs-00000002wbW-33O9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 06:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4AEE42B6C;
	Tue,  8 Apr 2025 06:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA3AC4CEE5;
	Tue,  8 Apr 2025 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744094712;
	bh=mOv+HvzRrxAHJGRbI+qsfBmoBE1QErM9V08wm89ZPdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knKVOs6tQaE1iv88Hyq4JBbX/wpDy/tGlgs+QemkXkB+9bADFBEpf8YN+O+rQqOp0
	 x/E114SgTJiJ+Qlve/r7TS7jBBRBayeexEQ6H/i0SNUVssM2gjbKDVJPC8G5CodVUe
	 T3yrGPfVvJt+kQ+bjwpPH5RqHZW86KfiSAHjtGBl2VFA1HFNIfeFSS5+/21zULDYh5
	 WMn9w58KUj5fb0tEm1fq4x3ETD6UJL0yxkD2EbnbeLqiiPGL0i7sn6kukOR0paBtIQ
	 /M5bpqJnPyJX/bZkSMTz+OQxuKfdYaeXD2UiZkMdn0SKNc295OPZ0zItxyX/+2ZjRy
	 7uqyprPyh3o8Q==
Date: Tue, 8 Apr 2025 08:45:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <20250408-magic-arrogant-hound-0f2de5@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_234512_791542_19B8A387 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, Apr 07, 2025 at 03:27:33PM GMT, Patrice Chotard wrote:
> +  st,syscfg-amcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
> +      memory map area shared between the 2 OSPI instance. The Octo Memory
> +      Manager sets the AMCR depending of the memory-region configuration.
> +      The memory split bitmask description is:
> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
> +    items:
> +      items:

That's not what Rob asked. Are we goign to repeat the story of Benjamin
and VD55G1? You got the exact code to use, which only need corrections
in indentation probably. Why not using it?

You miss here '-'.

Best regards,
Krzysztof


