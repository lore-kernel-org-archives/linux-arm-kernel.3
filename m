Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E7CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY1hAFxxL6evvZyy2TL3uhH5ZI0vJV6k/u9YebRPuyE=; b=OtyiP1B0bjj50Cyb/H1x79yDNs
	7XJj43PIBC2XgQoPIQliG61C7X6CX1r9uIdRNGAVxFS4wKA1sNo18Ko523O3vMRjLyD6EhNsQEZQx
	iGzu5YH5ZBYZ6Jejlfp5MaEAOsq/2y5SjHtjzPwdGWcwDeSJtxAcRmp89N1xUtOWX43mekSJNUy+9
	A8hZRgrz9CdShU/vfhVcqPhRmDMdtERPKV6iL8BbSUwfpCHMIl/ZTp9HeFE7F4vnuGvHLN9qrGcli
	6sIenUu5y25Yr+3jTw1NVBgY+/n1hM8npH4JquT45FSzlWNirwF9wJ2+DsiXgBf2nBU4lRZit2lqu
	PGfyn0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U9A-00000002aIB-2iqJ;
	Wed, 24 Sep 2025 18:23:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1U99-00000002aGX-1phU;
	Wed, 24 Sep 2025 18:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DBFC6022F;
	Wed, 24 Sep 2025 18:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164ABC4CEE7;
	Wed, 24 Sep 2025 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758738168;
	bh=/dizJ5Yx9RjejGKb4zmO9A3cx6kee5ApzkrMTFA0MNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U143hdzXG4BM2U4/RGhbJLZkf0oHaWc6kUm4O7eVMoW3LZC3znzGv+cmvpHeLKlOK
	 eIM+3C2AOcCqDVAo9QWSnqGGFiOcyT51ZM3FpMgvvexB9rwL6LQuczEdEgNIUXUuka
	 3r8PfGWoeUBEFrGmbWqDO6TbNH/+zlOoI7O/RNoUwA1mIoReOZaLe/6bPqtrDXCGn7
	 04MhO7ShJEt+ZvQyYxRo+f+9YXoqAt0Zh9DZhnI9jjahdcvVzgwsX8OxfzNTqDzREk
	 2RAdPp0WK43KkCtYdJmnwliRuoDAnbnvDeM3y7XTxlb4lcz5x3531NjZZbdMgeI4ru
	 oZC/vxeZyzxfQ==
Date: Wed, 24 Sep 2025 13:22:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
Message-ID: <175873812927.2390194.2900839145520003196.robh@kernel.org>
References: <20250923185340.21526-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923185340.21526-1-ansuelsmth@gmail.com>
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


On Tue, 23 Sep 2025 20:53:34 +0200, Christian Marangi wrote:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Follow alphabetical order
> 
>  Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


