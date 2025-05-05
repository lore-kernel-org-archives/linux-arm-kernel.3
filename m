Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E04AC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdRs09tMcIggzcI9kc7C+35YrGjM5onpwHm8gQ8dkKc=; b=GqEkhsr/bb7+x6Im0Bi4YtHpMY
	AvncKChGHjmX4HDPexcwHVJEUy6dMNbvwd7m8nVonpNTb4wqedsKxzzA75NKIyk0NTPq2z7wBkPkD
	eUtg7kVO+ZNdhNZzsg/o9Z0LFYs0xcmHuyzLhIklHrcoo+kuytHeBs6yCsbgqsa8RZJK4+SPbAvKx
	+XwyVOrhdSE18N4wMY5UnpcaCNSQL10HLHYc7FU84xTYHSE+YASa5jN0Io91h14soxvBx6vP80eNV
	RKH5e4QwBVT0zW50s72NVo2UYi4Rm9AiJB1RW8WSC+x8OYVXVoStH/g1eX6X//SR0pbd6a6h5xMHL
	eV0hJBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC10p-00000008Luq-1ziL;
	Mon, 05 May 2025 18:57:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0xg-00000008LV3-00sA;
	Mon, 05 May 2025 18:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FBAF5C5929;
	Mon,  5 May 2025 18:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E71BC4AF09;
	Mon,  5 May 2025 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746471283;
	bh=Wt5xzmEhfQ4KWRfJPCRBmDR4TE8MX7M/nR3ZeTi/wMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pm27iqwYJSOXrw2XiaW7wqGFfvb3xfnQ0PrBrHznsyR3bC5+TZpx+JaBEEatSp1bL
	 oRfCYrFdoEDUzREwd3ANLe7QN7l5UdNSODcDW0nGDgGNFXvI6kMf2053wbfIEsAjvq
	 s0Do+Gb+PhLT+K1t/mq+G7qgvDIr1XdrqSQjjy4kjrSXygXPi/YwrKKRqWYwOx6vx8
	 wdq5GGVfxORql6AShuOsaQjmN/WtKQIGx84rqgWgeTzll6DvXWBpRrZ6XravhztFHX
	 zqHpc+u3rq6zOn1wjQYgFBY5fEPA8swkfAp+AgV2v6V5z70gCVjeh2vwfVM6ADMLKI
	 06J+s9JpmWd7g==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb415dd8faso721733366b.2;
        Mon, 05 May 2025 11:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFY/EJOvk/2BzNamnuOeVESxanA2tH0syOt/3MeFvUNtgrx2WHiMstjepsK2kw0ERNFpidyiYjwf3eLZoopfo=@lists.infradead.org, AJvYcCWJ23o6SS60Nlq9btT355Arxxxl1tf47dNg+uOWIrhw5caqmIoITnPpau2nKLXFaX58ossVPczdubKt/H7Q9E9w@lists.infradead.org
X-Gm-Message-State: AOJu0YzuHbyZKOO4W4WL+t7H8O9g/prRdGCITlBxM1s6bKmDuYO5iPLW
	kl2tj74lKcQRKtMJrJQGhPh6kx3D9VmX8h8q/mNHWarkwSRIGkKAq5dFLFpnAZTqoZ8OlJ6ZSxR
	fV8z6fKZbcFThX7QvplHYkatQLA==
X-Google-Smtp-Source: AGHT+IHjgvublUsuE1dFWpoQkQc9HsSmsJu09iwnu9Ap9HbnQ7uoVwIxTMWF4kS0eMV+Ik3r0zR8mixAkRlb538PC7Q=
X-Received: by 2002:a17:906:1c53:b0:ac6:ff34:d046 with SMTP id
 a640c23a62f3a-ad1a48bc9bdmr658682666b.2.1746471281692; Mon, 05 May 2025
 11:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250409205001.1522009-1-robh@kernel.org>
In-Reply-To: <20250409205001.1522009-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 13:54:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4whU81jRLD+N+oiKD-VMSYbrQnSCs-6GfUsk+MNJfpw@mail.gmail.com>
X-Gm-Features: ATxdqUHhyEcylLimQ2AZbABOXm5VFq6XGYrWShT7DDd5Zhp86Og0KeGcT0zw1X8
Message-ID: <CAL_JsqJ4whU81jRLD+N+oiKD-VMSYbrQnSCs-6GfUsk+MNJfpw@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells"
 to linux,bt-sco
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_115444_117495_E4811B85 
X-CRM114-Status: GOOD (  13.78  )
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

On Wed, Apr 9, 2025 at 3:50=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Add missing "#sound-dai-cells" which is required by the linux,bt-sco
> binding.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/mediatek/mt2701-evb.dts      | 1 +
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  2 files changed, 2 insertions(+)

Ping.

> diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dt=
s/mediatek/mt2701-evb.dts
> index 4c76366aa938..e97dc37f716c 100644
> --- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> +++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> @@ -50,6 +50,7 @@ sound:sound {
>
>         bt_sco_codec:bt_sco_codec {
>                 compatible =3D "linux,bt-sco";
> +               #sound-dai-cells =3D <0>;
>         };
>
>         backlight_lcd: backlight_lcd {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index e1495f1900a7..9f53344fa83e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -105,6 +105,7 @@ sound: mt8183-sound {
>
>         btsco: bt-sco {
>                 compatible =3D "linux,bt-sco";
> +               #sound-dai-cells =3D <0>;
>         };
>
>         wifi_pwrseq: wifi-pwrseq {
> --
> 2.47.2
>

