Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE8ACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSGzI0ze77JnCQIrDa4/8GlfdDp7U92DagUlyp4iUHM=; b=Ou5OG5w/v+jOgVNUkf7WrpJkfz
	eMYeOj0fkkmgAOhSjMJBeMbgO1SeSZqtLK83plSYGgR2PKrKhGvYdnO6abgivbEDGdD94HDS1bJNM
	H9lPiNNnqLL/CHGNsqlLzLlTfCQEunbiWpH0aNSTGkn0vRUiUi/SrDQJfYcC6qmvVt2J+WVcMYZAf
	xAZudL7j30DXisEvWvD1Z8Am/42TKDjrHAp+O+SIIG0P+h+iZwYsi7dLe7Dtd0OlL94St2UDrZsBM
	fzyPw5fmlmrId7myqSgNRk/jHfh/yN3GpqkqV/xe6u47xNgCFH3b9fnK4ZJRuJOlgq/JAcxLUu1n/
	czttC1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtIx-0000000FZSx-2gZ2;
	Mon, 17 Nov 2025 07:05:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtIv-0000000FZSL-05Ox;
	Mon, 17 Nov 2025 07:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 525E843F19;
	Mon, 17 Nov 2025 07:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765EBC4CEF5;
	Mon, 17 Nov 2025 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363136;
	bh=iU8ROMk83jPncCljG0G/Fsoi2HDIAUbVt2VmcnD6plU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zmf+GQm0pAZ6z6C3arkzoxE5KbyOToef7Sp5DndQnxXr8JmQ3033UwODfZZpK7eMG
	 hNH2jlwIuNUC5NnJDZINgZJkjsQJmjVDQrUIWEvPazC8bT+gOyaYKNFP8Uis24UXEt
	 mU5oJ0PrmJNp25ZaImcMpp9pIDc8xskK7aEelL5VGWSuUeOnhVqU2YCiwbVsYM36cB
	 +17Rqg5eybYkDTX3XKBekgImKsuhhWCgQs0k0isOYITGYUfeEsHwvLyJGwVn6IGefN
	 4doh0ptX0oiLvP/wADeR//qwwzH01kT6exkg/8xtX7yON6lMV/FrtXhlnhvW0RUQWm
	 qytLrxDJMjTIQ==
Date: Mon, 17 Nov 2025 08:05:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
Message-ID: <20251117-faithful-unique-millipede-d8bae5@kuoka>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251116134943.447443-1-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_230537_083387_608C1A3A 
X-CRM114-Status: GOOD (  13.14  )
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

On Sun, Nov 16, 2025 at 02:49:43PM +0100, Kuba Szczodrzy=C5=84ski wrote:
> The sun4i TCON needs a reference to the D-PHY in order to support LVDS
> on Allwinner D1s/T113.
>=20
> Add phys and phy-names to DT bindings.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830


>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a1=
0-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10=
-tcon.yaml
> index 724d93b91..52589341f 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> @@ -115,6 +115,12 @@ properties:
>            - const: edp
>            - const: lvds
> =20
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: combo-phy

Drop phy suffix. Can a "phy" property hold reference to something else
than phy? You don't need names in the first place, you have only one
entry.

Best regards,
Krzysztof


