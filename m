Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5630606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pDnSBHby;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxhzywtJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PGaY0Pa3HUYVclQJqjBeSI20mWGTsICDiHVjhHNeV1I=; b=pDnSBHbyyGkpFYbM9nDO5dCAgN
	sxxCG8gidgC5sPsUap93z4fRs/ZJ5uvq+PJi5fE4bbhlzMSsKOwdlXPZH67YYXkap40NxQr7YN2MM
	X6ORnjue9wjSJwMob5VejX0AYquKw90XWDLk4oz7HHR2fSNYU+aTKyegR/BgZfQTZ9UMHbc5VEe3o
	7MQrvZMu+01vl+gRsk2SH9lLpZHyTn8AtcP6JTizNtrfwvnYfQlkBE0iVvEJSdwi4IcEAverzzeMM
	Lf6WmWwEZY7XJY7HgwyYNgeMtLvRXkj1DZ+ogc0a0pe1+4VHVHtqjM20i71OW0Usk7cFPgUYBf74h
	loxM+k4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOV-0000000GN42-3QsH;
	Mon, 02 Nov 2026 11:40:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOV-0000000GN3o-0Ji4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:40:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D5F54243E;
	Mon,  2 Nov 2026 11:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8761F00A21;
	Mon,  2 Nov 2026 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619606;
	bh=PGaY0Pa3HUYVclQJqjBeSI20mWGTsICDiHVjhHNeV1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxhzywtJBHiisWhAANnkA8vgHE9oI5DEKKmoc/nAm5eLjve7s+fjBjbY3sJi+iMVk
	 513dCavz/UvlAVM+dYF87jXDBwrmV4AY9r/xfuDry/43mW11avQyQtaUBN/mNachnL
	 VUj1BE2lmHejeUaAfvF8cRfwsnq0HtAxRQtXnPrqJm9g6RD3TibbGg5Nsft22QIOcw
	 By7RHFA807z9xRshcCcKZEiIe660/h9MLluJp4ekrksYbR2q9XZfztahkzBZxAggW7
	 DBeJdb4EEPNJYJ8wFDp9UkUxaTo/0EzB+XzzDDbc/kxOaQP35dADO1Kkpfa4HfxTgQ
	 gOPxz4D5mcCBg==
Date: Mon, 2 Nov 2026 12:40:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Axiado AX3005 IRoT
 MCTP transport
Message-ID: <20261102-nightingale-of-legal-superiority-fda313@quoll>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-1-36ceb822f01e@axiado.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-1-36ceb822f01e@axiado.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 06:00:57AM -0800, Akhila Kavi wrote:
> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. The two exchange MCTP
> packets through a no-map carve-out in DRAM, and use one channel in each
> direction of the AX3005 mailbox controller as doorbells.
> 
> Add a binding for this link. The node has no registers of its own. It
> describes the fixed pairing of a TX and an RX mailbox channel with the
> reserved-memory carve-out that the IRoT places its packet windows in.
> The IRoT firmware chooses the window addresses inside the carve-out and
> reports them at runtime, so they are not described in the devicetree.
> 
> Also add a MAINTAINERS entry covering the binding.
> 
> Signed-off-by: Akhila Kavi <akavi@axiado.com>
> ---
>  .../bindings/net/axiado,ax3005-mctp-irot.yaml      | 60 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 68 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


