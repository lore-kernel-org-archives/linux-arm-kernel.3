Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269F8C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w5NT48wx/0aBVuRvm9KEpkK3uGPxkWdWOwg4cuAyEs=; b=Z160bd5lhKhEWCIfUf4dECCzuz
	YQJrRZ55SVLuTOhMicqR1IqBojg4qbfpDZjg5F1dFI1whzTuV7WPgvHpmMuxw+Bgo+2c3L8oKADuU
	TNTe5L/+3W0AvQB/KrdduKGE5VhvEIVh7v/wX1YomwahipDXZoZGOVn+6GQ0KvqVwzud+rT8G6AAO
	MMVx+cPjfTlKLiVLFqZfrK9E1/R1PzEsR1iLE9fdDPIvTsQ4X2GzkogW0qMsDZYAUWs3bvMXmLfEU
	X7W+OSCcTI1+glWHGuuXQqe87E6SAG+FPzMxPqV7NFMaEV8EcpS7jbBDbz5SCygO3LMk5DBCJz0UQ
	Nw2FNArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt03a-0000000A9Ns-39zZ;
	Sun, 09 Aug 2026 09:43:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt03Y-0000000A9NN-20dE;
	Sun, 09 Aug 2026 09:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8w5NT48wx/0aBVuRvm9KEpkK3uGPxkWdWOwg4cuAyEs=; b=aOdAsLCti6rJxfN1ry8ER+vdoN
	aQFot3rF1t5ihXUUMb/Q3nZPaQcoQLkOhczZEErcJ0GERffpHj0Clq2mJBJYMm09ysPnFQTbi2ZY+
	aqxkE0j5I9sTTERSNdi1uZK+lAROrXhyv90dZzg2ATt7nzojptcSGLduxCsxJXJASev8U5KVqNdmC
	x7Ol0YgYXRGhcoWfHB8FR49d0Q9xMeDbfcjP7Mc4M+ssSKV+5ud7jCUNp9aoyKcqi54ERktlEi4Er
	GTyBZEk4MRgJDaa9z3p7B9Fb61yuAOjyakjFVNz0dSZWXc+cq3ci4oO7NkXEFxwk/u+Qwk6TryJhM
	TLb4tViQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf
 property
Date: Sun, 09 Aug 2026 11:42:47 +0200
Message-ID: <5555671.NgBsaNRSFp@diego>
In-Reply-To: <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.2.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_024300_547157_54CAE408 
X-CRM114-Status: GOOD (  15.03  )
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

Am Mittwoch, 29. Juli 2026, 15:27:26 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Part of me fears what next abomination hw-engineers will come up with,
but I find this solution pretty elegant to handle that per bank pinconf-GRF.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Add new patch for the per-bank IOC reference
>=20
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.ya=
ml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index bdd83f42615c..774e9c7de606 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -44,6 +44,13 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node managing the IO control registers
> +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> +      its own IOC block.
> +
>  patternProperties:
>    "^.+-hog(-[0-9]+)?$":
>      type: object
>=20





