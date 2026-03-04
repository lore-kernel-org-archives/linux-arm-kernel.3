Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F697EB7ED9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RggGFLYhq1K3LXLSljS2hs9MQsZcd7If1A/dhos4zVY=; b=ap+MlcoMPqHGIB71kMc94kgVtp
	kBeB4zr6D19BYf0TFSGR5zgkIxRFqcEQkUIxxf9RLlgUECWmTuT2aEwP1cRfZL+PibYLwDGPOXpEu
	fIjlBFcdDhMB3P9iAQP4q8yDHXf4/nq0DRB4zKXdjcdBm2FLzETAZro2RiV0pZafDIZq4T4ILoT8Q
	2Ez3kXvjjheypoxzxMNy/Lp9L7qqw1z5aEyw7WCJRr1pjJYH9S4rlIB7cFlwM03ugq69LVyiHFQI+
	2fL3SJGMNhfU8Ycy2ZB2H76epRnVghUE3Bhe7r8oawm0AECXC/2H2sfuTYn9pMBuDSe3+DEgX/YNy
	FR7e0X+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlEb-0000000HAwI-2HGQ;
	Wed, 04 Mar 2026 12:21:49 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlEZ-0000000HAvo-2onl;
	Wed, 04 Mar 2026 12:21:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vxlES-0000000031c-25Dx;
	Wed, 04 Mar 2026 12:21:40 +0000
Date: Wed, 4 Mar 2026 12:21:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <aagjzL4c-3jVuOM5@makrotopia.org>
References: <04622e0bc917aed4145a9a3b50b61f343fc89312.1772585683.git.daniel@makrotopia.org>
 <20260304-defiant-echidna-of-examination-b1e798@quoll>
 <aagiPIgoosVqsA0t@makrotopia.org>
 <8e685c37-afca-4f2e-ac0a-76a0b060805d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e685c37-afca-4f2e-ac0a-76a0b060805d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_042147_707248_CE0F92CF 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Mar 04, 2026 at 01:18:20PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2026 13:14, Daniel Golle wrote:
> > 
> > Starting with MT7981 and followed by MT7988 and MT7987 it is
> > technically the same hardware, but on those ARMv8 SoCs TF-A assigns
> 
> So they are compatible, I presume?

Yes. MT7988 and MT7987 are just like MT7981 in that regard.

> 
> > the MMIO range of the TRNG to only be accessible from within the
> > secure/trusted land, and TF-A provides a (vendor-specific) API
> > allowing non-trusted land (ie. Linux) to acquire random bytes.
> > 
> > With MT7986 they made the unlucky choice to initially allow direct
> > access to the MMIO range, but later updates to TF-A then also locked
> > it to secure/trusted land, offering the same API as on the newer SoCs.
> > So for MT7986 the driver has to try and figure out which convention to
> > use.
> > 
> 
> 
> 
> Best regards,
> Krzysztof

