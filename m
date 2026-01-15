Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAFAD44C71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eH7mxwlVEDzrLl6YON9CWnZg8zdeLSZefrHJlEUyWu0=; b=0+DMN6rzIRitwGvBdkSgCEIYWf
	PzRAiF6CoP6kKHFMzLiIM8D3BDmshnI7ZToqTr6yurmq7u/WFzEBZq2GW1df0q0MmgLe/5o6lu9BE
	zbFIFmi060CaW3q4dFOI2KPvSY6ymrsyFntbl84JKKcfDLDzmkVM60QoRLgNSXWyHR41JLPjkRhPU
	N7hY13berzQmJqECoNmvoQzswwFdoza2YAG33BTR5KXfyAfJAqB2o2DT0eSDUc57fScBNClQH9tOa
	lXcniJdw7/nIwtrTHQCSsvJGTLIhycvzw2Apan0uV5A7nfUophC4IMG3Kg2+fN65bmkAkDn+ZX6Bi
	4ce0t5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPpy-0000000Cdbc-1okn;
	Thu, 15 Jan 2026 16:04:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPpx-0000000CdbO-2FMF;
	Thu, 15 Jan 2026 16:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 017BC6001A;
	Thu, 15 Jan 2026 16:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AE8C116D0;
	Thu, 15 Jan 2026 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768493080;
	bh=VE6kYNx2SzH/A4QC3j/Bhcms/BhuO8QMuFZGjQwPbEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHyLs57TSHDpYyYbKDaDMg1CidjvBMEFp/7Jsveo2QSS9LK1kzLiE5DorVFQSPiZ4
	 DXUbk1hcbJ5KwXXTMRsBGeILs76xkch/Y6zFQJ1tdg7xV9SLRUaD7woPqzbhqgM/BJ
	 g2VuDCUttvglZpVIDI8nzcJ8ykbQ+vIhuonDGvefQZ//oasfnNkOuD6jHav0SHdRTN
	 F+JIlH4qdeRsxRHoxUGqSsmU6yufACBQ3aflDXhPbaSAGERVaD8tCunqLD05dF+ClX
	 FBCehTGB59H7UL64x5Q9Hh5kjUHAYnri8bmSkoMqOUwU17JCi9OOB7/E272AI7rUDh
	 55QJitB1P/BEQ==
Date: Thu, 15 Jan 2026 10:04:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: airoha: npu: Add BA
 memory region
Message-ID: <176849307902.695520.7167171864091079229.robh@kernel.org>
References: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
 <20260108-airoha-ba-memory-region-v3-1-bf1814e5dcc4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-airoha-ba-memory-region-v3-1-bf1814e5dcc4@kernel.org>
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


On Thu, 08 Jan 2026 16:05:07 +0100, Lorenzo Bianconi wrote:
> Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml  | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


