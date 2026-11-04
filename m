Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544FB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vIj+meVg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4tv6X1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZmxlQbjY666CB2DpfDGRCp8x+UD5CCdq+P/PXnNUKNg=; b=vIj+meVgXEAmDrxXPPgZ8XRx04
	i7Oao+6S4VE/wBuzp2Jk3qqMtw+kImhXx7Ni3mUq0Pz3Mt1w8cJu6rXQji8mrGh5LjiQBZIUKTg3M
	mjshq4gAPyNiU04QuziZfFFi0YIVzFEZXoDVzzhqHWTsPjm+7pBIeEvNB758N59W7XEBroO2AHco0
	x7nsQj3RE7lvqaKDcw/l7Za1S2ii7hvqCUAo6RR/MFm761oJ9EjIwnyfI3iTEoCkHmOEZEdXl5mRd
	rYSjIOjG9PWWBl5pSSo08UYLceWcfV0ai9UEvGW98aPIHrU2H3ffJ4PtOUqNYs0zvjPgJNTPdXOop
	K5SfaGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYeo-00000005489-0d4I;
	Wed, 04 Nov 2026 10:55:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYem-0000000547y-31bw;
	Wed, 04 Nov 2026 10:55:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AFD040AAD;
	Wed,  4 Nov 2026 10:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0C51F000C1;
	Wed,  4 Nov 2026 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789752;
	bh=ZmxlQbjY666CB2DpfDGRCp8x+UD5CCdq+P/PXnNUKNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N4tv6X1+fuRnzcFWc7kFqvNw1R/k3c5ZOX6VF/gvjliL25lWCLvp1ly3mk/hsSILr
	 5jbE824NhPu4esLW+cDfVZbZM9is5IPDBMpC+nkPe4VYYdavglPO44FG8HkQUtRQ8m
	 mWe+B6lpTfbuC4ssp6a3RS8x36Gb0eXjGg21MGQCaLlg1i4VQQar9BgvkU1LwgX0DN
	 cuNECgFq5NQfSvh/e8689Fr0/X0SK6tVY5BSlw2M0+0et4TI9pAg3WsBuabyOSmK74
	 g2JL0gM4lqnx+sPUTyiynnb7Qxxm08kbxCd/L/hQfFjLVQoRB9AQHPjOoM/QNKp1Gw
	 W8OnbjgUPT8GA==
Date: Wed, 4 Nov 2026 11:55:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao Huang <biao.huang@mediatek.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v4 02/10] dt-bindings: net: mediatek-dwmac:
 deprecate rx/tx delay vendor properties
Message-ID: <20261104-glistening-woodoo-narwhal-ebb587@quoll>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
 <20261103-dwmac-mediatek-mt8189-v4-2-c86c14fc50f4@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-2-c86c14fc50f4@collabora.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:12:07AM +0100, Louis-Alexis Eyraud wrote:
> The mediatek-dwmac bindings provides the 'mediatek,rx-delay-ps' and
> 'mediatek,tx-delay-ps' vendor properties for describing the internal
> RX and TX clock delays.
> 
> The generic Ethernet controller bindings also provides standard
> properties to describe the same kind of property with the same unit
> (picoseconds)
> 
> So, ddd deprecated flag to these vendor properties and update their

typo add/ddd, but entire three paragraphs can be simpler:

"Deprecate foo bar, because they duplicate standard properties from
generic Ethernet controller bindings". This has benefits, because you
start everything with clear action what you are doing here shortly
followed by "why".

With commit msg fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


