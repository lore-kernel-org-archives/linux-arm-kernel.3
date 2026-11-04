Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NrT1vHsH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6mCxqST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2xX9iJgWUUUQL+Ex8TMZWoceQZkaiq4TOsPi12PIbz8=; b=NrT1vHsHpnkza7BnBABRsyXWJ+
	hPUeOGbskSxJS1PFVa+6YPXw9pxsC2UGTvssTQAysjaCh6f84/eSG61bCPZWTX9WOpI92UnG6tSnU
	G2VSPa66MMRg/zaJTJqDg5KMZuSAJ/4O3dIm0yDQOCyqkR262heMwpuJVkC4kkRFBoKrEod//9nCY
	l+mRDaSJCfzT9wRyitPNCdRnkODQsrqqTskMHrEDbXKEm6whhxJDwJHVGLif0izrKF0Hytetd4sGI
	S9WENmv5pczmTp4vZ89dOWnLI1hzjiShICtMECeyLL5FPOKg5PwdkcpcPN9xmDKRB2A4v9tgtN9Oc
	dhG7vyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYg1-000000054Q7-015h;
	Wed, 04 Nov 2026 10:57:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYfz-000000054Pl-02Zz;
	Wed, 04 Nov 2026 10:57:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0C5F40AB2;
	Wed,  4 Nov 2026 10:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE8A1F00A02;
	Wed,  4 Nov 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789826;
	bh=2xX9iJgWUUUQL+Ex8TMZWoceQZkaiq4TOsPi12PIbz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6mCxqSTqunXa3wblksRl7na80ibmakppv+yxx/tiI6wOK5l6rTFAmDO7Bz79jHXA
	 4GLIcAg0/WGbOvCGWuIHVi1zInQVtTFYHRpfoIYUZwI73eOeGiPPUtZdb1Yu2/Nq2Y
	 WazMN+VfYs1j+TUvDG+WelwM7gwdN53OU4WW5WNKWehykINUEkur3l9UIyBzpSAGM1
	 5TSxKbI4U3aiQvGMSfwJ9PmB9pFZ7NFDD+DQDf+d6R/Yftk4V/zd1A52rfoWQXQK+o
	 Yt5cQmE8SyPLSeatcguU7zJeaWJ6fNuCvPl5p5t1o0cau8AaXXcQ++E602mBmRFHjC
	 ewrJd1KX0Q+EQ==
Date: Wed, 4 Nov 2026 11:57:02 +0100
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
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <20261104-passionate-illegal-wapiti-6591cd@quoll>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
 <20261103-dwmac-mediatek-mt8189-v4-3-c86c14fc50f4@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-3-c86c14fc50f4@collabora.com>
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

On Tue, Nov 03, 2026 at 11:12:08AM +0100, Louis-Alexis Eyraud wrote:
> Add new compatible string and clock definitions for the Ethernet MAC
> IP found in MT8189 SoC.
> 
> Regarding the required clocks, the MT8189 datasheets list in the
> paragraph related to this IP clocks the mac main and ptp reference
> clocks as the ones to turn on.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


