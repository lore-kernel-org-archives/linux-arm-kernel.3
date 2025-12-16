Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C44FD609BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EscLIPaYaeCN/IIC8x0x4baLfefc+TaEHPSSvBaypRw=; b=ln5DI/1RpNK9L5IIHxkp5L3Cqc
	K7jWPU6SJ7++DRq1a+tjCAbS7wwW8PCR9+5D3oW5WalgC2vXFfmG1Vx89GbE1rCHPysbo1NT8fjFj
	v5uns0kOe+W6+9u55ffv6i7VLP9wzh6jHI5X6jpOgq9+wfgN9pEIkwgA876uqaRHRKvgouoyS5SR+
	R1N2nWptTdg9COUViBW73T9tjYcWsBy3xsTx4gkg0PRJCWMTNDusq1ERkkjJHJMbRq/5vqSPMvNBr
	hWwa4zLhUdO9gyCwqY8/7+NTc7KTmq/dIRLWpSm1yqvIqqCHMLFh8Rc0FRpujUK1bWnm4EM19x49M
	ani+VTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6f-00000005XpB-2sgq;
	Tue, 16 Dec 2025 16:41:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY6e-00000005Xog-0G0F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE44543D89;
	Tue, 16 Dec 2025 16:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D4DC113D0;
	Tue, 16 Dec 2025 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903259;
	bh=pp+yt9qeGh7y3VYMD8TwdryBjrQUjciKcpXyKjP+FNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIGZeJtM9paVONDldO+pOxX3txewXE45X5zvHvp+bvc8tGSTrn73jUmUJ903/YQtC
	 Oqcuwbw5n+wHtraqLgsmxim5qCBfpgnvQT0Cw9V9qfWkWZCVBKXYqNnI2JBnsmKdZa
	 OBpEKaIh2PY7eMe/Om3s9SRGY5LZ1e/htivLlCGCnEkoT6gQl4WiQdT3l3oAMGJ7Er
	 QO6xiGuYHoM2YDB8k9qQQpqJn9aJB0FBieFzpNfKUypLNyC0+60MDhlaW+n9mw1sLO
	 8ziRzv01MNdNDXbCSfHCyHN574WZxrF8QvYujLE8EN9Qq0xvHcUm5q64BRexLTJhY7
	 Rkax3Sw3YkZzg==
Date: Tue, 16 Dec 2025 10:40:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm,vexpress-juno: Allow interrupt-map
 properties in bus node
Message-ID: <176590325593.2606466.6619016689348303654.robh@kernel.org>
References: <20251215212932.3324144-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212932.3324144-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_084100_118352_299F791F 
X-CRM114-Status: UNSURE (   8.21  )
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


On Mon, 15 Dec 2025 15:29:32 -0600, Rob Herring (Arm) wrote:
> Allow interrupt-map properties which are already used in the bus node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,vexpress-juno.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!


