Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5BBCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1iuuua+DWmwADX1krgf1P7nmCR8583xDtHvMa1bvxQ=; b=kRqu5ZRyfhZwoqZRwOUonCUNrs
	I02sMvjTok7SRZWt73qXk+CGHJlEnQPcv9zv/BsgbEQnL5WPAVDdpIbHNRxE37rtaWUNHFUe+mPo6
	i0BqIHZtTrptnntEiaRgwpkDwVLuxYclfebAcWKgZmnxMDGz/LWlf3V7TFMoA+FsOc3JFS4Nw8FjQ
	GBffGmfqWkBVs7uX2AERtTtO4a0O5QXDvBLQyei513fNRjpzBNBzfZYzthayDCpEMJa7J9PHCJH81
	jWa3ztqyQy1zN24O17h59qbAI3nIPA5mSmZFYpcN1aKSLTfQsvLWBGs31vWD6BamCTsREVJcoJmjB
	6NDOYN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRpT-0000000GiQw-2nGo;
	Wed, 10 Sep 2025 20:54:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRpR-0000000GiQL-3cZm;
	Wed, 10 Sep 2025 20:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F0EC44A95;
	Wed, 10 Sep 2025 20:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E83FC4CEEB;
	Wed, 10 Sep 2025 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757537649;
	bh=/lPhduxhLE2dyo3EDgeauFRMNjRR24GuMLp+Kl/txcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMy5s+ORtS1KZ/hJOTvg+ulKukoFIx5t6OHHrGMarN5mTnW6lzKC6VXmugr7uqz7h
	 AL1u6w3X+5xnBadTXHRNu4UzKCYRMmYjOBn8jQMkXJq86fEH6ZFdglkpcsLD6DsqHx
	 zcTRiPGiUAliPiTmk6JT1Eu53RuJH3LeLeewg0t501G/Zdc8wXdeGLXRDK0vGDzhnZ
	 aj9KIB78vUP3R9dTeSqA0rBI8KHp1g1ieZD/ZTzy2tA0bGvWqbtEJtv5DiORKgDA4p
	 vpMk8xksy3gCvtLvMoU4JIVQmH2InYhunf4U0JQ5nCjRc6MF0T72JFY5aH/68Vji67
	 3FzyHrlVxLNwQ==
Date: Wed, 10 Sep 2025 15:54:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert rockchip,rk3368-mailbox to
 DT schema
Message-ID: <175753764852.389988.1115547537255507154.robh@kernel.org>
References: <20250812181348.62137-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812181348.62137-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_135409_919255_088EE71C 
X-CRM114-Status: GOOD (  10.04  )
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


On Tue, 12 Aug 2025 13:13:46 -0500, Rob Herring (Arm) wrote:
> Convert the rockchip,rk3368-mailbox binding to DT schema format. Add
> the missing 'clocks' and 'clock-names' properties. Document that it's
> one interrupt per mailbox channel (and there are 4 channels).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/rockchip,rk3368-mailbox.yaml      | 56 +++++++++++++++++++
>  .../bindings/mailbox/rockchip-mailbox.txt     | 32 -----------
>  2 files changed, 56 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/rockchip,rk3368-mailbox.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
> 

Applied, thanks!


