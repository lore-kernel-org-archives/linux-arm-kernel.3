Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh1rISjteZFaE6ymo8YKzLbpah3itnfDmgq9mWUiCFw=; b=dXHMYOlYi86DP5BdgooRvNWEce
	Bw31FsTKkjzh7Fiyqni6+Q53hmSYytjHkmCPASbiRwthHF8xtYJGHZBkF2bF5mrg/ZokLIgjkarDs
	tmCd4PcNrRjq3h0sq+vUA0dXSw6Ng6evKbphT1FLSg04LczzUMv51o2rLRFt449s5CjlEl3rS2PeK
	MYQjKK1Z2vZjJyOMt0f7uaMVVsEvZIuVrsqYLY1l5PN6I5Sg1OqttOqqap+qxP6QFuUT02UIj5GN7
	/0iMoIkpg/C/NP2csV8htuQpM/3Fn2K7qGJ+Xx9KAOjqVvtJ7Ygiqj94jKB2Yc09tEgjKKf01bjrT
	N4HUJ4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn3f-0000000DnxF-2Iux;
	Fri, 03 Jan 2025 19:10:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn2T-0000000Dnoe-2wjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 19:08:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C31E0A40FA1;
	Fri,  3 Jan 2025 19:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2A3C4CED2;
	Fri,  3 Jan 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931332;
	bh=v5wF+YQohzZ0mdJx4XQP5J0oRgHYezO5srl/b5e8OME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYpYrA82uwU6Y8B/cQeF7Y5cZEwRwY0Rbw4uhWQQvihYQ1pAlLDe9f9ZNfqCm2uxe
	 6iiM1kn5EORrc4E/Ef6cvSWgw4WncDBNiPPEGe36jEFWnK8dKS7GDDKTmYGt7BfO4h
	 myx8EEElrri/EC+u3Tm41q0rbDxKoosy2G/0BNQGow0tkvDKH57p3KR+nyEVden4WK
	 fy8YCz0IWVgS2/RqWz2EXBwpHlPVFjbEKIkblX37Mh26yo+yRzjo49PLRtDOKW2Wvo
	 bUI76+a4aJxIycdU4II6L+0mUMuLYDO6BTB1ns/MmORKfWIp2vFJPLVD0hywaf1pNk
	 mojrMIy/RiWSA==
Date: Fri, 3 Jan 2025 13:08:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
Message-ID: <173593132982.2620574.29762646865027511.robh@kernel.org>
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110853_798545_D3F328B2 
X-CRM114-Status: UNSURE (   8.88  )
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


On Fri, 03 Jan 2025 09:25:49 +0100, Krzysztof Kozlowski wrote:
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
> 
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


