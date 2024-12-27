Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF5BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6WB5JUsloD/FmhTagrbMirTrg8bECOAoNa/QuazrVI=; b=WFcLnQFnvA3ndihsHcRvMRm45a
	hx8Z6VdUNOK3z7PfBqbm4W2wDt0BwEoQGEKxp7nTLXGLK+Fpj4oe//ITbtD2G/9vOz8uZetinHJkX
	puHYgRf9LY6tEr37fseZS1AxBLd1CR8FfeicH1ZvX+vmU/xWtXyKy1QXcu3sMgmJ9GU3dC1xMXW3v
	sf8pOWGA2WMWKkl61/ZGFjHhzR+yBlqYzdOWp+pRFg2414YqZriRo8Kgkkkg51Fhu0ABZFa+UNq0Z
	LR5XqCOov5CgRibYrun2KGHQ952I0A1FykLFse9vtuWiP4GIOagjpfdXwPLGjPdHr2RPVhYBncyVF
	cnAGoWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6Bl-0000000HR9S-1Axo;
	Fri, 27 Dec 2024 08:59:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6A0-0000000HQms-1BSJ;
	Fri, 27 Dec 2024 08:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 109B75C621C;
	Fri, 27 Dec 2024 08:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88229C4CED0;
	Fri, 27 Dec 2024 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289851;
	bh=nOAawsn1brLm/z9JCvu8un0aQoCK7ypk8m80UQT6TbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlEK0OA7H2qm3i9mh4kuTT1gT5JInQQPrrHE129Nke6tF7m37t00ZlsqWJefP/MRZ
	 W8hTZAktgNrgGZ2k8OrHuQr+FLbUvjRsBHBFJUOzAhIIuqDRrj0cA0og+Sfyts00fb
	 LYKbZxgOhkjTg79yryhbrJt/wCUe79yPF7ePGWAOjUFirbp5C9XMA5eCb0Whs4wuqj
	 5j5bBAjvNdHyRBHZvgDYBPZfUvPTbl0ZjBXRW/a40+3iyyKoD2xqLjYSY6XwykzL47
	 UWbpLKIw0dUhvdJ9IMv9A1Mi+7E7fy+dY+zBd5RCa53dZDRS/3pNTftgPtiwV/GUju
	 +rwgmDaa/9DEw==
Date: Fri, 27 Dec 2024 09:57:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-iio@vger.kernel.org, 
	Detlev Casanova <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <jic23@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: Add rockchip,rk3562-saradc
 string
Message-ID: <5gq6yd5kwu6xhbuhrg5nmgl3llgkrqw2qvuschj5yjctuiqzoz@p6rol75kvrfc>
References: <20241224094042.3816483-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094042.3816483-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005732_368612_CF00BA1C 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, Dec 24, 2024 at 05:40:41PM +0800, Kever Yang wrote:
> Add rockchip,rk3562-saradc compatible string.
> The saradc on rk3562 is v2 controller, with 10bit width which is different
> with rk3588.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> index fd93ed3991e0..da8bc6f50a32 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> @@ -16,9 +16,11 @@ properties:
>        - const: rockchip,rk3066-tsadc
>        - const: rockchip,rk3399-saradc
>        - const: rockchip,rk3588-saradc
> +      - const: rockchip,rk3562-saradc
>        - items:
>            - const: rockchip,rk3576-saradc
>            - const: rockchip,rk3588-saradc
> +          - const: rockchip,rk3562-saradc

This makes no sense - why suddenly 3576 is affected? Nothing in commit
msg is explaining this.

Best regards,
Krzysztof


