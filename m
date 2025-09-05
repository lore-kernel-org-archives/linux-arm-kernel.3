Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77F1CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeWZNFniFCDTiSIrH+F/npVqPSMRh9jWU2x7QUDDsAM=; b=x+HL7wMXMX8xm0PO4QCq8oTSfg
	FLOV6uBClRKcH8pdgj+rghl87ScoMjKjVyprZKXhbvv4KAXdmiN+tyge5pOJ+J/UCHJnpJufFzSBy
	8TiGz+9ig3bzem/kqBIVMPiHfMJaXKwWlBcMRe92EVYHVlN0uQ0k7yR1tgH3MzAva0kO5xu5TMR+T
	Ree4VsEUEuIOpTW2DWjAaHo0UC5zdidoa6hNAj4u6gcXkId1HxfNOfLlv164Nz+dPtw/LiGUpSSdG
	xTcbhy4qsDjv53k57aoifUR5w8gZtTLAFzCpi7AoQ8Wda1AoxfKMqMOAubHLmEIeg7Zo6UFwMIn8y
	+mtodouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSXF-00000000fCj-3g4P;
	Fri, 05 Sep 2025 09:15:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRGG-000000009zT-3sjh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 991B64185E;
	Fri,  5 Sep 2025 07:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD639C4CEF1;
	Fri,  5 Sep 2025 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757058812;
	bh=tTfuVxL0tJfbFNZIAPWlOg3hJrctEWrR38o7eJHMoW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHq/Q+ABhcD5UQfn7jq1ts55lGplUJdn2IoIYKmokP3etjrHQqMg/gHOgZvvkRm5G
	 /GywyuGH8gptUPW18QCJXZuBA0WWJBmkpADlBKdfFyPbnoZka/476VoOTxknW4s0+H
	 rO06xx1GdKGMkQsjspj3nXY0yfSZZVbHAeIaExJ4Xkt9tuTH72JF06kV5qxpW5qfOX
	 37tGPYiTVeT+zkd/1ZW9KZEbqrYufpaEaobaasUcZfcZfZtgYw6J7JB4+im3wduGiB
	 m26G6Iz/xQubB6cHV/wqd9yGFuKsN+Yr8PbXOHEhQe1EU2QSBXNvDGcG4RVq5uVNX7
	 fBPtROte2MkQw==
Date: Fri, 5 Sep 2025 09:53:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, yong.liang.choong@linux.intel.com, 
	vladimir.oltean@nxp.com, rmk+kernel@armlinux.org.uk, faizal.abdul.rahim@linux.intel.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com, jan.petrous@oss.nxp.com, jszhang@kernel.org, 
	p.zabel@pengutronix.de, boon.khai.ng@altera.com, 0x1207@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, emil.renner.berthing@canonical.com, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v5 1/2] dt-bindings: ethernet: eswin: Document for
 EIC7700 SoC
Message-ID: <20250905-hissing-papaya-badger-1b2ddf@kuoka>
References: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
 <20250904090055.2546-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904090055.2546-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_005332_985709_5CCDF178 
X-CRM114-Status: UNSURE (   6.54  )
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

On Thu, Sep 04, 2025 at 05:00:55PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


