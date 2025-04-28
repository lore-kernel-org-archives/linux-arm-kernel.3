Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2B7C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMdoGjyTlobaS/cZQaYETYGQto65IekcOguBZnPcpIA=; b=0rGNUTbnk9bBXX/7QnxjwjJyQY
	JGdGLaJqS3cv35p3Z/cc3IEyUWv56OwbG8DLo92AICxwx2ZBbis+dmQRuLR5QLepWeU6iW7rC6n9F
	6th0rBiHuRvL3C5jP+WLzZvdC4pVPCE554hZe4nqozQun+4IoXTpcy2q2roM9lybr/D7Dx2xriqpc
	RtNG9pk4uSL3/FHTEwaZHyQwDUdlnkjE+bGicNDtz9rc7S0fZRs24s9KibwGekFl+pTJnJiXJgERA
	WHL/G2NvClCYyaWE8sS0WA2S62hXP1FTcX9UhAdiaEXV9XcnzejrGAN9m6pFtRIGUN6i+D3Sdla9T
	8trtmzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L3o-00000005hfA-0g1E;
	Mon, 28 Apr 2025 09:46:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jqc-00000005RD5-2rO1;
	Mon, 28 Apr 2025 08:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F67E6115B;
	Mon, 28 Apr 2025 08:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50208C4CEE4;
	Mon, 28 Apr 2025 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828897;
	bh=ay1sGqMLLXsxFuARu/F9cw+9JCB2xo4TRuqASGpOyn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJVNyZQSz2Nv9WHNFl0z/dkO0H4bi+6+KUIjeGJD1mE9fWtjmrkqexNOVqJp1RMU7
	 2MIk4RqL+qcgt5OF/qPh7xzOvxiBNLwHbgLWEpv6wImGvhPjNBvvsViWWKXTw16nfI
	 B73eRUKWFn1fEn3TCip0sz5KxpM8MNx63PnMAkbGhiIqN1TU1RjFnIFiOTFkgvuQuH
	 nI3Mx4e78EftMUh/3Ozb3zEaAlgfqy9mm/VI2dK1CGCKx1iEatQXss1jxSB5RsxjWO
	 1PCgARg+twom2ixOA9ks0+tiPj8mmdRVB+A7ubWAYabPhyt+hGzj1hpfIg9PnSG3fe
	 Br/IKb+Ucc6yg==
Date: Mon, 28 Apr 2025 10:28:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Serge Semin <fancer.lancer@gmail.com>, kernel@collabora.com, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ata: rockchip-dwc-ahci: add RK3576
 compatible
Message-ID: <20250428-vengeful-outgoing-pudu-b19b8e@kuoka>
References: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
 <20250424-rk3576-sata-v1-1-23ee89c939fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-rk3576-sata-v1-1-23ee89c939fe@collabora.com>
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

On Thu, Apr 24, 2025 at 08:52:22PM GMT, Nicolas Frattaroli wrote:
> The Rockchip RK3576 has two SATA controllers. They work the same as the
> RK3568 SATA controllers, having the same number of clocks and ports.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


