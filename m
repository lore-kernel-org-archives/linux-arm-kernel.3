Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B9CC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7AAQbposZIKDJtq5ddWLtSA1Emr6N+cxGRFQALOZWE=; b=eMJwLBNAUs6QR6yLqeGtlPNY8p
	fUtgeIGkTFTqVa5KZe299bzccYl979VDrg4xuYCP87Clszk6K9Z7WSvqzSJIM+Pb4J4OvdKX7lg+1
	i/zGCNaFCBSJ3KAzxGZcikeENoPl+KC5VxnGPtsOet03loIVSTOgzwopj3wgRMc2upSbxviRFrW+4
	KmCE5PTmEX5a5m8lNtdtD+PZb1abnx8rhb8tfybLc3lx9HUEDTN+Tpm8ZtAK6QgTPA2IB29xvUQGp
	aIVl5Nmr5BWM4sqn2rzlJYJ2I8iF8vClvlH20va5AyaCYRM+NLET6Pe8Tj6PAEHZDjkcXEzqxXTuS
	bbBW8dyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAD0-00000001I0k-1wJO;
	Tue, 04 Aug 2026 08:09:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrACy-00000001I0T-3Ueq;
	Tue, 04 Aug 2026 08:09:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A72860A73;
	Tue,  4 Aug 2026 08:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F761F00A3A;
	Tue,  4 Aug 2026 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830948;
	bh=W7AAQbposZIKDJtq5ddWLtSA1Emr6N+cxGRFQALOZWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3vD6cnzbm+FCl5WjX6S8NsHl2BU45cQp88pj3+KQVatvOkAq9SGmL7XxdvDFtD5h
	 5ei2SKQ5nn7gUYLV6yybA0+ehJTuTEmB1Lzx6HYZ6+Tumt9DA6mC/9Jd1G0gIQ7RqW
	 dSWlc+vkxsH06K7kLHItmoW8PD1sf5VteR4HMfapEz7zKePdklS2y44eLQfAzm2yTO
	 q7Qb2fHPCPCgjArjesUtErWe7+MQB7GPE76oOkARCG/BqGq9f8iWdhOuSuJhe2jaKf
	 +A5J0PQ4egcATk4eNLYM/RtKwhw9g8eCmYofOEYDwDPhx4Hjc7VlMmQ4NBDPYVhZnu
	 DmGmJHzQFLc/A==
Date: Tue, 4 Aug 2026 10:09:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite
 board
Message-ID: <20260804-pumpkin-termite-of-exercise-a0603a@quoll>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
 <20260730134815.434654-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730134815.434654-2-hrushirajg23@gmail.com>
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

On Thu, Jul 30, 2026 at 07:18:14PM +0530, Hrushiraj Gandhi wrote:
> Document the compatible string for the Vicharak Axon Lite, an RK3576-based
> single-board computer.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


