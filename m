Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBDDC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2ivuFaJvfVKS8vyw1YZy+bd+hi4yI9bZZyUN6gc+uo=; b=KQrPmV22R7hX3KR+IvWWSKCsVC
	yFDfbXTnzq4JuqXkD+QwY4TM2tnrKRFw9MNSDy3B5DAjgVq6jkTgjhYgeBBpeS2irOSB01u1WkOtC
	Tx9S8fdxW9SwNmUiM4TIE62m2/+DlYUlxLbcdpBg/TiR+ljgJSrNi4VUNOL5LN6ymfoM5RO05LFD5
	fS5G3fhycAkS4vLZLROr5CZUp3XfkDSIzDhhEnfyBZXXmAZRLA4NR40WzuYWwBP7CbGGzvj15ydCI
	ET+IjfdSNg3AkSRpEacH+sLSFvbzWhZo4fWA8MFQ2CVrU0dnR7B1xc25bkohue8PF/D93WjNtf8ix
	bMql6dpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfOg-0000000FTYU-0XiP;
	Wed, 06 Aug 2025 14:45:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfJh-0000000FSyq-13Ny
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9819745B14;
	Wed,  6 Aug 2025 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656DDC4CEEB;
	Wed,  6 Aug 2025 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754491232;
	bh=HUIQMF66FePlPJPI95nNDJ3aspbdARZuuJ251SnikDY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IskJItYmLX5jAxfvXhleCpKfKPoi3Vkbu7FwALAhjf8RypT/4QavaYWH5zCy5Ueem
	 bJIgqpiyLjnsaMf9XCKTtGZdsh5R7kBqHa2CG5SG69O+SW2TEP9SQ1vWlNjW+WviTs
	 BK2kqREG9emx/bW4dNggalAuQ/JtpWwK0eynay43oAN7oomekJjih61UR03g+V4DoO
	 ji0vEIWQp9kAt1NSYGYdX/Y9/oginVWqdLtr56wageF1TO45IXzJf/mzJrlvoBNCtZ
	 vEew0PzJ6iEYXXF0WHORm8aEArs+E7w/5cnokyiYS6HVvbMinfzmru9B8gBkkVAWHk
	 +W4Eq0FkZM76Q==
Date: Wed, 06 Aug 2025 09:40:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
References: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
Message-Id: <175449112431.639622.3115502959226804810.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: st: Add memory-region-names property for
 stm32mp257f-ev1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074033_308173_4666F84F 
X-CRM114-Status: GOOD (  13.15  )
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


On Wed, 06 Aug 2025 10:09:35 +0200, Patrice Chotard wrote:
> Add memory-region-names property for stm32mp257f-ev1.
> This allows to identify and check memory-map area's configuration.
> 
> Cc: stable@vger.kernel.org
> Fixes: cad2492de91c ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 038d61fd642278bab63ee8ef722c50d10ab01e8f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: ommanager@40500000 (st,stm32mp25-omm): memory-region-names:0: 'mm_ospi1' is not one of ['ospi1', 'ospi2']
	from schema $id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#






