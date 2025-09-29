Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C618BCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ubdp5b+xqgWhD4LssgYNHMzYCiBjCKYEP7cfti0FHc=; b=xh8gLqbsKpGXIBoTzQEK2EQ/TL
	prkhZuONvX9kk5e9IZcgCGq1VN+T4+E8pxM0l453tf32zbUIs6LVXT6IsB2J59hBRLbDF3O5aSJ7y
	u/EtQBf1ojbHnNVn0oz0ViWUHRLXMer10uvwmbnGzwX0VT9wPt53NqHOXEgE7dM6gqgTwHC83mRUH
	Y5tO+Nmr9hSm4aDX33eQHxWB7zgVkdRX0/6yoTPAyMAz9qTVMyR88wbpADyKChqnRIAl9G4jYmKO3
	lNnGP1/qYF8OyCEUQR948TJJp3h1nLgqMgEKatTGR0ICW5kQbqSNqQUhiBqWgnMTzund2teO2yuUn
	W0aiy+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BLv-00000002DeF-3g3m;
	Mon, 29 Sep 2025 10:43:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BLt-00000002DdZ-1Roc;
	Mon, 29 Sep 2025 10:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759142606;
	bh=tReOAykf5vjaZ4hWe3+AO58F3yFrvH759h1eiJJ2MIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bJ/G51CvVwbJl+3LMpYYWgo7h0Z8q5DWkVt+lG5Eg9efIxYzvhqWZ+boXRQL33P2B
	 JW7IHn18C7q36Dkcpd2g+znP3oOdC6U9j04tZleA3Mi2XfYPGpW/VjiDSpqdRSE4Y1
	 KXIiPS4v8Q4yYgvhpAZNJetGmfbctZ4cbNAl+cMvVlaa9dVe1A1vT9lPk0yJXeflsd
	 0JxQnNEYdgiAIkPs4/T3pnzN6PlUSldTz0B0yTTMjwp1ilTXxdJAClU0vSzRydnHqV
	 TRNBE8ni6UVRR2sDstKGBDr6UuvSq3DPIxKxI/RD2n3MYq/xEgLfhKojAaRjx8X2JX
	 2WR0wa/OlCRlA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 539D717E12DD;
	Mon, 29 Sep 2025 12:43:26 +0200 (CEST)
Message-ID: <0bef7e84-415d-4324-94d0-a2adb261a18e@collabora.com>
Date: Mon, 29 Sep 2025 12:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mt76] wifi: mt76: mt7996: Add missing CHANCTX_STA_CSA
 property
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250928-mt7996_chanctx_sta_csa-v1-1-82e455185990@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250928-mt7996_chanctx_sta_csa-v1-1-82e455185990@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_034329_551901_F7B9DDAA 
X-CRM114-Status: UNSURE (   5.08  )
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

Il 28/09/25 18:27, Lorenzo Bianconi ha scritto:
> Enable missing CHANCTX_STA_CSA property required for MLO.
> 
> Fixes: f5160304d57c ("wifi: mt76: mt7996: Enable MLO support for client interfaces")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



