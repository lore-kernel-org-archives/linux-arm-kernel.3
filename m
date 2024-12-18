Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwORaWFqulTAzheZWrmqJV0onw4FDgGxFD1GGSlekFk=; b=pj5ihLDjLzbR//pDJinK/ZN+0P
	g9A4v0RQJpqRqcfuTd2M19WZPl7jnK4QQaJH4JPi7DcCMn32W1xWKXm8A6llGRcLOQLvFdE6SPdWz
	Lp9OulIcZopXxbP7Q9giG4OXMLcmPkyO7JF56Htq+8i+PSty4Lr+J6rFODSfXnU+bxhtwCLdNd/ul
	xcOIAQNuLxdIAZgoLXEhu9N5eE8L6FIiLhFhXTY5sHMCf4u7qyoeAbHyfBMn94UvGQA3nKrlfhVMi
	Jh9AhhZV+YIrMITYGZGydoLAdR5W98KgPLS+g5x5tBPT9m51SopIHJQGtQIyzkvMb0DlCpjvEts1j
	qntTcSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzkz-0000000HXg2-47pI;
	Wed, 18 Dec 2024 19:30:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzjt-0000000HXXj-3dKO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64D15A4085A;
	Wed, 18 Dec 2024 19:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB43C4CECD;
	Wed, 18 Dec 2024 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734550184;
	bh=hpHX0UvlDSyx5pI6TYm4aijPyLWk5pW7U6lcQ6Ug62M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTLM1y9+BaliZsAek+5vTR03HZ4lRIiGx3QMAcZopwX5TDjKj2wifgN+BF2zRiznq
	 ofdT9C+vTHx++rtK6H24eRP222dWLDeBfN8R8qMgNoSatfP8wo733evdTQwOp+xMB/
	 o9Sn99LrH/jy2Rb4xyPq41WU6PdTC8/Fta+POJjdrkPCyjTN9TH/wC39Haf4Siig2A
	 KSA//35IZw/pvAGLe1qJuUz+xocCL3ttaSpbEjWkyWrkywaAdRzdn0pt2PuwqL+dEX
	 TNFV8nyhVl+FV62uyPgtgQNTi/Jd1nEZUaDK0kRMHi15DviqjElrlEbfzdEv+mxNAN
	 fTlKl8PD07R+A==
Date: Wed, 18 Dec 2024 13:29:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm,gic: Correct VGIC
 interrupt description
Message-ID: <173455018100.2198330.12077558801772545243.robh@kernel.org>
References: <20241217061226.14139-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217061226.14139-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_112945_991205_188D3888 
X-CRM114-Status: GOOD (  10.13  )
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


On Tue, 17 Dec 2024 07:12:26 +0100, Krzysztof Kozlowski wrote:
> The description of VGIC interrupt referenced obsolete "see below" after
> converting TXT to DT Schema in commit 66ed144f147a ("dt-bindings:
> interrupt-controller: Convert ARM GIC to json-schema"), because there is
> no dedicated "VGIC" chapter anymore below.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!


