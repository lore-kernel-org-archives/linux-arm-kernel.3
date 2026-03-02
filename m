Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59CDE9B361
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQuI4K3ZEUJDKCq+x5XsDnEwD4uwogcQg4jLmDea6Ws=; b=Qk5TVndFPzGLOQxGf4Gcbz5q+1
	cwAjd+xj5dc+nHd3Dt3KAnOfku45YAkBa2atCqiXZJsOxM3WTv7sboTNA5m3Gvy8hEzcVuCkT4iEW
	wmfbJjeVD6R6i8Z24o8wBSVTwwquPseHcZdywguDP1cQHN4poRyKRlHMfvBVXSJ/9yM9o70T10dYh
	jKQkaEgIRSvPMrXP4gz/6pXJKwjiexhivYAlt3QuyzK2YtItsEaz6DK7ExPqRm7STLJinHu0+456E
	yjJYNj/FA/qH3gxu3tTpwPnf4ki8dZjCqeFefDz4alJhM6s858FvU0yyYVvRrImmGZCpir93DeErD
	38S7oq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0ov-0000000Ck9T-3BLw;
	Mon, 02 Mar 2026 10:48:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0ot-0000000Ck8r-3dK3;
	Mon, 02 Mar 2026 10:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772448488;
	bh=TqIenPwt6OVbrGlBW9KR2jLxrOLkeSIALm72A1x7urM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m6qHuL/TKXNlqunZ0wzU29sKWp5+A2CGm4Kx+ly4uHO/jAO3VvfCwoejPNvlFTXJS
	 mCxxI+TPWBx37cvSLFnQRkcDExAy6xY2VUPA6y/9iXUPNrcqqhUzv+jhAz5F29Zhug
	 GTQ+8Z5iU9+GWIxlUpPOT3Srj46aFJZYApEcUcsEojDtSOpxHezS+SzfBtvCUTzPwG
	 TVFi64lAC+CIzR/EHccz6VR913PW9j06scywnC272KzCCSiEV9vOdeDfayFDbxPdl/
	 Btvx4z6Hh3lWdTyMOA7CUEZTUksq4envwyut40ic28XqPeTC4h2AHLY3oIDw2AzvuO
	 uVUknf3oA3roA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75D3217E0D04;
	Mon,  2 Mar 2026 11:48:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251215074609.4100-1-linux@fw-web.de>
References: <20251215074609.4100-1-linux@fw-web.de>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model
 string
Message-Id: <177244848843.35091.13923037073302766637.b4-ty@collabora.com>
Date: Mon, 02 Mar 2026 11:48:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_024812_078220_9C510B4C 
X-CRM114-Status: UNSURE (   5.75  )
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

On Mon, 15 Dec 2025 08:46:08 +0100, Frank Wunderlich wrote:
> Fix incorrect model string in Devicetree for BPI-R4-Pro.
> 
> 

Applied to v7.0-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model string
      commit: e4e6f0c5a4dc238684acef079e792c81d37e3226

Cheers,
Angelo



