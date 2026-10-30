Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46221606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SC7preOh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Oq7PXi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zl1IRjRLWMErm1qZ07L6W5fUo7xnuuzmCdvod1fuQgI=; b=SC7preOhjBqJtzeRVoUjt0wnvb
	mb9H1NmscOyRsva02kr6Kpig6WDMr5Mpx4JQ/fhiMeDhwXIOWwabtcl0lNBUUIvxSwcnq7O1iC7IP
	eIhx8nT2QbfUA57t86uqBihN9cVL+ilB2WuTruwVR3ToK3dJtl6lWEgH6U0PFjJae5E+yUJYsq3cm
	83CG29BBvQX8Vp5MuLNpTqXV4f2kLyTG5XAc/fYLNh/XJYhdNDXl4y2dhQSWEM7kVPA93/aW+N0HW
	kAX7SgrSiEYCP2WtZT+rq5ok4QjC694bT9mwFkdrOkBUggfSaE2GVlVZMCDii+jApnrVcIZGRS6Ic
	JJpHmcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqiN-0000000CIFJ-2Crm;
	Fri, 30 Oct 2026 17:48:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqiI-0000000CIDr-2bAc;
	Fri, 30 Oct 2026 17:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFF3242D69;
	Fri, 30 Oct 2026 17:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59FB1F000C1;
	Fri, 30 Oct 2026 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793382505;
	bh=Zl1IRjRLWMErm1qZ07L6W5fUo7xnuuzmCdvod1fuQgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P6Oq7PXiLfxOFbmD5oTxgtKm/SJkfLFINc4c7ogtZuPZpbMWyRXDlmFUd7YwX7Bme
	 BVxXCcw6WzkVVDAreCMbAcZfOj/NpbG8vCiXy50jZv0snOY32UKxLuga85Rf6ZewO8
	 HQ5dgUr+biOJy0dyVzXVKIujtH88LIp21rLdVUSEuIz1d/emDO6JLChmWCMgWfqORN
	 w5SUvxd6Lz7bS4cBBWYDUM608k4WnwQS1pedCV9n4DnCEV54BJVe1VTQ357QPzwNMa
	 3nNvjJ8+o8prPnylsyZSBw8qwN2jVinCXfkKtOH7t4ULIOIi96EHMkLTQRKyife7Sn
	 X3urShtaV27Pw==
Date: Fri, 30 Oct 2026 12:48:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Roese <sr@denx.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Message-ID: <179338250249.996557.12430447077139072221.robh@kernel.org>
References: <20261021153953.285222-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021153953.285222-1-ansuelsmth@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 21 Oct 2026 17:39:51 +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having SCL_STRETCH bit.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
> minor bit variant.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


