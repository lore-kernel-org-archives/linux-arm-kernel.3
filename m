Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDDD75BD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRkY4ECIjpP67hY816uWjE+73gJb6EmdQQJy3du5r0k=; b=pNtc6+QNfrxWB/oiz0NsMipj1J
	UucDfwB1ABExtbBQyFMVN0c5ucOuM6/KyHTQnxALNo4tOfaBeTLtUxQ0QKcSXIT1r6XxeUY2aE2b9
	7NoqT1CTOSvb/AVQsTPAd9iPd1ZUuGSvhai7P1WP5i3tcGXSvywYhqLbsFZpjtmgQm0aYs62wkS1G
	cw6B972aTdOAUaZUMY/NBd7Nl9ruO6GVm3ZXEJt9GOzbTp5kaIPl+7HTBDw8p3m2qFbu+atufmxF0
	KEpYyLc790gbkSP/gBdCsnKgzhHvoNDIoaXB4c7jZLkB65s9w6nSRgOhgAAy5HovRV8DgjOQjO/kf
	nnnaZouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2mx-0000000H7yM-3uht;
	Thu, 21 Nov 2024 08:43:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2m0-0000000H7nV-3DlW;
	Thu, 21 Nov 2024 08:42:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D2D65C3EF9;
	Thu, 21 Nov 2024 08:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7EAC4CECC;
	Thu, 21 Nov 2024 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732178567;
	bh=9Qn9Cr5JCK+4qWRIUMYaZH6DpbxN46AKQ4kwJoFcCxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLeksefilZqrfOa8sv725yVyhSiQH3UMWKyiLeM1ii++Y2aAdSY2MApGnqWlI8WQr
	 ijxvlhbqvsUwlSzkoBJM3+Wp1OyKBRBlcJPKnxqSoy2wnTtPMlGuN14a8LY95/jrZH
	 Cyu8ZTl3xFXfLrtzl0xpS3OR1Q+qutKUkpg/dLwuShdf5upH85E/T74guy1iwPwPAk
	 xZwi6rZz1Xm79XSz2/slbGzO7oLTQYCdr37QZIv8nytJbOWVkoaHwFR7PWPsJZdF68
	 OHXPZ/PhpCoFPS0RLarFwYVh2gs4r2w5jCTnORTgAxtBgdVHQXJyT7WWyi+ipwAuJs
	 zb+aQFTSEVTNg==
Date: Thu, 21 Nov 2024 09:42:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Moudy Ho <moudy.ho@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Message-ID: <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
 <20241121042602.32730-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121042602.32730-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_004248_845498_6E45EEF1 
X-CRM114-Status: GOOD (  11.77  )
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

On Thu, Nov 21, 2024 at 12:25:55PM +0800, Jason-JH.Lin wrote:
> Add the Global Command Engine (GCE) header file to define the GCE
> thread priority, GCE subsys ID, GCE events, and various constants
> for MT8196.

NAK, various constants are not bindings.

> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1449 +++++++++++++++++
>  1 file changed, 1449 insertions(+)
>  create mode 100755 include/dt-bindings/mailbox/mediatek,mt8196-gce.h

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

This goes with the binding.

Best regards,
Krzysztof


