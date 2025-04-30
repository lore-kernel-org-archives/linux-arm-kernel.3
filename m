Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51884C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSb5oodn5uJJf7sWWAqxK8ykhxJNSoaEjtj7JWvmxOA=; b=cbXxmdkNY35Pct6od4Ffl/numZ
	Iu3b3U//WZo8RksOni8wyZsADF/1Boog/ezoT8EFrWogImoknRJqISkQm1Hr4b0BAZkxI12ThRP5d
	hMf1UgbDTYoHfLHxU5pWch35HcnZtGH0SfBOvN1xJ034wfhMcWYmVaAJpU3aePnOzQCPQRNs46nZU
	ZOVEVnrYQawlNEhOMAMymg6JhMfcMr7jopFIxfx8LlnejHIQjElyRgfCVg7Nb2gJmjfMJuCnA5xBk
	aHRMccKXVHU6jCF4cN2IqEvujUKv39Q81sGgT/p6NqjYgrL/Tjy4JdATc1l7lC6zj1/5qkZAiN3VD
	ElCMQSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA54f-0000000CbJB-12ZG;
	Wed, 30 Apr 2025 10:53:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4eV-0000000CWTd-2fob
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 017A95C483A;
	Wed, 30 Apr 2025 10:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63953C4CEEA;
	Wed, 30 Apr 2025 10:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008814;
	bh=5S9/3Cg3zb0MLDpEzZB/1IkVH5v3jhxJVRqkX8S9KxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XamfUbB2nzUFIt1CdO7w6/fo7KeVY+bm/23pzrF6jyDFiUYDH2my85ZglLFDGHjnA
	 BCEd7KgzlpkYX5nxDPVB3dYH7R24PIwHlTPzTKTGHuO8P5wEBC+mAKJ6Qp3+b1BPg8
	 gg1Ezd37VscW1RdpaMlgvofeBpQw+LraPWHyRnjqwM2D0aG4S35ssbyyTeE0kghGwH
	 OTPzsT/2+nc4U0HFv+Ldyk2fWsLpn+i7f3VoSr2S5420CL+TuaSoJ2QIxcbku/Q1rE
	 pgI58zZpMEp57tXGkjiVIhLtL0adU9RA783eE7IxEBd649ZigrJNBFEaBh/55kdG45
	 RSY7C7o2RtlEw==
Date: Wed, 30 Apr 2025 12:26:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, 
	a-chavda@ti.com
Subject: Re: [PATCH 2/8] dt-bindings: dma: ti: Add document for K3 PKTDMA V2
Message-ID: <20250430-imperial-masked-coati-e35bdd@kuoka>
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-3-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-3-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032655_719078_C609FE62 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 28, 2025 at 12:50:26PM GMT, Sai Sree Kartheek Adivi wrote:
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+
> +    cbass_main {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +

Same comments.

> +      main_pktdma: dma-controller@485c0000 {

Also, drop unused label.

> +        compatible = "ti,dmss-pktdma-v2";
> +        reg = <0x00 0x485c0000 0x00 0x4000>,
> +          <0x00 0x48900000 0x00 0x80000>,
> +          <0x00 0x47200000 0x00 0x100000>;
> +        reg-names = "gcfg", "chanrt", "ringrt";
> +        #dma-cells = <2>;
> +      };
> +    };
> -- 
> 2.34.1
> 

