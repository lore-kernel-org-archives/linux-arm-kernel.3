Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D352D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vweDOV/qIlOarmKBNZnSIg/tnQa3AuwicAqyPeOdeUU=; b=0CL/Oijw38VxU0RmNgwA9Vn/oR
	OkIn+KVmyChFdj/Y4/SYVYwtLYC3Tk70sr0xiomfO28PIQm/lkF0wawok6cpJshZlYXlm/otS/iZz
	h+bCQRlPNqNt+7DUvCHtS5O5g0J3zh5PR9f3OtXPk3RASkXPkb+axkYELvEoE6oigRNZvx/Pep+tR
	pNLBw8Xf5T7xtkDO4ElAakKak+iGSSbyRj+HUjyBlUTAVtU9lo/koIMcIkXxLj50HCPQzSpxzaPBH
	10pzMrpMTalmIG3J4m6eOV6NHSOBmzQ1Mrc8H0cQ/K2m0d8MXEqt/KwJ7D1VBpTe/jWd/FkBvIaIk
	EBCOFYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vesL9-000000046xO-0u6Q;
	Sun, 11 Jan 2026 10:06:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vesL7-000000046x9-1LWP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 10:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 320A660010;
	Sun, 11 Jan 2026 10:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81948C4CEF7;
	Sun, 11 Jan 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768125987;
	bh=f0Wq9MbNlKb5pZ0bl8dUQVC9Gg9yFaWKAKdarLjQiF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2j4+TvJHQgaYIuzBXiyLcNVYoQi5bLxvI1ZtXK5CpFybhmSRDNihJO98r3xF0kEo
	 V9hq8H/2hwwGt8n4lUbkV/VvPUY2fflZS0AHP6SuKv6VA7IvbKeEQUtqv1fvFKSKui
	 pGOrKaPjuMeTDrEOLcU5Xuq0qk/grWzXKlsYOGhbekkEk46/us3kkRCI30eoDeJG70
	 rs4c2lxaPJwwAtrTdSVogcV8XOq+mG5UfsaLoCP0VvlLOEiLDKOTzefvulqmpFwXbr
	 +YcTUldfjUD8GK65qV8FKPI4ROtWYwS86vupdB6a1BQt0iV9g3LswxEcQO1Kt7oRxw
	 8ybW8hQenNUGA==
Date: Sun, 11 Jan 2026 11:06:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, cix-kernel-upstream@cixtech.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Message-ID: <20260111-elite-wren-of-force-eef87b@quoll>
References: <20260110093406.2700505-1-gary.yang@cixtech.com>
 <20260110093406.2700505-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110093406.2700505-2-gary.yang@cixtech.com>
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

On Sat, Jan 10, 2026 at 05:34:05PM +0800, Gary Yang wrote:
> OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
> processor + NPU processor,integrated graphics processor, equipped with
> 16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
> SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
> and high-capacity storage
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  Documentation/devicetree/bindings/arm/cix.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


