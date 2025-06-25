Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44151C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtFTJfF6gIKQ2nNjQqOnc55REx3wzdOuI73n1KphcxY=; b=qKbreP9ABXPJz4DbIZZGXDs23k
	SJlsv4l0GbAmXuLt/tkw99i5lyaNwQ4Cu8gqxSxfBG9QWQ/0fKlRpZpX8ygEUaOLdBElWBk3sZ0Lf
	zkPqOmcvYLLb6+xHXigvBXXi20vkJ1Y834IeqxjoC3t5SZwSUHXv0RjfZIONhdXjQXdRO0yyl9gEc
	8XaJ7xCYhL2JFs+7ZIzGy3XDOAxKG83hXdKNCfzDgS0q1ATh/asCg/krLCOf9ZDo2BY39ZQtJEorV
	8dN6XoNnsyGkM5rPAb5t2Lh2iCfcopjRLomBQUHCqvHbrEFbt/7YL8SIIK4ynvQN/f+BYogIDEIc5
	OfA+OuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYYw-0000000A3wK-2RAJ;
	Wed, 25 Jun 2025 22:25:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWUo-00000009ol0-09tn;
	Wed, 25 Jun 2025 20:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B236A52E4F;
	Wed, 25 Jun 2025 20:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437DC4CEEA;
	Wed, 25 Jun 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882404;
	bh=zPNkKYayJIxWTUaQnmIIX16h79rDQcRVFOg5N+6RMbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUguQlRutLZB2kKQ6PnH4vIkUeBzHe5x+mixpdSni6mitWR5mhUOUL2sySgP72aHB
	 L4dz6RNCtbVIMRri4m9+NCGom6RdOzRXwCf63a5zZSDItNxHTjpMh7xEPcVKhL8fZ3
	 4PaHLD9uOm0Jg/tZPKPL//MhqChA8KEeJqQYrZ5jR8/OmDdiz5rw6fP7uE1AVmPb5N
	 pQaTyh8wDHi8D7IUOPD89lr83ZJxqGmwBW2MHbONymszfIfkE0WR5XCKUZxE8vrlQH
	 2t/r9Rn2RPa0Rp1T3txmSJ3Oq2cRr/p/cZQTtYg+TnyAukV9AerUSDdLPrXI6wA4nw
	 pWSsZ7yIOBtlA==
Date: Wed, 25 Jun 2025 15:13:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	jirislaby@kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	qii.wang@mediatek.com, andi.shyti@kernel.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 1/3] dt-bindings: timer: mediatek,timer: Add MediaTek
 MT8196 compatible
Message-ID: <175088240336.2135179.14074379043587358741.robh@kernel.org>
References: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
 <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611110800.458164-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_131326_145660_E56EA268 
X-CRM114-Status: UNSURE (   9.07  )
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


On Wed, 11 Jun 2025 13:07:58 +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the MediaTek MT8196 SoC, fully compatible
> with MT6765.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


