Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E82CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc3VC5ji02G4YVAh7G3jSt4Snr4qplnU9EZrB1xWmjA=; b=nx/LtralbSqkxCqWP+1cEyIkyb
	HTTiGelBrZhNzJ1wS/c2RXDiOiWYWfeurGK4VuC6MDeBekNn3CfIcYUthapFuuOmvNEsz8IfhWhls
	+8aLyN52gvy9wgUUW+4FjzPdQlDTFvXVkm3QNibon+F7o0B8a3qjDMVkJEcJCEU0/amLbuWvFCGtD
	pXc53qhw/PXMbyF8UVDr+WzQhLiKYw27YJAcf+G0n6OKqwQPE5Uw53qvyaLGcJhyoZncJKX/kMfZx
	7fVslZacFaQICkwTGWCm2kPCzV/ew5JroXoFkI5nVv79LvoFIXgnHr/3mmSjHCW1WqayOtAamovhh
	FYW2AptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDd-00000006Lit-3jnn;
	Thu, 23 Oct 2025 13:19:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDc-00000006Lic-1B8t;
	Thu, 23 Oct 2025 13:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C991560ABF;
	Thu, 23 Oct 2025 13:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A02EC4CEE7;
	Thu, 23 Oct 2025 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225541;
	bh=ZJniWJnry8+fO1GaHhaSnqADgGtJIJ8AN2vSP4jyT1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZMmalc2PI3KQ7dFvTUbDh5yiuRR4B1rQ3kmUv8x1XuziDKiGm2c5xo+zIOJS33ZL
	 TzYj8VUU+eeNcNv+iT0z9B5GZBqNhmcHPo9Y/EpmnSgYaZBJggGycuQHG41gtLcSNv
	 pz6n75HxPtBXKGN1fIPsWj/N8maA1w0L31Fu5JlvFxhrxaBKxMk5oLTsP4gtaweIhZ
	 3121XndTj/q3er6QBG1jJLho5B/qmhX8b9a4ojOugm0SEK7up/WiD5sb42G5rViHUi
	 mcxXYN8ldCZJF6JVHZnP9Z/HqzzQW4rkNT8Br/iVxAckKmwkSu/04z3YxaXdKdsVUd
	 hKAg6n+XxALIQ==
Date: Thu, 23 Oct 2025 15:18:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3506
Message-ID: <ka4wwbldtcmsivvoie2qjzdzadjpougx5odwztdy53252h3l4u@y4sfbrdbagp5>
References: <20251021222853.193224-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021222853.193224-1-heiko@sntech.de>
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

Hi Heiko,

On Wed, Oct 22, 2025 at 12:28:53AM +0200, Heiko Stuebner wrote:
> The i2c controller in the RK3506 is compatible to the variant first found
> in the RK3399 SoC, so add the RK3506 to that variant list.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

merged to i2c/i2c-host.

Thanks,
Andi

