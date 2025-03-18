Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B197FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KI2DI4Zb/l3yDary31g2hF2Qu++zP0wwUwWo2b9/rzM=; b=wlwXLi8D42G1E0wMpkKns+0SHx
	GqBNh3HpMpZhQljD7RhbGIe/B04B12dtEqIYFLFXkWT2KpRuaqnBk2bR3cS3CidCzL5H1Fn9y3qGq
	WEIBq77lutWzmhiYwt0rnIZ+H82Nzmmhi8PEjtxdlhynKPuvrLuWMyBPg7v+6Lhi6ulsr6Lk57N13
	mLAGQ6+XUFrdq9DV7AoLu+St13w6B9bD8btfHLOOtop1aBCUec4DsdOt/rS15beqCME1eUPQc6Yby
	XchHqyjDbcQHgVxVNFZKV/PXIjkkkWDwHf4lmvcy5qxPXtyaIlR1Srr/LnkEad3YmXlmtFPPeOjs+
	WyM1D/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSmG-00000005FOk-3sga;
	Tue, 18 Mar 2025 08:58:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSeE-00000005E83-0mq0;
	Tue, 18 Mar 2025 08:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86DA45C55FF;
	Tue, 18 Mar 2025 08:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449CDC4CEEF;
	Tue, 18 Mar 2025 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287805;
	bh=muVfotdBVkgMqpFob4WAELBMk0aNg3mJPn4XqjMIXXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+6YJkp63UNGN2FX4jJzXrHc/yzzH+EK/cS7L+SZrLmk5BkobWYvSKOnC/WTSrSyS
	 DLinzHSFM/0dVmRiH886cbsADDTvVKQWzjb+kYOe5FSDaRXtOxAYcWVwNRfm63Gr9m
	 fucrnOpd2AaSy4kHXmAzqf/+v/ZRg8Skk17nmyjgGNrLYwQ/t0vo1g0+LWH8lU4HkK
	 gqffAH4o0B+3DO6R92ylua25PM/eLloy4/d8MMklEAsYqRF4UT3h2cN842q1YfshPB
	 LBsjC7HDZyfZRI8I5vYJ+rGG0yVPOqFnEQYv3xklQtLUkYlrK6Fva2G4YYM+U/SBmw
	 cv++zmtoKs0PA==
Date: Tue, 18 Mar 2025 09:50:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop
 assigned-clock properties
Message-ID: <20250318-rebel-voracious-tuna-3a9f53@krzk-bin>
References: <20250317214621.794674-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317214621.794674-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_015006_282965_D3D8D469 
X-CRM114-Status: UNSURE (   8.20  )
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

On Mon, Mar 17, 2025 at 04:46:20PM -0500, Rob Herring (Arm) wrote:
> The assigned-clock properties are always allowed on nodes with
> 'clocks' and generally not required. Additionally the mt8183 doesn't
> define them, so they must not be required in that case.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


