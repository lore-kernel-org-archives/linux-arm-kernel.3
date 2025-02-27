Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D24EC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxqmcrd5ikCVaoJqENAUwKBGMjUcF9dh4fG2XIsYbk8=; b=rXk9Cq6BK6nMIGrwkb3CSyHxhu
	DzNDeTzJCI6iLMYNZUI8xLr3i1MEpOqU1pbOFtv4xSiwFXCAsL0eKoCHk1OyvfFDIGGnwEe4ndbA/
	7lNz7BBud5IZ52K70mCiM8gh0kbcQkwPr786B8fRyVjW2dANX0++G50ITvjMIxunEmkhsL8dleg1W
	uFyFniSO3OFzkOUr29pMZITu4uP80ty03WMC0tzTzq++9C0j4g04QeZ0TPZCRZDwrGyxtC7YVaF6J
	5fplWjBHGvjpy34rLse79oFBIPGJbY4QVh7cKmD2YEpeHTagnqFCYghu+nSUnMV0MHkEqk6PASO5i
	i7mOVW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjF-00000008Xna-0T0M;
	Thu, 27 Feb 2025 19:39:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngZJ-000000082ml-366c;
	Thu, 27 Feb 2025 16:17:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22D405C5E31;
	Thu, 27 Feb 2025 16:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E869DC4CEDD;
	Thu, 27 Feb 2025 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740673020;
	bh=C/IXySloKFVBYOwHeyIU21KrrNb5UqpWetJ68tooln0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5znDtvf3i39QIl2tjSqo+54dFM2Nti1LTC5vEUOyGxK3YsgLDYe17mNX5RTn+/4N
	 boU83qNPp5h+MbzsYxfBM9F9LsJHE0bIwXtA6EzpX3XqeUfw0aFrawUX0iS+FTKsmn
	 GGGmR38J5pbp7StNJOgJzsCjYJmnx6jZasPD3kI2yVk/ZQ1sXw8huWAM25Yv2iJ+Vg
	 e8vIriyF9AWivEnrpxKvShjPYrHqmN4tc3/v7QGeb0yoB+mJ3hq9owFL7lGGuwDffN
	 XAw4vUbn/2MahkTBPcdYKkfMG8RV8oFLrTejUtZWipdN//Zn72QFMF+sM0d+E4R8vf
	 wGSz+xd6cI5Yw==
Date: Thu, 27 Feb 2025 16:16:54 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Andrew Perepech <andrew.perepech@mediatek.com>
Subject: Re: [PATCH 03/13] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
Message-ID: <20250227161654.GG824852@google.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
 <20250214-mt6359-accdet-dts-v1-3-677a151b9b4c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214-mt6359-accdet-dts-v1-3-677a151b9b4c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_081701_820670_7C68441A 
X-CRM114-Status: GOOD (  10.97  )
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

On Fri, 14 Feb 2025, Nícolas F. R. A. Prado wrote:

> From: Andrew Perepech <andrew.perepech@mediatek.com>
> 
> Add an mfd_cell for mt6359-accdet and describe its IRQ resources to
> allow the mt6359-accdet driver to probe.
> 
> Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/mfd/mt6397-core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks okay.

Not sure why the other patches are yet to gain attention though.

-- 
Lee Jones [李琼斯]

