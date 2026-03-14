Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D11EFD88ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HN4c/md7ubCwGFV8iB4QQzxgqPerbYJNq+32KO8z7Z8=; b=4P6pnMSVb4+6rQY/HaAtfPFw0W
	C8AUlH01C+OMlTn9O2odQkb6eY/vfxjZuqlKxfLjyswGTPxOe2XhO5S8pdgk5NJzDZopi9cOP5KKK
	8cQtgkVv/8dxAQvXMvxWSYDVtIrPJ1HWiBmV/pXGNFvI2ihHoo2Of5FaEqmnm9hTWvkYR2eg+Q/+Z
	Q05XQDiE1CFqJSFBQVWDa/l1L5acq33FSr8zfAXNNtyTwpGAnLXZh7K0am5ZS3rvLDh+46jje0zGo
	ueleEm3NszfDqm4ViOwJbb9Kmvj8vdASVC5HgYMpzoNmiwxmlc6HQLf+O+NnMAFTzxisxbYqEsC2S
	rnlh+E2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HDW-00000001VHD-2yPP;
	Sat, 14 Mar 2026 05:07:14 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HDU-00000001VGU-31e6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=HN4c/md7ubCwGFV8iB4QQzxgqPerbYJNq+32KO8z7Z8=; 
	b=MpGyM0n68D6QdNiLKQ1JFuuyEnUZ7u9mToS5Y4vXL6GAmMzXQgTJ+dh+7WD1L6fyiDIWx06tem9
	+B3PiDe6OfX4FAf7GkdaEFM9Z1OBhbuKSF+3Yzot7SCxsa5LBAO3TnEH6X0jr0McEYcLTyrpkFbTA
	j/gbE54UZOWYr+GgWJYZFqEkM83fY7PETke6zr8LmEJcuxvwOiA1v6PC4rNfWFZvxtxzYRFXCqMQ3
	9z9aNGDl0kZJ0ybv2adSuhYEDn6MOy0nzQZZdnTLnNP4TbZ8KbUkxCuuETJNoFNLFEliztUkvES7z
	pWcIPX2FfsD/EN/6Kk6auxPb5qWCL8TnycNQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HDB-00EL1R-1V;
	Sat, 14 Mar 2026 13:06:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:06:53 +0900
Date: Sat, 14 Mar 2026 14:06:53 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	horatiu.vultur@microchip.com, Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	daniel.machon@microchip.com, luka.perkov@sartura.hr,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: rng: atmel,at91-trng: add
 microchip,lan9691-trng
Message-ID: <abTs7exXXVPcvULD@gondor.apana.org.au>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
 <20260302112153.464422-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302112153.464422-3-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_220712_775891_203923BE 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, Mar 02, 2026 at 12:20:10PM +0100, Robert Marko wrote:
> Document Microchip LAN969X TRNG compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---
> Changes in v5:
> * Pick Reviewed-by from Claudiu
> 
> Changes in v3:
> * Pick Acked-by from Conor
> 
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

