Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD7BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McEwD/1d4/Eide2Hwd2L4937F2DhEadKA7AdOJgFrLU=; b=zQzSIgm39ciZSaG9YvPgbII4Gr
	+ABe3NkqFy9NEyEOG/Kv64QycyCS8sdVBO8AuQVvm18b8gE3Q77D9k0/OUb7FC2rAFixx7mT76HI4
	HOb8D17mS2xqoq1eYdTxyJm5liBR6Ei8YsodgddVd3We59zvSXmEWjGdpWHJRBknoq4zNfYmEKZPv
	/fpsQyJBEO3d2/nHxPc+fl7qaWi4p3TGGp8cZMfib80R4jTCSDraXPaMfT+9w4gnJkhXX7FOVejVH
	oBmgv4ENBtLaOPK/A2Px+/u6KmdCLrjO6YRgMkQpLU20C5GWwrWY+U7AJ7bBTii8c2Xrx9PyrHrGO
	f+cP+TTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweIR-00000002kAu-2kMV;
	Mon, 24 Mar 2025 09:40:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweC7-00000002j8z-00TR;
	Mon, 24 Mar 2025 09:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9CF5C4839;
	Mon, 24 Mar 2025 09:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF6CC4CEDD;
	Mon, 24 Mar 2025 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808846;
	bh=FvQn3givm85EANWlfsUtGcpdsUFHMIzmUrIJkbrLKlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HA98kcj3d+kiZI2Lofc3n1TBAGS7wYTceRz1BVXH62/B4d5TNdiIjqZNskJcWKKtz
	 Vpjj0auztCgtdivyZ/WHR5b0zJT8QvR6jSYk4wTuy+2oYygLaULIWN+HSsUQ7Uo3/P
	 1BZnR8plpgEWS3OmPmzjY6W/VBMYs6kI2b9dOLVchttfqBHLuv12TdXHDscJIA0lyz
	 SoJ7xwUJoBzbbUejhLYLX84VY5pUXIVbxht9NSjtO5+M0J+BrMPKVlEzZ2FVCgKbmu
	 wUoN4brf8KOLM6bRVYbq25XEeBlzOUX52q99zgulHr/en2hem1Hd0sToceVrHw0ALw
	 gQx/wmwyQHGrg==
Date: Mon, 24 Mar 2025 10:34:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 02/15] dt-bindings: soc: mediatek: add mutex yaml for
 MT8196
Message-ID: <20250324-amusing-pearl-yak-9d925a@krzk-bin>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-3-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-3-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023407_096752_4E7BB360 
X-CRM114-Status: UNSURE (   8.91  )
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

On Fri, Mar 21, 2025 at 05:33:31PM +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add compatible string to support mutex for MT8196.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


