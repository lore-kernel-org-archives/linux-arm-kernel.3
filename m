Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CB606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OxCXgX23;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyvwIgI7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+gNGIgHBR6OOPjcVSPkPXocOwl0ylfDvKL0KY+9viFI=; b=OxCXgX23NkZY7fG50JNWkjJ4fU
	MEtF2rgZJCuS2k6snrZuYXrUawVCtSMzAtdPKuMxDpjwm20wzaQLrzz4YandHCfVtaVKwCRengQkL
	GjvtfIk0dxw4+onK/Pin9ib6X882az1agvFGIqtBEobuHvIrHwjbaBVeSg8AgrPLRcLPdbTjQFESQ
	gYijiNgZXyKJgxNqk0RYTtgxgBRq0FKxTV/8IFBykgFTeR7ytWC48ejN/dx2RRADwFM7U3Rn1KOgD
	QGzs6p+W5w0asGafZix+Sf61Q/7diph48/ZsNNfFBc3ccKCliweYXVufYmcdM754Pd/QriF3JEXbh
	b8xid48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH0A-0000000Bsp4-0unQ;
	Fri, 06 Nov 2026 10:16:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH09-0000000Bsox-2nAr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0575601BF;
	Fri,  6 Nov 2026 10:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC901F0089F;
	Fri,  6 Nov 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793960212;
	bh=+gNGIgHBR6OOPjcVSPkPXocOwl0ylfDvKL0KY+9viFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyvwIgI7IyG1KTYZDsrSyVNWW3Pr2hT2V1jRVkQCjbrimZfLLebrdFzC10Q3ZPTkd
	 s5BFXalR4rKLepqjo9NmRqDpc0HXw1obDSBcJNu3o6+avfK4O/mbxpt1v499fFcNM5
	 ZgGwdQ4Tf1MO4Zo7lsakD1luQQa2aL/UnwOcuUdrAzMpiKiqiE+0/8HVgcam1JKATT
	 UPzrOrLXkRBDHym/rSrySXDy2fQkGL/WOAdbvnMdQzFtuDx32ssF7a7b+tcdWGqhKx
	 Xwqx/442je/8tbZ8YxqEtdO9VKzHS3rZXETNl46Ro4H8eN8Oci+lgi1QmZQsxUMnkG
	 HmVrqhHRD7FxQ==
Date: Fri, 6 Nov 2026 11:16:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
Message-ID: <20261106-truthful-humorous-centipede-bc21ab@quoll>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
> +      nvmem-layout {
> +        compatible = "fixed-layout";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        /* Data cells */
> +        wakeup_sec: tamp-bkp@0 {
> +            reg = <0x0 0x4>;
> +        };
> +        boot_mode: tamp-bkp@50 {
> +            /*see boot mode selection feature*/
> +            reg = <0x50 0x4>;

Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
obvious issues.

Best regards,
Krzysztof


