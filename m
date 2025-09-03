Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C76DCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v94fhSJslU1H3Wxe60+RJevetmgL7o9TlKQFbvSCB7k=; b=orTBEA0SlsdouGVThtGNsK7JGM
	aEZLq+oAjvm9WFE+758ps9pehRGkiUoIUY5NJcaDPjrdnzIw42nTduvzcYant6hHoUgHPD6eSjsKr
	7LhCZ5dJqCLyGPF7WaGpKCYvLxjnDeUtkNhnIuzxDtXM2JgDPHz81FFbetFa50OxSqjlZSvGOovFQ
	iCFf2G62pii32ZTwLFOafV9LxXbzlogQB3ilCuEO04F0Cvc5y8YKA/tjSQMTbpPpEm8q1uvVDEWUu
	jg5gG1Cqgh4Lh9d50qe+DNEaC3aQuVL1f+X2hkBAEL2755JshN6oNRjI0ezBYY4Hkg4hRzZ1m2a3Y
	9fqfpG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthw2-000000055tW-39z2;
	Wed, 03 Sep 2025 07:29:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthmc-000000051KN-1SMh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84D9160233;
	Wed,  3 Sep 2025 07:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57A0C4CEF0;
	Wed,  3 Sep 2025 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756883993;
	bh=IvjNC842MxY+UMDgGJhsWF+myFJMSct3VEgfMUbeQZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzpC8NcTdV93L+kP5jVNgQ4UCYWOQzmQciejKr4kGXbl54WgEgZ1pSXr7Kaif45E4
	 i9RJZ69FyRGUaeXJ3cHFRwKsrvKePFVsPZYfVWjMkUsSh8S2Ky7z9dDQEqqrSf79aG
	 dzwBAKT3FBl0Q0wuAWlbE3V0YVDyysYmk6dN6c445HEYIbiBuiXCT1ZXjvlBoZvZHz
	 ZsXqyG0eOGvm6C5lByvbTLEBSNLj1wVODOZHWpxg98dD+QcCZha95ghAp1oCJNGFV5
	 PeFB9UT61Pv/iviFsqZVWJfVwGb3nL/j+mDNyqAeme5qmrKhzXEdr7xPo/qJaUI3HZ
	 HwRkZUcx6Lzkw==
Date: Wed, 3 Sep 2025 09:19:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
Message-ID: <20250903-peculiar-hot-monkey-4e7c36@kuoka>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902090746.3221225-3-danishanwar@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 02, 2025 at 02:37:40PM +0530, MD Danish Anwar wrote:
> Extend the Texas Instruments K3 R5F remoteproc device tree bindings to
> include a 'rpmsg-eth' subnode.
> 
> This extension allows the RPMsg Ethernet to be defined as a subnode of
> K3 R5F remoteproc nodes, enabling the configuration of shared memory-based
> Ethernet communication between the host and remote processors.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> index a492f74a8608..4dbd708ec8ee 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> @@ -210,6 +210,12 @@ patternProperties:
>            should be defined as per the generic bindings in,
>            Documentation/devicetree/bindings/sram/sram.yaml
>  
> +      rpmsg-eth:
> +        $ref: /schemas/net/ti,rpmsg-eth.yaml

No, not a separate device. Please read slides from my DT for beginners
talk from OSSE25. This is EXACTLY the case I covered there - what not to
do.

Best regards,
Krzysztof


