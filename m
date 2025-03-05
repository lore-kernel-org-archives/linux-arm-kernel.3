Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76344C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9IX6wwFOJkLHx+OYJjX1wlCrwJc6nAoLqsDjysV3x0=; b=jv7H+dAj7NlRT8B4UAbO9rkzUA
	P7u41el5bT+fuCYfJpQ0CbdZmwDgHGq6MEzrbLyKWtJEcxvpONriNT/JlQOiDScrPo5UQVMuQKFLy
	SmYXXjkxzH9vhgMfnQ+GCjwm/fdeIGTb785NAfMNjR5COHaUl6mJagOVNSryPmDyaC44VAwibEEP5
	Mt6RLgSxfNP//IbnInhWeFEhuGC8ii+gGYQxvTbVQwbNX4Jva7w0venB8oCXebuSn1NHC/RcwUaRK
	1tvkXQIX/k+BR+vrirSWU7CRlz6TNdOKEMo2CycCtLfSEzZOkZ4ntFzmQ/3y0AGFkWFRQJF+TipzM
	nCpZIuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpju2-00000007Kel-1bMb;
	Wed, 05 Mar 2025 08:14:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpipf-00000007CxN-3Dud;
	Wed, 05 Mar 2025 07:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 327445C63F8;
	Wed,  5 Mar 2025 07:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA30DC4CEE2;
	Wed,  5 Mar 2025 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741158378;
	bh=qQn6Jnf+mcSHegDRQ65RUohedFJKfjbw3usr7d1maOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vovlgwec7HLGQkRfcCMfgTrD7i5n47NNZIHh5z5GoLIBRXgkPNYcluXsdQULe8cq3
	 RbFJ+qFDJN4/Tn71ecGqRI1clebUn7dRt87NkMD8snI/EzleaLbYU0ysYBp8CoFNFz
	 YHrZe7AMbMIKvqmpNIypMCgxf1t1fC+1dfUI7oP5vlnH5br5uW9CMZlAECta+JlIds
	 yu5tEBBT8PS+E7aUMG54ohLfuy461ZeqK5o2nDxli79YY8A9aLAvxDOZ9ibY9inaTa
	 v8NY8OSr5SZT7H4ZJrdSquWLaycyAZrts05zqa1I0Plxs5PUiFBRAEBoq5Wrpa2IXX
	 jaXf7EweyFzgA==
Date: Wed, 5 Mar 2025 08:06:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 02/20] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
Message-ID: <20250305-dancing-amethyst-tortoise-d98036@krzk-bin>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
 <20250304-mt6359-accdet-dts-v3-2-5b0eafc29f5b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250304-mt6359-accdet-dts-v3-2-5b0eafc29f5b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_230619_861969_F626DEA3 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, Mar 04, 2025 at 12:15:43PM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> Describe the accdet as a possible subnode of the MT6359 PMIC.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20

Neither this nor cover letter explains dependencies between patches.
Good luck in making maintainers guessing this.

Best regards,
Krzysztof


