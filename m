Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bGog9284;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZmiTEU4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Gz7En1oK8OrbG/8Czlwpynj8nEeQahmBEOy+4rFJFg=; b=bGog9284a8DSK9B6mC0ITRQsCD
	h5sdmI7p52PL1K4u6NrpxYd/TKfdC8DfxBBAaOHMDLLb2WxlJs9KK+QXotuxFmB2WAJx/BUgrjIXA
	8CbqFAl1EnHrfli0bkcsyHbMWAnnOGdePeSbpx5NE7JxT8ltoHCnGUHkB02+0Mul7tDE48yPqd9fl
	M67Sc5eQaozgmXMoQgorQi5GEVoocTwh8eRrXSLmnvcJhGmxKFsdc9AoMOQ4ctyNQ2MZpor5RHtuq
	hSGjisKYmegDdLipMePFAE0KDZfT5P2Yr/X/FuTwBF4qA3hprMfkRaSo+8wya48Y6Grw17BTuWsS/
	tsphTP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsER-0000000CUKl-20Yd;
	Fri, 30 Oct 2026 19:25:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsEP-0000000CUKC-0eo5;
	Fri, 30 Oct 2026 19:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9Gz7En1oK8OrbG/8Czlwpynj8nEeQahmBEOy+4rFJFg=; b=ZmiTEU4Q4TcxpYKXHIHlrQXt8W
	wdsj4IoKSFCB6MzSwA9c6xHYx8241QpdOroAmqLzwGF6RobBF2DvEtmC97cvW0/R4CT1zRnA1nOWE
	oQnBw3+eLfuLQGaM90cntLhLrY6rH75dmfDLULAXGU08j9jtgmKkyvDXRJhYNysxHWOniarnyT0II
	tD1jes14OFWXVqv64LB49hE/9Wm/bUDz2bIekNPZLtdjuSqUz69BHPjZqYbRr5fuoboJ8yyY82NMI
	ZsHHqBfeQzi/Y3E5TGBxNlBlnZl3VM7s4uPaw/QNZoanlhGbl6A5iwI1GR7ZnViwpWKjsZBfAD1iL
	JStRZN+g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Daniele Briguglio <hello@superkali.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Fri, 30 Oct 2026 20:25:31 +0100
Message-ID: <22143920.0c2gjJ1VT2@phil>
In-Reply-To: <20260907122406.1862398-2-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
 <20260907122406.1862398-2-diederik@cknow-tech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_122541_197377_A8F5D11C 
X-CRM114-Status: GOOD (  13.33  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Montag, 7. September 2026, 14:22:43 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Diederik de Haas:
> The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
> Add it to the NanoPC-T6 list.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 81744fbee98a..aa828ee60d21 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -398,6 +398,7 @@ properties:
>            - enum:
>                - friendlyarm,nanopc-t6
>                - friendlyarm,nanopc-t6-lts
> +              - friendlyarm,nanopc-t6-plus
>            - const: rockchip,rk3588

somehow this seems to have slipped through the crack wrt. a dt-maintainer
Ack ... maybe resend the series?

Heiko



