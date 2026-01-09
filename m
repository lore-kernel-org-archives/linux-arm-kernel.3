Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF71D26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dh/vK8xe3zPatuuQ1IGcsu4BM9M6sSODFR2WoCbzXDw=; b=dMslfuFafFiiUAhNzrHdL3/eT7
	u8PpLMGWxzx1ONLwUXZzZNtLjdvdvexpEbWP5X9n4slBIQ3WeA55b9W+Glr19OFtjjKkZ8MjFYxhi
	M6STmMV+ZLtN0H6riE75rebjwfSRDiHN3hspf6F0uxCebIP9wBR4fmiTDNEIzgsSC1ma8fkpEaYBh
	pRUqGWRqspoC70hgH2yZK1XnDen0fxubyeioXuSFgej5V2VgR4GORVvDDvUXZjHpb08COEQ96elb1
	54xGJorAelQUIaXsDV5J7uxYXV1WgmoXOwCoL4JU5YKyU4ODjGjhyOKZm115xcdvHRYhAdbAg/eD2
	Ae/sn9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHjS-00000002uer-1UCu;
	Fri, 09 Jan 2026 19:01:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHjP-00000002udw-3rZT;
	Fri, 09 Jan 2026 19:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dh/vK8xe3zPatuuQ1IGcsu4BM9M6sSODFR2WoCbzXDw=; b=B+SZyvIallOxPNX4D2N6YceP71
	3Bv1hSnZPUWr1GE7gI19FizzWtp/F0XC37W/vwwfYmH0qeiSKQkNXnAzHq+nuAlRnqiIvGgA0Ex9H
	s48rNPkrsGMTLcUs5mg4PF99Ek5CrYaoDN9CoZWP6k3jUndng8QmBiECXSfzBwe9ccT1Dg3XkHtma
	8V03lF1CrYhe4kHKh55iybAcRQQr9qS9bxN2axEzeqBjyZBowP7XccL77aCNN5cRP+zvA1YgV4GzG
	nvPV2s8BzIucclxVPLoyVBvdjzAgBWK2x/nDjoFFcJOtOP+TgfwrELIykIGouBLg5xAU+l3+T9a2U
	UTfddRdQ==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veHjN-001fbn-80; Fri, 09 Jan 2026 20:01:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip-spdif: Allow "port" node
Date: Fri, 09 Jan 2026 20:01:05 +0100
Message-ID: <4963354.V25eIC5XRa@phil>
In-Reply-To: <20260108224938.1320809-1-robh@kernel.org>
References: <20260108224938.1320809-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_110108_089386_A9F0AE1E 
X-CRM114-Status: GOOD (  14.22  )
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

Am Donnerstag, 8. Januar 2026, 23:49:36 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Rob Herring (Arm):
> Add a "port" node entry for Rockchip S/PDIF binding. It's already in use
> and a common property for DAIs.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml =
b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index 32dea7392e8d..56c755c22945 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -70,6 +70,9 @@ properties:
>    "#sound-dai-cells":
>      const: 0
> =20
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +
>  required:
>    - compatible
>    - reg
>=20





