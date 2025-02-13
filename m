Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C88C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enes8CkfTRDji0/q1ktEVGYNbPo8tuBnswsqNQYVabM=; b=IzhSPpMvvfTVjLF3B/xfP64se7
	wpUH7ZQ7P1S2KanWFtg/nEIHfVykOMxH8PXGsVqUm//7M++FZFh7vmFoxYP7cQNnwrsZiiGNJa6+Z
	BLL2aYZ+z5wAL6s3KLG3YWXDrPgRyN3O1yu56n0RF/fh7RE25+is/NvpO6zWt4tkbHF8vlLJsPz8g
	auQNN4ghdRBxFcHFWu/cEGhfidPZ1mi6c4+h9x/0LznN1wVgXz4IoWCTjJzezEXnRjiCIeRTjUrsN
	pTS3Do2isNcLWj4G/FTziZPWNi85TJ1AN0uHWCGPfhiCbjkfQtmH7ABVbm+r3AwsQmajCPhx9wbaD
	DGQnZNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV7E-0000000AN6G-24TN;
	Thu, 13 Feb 2025 09:02:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV4B-0000000AMUN-3VCz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C29E4A41F62;
	Thu, 13 Feb 2025 08:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEC9C4CED1;
	Thu, 13 Feb 2025 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437166;
	bh=r0p8oF2o5KcUkeDQOtykeK1nddAxj6LGqMj0TRgl5jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViI3lAUREFpp/f9x3sPMkFSynOe0mj3ozQIXsJTK46uIC918sz+sLUgC/vW3fWzfp
	 pwpy6dQFqjqv4ZKwQUucSN6JatWQYeqW6gZ+dxgT6ig0QpsC880dulVf1ubHP09+XF
	 39mF8kkY+f/46pgPWBz1rorbdc8eKFsc58elem+vg9hvK3SlqGhRFxzMqhymxabWaR
	 go5S7LXMaHe8fZdcTknA7fQFMJgryg/y3wnGdwoPHVbZqa+DWmJ4keEvYVrBzmodrY
	 qu9lNlGXInZITWUutbzn/AHu3TfXtBEtXbKVmY1CZ3tU4EKOTs7ZP3OHJ1dBmQ5PQb
	 59BYo9MfinClQ==
Date: Thu, 13 Feb 2025 09:59:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 09/10] dt-bindings: stm32: document stm32mp215f-dk board
Message-ID: <20250213-wooden-ibis-of-assurance-2b3622@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-9-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-9-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_005927_936151_C0BE870E 
X-CRM114-Status: UNSURE (   8.10  )
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

On Mon, Feb 10, 2025 at 04:21:03PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp215-dk board.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


