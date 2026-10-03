Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82757CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niTaM0Ytht8ZXyLM0MwX4xCOD3K0NhKmQijvDp7U30k=; b=T2NLg4dNDKSu6s/yioCqY/tol9
	TSlnf9Q/SbuZDiKIld2dmjk6Y2rg2KXhmYUqlQndiQ2axcC3wF8CALiLidvsU74rdXqymth3YH3iy
	oB1JCh78ojZFTdUjzwqPvDvNYeL4QCpyy1WdFlQaed11wZcU+7/yj5CrAYJYHnozmmbgQDs5AKJo/
	Ad69ALZyJJ4danV53yRA2DNd1ono8RGqsH04yozW+PocnerSZQzXvCUefzqofMrsJYspaQzC6b6w0
	qZwOgGUMGC8YTDZnR6ASV4+/HggHzX0VqH8SPdzvm5ZqLE3KSpL6TLX5Ax1SFonzfY6WNtcnodi1n
	ZnjF7ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCrn3-0000000D36d-3U0z;
	Sat, 03 Oct 2026 04:56:05 +0000
Received: from mail-106102.protonmail.ch ([79.135.106.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCrn0-0000000D35o-2jmv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 04:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791003357; x=1791262557;
	bh=niTaM0Ytht8ZXyLM0MwX4xCOD3K0NhKmQijvDp7U30k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oC1P9QLpD3Zd2SCU4d1B25i9piQKAaoKWQ/oxpO+Rg2RvxKPonfEs9V+XbWl01k6/
	 j7PQ+pActwi2ReECCamLXcYG2jv6gVN9PCXfGy+P7NLFi4xxqTjW2j0M2ncmEgA4NP
	 QJLRPP2tllXA6GbNRZ3V+9kYm+Ln/jUYD11cc40hAzE3xNT3+/9p/STZQ/KQtS0xFA
	 uR677LGFlGGrvF/iEfWmTlHci8/TueBVMUJUXnZ0QK18477XjDr/kCCaMwR1CgSZJm
	 LpPYXi9mN+XNHjW4gVtgDf3+5XlfOSJ4e4quQaRX6zV9sw+S+CYXTW1byyKMYtZ6iz
	 mYc1bPZciPW1A==
Date: Sat, 03 Oct 2026 04:55:53 +0000
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org
From: untilscour <untilscour@protonmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, untilscour@protonmail.com
Subject: Re: [PATCH v5] wifi: mt76: mt7996: add thermal zone device registration
Message-ID: <9ZfPhagV0EDMq7if1ebyvRXfPIHZvPjlbWFuqTK1OuoqpcNj1AQCFwYy8vTQf8w8De3Vx3pFCydfiEOcAmx7ZqC9q5lrBqoepqoip8FyuaE=@protonmail.com>
In-Reply-To: <20261003-mt7996-thermal-zone-v5-1-d7cf8820d187@protonmail.com>
References: <20261003-mt7996-thermal-zone-v5-1-d7cf8820d187@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 98bac8e5a6c23d3e373790a3d61e63916fe1e3dd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_215602_861173_E1328590 
X-CRM114-Status: UNSURE (   4.42  )
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

Hello,

Please ignore this v5 patch - I misunderstood the thermal sysfs API.

Sorry for the noise.

However, the v4 patch [1],[2] still remains for consideration.

Best regards,
Ryan

[1]: https://patch.msgid.link/20260811-mt7996-thermal-zone-v4-1-9ca715a8ae1=
f@protonmail.com
[2]: https://patchwork.kernel.org/project/linux-wireless/patch/20260811-mt7=
996-thermal-zone-v4-1-9ca715a8ae1f@protonmail.com/

