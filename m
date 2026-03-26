Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D74510AB829
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tfmY/v2HtY5x2GcuRis244mDWronYR/iYKmIjptCQ8=; b=TP7WpVnPdW1i3ZWIgczjyZx20V
	La8d+TxqG0HnqhL7BA/oGtkC5AfZpabmFO9IoMoBY4xMILbql1FeapIDjhLp9Ji46vTNprat/BvCY
	prA/o2nxpshu60lCoCVNylGekJxiZJQ4KqWX6QowXYobzOHr93apGDZbn3MtXtiLVqbWFrk8w+/rL
	rn4IOHD7zQhgqbQAiAZQe79nE6CCYuGpOKzJfb6b56oP3KkTyQcnLfePQMyCjc2oMo1ebsPC9EGLA
	b0x5q97KSczUpkFji9b6CLNA18PNVUlU/buTE5/gKcmSTzXi9osO5NQHTXrI0asG7O3HC4l/j+v8Y
	k2vWwQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s5o-00000006F07-2q9g;
	Thu, 26 Mar 2026 21:18:16 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s5l-00000006Ezh-2myQ;
	Thu, 26 Mar 2026 21:18:15 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 8DD59138014D;
	Thu, 26 Mar 2026 17:18:12 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559892;
	 x=1774567092; bh=+tfmY/v2HtY5x2GcuRis244mDWronYR/iYKmIjptCQ8=; b=
	B1OozqUR9wU2oJhixwEKUomHLfraD83tHL6yHnbYQ4iOZjVUWhHp1Opo+ZccK+zV
	FWdShXollx6H1e6xnBK2cYid9K7YzIVspBRKkgWgRXa72nd47KX7dLHeyxf9WLnC
	kAlXEb/CTobWxTl8Uo7P3YwJCBv2PaPIEroGqCLYjuDUA6KMVChAji+d1fl//MM1
	ZuZUI7eOGOR5IRNAXMPzPAItDe5pGIPPaC0KbCHX4tyNPwgpjP1xMlParGhF7cx6
	1gdPlDif9EizP2iGILTuaTTS/7Qxq4dOB2QmIdk+WlWJxvJAvp65lBQUzX9Tu/F7
	r099vtVAz+eRqGS1d5nEjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559892; x=
	1774567092; bh=+tfmY/v2HtY5x2GcuRis244mDWronYR/iYKmIjptCQ8=; b=q
	oFAzsoVEYP8xIX3IfCmjayWsk3qcBb6ga+rm9ACMoeL8elZikkQNs3itFtbUWpFk
	K5rpwXTbvS1pSRVJ/sQx+yqQ2jjGGsFidxVDVtrDrq0MsLXf55A2vJltXiJhXzCY
	b6zLbpYQ4hCg8N1NwaTuLMdID0VAiF7WsBjgDbBlrntkYPtKWaggkg+uv7oz5U92
	yujBFFG7fSUaX8afui+uu0hACmJ+Gy2GbQ9fxjPmMa+3qYB4hh4iCUmALtRh9q6c
	Gox/mZa9HMjeVPyLqaOzzvz7eNl1UMnV1dvklP/3I9p+oVj8juazJz0AkaMd7s9F
	D5W8nZhc/uRDVNKLJRRdQ==
X-ME-Sender: <xms:k6LFacctHZRcR25SPnyYG6-2Og085ugVTzFbtgZ4JJSmb1Vm_pxyjQ>
    <xme:k6LFaZAbkOi9K98JcoiD7xZo_0_P7RHK0b0snKR6Dvh5y7xgr93XWVeHNQzDePXgR
    upqhOSvu1AzwajmuVxZJuXEfocwN0dBTvv3zVqNw3wOBbrmosSgqrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpeektdffveejhfeffeevgfefhffhuedvvdfgfffhieetleefvefgfeek
    tedvffffgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhmvgdp
    nhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnh
    hgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgt
    ohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdprhgtphhtthhope
    hlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhivghlrdhr
    ohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhrghpuh
    hishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgihhoshgrlheltdes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilh
    drtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:k6LFaUFKcKZxNTo4j08o25c0HF_9cQzQ4_XdwnFdMEk0bX4NsCj6xA>
    <xmx:k6LFaZDTFJ9nvrD2sx7cZAtayQuL4yd-Dt6Pe7IuVmYFICS9dUiKJw>
    <xmx:k6LFaY3N-fYUmW7OxyFcbUCmMGe4-b0ASjdXftHTslMpTEPjfSG7FQ>
    <xmx:k6LFaXB6Lyk9B_EX-VJgI9tps54kS5YK-AS_bsALI0siRyvt-vaRqQ>
    <xmx:lKLFaSt9bSBv8SlWNkJ26_WP26ipKaDCtqsKVhxNXkMQHbjD91A6-F8g>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C96EC1EA006B; Thu, 26 Mar 2026 17:18:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 15:09:40 -0600
Subject: Re: [PATCH v3 00/13] This series adds support for the MediaTek MT7927 (Filogic 380) combo
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>, George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, Samu Toljamo <samu.toljamo@gmail.com>, Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, Chapuis Dario <chapuisdario4@gmail.com>, =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, =?utf-8?b?5byg5pet5ra1?= <Loong.0x00@gmail.com>
In-Reply-To: CAGp9Lzo1XPR7=Gwi_Qr9ZC=g4ec+zGg_eUdh8yBgUdi=qiHMag@mail.gmail.com
References: 20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me CAGp9Lzo1XPR7=Gwi_Qr9ZC=g4ec+zGg_eUdh8yBgUdi=qiHMag@mail.gmail.com
Message-Id: <20260326211811.C96EC1EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141813_788768_14A1A77C 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Sean,

On Wed, Mar 26, 2026 Sean Wang wrote:
> This part patch 1-8 looks good overall. My only concern was a possible
> regression on mt7925, but now that the incorrect mt7925 320 MHz
> support has been fixed  in the version, this should be fine.

Thank you. Patch 5 also had a build error (is_320mhz_supported()
called is_mt7927() before it was defined in patch 6). Fixed in v4
by using mt76_chip() directly.

> I am still thinking a bit more about patches 9-11. My current
> preference is to introduce the generic layer first, and then migrate
> the mt7925 and mt7927-specific parts on top of it.
> I will handle this part on my side, since I want to carefully compare
> the vendor driver with your changes first, and make sure the mt7925
> side is solid before moving the mt7927-related changes forward. For
> the mt7927-related work, I will make sure your contribution, as well
> as the work from the other volunteers, is properly preserved when I
> carry this forward.

Understood. v4 drops patches 9-13 so you have full control over
the DMA, HW init, band_idx, and PCI device ID enablement.

Regarding your feedback on v3 patch 13 (CNM quirk) - you suggested
folding the MT792x_FW_CAP_CNM force into mt792x_get_mac80211_ops()
instead of the post-hoc memcpy. Since the PCI IDs patch is now
part of your series, would you prefer to handle the CNM fix there
as well, or should I send a standalone patch for it ahead of your
DMA/init work?

> Similar to the BT side, I would prefer to have a dedicated Linux
> firmware for mt7927 WiFi.

Noted. The driver currently requests mediatek/mt7927/ paths. Once
a dedicated firmware is available we can adjust if needed.

v4 sent with patches 1-8 + ASPM/PM disable (9 patches):
https://lore.kernel.org/linux-wireless/20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me/T/#u

Best,
Javier

