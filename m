Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E092C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uv1h2Tvk65FhiXQhACDdhpGr88AWy+7MJdT/nSXnmHE=; b=TwUquoXfTWQ9i/KZhh5zPOMOaO
	O/prX8oXleM8TPVabd7pPKKPJPJvL8wsGDBSgdJlMeP6Igl5WiFlB1OSgfRuXTqah5MQk1Fsvlf0K
	eoKs5pgQLl8ksTyO3qG6fcE6/BLiDD4b7ubIQh71eoLxf9ofUSsF08zPV45va9AtMRzaJa64ULWfr
	Ma470fOl22Rt4gtevUrYWyN/1mDJPREZa96S79Lv13EyhTdqV2X/HvV392Ua79uYT38YjbBLovsNH
	NNxfhBzJx1mpzlHqEfNgD+W2zWJFUOrEdrBaxxPJ2E0CkFCLWZF110/VxCWyfizCGl/3zW9Mp9O59
	LQBMuLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RJ-0000000DRdA-0MR8;
	Fri, 11 Jul 2025 01:20:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Ob-0000000DEi5-3LWk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C5874632B;
	Thu, 10 Jul 2025 23:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7CBC4CEE3;
	Thu, 10 Jul 2025 23:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752188981;
	bh=xX1Y0DxEL0262QrqSMHrEjgZLmOO6gChgX6+avkZ/Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npFJ9pss1Ak9vVLoGluAR2E594OevgHB6Dtu3eQAc6H/4R7Jur+PUJKlk5Z6W/iYM
	 ciAKP3hPk+/3Gzr+IWFE814C5cDSDBptvgrWjB1Sfjm5J0VCLUFLS2sQTHbCgyxwbu
	 ydhQACEtbz1CgV5nNe9anBHZbXNq8WDJxeT138L73EqtUUymDLTChix2M0FcU60Ug4
	 fiwphlsr6YMfveeJ7uHZ0Kab0vpH4FbKNVl4kCgoI51jU5t+mvZ7VQpF2yaiTRPiqZ
	 oMd3kc54s/dBARmQTe6aRTn9MkpGi3EWh8e6Z0ujFk2URctyIx+arEfq2B2iSKIznD
	 8+795ZEEvq5Dw==
Date: Thu, 10 Jul 2025 18:09:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
	devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62P
Message-ID: <175218897949.53397.7050209461596746496.robh@kernel.org>
References: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
 <20250710162737.49679-2-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710162737.49679-2-stefano.radaelli21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_160941_859588_23154394 
X-CRM114-Status: UNSURE (   8.95  )
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


On Thu, 10 Jul 2025 18:27:26 +0200, Stefano Radaelli wrote:
> Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
> and its carrier boards.
> 
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> ---
> v3:
>  - Change compatible string to match existing mainline format
> v2:
>  - Add symphony carrier board compatible
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


