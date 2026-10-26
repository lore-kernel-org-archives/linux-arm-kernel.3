Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UIsS+cos;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOrj37d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sG+9ctl/dW9U6eqe6MBanSCbG0xr4iLexnlh8IV7Kqk=; b=UIsS+cos0SqogRZIfF3clnBU/n
	eJHPfdjmgJ2SknOWWsbVdbxdYUnnjRyxsL980cxoxbOzqIUN66HpHW0vsfJTXHyRcKcl+Y8dQywvb
	vrY50Ah+We+DDg9BfgFXs/aqPaU8QshiI8HLq38c1WBHtPx+8c7MSyCk2NaDxuXklHvZMbn0v89bm
	6NjAUfb4diBX3qm1MOKP06LZv9WE+dQ15XE0SI4f+tpjIgQCHzyiVELxhGgvxcVQKFbUo1GFG2QjO
	Knj1h7imQb11WQ00AdeOxag+/qD33b/a22/yVPrhOJz/uwa7S8FzaATGNCc0tBGFyiW0gBi4hR7yg
	yVzL8VJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEp8-00000001p96-257k;
	Mon, 26 Oct 2026 07:08:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEp6-00000001p8k-3hVQ;
	Mon, 26 Oct 2026 07:08:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 529EC42208;
	Mon, 26 Oct 2026 07:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8101F01828;
	Mon, 26 Oct 2026 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792998528;
	bh=sG+9ctl/dW9U6eqe6MBanSCbG0xr4iLexnlh8IV7Kqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bOrj37d4eDd8+URwZ/ZAWqk7wwPZb9QcdPca5Vf43Umo/x4HMY0OKffScAvtDUpZb
	 pPcK1kE4kLfc4Zg+50MKyLCFa1opqmPuahEKcPjL+thf5CtlsuVkyWrRwkRXZ57yyt
	 gX1NTCEBxoZ+Lb3dIrBTcQaoVUYKJEM53LKfhRueuswKvj16yT5uG9fFbB+NKWNuUK
	 gVr85ijeGmfbaPKrwQvqjyKUVgfRcIsXJE7ZfY3a8pZ3uLdeKZER2RmbUCR+sfemQ/
	 0hHPhbEUOmGcS5khphAakJXc1noEGz+gJygG6v8XSlTWmANnCOOcOvZ1kpyARJDPkW
	 g5d4zOB6PjGIQ==
Date: Mon, 26 Oct 2026 08:08:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-rockchip@lists.infradead.org, 
	Chris Morgan <macromorgan@hotmail.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hrushiraj Gandhi <hrushirajg23@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Message-ID: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
 <20261022125339.82746-2-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022125339.82746-2-liujianfeng1994@gmail.com>
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 08:52:52PM +0800, Jianfeng Liu wrote:
> The ArmSoM Sige7s is an RK3588S-based single-board computer which
> shares its hardware design with the CoolPi 4B.

How different devices from different vendors can share design?


What is exactly is shared and how did you verify that?

> 
> Add its board compatible with coolpi,pi-4b as a fallback.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---

Best regards,
Krzysztof


