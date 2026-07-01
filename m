Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D723C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9rGDcSq067221QCN99w9QSFJcWyHWa6jMw8d0od3e4=; b=R7PyV2sy69mbyei23JCXriaNHY
	zJrajb4u26VsylFODiOGwFiAfKtFkWsbSbk7C370j2yCQuDFuMNMs1yG1oiPGPCBVaHTfs9AY1Tjz
	nNEfnHNEEYeH2aBSprIRsOUgcAqW+uccGpaSg+PyZ15kSCT68memTcHuRrQzUudQhqFJfoLkk31Pv
	AR5AYQjZ3yy+Ub4qORZXje8OtTDfOxU7q9/D+62Bz4CZbXQEpIWZq12Yr/0FXjE9f9Yy82DGbiZGE
	0jt7yW9ulH1LgeKBZ8ON9/dNtEfPqGkOSj+d4Ba1rOqCGC75sftvqbeMZivB5Et6JgIOTzDcf5J3h
	iK9tD9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep2K-00000000ryg-1uNN;
	Wed, 01 Jul 2026 07:07:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wep2J-00000000ryX-2BeW;
	Wed, 01 Jul 2026 07:07:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EBC743467;
	Wed,  1 Jul 2026 07:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346CA1F000E9;
	Wed,  1 Jul 2026 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889627;
	bh=R9rGDcSq067221QCN99w9QSFJcWyHWa6jMw8d0od3e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuOkEZJ5C9xO1JPYnvSJY7ZTyznvCrjAV1j4SsHttiRWbPIySz7mOONco5crA1kGH
	 3hrdci7+IHLT3QfzsDqa8BRpYNKbTpwyTyWhxAzFlNV3nCV66HvU4+mJT8hU7DSDIG
	 +OMD85eqhDrrW9et2Vo3TXeEuBQU02paEpv+HUqh1EafYirsPLmFATfQ4+HcTVDwof
	 nj0wvt6peB1GklPWUwVJxLQj+a9VUr8p5gLYYokAVCt3Gv9JdLffpDVJGc/6erSovB
	 rxR6nbn+O5QHHhGgk4ke8nrjblUDD4EvTgqSRYrQILbbFXWU71yjLQ1gRHnMMkuzpI
	 B31G0aQH0xmmg==
Date: Wed, 1 Jul 2026 09:07:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
 <20260630153810.3574714-6-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630153810.3574714-6-coiaprant@gmail.com>
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

On Tue, Jun 30, 2026 at 11:38:11PM +0800, Coia Prant wrote:
> Document Graperain G3568 v2
>  which is a development board based on RK3568 SoC.

Broken wrapping.

Best regards,
Krzysztof


