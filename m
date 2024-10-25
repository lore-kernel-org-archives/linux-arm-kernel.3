Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED2ED149C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/njK/9UAdmzGK6xcWt8QVfIcQrkfJqreY9fAAFy2AEA=; b=TTnmkhGn9SXq0WCeUVeCfasopg
	HUSzeORA2BSoWmVTxsKzafV+73UlMYmZET5oWQ8WRZUj8az9Sao+u61GxENdeJaFbVddeJaVaOJLe
	D42kquhA0JSnzTl6+8sKZCrMMkFQBfs5nC2Av7J30z51hKVs/+0Lh3uly0V+302qqODMC+MPURpgs
	fWTkhyupON45GlChIlvJHqVhrw3rEWVdqwIKgS3IHxfazVXdReUT4F/YbWhA7RRVlhVJcotUGkq0z
	C4O0y0Pigty8Pa0k1Fl+flKYVk628ZicYmM67epzR0g6b0haC1zDUmr1w1LX+VH869XG0LcV2KtR7
	FvqG/4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NCV-00000004RbK-0pCN;
	Fri, 25 Oct 2024 16:30:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N4l-00000004Q88-07Jf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C58DA439E9;
	Fri, 25 Oct 2024 16:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31323C4CEE3;
	Fri, 25 Oct 2024 16:22:09 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id D33D05FCB4;
	Sat, 26 Oct 2024 00:22:06 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20240913104845.4112986-1-uwu@icenowy.me>
References: <20240913104845.4112986-1-uwu@icenowy.me>
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: document RerVision
 A33-Vstar board
Message-Id: <172987332686.809046.13831869939181367498.b4-ty@csie.org>
Date: Sat, 26 Oct 2024 00:22:06 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_092211_330509_CD8D9200 
X-CRM114-Status: UNSURE (   7.25  )
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

On Fri, 13 Sep 2024 18:48:44 +0800, Icenowy Zheng wrote:
> RerVision A33-Vstar is an evaluation board of their A33-Core1 SoM.
> 
> Add its compatible (with the SoM compatible) to the sunxi board DT
> binding file.
> 
> 

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] dt-bindings: arm: sunxi: document RerVision A33-Vstar board
      commit: 654332bede7526cbe9e7ba4c1edbf86a1d0be76a
[2/2] ARM: dts: sunxi: add support for RerVision A33-Vstar board
      commit: 3888715c76956c6ea13577965586d5b891a1f3ff

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


