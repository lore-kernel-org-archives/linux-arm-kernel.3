Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BFBE7542A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1MUqHk/z+4tmfJsTEaw4AodDbdxLboDzXBsWvpAHnQ=; b=uGOJQMbaBJqytBfUiK/Ku+qEVv
	uGzA6e5D2Pg2Hvbysjs9dAe/sqqbcWuf8CZgNYtCAGJt+5Ae5ogHVRgKY4BL64IYRwmeaSgNE9raW
	DY0++B4b7BgXfWqbVU/yeMSLMHY8ccbq2bs/6Lc89FpsWUXKvoQy5Dv0oU826elyDPd0Fyc3RyKwp
	VrnItUU7mmFBdQ5z6aeoczQEtyyMet+ZGs1Vptlw7bREshtHgSw35rYjlG/qHAdXylv5U1PmlqFFR
	rZwaZSN+T9j/KnpF6QUlvPUPTTuu/FPBmJdjQyYvF/VGDX1LxqsmSUZReS7r43l8rDL/4Jsb/FMz9
	1sPpTn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKtO-0000000GcWW-0pac;
	Wed, 24 Dec 2025 09:10:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKtL-0000000GcW6-3VKK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B63640359;
	Wed, 24 Dec 2025 09:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C25C4CEFB;
	Wed, 24 Dec 2025 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766567447;
	bh=5vZOqdUCDqHKRalg9x266UN32kb30vjOJx380+ZbytU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xjj3dNOqpXV5XAnck73qHs/iMJ1+AxC5UmpkrF64RUM053N/Ws+nZHcmYNLw0WFTF
	 NeAA3iaE22t3razdlkooo6/U0Jmn7MXtLE8qQtmfjItt0bo4+tTNrVl5Tv6FgKHNlJ
	 3B+QXSakc7rm0kvDJ5poOz8jgjwFuFtRUo7/ADzVPt7IwSNn6QOHeJGmJ0V7hR9JFV
	 u+0/tjzBr4q7frg7kZaTpvPHJmc5WtpBK0Ip9JH6bCKFhFpJ0keaX09Gf1IrNDiuGi
	 WeYQ3m6jY2euXmNPNUlEGywLhotW9aB++iQg/5ezDrabfzblYhIuWIhIzH3xejDI1i
	 yuoZPQm7SpIlQ==
Date: Wed, 24 Dec 2025 10:10:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta ventura2 board
Message-ID: <20251224-bustard-of-major-growth-b9cd89@quoll>
References: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
 <20251224-ventura2_initial_dts-v2-1-f193ba5d4073@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224-ventura2_initial_dts-v2-1-f193ba5d4073@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_011047_916861_8DCE922C 
X-CRM114-Status: GOOD (  15.20  )
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

On Wed, Dec 24, 2025 at 02:44:38PM +0800, Kyle Hsieh wrote:
> Document the new compatibles used on Facebook ventura2.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


