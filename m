Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD66E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwydjmJT2YL2H6h0BlrDdpncfhiYCc095veUxdLYW/8=; b=SL/QpQ5WaMg3dgIleXZiQFcest
	rzfNy0DfWZjwMmTnIyj5TZBgUfDm8s0RFlSLHhyUsCltXGEymXOyqHjjpzI1SgwUDaD1S3F9bUNE2
	dKJBZlEs/T1UmDY3Pq1TiJc1lH1rkEbQaNzdv/5EmYePyv1deaC5v2WFCH6AfaZBQ4OR+esQxE7gk
	cL7KQNw8705Qs3KvOSF5hS92HR/jqT0mjUe0UDqkXVYcdGKXhN9S3r8FtYm5yGAIfuZoueh+uCfps
	ah+8KgK0B2kh12ZoaHLcPXkp6C22lkFInn43dvfQy+cD5DfVYr7utaT+aGSBfxBsaRIzWRz7ymrjd
	9uvu26qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn2I-0000000Dnje-3RPp;
	Fri, 03 Jan 2025 19:08:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmzf-0000000DnOq-3O9r;
	Fri, 03 Jan 2025 19:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5954A4109D;
	Fri,  3 Jan 2025 19:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F0DC4CECE;
	Fri,  3 Jan 2025 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931158;
	bh=wEfIxLmMivcYpaOCV9CS4L1pAWpwkcsxKCp/ORxJUpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSnaBOVLKv1sXfkbNkU702SW2cppnacEk1kLbvxHoRbk+m7v2N29TqmwyugVXEjTa
	 aRhMbOl4tah0iLu1HKXuXNVXtIoVQ6ZlTRa8ZTpKrsj9poA+h3sqU0/zI/3IYtoygJ
	 Hf5PM3JUY3azLrosAoBWyjnwOWUOk5iB3/hRyFu7r9o3PtodZV6vZkj2p//X0P7wmU
	 KkNHDI4nIkmlPAIb61mEubM3zViMFMjsqU6F6FTg7L1CNo2vsmb3b38SQlwLT0wQdG
	 Cvloga74Bm2AAG/0eHyF4xTHfccwBNHveLK8VFRqg+VHpsT8Oj8mLgRIi93F7PPjv0
	 8MXlzB9wYQpmQ==
Date: Fri, 3 Jan 2025 13:05:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: kishon@kernel.org, vkoul@kernel.org, heiko@sntech.de,
	linux-rockchip@lists.infradead.org, krzk+dt@kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, cristian.ciocaltea@collabora.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: Add rk3576 hdptx phy
Message-ID: <173593115586.2590023.9486538940303908638.robh@kernel.org>
References: <20241231092721.252405-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231092721.252405-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110559_911639_6DFF8BE0 
X-CRM114-Status: GOOD (  12.61  )
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


On Tue, 31 Dec 2024 17:27:11 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add compatible for the HDPTX PHY on rk3576, which is compatible with
> rk3588, but without rst_phy/rst_ropll/rst_lcpll.
> 
> In fact, these three reset lines are also optional on the rk3588,
> they just used for debug, then they were removed on the rk3576 IC
> design.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - Split from:
>   https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#m02151cd8591d7fe92cf30ab69701ed57c1944c06
> 
> Changes in v2:
> - Wrap commit message according to Linux coding style
> - Make "rockchip,rk3588-hdptx-phy" const for "rockchip,rk3576-hdptx-phy"
> - Make declare phy/ropll/lcpll reset line are not exit on rk3576
> 
>  .../phy/rockchip,rk3588-hdptx-phy.yaml        | 62 +++++++++++++------
>  1 file changed, 44 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


