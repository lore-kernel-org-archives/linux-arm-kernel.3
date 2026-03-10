Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACE5FCC9DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqBam9KZpTPs2Py6PLP178lPJbu48RyNhe+EuAcsLrU=; b=pZkRj9bOESzy0229SU22Lh8yLo
	BoKmB6bGGFYfcIii921BNhZdCityTzTCALoFrn1UgUlYvqRr3+0thQJ1zT1KXi4ZUhcadpZVEkRcL
	EnAEdjN0roJJggn6h/6Uxxs2ISy10AhzUzpX1gJMbeuhgapR6pmtByZxFNlBCqbmyCTPn+4QUEOaN
	gwcyYzTME+C+HjNIzi/T4NNFEAQi8HTm+t+aWvlDpkyT89L0qQAQuxLCnINkZYOmE/WxgjuYEv9xP
	tDd7YUK/UHfQDHM0qeE/K7/l5R8MAK8b1ONUQDzaFUFew8Kd9o2+x6eW+47OI055l1iUKSH7QrxJL
	rZZkNC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsLk-00000008vtV-489c;
	Tue, 10 Mar 2026 08:21:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsLj-00000008vt9-0w0D;
	Tue, 10 Mar 2026 08:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EC6760126;
	Tue, 10 Mar 2026 08:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B86C4AF0B;
	Tue, 10 Mar 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773130914;
	bh=OSpFEb+8JxBVY9j4OB3Pja7xXgXwec+4oG380zPRh7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RedxTO/B6FUWuNCirVgKnpdAkbhRW+yZrydrsSbKiH6rJ4fCepqVobZeyfBXjEm4k
	 cgwzz9pjSmf1nygIOEcZ2LnEWWUGPTLjluc9h2zs+sGJ+zj2M1JQlrnrefpT2kwYyM
	 KKQ/UdAkupvoypw42FfyRRQrgbMvRWOqLr1aXh38U3LXOLVIISIsf8gxi4H3npH7wg
	 dsx/uArC2p8Pp1s7JQdCRKhMACtLjAmLq/2cak2yJdLXB+D40s1dc/bys/MPcC0d9U
	 7U25KwQ6iejRCng1l9Hw/7v/8RmAKlRhENNbOvcgLhYV4Kfo5Kd1oABy12k2Rzkxy5
	 QeYJdP/Kb5GZQ==
Date: Tue, 10 Mar 2026 09:21:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] dt-bindings: clock, reset: Add econet EN751221
Message-ID: <20260310-rousing-tacky-catfish-fcba60@quoll>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-2-cjd@cjdns.fr>
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

On Mon, Mar 09, 2026 at 01:18:11PM +0000, Caleb James DeLisle wrote:
> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
> an additional regmap that is used by the clock driver as well as others.
> This split of the SCU across two register areas is the same as the Airoha
> AN758x family.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     |  7 ++-
>  .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/clock/econet,en751221-scu.h   | 13 +++++
>  .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>  5 files changed, 72 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>  create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index a8471367175b..91abe7716fce 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -32,6 +32,7 @@ properties:
>        - enum:
>            - airoha,en7523-scu
>            - airoha,en7581-scu
> +          - econet,en751221-scu

751 < 752, keep alphanumeric order

>  
>    reg:
>      items:
> @@ -67,7 +68,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: airoha,en7581-scu
> +          items:

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof


