Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A879BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWbM06ZcaZAXvbtTMXXQwtuBotg6y0hoZpqSNdaGwu8=; b=GKildXrM/zFnBVB5LgcDa+o5tP
	r22xaEGxPAaEmGQreNklVKHf09ZKW03DWrJTOSBpkSMUa4zMr5O2tVnVkG03btayVfM45bJCt6q4y
	glAWz+YHfmAGky31usbvMtfQ0T66eKAwOAwHyADDVx3xZXaC1mIdQ8EegBesPKCRnqXDrjndvk9Ad
	qcv56khtCWuUuihvC3tT1tj/cAyScBGo+QKfvlOinJpoyNZHjemCX+GrIRUsFoTm1IcoqoA0pc2De
	VisKR9Jp18FLNpj+DKERP2rj2x+A48HqQdsvzWTkPHPLFL2suYPQoymLz+llysvZeLXNWEvuMZjpP
	urENOcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjs9-0000000GLr0-0qKK;
	Fri, 21 Mar 2025 21:25:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjqR-0000000GLWr-2rPU;
	Fri, 21 Mar 2025 21:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5AC143D4F;
	Fri, 21 Mar 2025 21:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3801C4CEE3;
	Fri, 21 Mar 2025 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742592239;
	bh=gOfJYQK0p2G/hVDRAJhS7e5zivlY9TzR7mIpXiz5tCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elOSWnqq93wMVkWczPA13/4IKBIS/gEcP7YQ2gSZmRHYA5dxERHpWiQMGqEttx5+6
	 dtGSu+NqKTmIi3smtQkSW6bUyAvjowQebMEIXA9ThllTMPsHanMGVeKGnVtoj/7eBY
	 A9JP7y5pzvc85LwAPV4NSENTQTUxxdRxahnTgBBHm0Pv1Ap01Ou7h2Hz0i9o0EpAin
	 OP1n7xKOjVPGCkKDA3u45tIfccztmN4asvqhawYOBJZILZPNql2O1dbsgAtZJKl3uk
	 R8PyeSGEvDYSdUWhqAwFeriShB2dIxPU5kTpLVDWhdAsgTp5epfvRcBB96H+bG1BHL
	 CCTw267G7rEiA==
Date: Fri, 21 Mar 2025 16:23:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop
 assigned-clock properties
Message-ID: <174259221258.4077511.5846925634356953161.robh@kernel.org>
References: <20250317214621.794674-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317214621.794674-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_142359_738841_54EE96A5 
X-CRM114-Status: UNSURE (   9.37  )
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


On Mon, 17 Mar 2025 16:46:20 -0500, Rob Herring (Arm) wrote:
> The assigned-clock properties are always allowed on nodes with
> 'clocks' and generally not required. Additionally the mt8183 doesn't
> define them, so they must not be required in that case.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml  | 6 ------
>  1 file changed, 6 deletions(-)
> 

Applied, thanks!


