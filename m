Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC43C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCUJY1JUxKYEGMhRrKMDXMf1XwkKnf9VyfeokZhRHik=; b=JMPM+X0EmFIdhF2kuYBlBZwKlt
	4gAV+8g3JEahqKddU+vCO39ccIQSsLISWsxBAbiJ+pUXkpqZrzeoL3PwKtyZT6/godEP6I2Ey7TlS
	YkgL9eU2vN5TqFHa7Bhh9xX7wfjR/CVSgePOK/ZMsn0doEkROVd71R6YI11QJQhcA/KHJPpzEOww5
	zjMrYiTXw6U7KBBoJX2t70SPCeGGugWi21UeLMbBwwVTqZ6bN5hE84dYdFnPhKWOhfHEosWv9AO6n
	rUe99pyfMZ8NdiYo8tqhDD3WEioW2haaHa9qcq3iarzrUlkkad7I78vlQeuAfZVim2c1Ujpqqfa/4
	RzEzJ6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udncR-0000000Gwgi-1cpW;
	Mon, 21 Jul 2025 10:19:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmva-0000000GpHD-02UN;
	Mon, 21 Jul 2025 09:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 717E743E0C;
	Mon, 21 Jul 2025 09:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C2BC4CEED;
	Mon, 21 Jul 2025 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090521;
	bh=X8v0vyphKABw6mn9MwF3K64kGeZMYpZRS3X8znvpDDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4khWPmnVZphjAbFKboI0FSmd3tz3XjB48JFWgQMxBkdhtRUqkLuPZ/WQM+YtW/Sk
	 kvnT4Zbi1WHSjCOm+0CkRKFvOIRLJUPmbZjXpLpim8de/LSP0U/2wkiY4NgSCh8Dii
	 rQ5f+nx2gWPmKs8InPBNUpBAB6/iMExS1HUuhuUguy8qeMiOCB3eYU5l8ORSDZdzuA
	 9td3HTwLrd3thWxQ/LhgV6u9OSkjoZlMsGM93Zk74GSDZsUi4cxeysomfMlvjiF4kD
	 SJjlDSvyWOOyEWFPCUQcla2SqaPzksJyBpIe2FQrW9ThzvInu6+oeAzLfebMclPQ9F
	 +qRQF7pqt3fqA==
Date: Mon, 21 Jul 2025 11:35:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, atenart@kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sam Shih <sam.shih@mediatek.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: crypto: inside-secure,safexcel: make
 eip/mem IRQ optional
Message-ID: <20250721-utopian-jumping-yak-8cc53e@kuoka>
References: <20250720174903.1321533-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250720174903.1321533-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_023522_092135_99D9B68A 
X-CRM114-Status: GOOD (  16.28  )
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

On Sun, Jul 20, 2025 at 07:49:02PM +0200, Aleksander Jan Bajkowski wrote:
> Binding for this cryptographic engine defined 6 interrupts since its
> beginning. It seems however only 4 rings IRQs are really required for
> operating this hardware. Linux driver doesn't use "eip" or "mem" IRQs

Are the lines there in hardware or not? See writing bindings - they
exactly cover this case.

> and it isn't clear if they are always available (MT7986 devicetree
> doesn't specify them).

You need SoC specific compatibles which will narrow this per variant of
the block.

>=20
> The hardware reference manual [1] for the EIP-197 IP core only defines
> ring interrupts and a global interrupt ("eip"). Ring interrupts can
> optionaly be routed via the main interrupt. Role of the "mem" interrupt
> is unknown.
>=20
> This deals with:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000=
: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too s=
hort
>         from schema $id: http://devicetree.org/schemas/crypto/inside-secu=
re,safexcel.yaml#
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000=
: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
>         from schema $id: http://devicetree.org/schemas/crypto/inside-secu=
re,safexcel.yaml#
>=20
> [1] https://www.scribd.com/document/665924595/Security-IP-197-HW3-4-Hardw=
are-Reference-Manual-RevA
> Cc: Antoine Tenart <atenart@kernel.org>
> Cc: Sam Shih <sam.shih@mediatek.com>
> CC: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../crypto/inside-secure,safexcel.yaml        | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safex=
cel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.=
yaml
> index 343e2d04c797..97af96bfe5f6 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
> @@ -26,16 +26,23 @@ properties:
>      maxItems: 1
> =20
>    interrupts:
> +    minItems: 4
>      maxItems: 6
> =20
>    interrupt-names:
> -    items:
> -      - const: ring0
> -      - const: ring1
> -      - const: ring2
> -      - const: ring3
> -      - const: eip
> -      - const: mem

You just miss minItems: 4 and no need for all the rest.

Best regards,
Krzysztof


