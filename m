Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF924606BA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1vCHulBK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbqzLtDf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UDbbd2s1kje1R8JXsCA8wjTjZn+i3rEJu4K17fxuP2M=; b=1vCHulBK7UZ03zCjxytgFS5Ill
	JJRToeulsX1LAYASzgqjMcCranbTWSzOauY2a5lm4zoI+Hefkn9qD8thWL9SG8AobH6AwWRYQrP20
	ECrii/p3A9xKiHnpq8rdYdITq4KMnoMR85gXMI2uSx8MBdO7JbntEjRFcGzeEWeZ6jYhCVMBRrih8
	dsFCW+ZjxzX0lLcyEyz7jr2l1Yonon7XKffe731QYBWMa6SaHgRGJ+1ZV27dsSwIMWHN5okoX31/l
	Z2tcGUnqFg+ZqEsCjukYdeeMCAlw5BmPdeC/jSTkoNigKUgF6+xygmowtJ8MgC1y3xb/xsfNFtkel
	fmtcnBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8w-00000002rLW-1d92;
	Tue, 03 Nov 2026 15:09:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8v-00000002rKt-2dBs;
	Tue, 03 Nov 2026 15:09:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 059466061C;
	Tue,  3 Nov 2026 15:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D291F000C1;
	Tue,  3 Nov 2026 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718584;
	bh=UDbbd2s1kje1R8JXsCA8wjTjZn+i3rEJu4K17fxuP2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbqzLtDfuoS+yk3Cb9NL+IELKSZJt5jyCcuWm3dyPp2z77xlQoGsnAiFaicmfoOrF
	 3tgpEeKBcAqoNvTQovNT6CrpXBmMMM2iV8B9lFhp3KZNOIJhrSy8Bd0rotbMBLv3LC
	 +KnLNaHF5xU7Gm9oRwo9GghzU3Kwp2hul1uCUPrmsDDGuE9oDVNcjOetBn13FDuJSP
	 VuZNdd720uPcLjizBpMDdLoO83Aq6TNCWalB9VWUfyu1zT+rbRsjpq30wJ2kYu1LRe
	 7yvTOetvukkh2IlBcVrCOBnLjRttzzCYUyPXbkYfYGI+AW7om0VeLAPMy1OEm86zWQ
	 Z84ArQ3Wl9KRg==
Date: Tue, 3 Nov 2026 15:09:36 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
Message-ID: <20261103150936.GB792264@google.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

How many more Acks do you need now?

-- 
Lee Jones

