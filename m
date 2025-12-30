Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D83EE498F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmhGt8ga1SaI8aGfRw7aQGuuC6qxCdeRrn3Poevpi0M=; b=SieQ9OHqL6ktJJcFyivmxzdFln
	pu4FqPCxXFZjjGr7/76eTzMHzaZmuaU89IZalbvG8OWg6ZM6gx0E5GFs3W4H1wIAMY/e3xCaxk78R
	IrnQkXQeiPaFVZeCAhruSpqpwVavOFEZWVZRAFZZQ0aXIyUDlsnv+8t1AhsNxwB9hDKNy6dJx+kqz
	PeeGennZgEjbd/TWFY34e71pOIbsOvFTSdXCGYDUvYmHZ/p+jHWoZ1DfzcpOnAvOqQ8hMh+E7TMGy
	iMd0EWb98MnuMnJYmecijZgyJyFFxhDrELfo8eqKwUvN9E1x+aF/3fjZxMIs5dtkUn46qB1pso8Aa
	CVWHHb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadnb-000000058sp-1nky;
	Tue, 30 Dec 2025 17:46:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vadnZ-000000058s7-0aUJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:46:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C7F141703;
	Tue, 30 Dec 2025 17:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DB3C4CEFB;
	Tue, 30 Dec 2025 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767116780;
	bh=ILOYy8k0vEwyHW23Hdi68K3x8vNTQdr7Kn6tc5mNowA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaZQLtCCuBKPDeQKKafj+JA3Mq4a3BUcto087E4IeFDfQqkA4SOpqRHjFdXuWYyat
	 Eo7VPYMZFHtj0udAiB2ztbN6os3Ce+UBMBva+rP13Kf3+Na/zlSSXtkP7o2cLGfZNr
	 KFG5R61dq60QBmB3eH/5dOT//iYzPcs+N0hCEzIeeZUdpLGCOgLFvk+TW5FAyrqrVq
	 EUIoSibKYV/mXjkwcwxUQq3vm3iikdW4kpGmUcp02bqKaMOHMF81zZ9DRZCoNCZp+H
	 ySeKFdV/gcYamjzhntFWIYd/iSGukcvbm708WoVRnlOnmg+x+ZwZDtbx2o2FGADAiY
	 WFPCTp/JD9cIg==
Date: Tue, 30 Dec 2025 11:46:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-media@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Jernej Skrabec <jernej@kernel.org>,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add
 interconnect properties
Message-ID: <176711677675.852762.10312933098835387721.robh@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_094621_196424_6326C49E 
X-CRM114-Status: GOOD (  10.59  )
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


On Thu, 25 Dec 2025 18:36:12 +0800, Chen-Yu Tsai wrote:
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
> 
> Make sure that the interconnect properties are valid in the binding.
> 
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


