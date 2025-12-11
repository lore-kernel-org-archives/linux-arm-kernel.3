Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E51D43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 19:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+E6HtIiDXDhcgqqck/Mu1DHq5XAqT+R6wNgEK+D0s4=; b=J+WVMctYj4bHQ41KyXg2AfximX
	D6sbo/F/m3SxE5MgPRu+mQFt6VR1e9jBG9RXCtqlnCBHcPhpsVP/4xNzXroT0h8hMRXutZWHiJpjT
	dM1RC39FmX3/YswgeIfVr2XbtlSng+EAMPf/fE60sNIka72hQ7Omr2CJjBfY2R7OoUaKRap9xUGRB
	pJ0Ea2iJNhexo4n8v12pGuVzyX7YjJHIx39wJ0jQvpSiuvROF3DbEgOnRRlooeT0W128SxEc+fHzP
	epXy/Ef99j0W6CYRs0qyLnFDW6bccKAzGLBYUMnCZrBkxnsEJCDSN45lSqkbHXMl+y7GrmgrykWbh
	pAsVmpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmnI-0000000HBh9-0t64;
	Thu, 11 Dec 2025 19:57:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmnG-0000000HBgS-023F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 19:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABF9D40E1B;
	Thu, 11 Dec 2025 19:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D7EC4CEF7;
	Thu, 11 Dec 2025 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765483061;
	bh=Io33r65MkdLUI5ebj+eMtKFDPiobvPbUbAdbp66gtmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJwriffR9MxTEwDY8BFqGcfGKTyA9NAJZYyNkQxepc3ukZDkbmlLiKZnUuUg5BdpK
	 +rDsFiU20ettgn8YFwTV59q0fKS8i7z9iiB6wl+9lzfRWDAY/Zuj4Y/Myg+zO3UmsY
	 HS/D5dGWLaGcK0X3un+3iTS7eoW1xKKfXGc9h3rIp/GFfx7Q9KASCQ/D4K+bwv5BiT
	 vvrB5Wstcdhi2i18vI+CBPhTlcSAulgmYvhh4QripX7dKRxdFeZpJJASdUAP+stp7E
	 cwsxoA3FUK02G6cbNXED9jumWAIa3H3gqGjX6KJhTwSD3zJwvuwBIbP9LeRKtv0Ecx
	 QUk3WGja0XMpA==
Date: Thu, 11 Dec 2025 13:57:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 10/16] dt-bindings: crypto: Document aspeed,ahbc
 property for Aspeed ACRY
Message-ID: <176548305816.1801207.6301308659120970227.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-10-21b18b9ada77@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-10-21b18b9ada77@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_115742_062494_3A8522F4 
X-CRM114-Status: UNSURE (   9.66  )
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


On Thu, 11 Dec 2025 17:45:52 +0900, Andrew Jeffery wrote:
> The g6 DTSI already provides the property and the driver errors out if
> the AHB controller's syscon can't be located, so define the property and
> mark it as required.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Applied, thanks!


