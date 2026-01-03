Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1911AFC617F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVWiNa4LlD/mq5u0ETtKYjcKFCY48LgG2i3vO/zTCo8=; b=DdvtsEcm2WpXoxySR1ecqtI127
	EdLffUGlUtk/t0VyB5FeBKTgKHBU3s8Wl/ozcd7wQDY6mK6fRIOpUalTBXuRjQB5A1Rrn9O/zlubQ
	OhNHz04R9NB7iS1Yiiu/0a0cL+HLY+Jh0TwPwE40abTnuWRNYyJzgiJmdC9CIzIsWeKecwTq4XO2f
	tlLmGaFNf30kH6mhfYZOB1GjFrPCADBLpf+iQqlrtYjTh4rBoIdevoSamy2dJdT11soW7BoyPcFs7
	mB9axcmm0dp1+su1chnFRnxOONR0fZWTjIH/wwI2CmV6a6cW0hzG2eIvUZdg3aug8p3IWAKrR8SZi
	3Zk6MprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2M5-00000009Ori-0fSp;
	Sat, 03 Jan 2026 14:11:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2M0-00000009Oqs-1t7v;
	Sat, 03 Jan 2026 14:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2C28438C0;
	Sat,  3 Jan 2026 14:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3434C113D0;
	Sat,  3 Jan 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767449499;
	bh=mwX86YyiwWbrjWAZfajgtdKslPeAHqJC9wmqoN1Xwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G10aLiLkZdu4eabbRJ039jDAhGApii8n98XPG+kba+Ri1G3TPWScGatZFNto7waaa
	 D/oYTL5boTKgoU4wv8uE8hFXpf3TjaKH/+Hbl4mauDtBTo+P8uwZVL1KmGZCJ+x8Je
	 9+daN0Caux4KU1UEjZTmlh8LrGdAjrvYaOSVezQN22sP394uvXAkyPZEYel/iotKT+
	 IdESCSD2VlWotCiRr3p59FQPDSqwGm7BCo8cgpkixrac0/V4r/PgtOR6x0P9rzC9Mr
	 d9HW/aPXgvjtkwpCnnrFVpcE5TTu4D8Lzv5VVLLmeUcNIFIDa74uQr3BQnXsL2xyJC
	 dylCSN9UGv/ew==
Date: Sat, 3 Jan 2026 15:11:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: benjamin.larsson@genexis.eu, chester.a.unal@arinc9.com, 
	davem@davemloft.net, angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	conor+dt@kernel.org, herbert@gondor.apana.org.au, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, robh@kernel.org, sergio.paracuellos@gmail.com, 
	tsbogend@alpha.franken.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and
 reset line
Message-ID: <20260103-sweet-micro-manul-12eaee@quoll>
References: <20260102155341.3682013-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102155341.3682013-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_061141_418541_68045B3B 
X-CRM114-Status: GOOD (  12.75  )
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

On Fri, Jan 02, 2026 at 04:47:33PM +0100, Aleksander Jan Bajkowski wrote:
> Add the clock gate and reset line, both of which are available
> on the Airoha AN7581.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - introduce patch
> ---
>  .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> index 997bf9717f9e..c6c99c08dc68 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> @@ -48,20 +48,34 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
> +  - resets

That's ABI break without explanation in the commit msg.

Best regards,
Krzysztof


