Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F295C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzt555NgMlxfaZba00E+bYleFGUZTLvEiTlhTWiZW5E=; b=jY7cKG7ctEpwYmhCWMFacDKye2
	voJs42dbBYUvUiYjUBbNMnv6TLBvD23Bxel7/qsiEgprAUo4F62I3LkHwuydwK5upwZTAfjH77QNg
	uQIO0iWsLFwE4FnFypEXajol7sH6YVYos2JKf7qNsXVMidKNCYVO3SqwLLI5Z4i0AO0emWYhTcpAM
	S5ShLQPYauPfV3n0+gt6M4WCAXO5X9XoO+20N4tiXwPhxuI7FCP0DVF47gjUu6MMqSaoBy270ckSM
	8Oa1n4UZFoDoJ2iAC5ML+Sqw1zvwtUqgm3cMRhrgC2jWloTLu1/sz9/wtD+gi4tM1//xDFccbFfOZ
	+wK7YTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IYl-0000000EZzg-135W;
	Fri, 11 Apr 2025 17:52:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IWT-0000000EZoo-3vGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C07C44A52A;
	Fri, 11 Apr 2025 17:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C118C4CEE2;
	Fri, 11 Apr 2025 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744393837;
	bh=UgYRPhQRBiJ7R4mPcaCowJ6V4uNk97/yxaeTPsWPQMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2H3sjhIOEtN289F9ZQj5HeFpR+hz4IfKJNw6si8S8erQFWjQv9c98j/zZUpOKhf+
	 Ul55hNMKll9NS24QrqUe67u5viMRq2O7a1bFpsDE76FogeK9dVME6w2FvFNUgl/85t
	 l5okiRToNExeTLMnPySMjJI+dziJ79DyEto1JfkUYU9/a9FKxeAGeyq79ZxwOHCBsC
	 kOJTfA6zlkQtxap6bnuEcqQ7i/I6myaqNeaG5L3Fb6rz3GoBWO3sK0lp1nRb0ZLiw3
	 zXinIhrrMzYuSvN8/ZWPjsFjTkucDCb1CFhOsg726ubw/mRvIBbBxAioK6+LTfUtf+
	 N/C5BgJYXiSmA==
Date: Fri, 11 Apr 2025 12:50:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer
 entry
Message-ID: <174439383495.3642695.16910474750574128734.robh@kernel.org>
References: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_105037_992022_D2A1E4AB 
X-CRM114-Status: UNSURE (   9.90  )
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


On Thu, 10 Apr 2025 18:11:12 +0200, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
> 	    from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> 
> Fix this by adding Frank's email address.
> 
> Fixes: 9ca5a7d9d2e05de6 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


