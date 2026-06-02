Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741C8CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLJGRrI9wchr6WhD1/7j1dssOLlHbCro87xumtftL1g=; b=Pyxh5LiXnES8LW7b/1Px/+ljth
	Zj96cCfIvYW4M0d3H5tcQnjkTT3gIlkSi1A/eey6oMxj3EcATbOrCizPZ+nV/yAH4fHyK+WwCHTAQ
	SXkxdyfi8+6fGCUUDbsR8WBIU9LNVGEeRU/DV1qnSbn8xyhKNgnUHWckWyUbg9d86KABi8zeZVz3E
	KPTqt34X2/2jQMpmhbukXKLmYTe/nhE/olaojV9dph29dPGa8NtHHhq3t8fefFC8NIQPd4mj1Xtpt
	vb3C1CnNOhUWHUmP25QbtA41t6X0zm7r93C/rUrYKoE1LzSdePcCvwVMC5vdp1M/Uq+8imOtEgJTI
	Cm/AfBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURKy-0000000DMNS-43i4;
	Tue, 02 Jun 2026 15:47:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURKw-0000000DMN3-0dDc;
	Tue, 02 Jun 2026 15:47:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 898A944055;
	Tue,  2 Jun 2026 15:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1271F00893;
	Tue,  2 Jun 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415245;
	bh=rLJGRrI9wchr6WhD1/7j1dssOLlHbCro87xumtftL1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Me99jb+roHbsO/55bjAd+JNvbH/TdJt1UxA/XQgPQfLSqmRbKhL8X1rzyQJYHNu9I
	 KpY4PF7EcDOgd4HKie7lGi/vELjW9kza3vmU5640mOzV2H5QRnySYvGUXERZmIkfDY
	 lK7rvXLEBLZP1i4DbxAG+S8znCGyoHQtgUB/F6Fj8lXSgjX9ujhoWeMafmBzHu19YS
	 v4fvCpkUKfiZ8OQ+1m9J1ENk39alRzyAZy5XjcPigyfu3vpExICv8IWAngBeFXGCjj
	 bTf8zrdQ3Z8ENIA5/7C7zBhFe//4oPXzUJhVe4Nvd4appIZONfMBbosePt5T+9qxZp
	 eyRB8nFx6pGwA==
Date: Tue, 2 Jun 2026 10:47:24 -0500
From: Rob Herring <robh@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add vicharak
Message-ID: <20260602154724.GA399800-robh@kernel.org>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
 <20260601162143.170030-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601162143.170030-2-hrushirajg23@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_084726_257671_8C33A507 
X-CRM114-Status: GOOD (  12.97  )
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

On Mon, Jun 01, 2026 at 09:51:40PM +0530, Hrushiraj Gandhi wrote:
> Add the vendor prefix for Vicharak Computers Pvt. Ltd.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

Missing tags. Perhaps because you are sending new versions before we can 
look at prior versions.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..504a691a33b9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1791,6 +1791,8 @@ patternProperties:
>      description: VIA Technologies, Inc.
>    "^vialab,.*":
>      description: VIA Labs, Inc.
> +  "^vicharak,.*":
> +    description: Vicharak Computers Pvt. Ltd.
>    "^vicor,.*":
>      description: Vicor Corporation
>    "^videostrong,.*":
> -- 
> 2.47.3
> 

