Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRYJNHzRnueu6N1Zy1nhDavbIR1n9mP4+HbV6D5w8uw=; b=sq7cyKZ0yJqEJ5cQD2KwsKzjhn
	eIW+v3/59WhpuK3Vi1WmgcyZRFe4k5nugUI+Arw7pukFH+P6XwrDTdOwDKcxGYT1JaCozMbjw2eIn
	l0U2aTejZlsGrf1R2nJaiD9jo3b1K81i4lwM+yvnYiLaeMLQNZHjT+S89NgFhAQv9Jpx9T4e2laUz
	XpJ7rOF4suFRyKuMobr587imlfeYcnifFUVIud9ORaSBCl9GYocVff/CO079DrBTX/BdsWPLbYaWu
	RBOZ/oo9ByaJv6BOKg9vZRE+gcK2veUq2Hsdjk2lkdeKLJC4gzFFbeZF4+l44vhJrYkLAB04LKKDL
	hMGb8p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVZD-0000000ATUa-16Yu;
	Thu, 13 Feb 2025 09:31:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVTS-0000000AS4R-2fCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DE755C03C1;
	Thu, 13 Feb 2025 09:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259A1C4CED1;
	Thu, 13 Feb 2025 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739438733;
	bh=38I1hCRodY+InrLjRVaigHjIIKw+PjXL6lLJvQekN7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sginmXz6gdKXf7jVIfQ0FNV/ngeUfT/8xmJIzEGm4eWEnBbttHIEwzjevmFvIfpRN
	 Pd+aVA8YKEsxtvkAEIsmRuXcI2XmrfQ9mkiVyqYNu42bQ6Xx+6A33CVQB6BzeWgn36
	 JcAoSYUfAKjtHSWiXjyAzNibfZuwngivq41ju803wH/zi5OpIvQWu0LlpC6Y59ExR7
	 GremGc+JcHlVjDURRnp3PR3kWlKPDxYtxCg6+gLJHhbQ4Y3teq3AcMEyaexQ+uvsPm
	 QSdRe6v/Z6sOkkYI9K8GkLr08MYctWhZx0Cnfzjq508crSSSRD0gcwwL77xFfdwkkL
	 RAX0Sakwu6FVg==
Date: Thu, 13 Feb 2025 10:25:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: bluetooth: describe wilc 3000
 bluetooth chip
Message-ID: <20250213-chamois-of-unexpected-glory-dd3eab@krzk-bin>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-1-9609b784874e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212-wilc3000_bt-v1-1-9609b784874e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_012534_756922_9CFA0B1B 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 04:46:20PM +0100, Alexis Lothor=C3=A9 wrote:
> WILC3000 is a combo chip providing 802.11b/g/n and Bluetooth 5. The wlan
> part is exposed either through SDIO or SPI interface, and the bluetooth
> part is exposed through uart. The notable peculiarity of this chip is
> that the bluetooth part is not fully autonomous: its firmware is not
> loaded through UART interface but through SDIO/SPI interface, so the
> bluetooth description needs a reference to the wlan part to get access
> to the corresponding bus.
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
>  .../net/bluetooth/microchip,wilc3000-bt.yaml       | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/microchip,wi=
lc3000-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/microchip,=
wilc3000-bt.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2a83ca3ad90b26fd619b574bc=
343bee9654a1e43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/microchip,wilc3000-=
bt.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/microchip,wilc3000-bt.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Bluetooth chips
> +
> +description:
> +  This binding describes UART-attached Microchip bluetooth chips. These
> +  chips are dual-radio chips supporting WiFi and Bluetooth. The bluetooth
> +  side works with standard HCI commands over 4-wires UART (with flow
> +  control)
> +
> +maintainers:
> +  - Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,wilc3000-bt
> +
> +  wlan:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the wlan part of the combo chip

No resources here and judging by the driver everything is part of wifi.
Either you wrote it to match driver or indeed hardware is like that. In
the first case, why this cannot be part of WiFi with phandle to serial
bus? In the second case, this needs to be proper hardware description.

Best regards,
Krzysztof


