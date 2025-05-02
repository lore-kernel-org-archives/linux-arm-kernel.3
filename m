Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D18EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGktA70aIrCRGuXlMC8AGPZ7YxuJM3VFqQJTnw3lFLY=; b=vfEddNzfhBn8F2PG7Qarsptaiu
	ZIkBS46CnztRn7yk8u43Zk49sV3vYZUOPrH67XkjSdxeJ1FBC5guGA4dJkCr3R4moWgTgpQM0X95u
	G8+cfr+iXf/PygjTFwTDMNc56sufqjLPIQzG+ajhD9HprASPylBC4ghY7Ny5hbZ5/L81hwi06Wfl4
	a/EsigMcPrvdewWMvSrmBfUbqXoHQMaKNFInZGG5fJqjFhNw1tsGpGpA9vuPibvStvQKCvagbiNVg
	FBdYPwRAHOohYLj414t/B9WQ42r8gXTGZL7vxgmpY74nn7PKEsa7M25g1hCJFer2sZQG9mPHavHeR
	FJzitdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAfBe-00000000VSj-37pl;
	Fri, 02 May 2025 01:27:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAf9e-00000000VIa-1ZM4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 01:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2985D5C4DAC;
	Fri,  2 May 2025 01:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A3C4CEE3;
	Fri,  2 May 2025 01:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746149129;
	bh=zd1nFbgKeSy+5nrsokDv/2xy+ygCCJKZYz9HQZRZkhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SG7WZ4ckh0bLimdNODNSxU+3V7AFpWUyQWg1hRwERt07Hh1GoPwLLpnQrry08Pm8u
	 TwoGXDB1KqO026gv8CNvrmC2cS+r/d/GokgGSwKv9Dvccs9+Zc86mRXCc3XBg0QP4X
	 UyvdoFFEfOiZdvGQ0vndna4Y8m4az2UI3sWpaXABi6ZaMulNyf7Mu8xF4ORF8whd2Y
	 eovF+jXHE54UhxsPP1SbZ0Kd1Wu9YiR2lfp9Jw2Cbb1qoCcxYkMqT9m1tVWa5chCZ2
	 s3GJcdtXq5xsP75tqJe2oF7dpABHcqLikMpPw0OBNkb63mSsITDRLIQhszwTRW6QzH
	 CO0B7+kzxKi2w==
Date: Thu, 1 May 2025 20:25:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: psci: change labels to
 lower-case in example
Message-ID: <174614912290.3401660.6761201989918368612.robh@kernel.org>
References: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_182530_452107_1C02607E 
X-CRM114-Status: UNSURE (   8.76  )
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


On Thu, 01 May 2025 17:09:35 +0200, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase, so adjust the example
> code.  No functional impact.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> v2: Only Ack
> ---
>  .../devicetree/bindings/arm/psci.yaml         | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 

Applied, thanks!


