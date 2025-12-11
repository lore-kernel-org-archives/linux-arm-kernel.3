Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D463D43344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONbXaRWBXX1LTRSqFq8fMOHEMVLQiTenj9LKRYRLWuE=; b=M9AiGjNVY6gXRFPbI7AtABAf3s
	PbKdU668muXXbvpSnT+UB3f7wTsABrldY3EYxETDLJ8Cg5OQZK93lBdbmdTnFxF9z+/Flti6ldydB
	FrdcHvwd374UpMobeXn7cYzcy8bfPq1jXF6AzZgzdgkf8eWn8hwiRf6TVFPqlKDAGUnq581GymeQK
	PtOfd/MUvXDadd7wTaLbmCrKjtRAaAQ2N5TRt0STeLK16kDTbWGypmUK0UWXkNPfcZs8COJ5dYkYH
	UEWpwXYccr2I1lqW66jgz5k30DM/t6pwjA48RI+gUNOkfNKsmwij2dGIF7J7s3ISNDPCS6qpB3us3
	hLmfmDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmnb-0000000HBlI-2D9H;
	Thu, 11 Dec 2025 19:58:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTmnZ-0000000HBkZ-0waq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 19:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0DAE4012D;
	Thu, 11 Dec 2025 19:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A12DC4CEF7;
	Thu, 11 Dec 2025 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765483080;
	bh=3/wJayDctxhp5vTQT4wNVc8YtzAiKTCUMkMHSROR2NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATJJ9+ukH0IzvEXvHTv6Bh/v+OnGQoKbctRpgp2vE2zMixw/67hkREvUItUMDl1Bi
	 Ax4mAc4VKjE3f8920syuzKruVfyJQh1CdFvGLdQPohTQD/u4HK4KOeVHSBlOg6g7pg
	 BpWKTfhsRW/WnJ1y3ztBDdx4NoJ+oZQSQrWLOG/BjJ/33uexE+QQYMDU48ryMEPKCZ
	 uQ+3GZvJjVBrUjMDhS9ucXX5lhF4d1RdytB5w8TqLegOatCfksxC4uf9NFkE9cvQoD
	 gQ3QPmkY96buSBIuUQdQd+YpWx6c4TjNhqzzomPQyE9PlSYDk4AIw0/bEixNX9sVW8
	 6WH/8wPsNXDzg==
Date: Thu, 11 Dec 2025 13:57:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-crypto@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts
 property for AST2600
Message-ID: <176548307744.1801669.10354753289483698774.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_115801_284777_D05ED080 
X-CRM114-Status: GOOD (  10.03  )
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


On Thu, 11 Dec 2025 17:45:56 +0900, Andrew Jeffery wrote:
> The device has interrupts allocated according to the datasheet, and
> the devicetree already defines the interrupt property. Address existing
> warnings by allowing the property.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


