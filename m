Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7471FA3734
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzLksA8mJvCThQLX71x1j9Gpd7hHqh7AUy4d1Lu+wbc=; b=QVznMbwIpuyka0Xu8CKOzrEYcY
	snwcFVJqDj2SY61L4s5+qgbnPoekLQIspixwZFjk5wHwpTWj45Dhb/ykcrlHDd08qxRrlr5jopZUR
	3Q3YIzRwtZ2kgKd9P5nMR/ErNWaJrVIBe1gVDkHBaAH/DXTJbcGtyabvEuB0cv5DQbe2T2XIfe6on
	qajK9xyvGlMsYdpk/QiGD0z5sSi789l9VZICMmIrVbdIzOeyhl0JTjEvr5zT86tIHI7DfVG9JhRIY
	+Ts12XSzT06wvkT+Ir9Bo8VaL+ycvH9GLslymq2BI5QhBCiHvEZMGqRjR315JdQ+zezYtbBSZ/VYC
	fPEVe6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdVj-000000089Sd-0A0a;
	Fri, 02 Jan 2026 11:40:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdVe-000000089R4-2GJw;
	Fri, 02 Jan 2026 11:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D21C444000;
	Fri,  2 Jan 2026 11:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0B8C116B1;
	Fri,  2 Jan 2026 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353997;
	bh=RIuKksoiIttHYtaOPePhnyywTncoVbvOBkuFklXk5u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2c0+FbjKVU34koV/+tCZSlHrjdvF+OnIeYXbFtqYUNMDfv6alETUBifxxduDWn8s
	 foAxCji/VgTMwIrmlWMesT8JsYZSW8WSxd1oa71DhK0bKJBgvbdw4PQ/PaeEqKyD7H
	 ssnxdu6afTTlGoVR51KE+NAeNYTSVw2fHBZ5DxEeQquM50J1e8AdIIoE7TLE6Dzgae
	 FCqw/AIMYBv4XyjARsTo+jkubBRvKk9Xmteb27tNDfgHUTCqZGYt3bqc2aYr8o6HRX
	 L/g2beYTzb7YvhFmfFK38TQJxPjppDydj+t/IiB8a6zhxc6ael8UFr5mNNfbBCrGPs
	 sekt34Ht9Cs4A==
Date: Fri, 2 Jan 2026 12:39:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	chester.a.unal@arinc9.com, sergio.paracuellos@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	tsbogend@alpha.franken.de, angelogioacchino.delregno@collabora.com, 
	linux-crypto@vger.kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: Add support for Mediatek
 MT7621 SoC
Message-ID: <20260102-prudent-woodlouse-from-saturn-56634f@quoll>
References: <20260101172052.1862252-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260101172052.1862252-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_033958_595735_F1A76C4B 
X-CRM114-Status: GOOD (  15.09  )
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

On Thu, Jan 01, 2026 at 06:20:04PM +0100, Aleksander Jan Bajkowski wrote:
> Add compatible for Mediatek MT7621 SoC. The implementation is exactly the
> same os in the Airoha SoC.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v2:
>  - Corrected commit description
> ---
>  .../bindings/crypto/inside-secure,safexcel-eip93.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> index 997bf9717f9e..8ccff64f5c1c 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> @@ -33,6 +33,9 @@ properties:
>        - items:
>            - const: airoha,en7581-eip93
>            - const: inside-secure,safexcel-eip93ies
> +      - items:
> +          - const: mediatek,mt7621-eip93

Why this is not part of enum with other entry using the same fallback?

Best regards,
Krzysztof


