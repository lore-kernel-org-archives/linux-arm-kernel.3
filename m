Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B332CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dOCLLWp9hX+ScYi36iKJw2FCNE3CLNX4EfhzNUCJOw=; b=jb4bS1JscwuDSlvs/BYCQqCd1V
	YyChUyOK/F8yxJ5edJ49UlxcFON+EVDbtCQqFybnqpHDAyk9S6+BERZTFIQ5vTo8ySAcOZez4SqyN
	XiB1A2z8WO65rMH1bi91Xv8QSQo/Tv+C5xF+kKUesR5k+baHJVneM2UWtXP3d1K6SDO9HbHHH5vNN
	5/i6RY2JDlUNFjEXsyutw1OtzERXrlz4ZfQX5HWmNoEztKoebkpGRQFHg89bHhm02vmGcK1VFq600
	zYB7IpT3KG7C0OWLu++dsBG4UnBLN/ETi3db880VmeZeyvBlH4t/HYQl1rqnp2xcEbJUqA9dPNPnx
	K4NG7i+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvfQ-0000000FLLe-3pzu;
	Mon, 18 May 2026 10:57:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvfP-0000000FLKw-0s3Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D01444439;
	Mon, 18 May 2026 10:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D93C2BCC6;
	Mon, 18 May 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779101866;
	bh=JiBPOxZLEDKT5kX2bjKy0xlL68o9NdQVT3OXuYDckuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2ggqCddi0IZTwwgbQR2LuWpErM2pqvyKTv2K3zWQgPatnKIgy8IHSbnBlnx9mu/V
	 o2vgcDL8bbl/sIXUuo5mId3RmllZT0Kn6EImrwcaqXA02sV1VrI4pxBZoKEQpjLPzh
	 yZpcKCugwbwUti2U052+3jtIC9sPNolcz+UJCsS6AywXzyTCjhpBP6eIsrH7oKney5
	 0gKxa2JPSrls3BGFEmxDeckFtkm5oU7DDxyhAP8UNQVG88Z+kagJxgnghvKALPycLT
	 xfWkIZfstLm9cosgPoTTDJKWLE070S2UGCu1i38UjOftmx7znums1RrfueIMi8MlS3
	 5wGtN/SMjJQLQ==
Date: Mon, 18 May 2026 12:57:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Message-ID: <20260518-rustling-watchful-viper-b9c4b4@quoll>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
 <20260518033440.17569-2-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518033440.17569-2-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_035747_269814_F0692CDF 
X-CRM114-Status: GOOD (  12.89  )
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

On Mon, May 18, 2026 at 09:04:39AM +0530, Prasanth Kumar Padarthi wrote:
> Add the compatible string for the ASRock Rack B650D4U BMC,
> which is an AST2600-based server motherboard.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


