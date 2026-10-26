Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F690606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mnkd6ZIt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jx/2faGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CLYMN7shHS7NLVY5dkfeAO8ipJLvlWnPXRfUIP8Dwts=; b=Mnkd6ZItpIvriYOhDqqb5uNyZU
	qJS+Cl/lFtchPCH9B43ZPvPvqBQKHrj0d7IUt2Jayz4CVitfMNhWRYsy64MPc8Og3rWvMF5tltqZl
	e+qaMItQtyGtER83Msf6IQzNDMvISE+VnCrThz1+aG0ee6z6UBVZ2vJHtPleSE78RNry1wMaDZg66
	EsiXM9ON1Bd3RcW882G7iTQCSTZ9AOhVtnqi2OijUshLMov95jA7wx01vsH0czc2/6Y8v38OaK62F
	58RMv7VIhzF7xfyGE9o7YPY0BubRReGJ/YktqJLLMDFVeQEu83m5sQ/I0MYRcxmaq75mED8gk2eS1
	JYSfMu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHdX-00000002E8H-3GkP;
	Mon, 26 Oct 2026 10:09:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHdW-00000002E7p-20VL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBFBA42A52;
	Mon, 26 Oct 2026 10:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1961F01282;
	Mon, 26 Oct 2026 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009341;
	bh=CLYMN7shHS7NLVY5dkfeAO8ipJLvlWnPXRfUIP8Dwts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jx/2faGBqIs6zqSn0EVeyAgK4/gRaSM7KzbJ30OBYvSv+qRxfyN1YazDoNZMYG1Uf
	 iQc5kVtTriWuDSXhgdkCVPph2cfjD3egv5bRXZMpZIz1WyfOJXYwGBT0G7M7jlLZuj
	 zn0sJQ61CrpEXezlZ1VTPh44l+YkzFsJ3OsM97tSFFe+w59Hd5o3g3hk5KhMNMg/ea
	 hIpmjOt6sTiiCJQgOcLPzLXHhW2iV3qa8mYP5xpG/9SOBSg6QTuB7tbueLfSKpAKTr
	 gll041yQ7XmkAWU/XvTKMgjO40k5ueyJqn779c5CpolUIICctyqEPR2oWl9twohVPf
	 tPuMGRBgeU8Cg==
Date: Mon, 26 Oct 2026 11:08:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: clock: renesas,r8a78000-cpg: Add GPIO
 clocks
Message-ID: <20261026-spirited-pumpkin-elephant-43dd3d@quoll>
References: <cover.1792776697.git.geert+renesas@glider.be>
 <624a9fb09e4ec74b1995797e5121b86e7206f5f2.1792776697.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <624a9fb09e4ec74b1995797e5121b86e7206f5f2.1792776697.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 07:50:40PM +0200, Geert Uytterhoeven wrote:
> Add definitions for the clocks used by the GPIO modules on R-Car X5H:
>   - R8A78000_CPG_SCPBUSD16_SCP_MAIN,
>   - R8A78000_CPG_S0D24_PERE_MAIN,
>   - R8A78000_CPG_SGD32_PERW_BUS,
>   - R8A78000_CPG_S0D24_HSCN_OTHER.
> Include a few more clocks from the same groups for ordering consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/dt-bindings/clock/renesas,r8a78000-cpg.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


