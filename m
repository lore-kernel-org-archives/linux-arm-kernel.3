Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA11061B1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReuejuDn8UrdQGs4rqrNlK0vLMzZogyPHFzPjRqc7/U=; b=mnVaNle7K+lneJMgPFsPQIn5CR
	SbaNUCllCHzBqWdbTLGmdNpdxhj1rRDq4jcGfztZZCROfwoBZ9TF1V5O1R+6EMdi/qXFyys/+kZke
	kAW5rHB4VfBMLZYLeSEzjC0buqgnc3NxbEKa/t/ZTWuP2xKHXYrMRzuwpiNi5N4D9Q42EPQ2n2fdj
	L8PrHg9n/k4c39+2swMz+8BQE+GOXqjI6SGNQKXBi6hPFC2W7SWBb+UhEuMTQArPzl4JynTDi0vOE
	nNqiA5lQRYp3mP4ib+BAL5EPk4VIYuHJprbRN+a2opLwTS1dUZrSCx63R5IayTgx7e3dcQJwmwXa2
	LiES2glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JQx-0000000Brku-01Vz;
	Mon, 30 Mar 2026 20:42:03 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JQt-0000000BrkY-1en6;
	Mon, 30 Mar 2026 20:42:00 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8633614001B0;
	Mon, 30 Mar 2026 16:41:58 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 16:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774903318;
	 x=1774989718; bh=ReuejuDn8UrdQGs4rqrNlK0vLMzZogyPHFzPjRqc7/U=; b=
	I5IYlUcjqQvSMde5TX3Q2zgSSK9dFRA6iDioTURVNv+qILw+fLkkItrHyAYffvn1
	pl95YMCXaWF0mgDQtxy+dkily0DFXlf3V9qpOB2niRdVHU63jPosx//n0cWSQXQM
	zilov1rTxrumz3LA+ppLsnsAMfaN5PB9OoW0jDHqKmYAXnpELApBOXawfecb8OAc
	CosL/QuNdS/LnxHPhI14xMO0Sq4UZym3NiYdvS/pihcv6qD7iApdZA8JrIPql8k8
	BX1SHaYUf9YwArdL++qhuLF5FteQjSgZ3h6uFMaQG7tOqO6//k/76ymd42sHb8sQ
	2lkmJkWzagRm85BXx5v7vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774903318; x=
	1774989718; bh=ReuejuDn8UrdQGs4rqrNlK0vLMzZogyPHFzPjRqc7/U=; b=O
	sRhpTWUpn1JAybElN5kJOb4NuGfMEFTfyZl42SUNzLsq6uLip1TB34/hCiA7u5c+
	+jpspCSFYnvX5Ceiou15lPsp8xCQE/r60zg2zxxLz5b1LyeANJdjuh8pOx+5H8Rh
	5mVttDD19tWSAQ6M6XyG92TvMvyyTyibbOLFwbwjo8wsHy1MMgIPaOCCrxc5z+8e
	A13o1q4LctxIt2bCIGn7+lR4eE7LYm8XVt9BJbXjqcC+5EV2UX/alFwmXUTmxH+h
	T0l9FcweCA45HR+z9MVflTPBxJdnqPAWC09omxEaDtf0j6PhMePUjfXAGif6aq9s
	IzXIgnG/iQ+8Gq3tpeLiQ==
X-ME-Sender: <xms:FuDKafHE4bJ5QQoklvmZ-PP4G-AqbSZ1T5-fES4ekRAGEP65gYuM_A>
    <xme:FuDKaXI0zGiCP-Sbdr61zJgVcJYUBMJDvTgwIZRoQx6lvp0I9jVDpPIBnhqo2M_H4
    akJEzlRu_RfiaReOpbGuCoX8hgp9H48223rITy4vPvcjh7V7hVtYYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffeelleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpedtudehhfelhedvueejtdejffdtheefgefgjedvhfekvdekffeuueef
    heetledufeenucffohhmrghinhepshgrshhhihhkohdruggvvhdpkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhl
    ohhsshesjhgvthhmrdhmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhho
    segtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilh
    drtghomhdprhgtphhtthhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheplhhusghnihhnrdhivhgrnhesghhmrghilhdrtghomhdprhgtphhtth
    hopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhh
    ihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopehmvghlihhnkhhovddttd
    efsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhithhinhdrrhgvugguhiekkeesghhm
    rghilhdrtghomhdprhgtphhtthhopeigvghlnhgrghgrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:FuDKafLjw9ck_HBl3KeFPgSjqxv839H-r8Vs3_RQHb9Ihp7DVKBrsw>
    <xmx:FuDKacjFsa1o2N6SD_ym0jfkfb80wn6XQUzsljpV9ddusrsOZjJAJg>
    <xmx:FuDKaQMkwkC73E76EvaULnAH6q9u2PLtYuwwZnVgPV6Fer5eHvhUUA>
    <xmx:FuDKaX6FAAgXreo7m48R4WJ_powIfpYu8-_cqLdMX8k4tCwVsfEmHg>
    <xmx:FuDKaXqrDk9--SyNBSZW5OyyNLZdgBzFEuxfqcIVcnOzQ0MJQA8aW9wP>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0F0D11EA006B; Mon, 30 Mar 2026 16:41:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 30 Mar 2026 14:39:46 -0600
Subject: Re: [PATCH v3 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, Ivan Lubnin <lubnin.ivan@gmail.com>
In-Reply-To: CABBYNZJLQ99727+3vnKscsDwgTnuP0NijWr9T=YWBpdq7giv7A@mail.gmail.com
References: 177272816248.352280.12453518046823439297@jetm.me 20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me CABBYNZJLQ99727+3vnKscsDwgTnuP0NijWr9T=YWBpdq7giv7A@mail.gmail.com
Message-Id: <20260330204158.0F0D11EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_134159_645875_4B0F1E7D 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi Luiz,

Thank you for the review.

On Thu, Mar 27, 2026 Luiz Augusto von Dentz wrote:
> https://sashiko.dev/#/patchset/20260326-mt7927-bt-support-v3-0-fa7ebd424323%40jetm.me
>
> First one is more concerning since it may mean it can lead to crashes
> with SDIO driver, the other comment may actually need to be addressed
> separately, perhaps WBS handling needs to be fixed on this family of
> controllers.

Both issues are addressed in v4.

For the SDIO concern: btmtk_setup_firmware_79xx now takes dev_id
as a parameter instead of reading it from hci_get_priv. The SDIO
caller passes its own dev_id, so there is no out-of-bounds read
from a mismatched private struct layout.

For the subsys reset: btmtk_usb_subsys_reset now skips the
post-reset CHIPID validation for 0x6639. On affected boards the
register always reads back 0x0000, so the validation would always
fail. This is scoped to 0x6639 only.

Regarding WBS, I verified it on MT7927 hardware (ASUS ROG
Crosshair X870E Hero). The controller reports LMP_TRANSPARENT
and LMP_ERR_DATA_REPORTING in its LMP features, and
HCI_Read_Local_Supported_Codecs returns CVSD, Transparent, and
mSBC. A btmon capture confirms eSCO links establish with
Transparent air mode (0x03) and 60-byte mSBC frames. WBS works
correctly on this controller family, no fix needed.

Link to v4: https://lore.kernel.org/linux-bluetooth/20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me/

Best,
Javier

