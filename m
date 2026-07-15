Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04970C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2kRxoCAum/25lk+JMgZ5Et4r6PioAkR1hFgQluxBjo=; b=lkRY5UBCJUPCteJv7eEdbdPVek
	Hxf6QCfLyIN5o4CFdoyyGkHxNW4Bt1tkqBJNoF41fDQ5HLFnZ58M8AEvxPIqBjJYeSDcIDh/HtnVJ
	/EBiMPcJ1010/I/kt55O5TEJGVRsyOZ03Eu72IaXj4z4BLizhiVhuwzgguR0qoSZjRHjeSS2t9lb/
	tABhYaI0kmsQJ0Mhm4slkWO3oa4zMUx9c8f/8kDNB0IftRZfC/L3Wq+GsMS7uRU8gxkoLnTsSMarY
	4AZob4VDsMiDBeDv/dGZupwB4+O5E0NzDJofpGcpQo4AqHi9UhFYjmVwFUQrgQ4h7zbRh/D2IVKmN
	vs+eu8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Lk-0000000Fn9U-09Bp;
	Wed, 15 Jul 2026 19:32:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Lg-0000000Fn8s-3iGO;
	Wed, 15 Jul 2026 19:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=K2kRxoCAum/25lk+JMgZ5Et4r6PioAkR1hFgQluxBjo=; b=nCrsCUz9KVyqdkiPlRd3mu0BPT
	BY/lltifM6/ZbtqRxSSVVnMfwnl35jU1PkPGYv8A+wbOsLSpMRK/gb5sCfaHkhKsLqnEVYDUgmpNd
	5uQpr/PPok9rRtziKGPHpBUZ8W3XMUksi8/X8IePJZZ2oEaLTHHQ8RMRSqiCsYhAR3dCRgd/+c4iY
	57tkbVxfBWJ+8jYeCmFop9LlFXC0GOorAfeQIyY/XzyzbdKrtmZyo1kL5WaGTFDbuoywDiBHRTon7
	r4AfvXEBr55f9k89DnejsBRcgAWYPmXHtT/kKU+J3OYevOpTGz8abQTlmWkU/i+utCoaoWxcIjRWf
	9rr15+0g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Glass <sjg@chromium.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-serial@vger.kernel.org,
 Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
Date: Wed, 15 Jul 2026 21:32:47 +0200
Message-ID: <15791133.tv2OnDr8pf@phil>
In-Reply-To: <20260714132035.v2.1.c1d92213393f49330ec14d0c670a802181b4fcbf@changeid>
References: <20260714132035.v2.1.c1d92213393f49330ec14d0c670a802181b4fcbf@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123252_920896_7AD42D94 
X-CRM114-Status: GOOD (  13.02  )
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

Am Dienstag, 14. Juli 2026, 21:20:36 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add the compatible for the UARTs of the Rockchip RV1106, which are
> compatible with the Synopsys DesignWare APB UART.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>=20
> Changes in v2:
> - Split out into its own patch
>=20
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 49f51b002879..c0d0524458c1 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -72,6 +72,7 @@ properties:
>                - rockchip,rk3576-uart
>                - rockchip,rk3588-uart
>                - rockchip,rv1103b-uart
> +              - rockchip,rv1106-uart
>                - rockchip,rv1108-uart
>                - rockchip,rv1126-uart
>                - sophgo,sg2044-uart
> ---
> base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
> branch: rv1106c2
>=20
>=20





