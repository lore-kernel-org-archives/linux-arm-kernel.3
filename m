Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A992EE0AC8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahJxG6+rp3tsyq9GP5XLtQQlZN8oBO22hIJOrOHLDbI=; b=wPfkIEehaBKab93aOAPyN0XZPI
	Aem1bdWZBXNqTCFmbW4RGARa/12rKfQp150EwYcL199vedSuhM7x0XqDpYKQZF+/DyJeyPvkE2t8r
	mu6QQh0+vCcKp1IAa1/gsY7SYaEMfQL0JqoJ1vn/NRctr7farf6L0JHhRw1sIT0vJMqT4c8r9zvoT
	sgtW5HEl/NFNcAiPaw54/uFt2Vf4WiL+fVWJqFjk7iKv72UOtt+OS7Uy1ilEnLp8Li135DUmLBxA9
	vSuTnq4Fs5oj2jwkVtAhRArTdl0mJgTAEQtJEJZopMEmcI7syfUPIwdosO4ub3K2syRxIKDKuZWYB
	nYq9B8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofzt-0000000CN7T-0POp;
	Sat, 07 Feb 2026 10:57:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofzq-0000000CN7F-3ok3;
	Sat, 07 Feb 2026 10:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D24856001D;
	Sat,  7 Feb 2026 10:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CACC116D0;
	Sat,  7 Feb 2026 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770461820;
	bh=+VDliI/cY6I4r+Ow/eR2sRandUCPfhX+/ZeELt5FbP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMV5LlgaUeEXVAZ/UTb1gTQECRj+2kqsC/W3f5GQmf8/ipLot8cw1zhnvn4XcdH1b
	 GXPX9gHpKxYdS4ULJlGD3oHF9bnEmH2GvbGS4U+qBwZpvUVDCCJqVHh9qQL8+ornx4
	 gKg/zv09gZaRbQIEOPTt86kLudsNwRgoA0P+YDsCqI9JevV7Vbz9c9tqn1pYn7SBZh
	 RClzeAgPtqw9F3xDaD+6uK9XArWzEH3C+T5hNWluv9tPNM0IZUVYYkTsFLWHXOR4pR
	 7dGb09WxMMqymO168CBsKfR8b3k6+uo5U7watZdLFgLImXMC5RG3+kSqTOeqoNYLo3
	 FmIv+pHVP0KGQ==
Date: Sat, 7 Feb 2026 11:56:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH 10/11] dt-bindings: arm: rockchip: Add Onion RV1103B
 Omega4
Message-ID: <20260207-quixotic-ochre-tiger-b1760f@quoll>
References: <20260206181309.2696095-1-festevam@gmail.com>
 <20260206181309.2696095-11-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206181309.2696095-11-festevam@gmail.com>
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

On Fri, Feb 06, 2026 at 03:13:08PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Onion Omega4 board is a board based on the RV1103B SoC.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index ae77ded9fe47..40c6f7f90755 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -793,6 +793,11 @@ properties:
>                - lunzn,fastrhino-r68s
>            - const: rockchip,rk3568
>  
> +      - description: Onion RV1103B Omega4 board

What's with the sorting? Why is this between L and M?

Best regards,
Krzysztof


