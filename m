Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49499C83030
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 02:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsEV695+W3Ktwe+glBrUcXpNvSeB5zOvPCRfQ1bX6vU=; b=p+UHnDIMs0t3GtxybiHEv+pVZg
	ypUzvT/RGhF8lUDM7CCc0jHJqvpqQLplVpdXf1tcnld0TZvUTcOvuZZXmadGqqLy312w6fh6Jsc3b
	oO9x0O1KB93t1i0Zhcj8Ievn219bCKxzfxWnzDoPBvHp4kSmyrNEjP4mavClM+DpBQhTXz2nvcLfa
	Y3l/jdGuA1tlJ9tqWS3sK0Di892L0fTjXyX8X2hLuFCEZBadfWSxH87OyTTOwrt1P4D6DfegBb52C
	OpRuQVHMrChl7DPCtWvUCPFmclzt/L2MFymyfAcfoFmcYVxvX26D3BSb2ZkARCwLWYCCW+heIncch
	RmpOsWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyDA-000000046CI-0CUr;
	Tue, 08 Jul 2025 02:37:36 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYyAn-000000045tm-0EPn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 02:35:12 +0000
Message-ID: <69687d11-e872-45da-a3d1-f91ea9dfe5f6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751942102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsEV695+W3Ktwe+glBrUcXpNvSeB5zOvPCRfQ1bX6vU=;
	b=ZeNYjb805OB7xPo0hz92zFWbjjSnTpEbrCvz2m7vgKsZdhXi7IDBT6yQ0cgrXhK7b9kw2/
	jHxhWK3q7GVeBA1rvUq6mipqg7NRpGnm75oKnsErdootuFdw/9NaWGOvjrrp0Z1I8me5Pq
	qR9LUOsTa1rNNWcy3jjg+Q8/i9GxfmI=
Date: Tue, 8 Jul 2025 10:34:51 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems
 to iommus
To: Matthew Gerlach <matthew.gerlach@altera.com>, dinguyen@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_193509_237142_0E25E589 
X-CRM114-Status: GOOD (  10.37  )
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

在 7/7/25 11:44 PM, Matthew Gerlach 写道:
> Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> implementation of the Synopsys DWMAC.
> 
> Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>

Thanks,
Yanteng
> ---
>   Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index c5d8dfe5b801..ec34daff2aa0 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -59,6 +59,7 @@ properties:
>         - const: ptp_ref
>   
>     iommus:
> +    minItems: 1
>       maxItems: 2
>   
>     phy-mode:


