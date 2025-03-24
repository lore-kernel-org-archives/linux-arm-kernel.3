Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F224AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xxF/wEpHxGPznm612NshC9f189nnq1fg9vu4iKnRBo=; b=Z7H2ZwKWmXuPe+jLHdzFLWAL5T
	z/eOfN3V/JrxLfLkK8W6f02nwHh9kspvueNedKLvWGEk6cRZvqrnisPPzVa4LkR4w/hAaZIg/rtn5
	LYW+07eurevsv+NWMlgAdIpQPW5UYjfY43ixh0VkmwZ4D3vbBcvl4eQjEEp7zZ8Fabg15R+c5Y9fi
	sLBi6YwcwqKUwgA5sYiF7x1w/4lYnnhBED9dxH6Th8z05T0l2YQWfyPCD3hczYIyiLE2/0nExLCJW
	PfIL7ZejNVBLStwdaQ7ypof6Kmi3nVTdavzeYVp2Hf9TR3+pAD/SFQZMlTgIl2hHa8Xl07ZLthIM6
	XRvNXjLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twoBG-000000049xF-0I3f;
	Mon, 24 Mar 2025 20:13:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1two9T-000000049p8-0K82;
	Mon, 24 Mar 2025 20:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50BD26157F;
	Mon, 24 Mar 2025 20:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D6CC4CEDD;
	Mon, 24 Mar 2025 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847121;
	bh=xsQnoIiAqK8rI1rdROJkhsNVkB1X7Nz0OtSOwQ8bwkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYFvWya/u5/qIFUJ9Yb+9dQDnyAsPIzex6IAmLQV7kmXL+yJp0cJpppeqPQXbeNDb
	 aJu/5rvpVqMbJHuOpQFl0bHM/hqbs1ddbezd8pCkRf55cdK5WROwuNH/1scwhraUiX
	 JiMoApDuCWOC2VphRshq9/7DnlSfh3OQR4A3mhHzy/lkvHstUGJjjnxb+GuqZkk/59
	 fjHvqA9KlN2GwrJFpXoXQsSJa7nXdZxXvNaVPMuNBWMm7QKkj6yNnLbXrP32w42su4
	 mXsK6k32o74PytqV4GzTisL8do8sT3PCml2nGVJnHV3DS25vBTxWEjVgcIrM08rgdn
	 69CeJfE5L3gZg==
Date: Mon, 24 Mar 2025 15:12:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	conor+dt@kernel.org, hjc@rock-chips.com,
	linux-kernel@vger.kernel.org, heiko@sntech.de,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: display: rockchip,inno-hdmi: Fix ref
 clk Document of RK3036 compatible
Message-ID: <174284712018.797576.18315585486040060273.robh@kernel.org>
References: <20250324103332.159682-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324103332.159682-1-andyshrk@163.com>
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


On Mon, 24 Mar 2025 18:33:27 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RK3036 HDMI DDC bus requires it's PHY's reference clock to be enabled
> first before normal DDC communication can be carried out.
> 
> Therefore, both RK3036 and RK3128 HDMI require two identical clocks.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  .../bindings/display/rockchip/rockchip,inno-hdmi.yaml | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


