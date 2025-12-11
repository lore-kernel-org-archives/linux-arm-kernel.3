Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AE7D43344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2GBEjCuNnECgkkR3aifc9R5IejcKFLfE1uJRr+64gk=; b=pMdgA+bYs+2bZq/tPIL3+5wP8D
	9Z9P34Lt6IXYfZvS/Z4oxPWTxsPJneMjLx8Ma+Zd3dnw6KWXdeLIwDD1ZcGbIa2+H49Jd67rYFh26
	jQQ/vJbbSQTTFD9xCbGkS7YP47E0VEYBuDQpPEvhR5Eoeb1l/zn/Vg0zBcx/fohddY7rDBySuz7OL
	NboCzQpSo1KIEuaaq8zmDjJwchvfWMflmKM4lnlBdV7kCI+DpQojgySgKInNCDxYDRfldV7RGHJYp
	l4+C2j4i06WYaPiqCXvYP9saJ3cRrYzXgqD0dA82YJJuuJRFdceuJ2G878Th5vJqde2Ezz71b8UAs
	88KeInZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmmA-0000000HBYX-3cQK;
	Thu, 11 Dec 2025 19:56:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmm8-0000000HBYD-2kgf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 19:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F16214401B;
	Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C135C4CEF7;
	Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765482991;
	bh=HMv7vikpdiyc0tr0TYhhhGH6GWe2x1iyzq1EumBTr7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Doq9lqp+j2BkKC59X5d5xNwaCtkHdKMBqSJU7xd3VUKEqtGRMStY3+hLyCm4cx0PY
	 GLAbUgXK69XtkVMGraP+oCePaYTvpho4LQX16dgzQU1+DO00Nz7RcTjFKFBOuONG85
	 2hR0JZ7ywSzoUAA/FuiUFFdJ3ShigaABCVM40fAqO/QyaSay5gu4EU85LRfFAaa+hX
	 faR5MhuXj9/QnQr/LosBEaKF3bQds37XndtjoLJknc2/MmhaxM4oGTuWXoag+2mIEd
	 Ph46y5A3pEv34txN9cZWx3UGV9trTMC1k0Uzd3PUSZMn/6Svnsr7Ewt9n0lTSQKP1N
	 Bh8xxGiRogr9g==
Date: Thu, 11 Dec 2025 13:56:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 09/16] dt-bindings: bus: aspeed: Require syscon for
 AST2600 AHB controller
Message-ID: <176548298699.1799665.1259025609428986424.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_115632_732039_26A4EB52 
X-CRM114-Status: UNSURE (   9.73  )
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


On Thu, 11 Dec 2025 17:45:51 +0900, Andrew Jeffery wrote:
> The AST2600's ACRY (eliptic curve and RSA crypto engine) requires access
> to configuration exposed by the AHB controller. The devicetree already
> describes the AHB controller node as a syscon, so require this in the
> binding to satisfy the ACRY relationship.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Applied, thanks!


