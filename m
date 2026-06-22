Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAE1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvAJ4vqqGIcu3OfuNyRNoQmCqh+htmYpa/S7+Nmfug=; b=hyZIjr/Xw2wNt0KMhxa22IijOw
	dpgmuM5liy6q4zdqX43ho8DQOuDpj3JxMMdAHXDqfKP/0HUnBp8I8oGp4IOrZyLF18Qu+vHB/XGTx
	OnD1Cu3S23EHUBQP+8Ax8oCkXAdRoUI+xpbn4Towrs1dB8c3dMLENAodrFgsOVrDK+LC2aGL0Gm5f
	zuxifYQSfkKGgIHdTt7QIuvSaWoeHDpe5oo+SnQwFR+sPemL8zE7l0/FXgIVl0wSF5Q5FV/yXqFpk
	V/6ATjFxob2AWvBW+7FJDaK/sV6MDWLZeAKCMa4cOSbEyxuB9K1H5/kKbtGY8kylrrthHhXe8/GOZ
	TLIjKV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbefT-000000051HY-1kPh;
	Mon, 22 Jun 2026 13:26:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbefS-000000051H2-1mzB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED94E43739;
	Mon, 22 Jun 2026 13:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B4B1F000E9;
	Mon, 22 Jun 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134785;
	bh=mNvAJ4vqqGIcu3OfuNyRNoQmCqh+htmYpa/S7+Nmfug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2xnT+2OhYyQ3LJDjcK3ORSu0zpDg6bP/Bs+PRVaBjlTtYIdHGG+zumA2PTzqhLmP
	 ncTKu3QFBvQwwD0pVNbSEzDAiW2Of0ooNvOSB1/t3ptY7qNkyl4sDX15sx/bDWnzk9
	 exUx68UYqBkIls0Mk3jnJdzzJyeNmqENch7zx0MrjYElFVoRTvDOhUnKZPTP/Tt1wk
	 CkCwj4nuCUKdCTz4VWGyjbsrwM3fHVns041A4WGrFbm86McYQSn3F14f21pUjBRWc2
	 wLDoBnbUcx5XRuvGF8zliECIBtgPOP11EILTAiSl/8EmYLkvU533lFiVSlm/7cdZ74
	 FYVal2fpjWD4g==
Date: Mon, 22 Jun 2026 15:26:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spi: st,stm32-qspi: Add power-domains
 property
Message-ID: <20260622-gabby-fiery-skink-dab9f7@quoll>
References: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
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

On Thu, Jun 18, 2026 at 08:46:35AM +0200, Patrice Chotard wrote:
> STM32 QSPI may be in a power domain. Allow a single 'power-domains'
> entry for STM32 QSPI.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


