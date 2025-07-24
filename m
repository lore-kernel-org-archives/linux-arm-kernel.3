Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C059C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRDrY/4i4vxfV6KqLLQJM66rprUmL0CTshjnTnV2Pmk=; b=uhxEa5nhX8FQnCzYgzgMsnSll4
	G1kIwpDq+rHf4RVoJb7ovSlOcO0DQLrshLQIvGYXyGFf14Ue/Pm03sADU3KLi4IZMBLKNVN+g7agN
	dqXocw+70gUr8I21MKdqmjnVdwqrnzi4qfVKtZNkdCes/iNnrcSpm1t/Ut3APtAUGFy4cmEJgnWTk
	V/PsMVTF82Tnawn4NKddZDnHKrKeJDIFnJ9z1QDowfHJietLipAOof1mBDHtfNgC3+DMaFtr/m8O0
	laB2BEiZvxcbtpwxgF0oWIT48RGRk7nWrRuSG/lf2MJb8k/hYZZh5iNKzP6FPlzafLmh7DNRPyJ0o
	wp/phqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMz-00000007YyT-419U;
	Thu, 24 Jul 2025 13:52:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueswe-00000007Azc-2BGN;
	Thu, 24 Jul 2025 10:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8281A61126;
	Thu, 24 Jul 2025 10:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C04C4CEF4;
	Thu, 24 Jul 2025 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753351979;
	bh=MKTJsXoh0ovoIVsPRZJbybf8oVQe3fF6tNG1svHyD9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F+KOmwgg+z7e6KttvqwjToMUUNQKbMcch6Kaqh7mZiJe+e9MtjQqK0QFMCc/r6Sja
	 p+D1xm97+/1DEirZQdiS8y+/KFaz8D6qlqH/lfgk8mS6gp58TEMqhj6XVq6SYaXY5J
	 zQuYjzsOKaKulq2ezVsbW2oiw0HNwtpngA5XWMEv7MyE5aSpR/zbmzYjpcXTHEcitb
	 TfjwB0SaDiSzB8/wFtEMf3vnCWpMBWKbirWtqS8e6MvX9yNTXf0K3in3uJsMhAoGaZ
	 Tmo1DaoDs2g06Y13IpqoEM1crzlFMx2a8w1h76uWBwcDwvJC1BSwoH7wUiLJemnoiU
	 GobqWa0flpRbQ==
Date: Thu, 24 Jul 2025 11:12:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
Message-ID: <20250724111247.669d6955@jic23-huawei>
In-Reply-To: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 22 Jul 2025 22:35:13 +0530
Sanjay Suthar <sanjaysuthar661996@gmail.com> wrote:

> Fix minor grammatical issues by removing duplicated "is" in two devicetree
> binding documents:
> 
> - net/amlogic,meson-dwmac.yaml
> - iio/dac/ti,dac7612.yaml
> 
> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>

I'd have no problem with the argument that this can go through either
tree if there was any interaction between the files or the changes, but
here there isn't. This is just causing potential mess if either tree ends
up with other changes overlapping this for no benefit.  Please split into
two patches, one for each subsystem.  You should be fine to keep the
various tags given here for the new patches.

Jonathan


> ---
> Changes since V2:
> - Corrected the subject line
> - link to v2 : https://lore.kernel.org/linux-iio/20250720182627.39384-1-sanjaysuthar661996@gmail.com/T/#u
> 
>  Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> index 20dd1370660d..624c640be4c8 100644
> --- a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
> @@ -9,7 +9,7 @@ title: Texas Instruments DAC7612 family of DACs
>  description:
>    The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with
>    guaranteed 12-bit monotonicity performance over the industrial temperature
> -  range. Is is programmable through an SPI interface.
> +  range. It is programmable through an SPI interface.
>  
>  maintainers:
>    - Ricardo Ribalda Delgado <ricardo@ribalda.com>
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 0cd78d71768c..5c91716d1f21 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -149,7 +149,7 @@ properties:
>        - description:
>            The first register range should be the one of the DWMAC controller
>        - description:
> -          The second range is is for the Amlogic specific configuration
> +          The second range is for the Amlogic specific configuration
>            (for example the PRG_ETHERNET register range on Meson8b and newer)
>  
>    interrupts:


