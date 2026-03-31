Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE2210F92E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:References:
	In-Reply-To:Cc:Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCj3dftpVU3GpBVKt3lynWlhu2vzbEQlfi+/kTc3Y9I=; b=mDynhJzvX2QBThNRCI4EBiDy1l
	e/vtxO3fMIm6zYCfGCypaUm98nIdfNaHc8IJewPtBTYqkSds7YtFpada2NKpoqBn3kbEz6Yqr+zNY
	T7jsT9hDib4RA2a+oOBn6vQrAmrot13aZvGmYNLpPsurrlmRGecISHzyhwx7NEFBdDxixvHRdXqPN
	xF8oNXHQjO43YrtJzhR9jnhuNz5uKotFzuvBPskXF98HOohLeWy9fya8oFv6LSqolWf57rpXzZNS4
	elizuPM451eLL+tDWoOcIelolhc+JrKnsA9KuktnJd4Dx7FjiPoOrS1sdsa2l8gZn5x+o/Xk7+Vlj
	oudRTaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ccA-0000000DJdx-3VPq;
	Tue, 31 Mar 2026 17:10:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cc9-0000000DJcl-12WB;
	Tue, 31 Mar 2026 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:References:In-Reply-To:Cc:
	Subject:Date:To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wCj3dftpVU3GpBVKt3lynWlhu2vzbEQlfi+/kTc3Y9I=; b=TBY32gYWw6CkQtxydcYZ9WZ5cm
	OGfnJ9UUjIX4+daDBefb5eMZr3dxitducFJXnQLcgAXEqj9GzmKJXEGO4HwInN6A7wosWfSKxT5Ho
	IZ++uuTBdNiqAzLw/Khn2Is3/lxgCy2K0wio30Z+BA+ABMSG4U9uNjRnYxcYTGGNOSXLkaMwc7ltU
	3woN8Gs+r6cCkDRCyWqS2qLxQn9Xy4RCx5T5QBYa8ndeIjjYiuCXsbl5tjiKOVVWZ7UogKW33dT6K
	+GJU4iBymK5UBG8Q1y4Mq1dTU+8KEZg9KCe4FX+s1rj/T76WNqs+gP2gV6QSU1yGi4LUlNE60Y7Rf
	YBd9sEMw==;
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7cc5-0000000GMFj-2Hym;
	Tue, 31 Mar 2026 17:10:52 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6BF2D7A0017;
	Tue, 31 Mar 2026 13:10:44 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 13:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774977044;
	 x=1775063444; bh=wCj3dftpVU3GpBVKt3lynWlhu2vzbEQlfi+/kTc3Y9I=; b=
	lWCnuegI0gtC9O4eliIV4tXGF+x9qPXFrdjUUisuivwJMT4vk5JktwbBtw1DPAP5
	ndwDN+UqdlAnPm+vXMN/6JRYO8Jw1sl2XzFSxNnknEMmNIWx37qSaJ9cKPvQKZPg
	CFcX2T0Jl0uhZdEFugW6s/DwOvf4nKEMbeJhlGwZNfzuvETns6XT5+gekiRfdFo4
	/A4bTFByaaIdFSWWc1398czsPKNyHhti+zXF6ygrwE+hGi5oXrychQZhTbO+6KD0
	spugdL9Vlfw9MPTPMfG96H5giTAIPfISAJUgng2jcgFhKc0fZaja0Ns2cvd/6+83
	Q6UGWrU6P4HwE4Soknapog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774977044; x=
	1775063444; bh=wCj3dftpVU3GpBVKt3lynWlhu2vzbEQlfi+/kTc3Y9I=; b=d
	gthWYE+ndY4ZJyDnscsxhQJHJmKZAWIEGgJXqdTgMNBfxgporJn9qcm7Frp404zw
	UND7ODlcaJM+ZUNIdCVGDMwuFrZ7DEfennREErxxAQcnaQJNcTLoIdhQSFSgs/IC
	Am7emB+zfcdhT8EyGFP8lG8eHrgGvsLYBvZR8nVHNH/prp1nox4VS++KGfaFgyUM
	NMEnlNpn90XXd86yBxWVhUSZ5VpPggPpvPV3GcA9fsx+Rv08CgpEzyayaloO5rwk
	f4rF1gi5yvs6MygT69SrcLCxJF/IQck0IWk+eI5fiaxVco7oyC3PniFdcKtWqeva
	sq3T1RAGo0c+UQYy/tRDw==
X-ME-Sender: <xms:FADMaeXEYzkJHL5CEv5cDkFJtzUcVrnu6ZCLhITQoDsXKCRMKn8ahg>
    <xme:FADMaVZnCwdqayDJJXyMYdeNbeSBXVwU37qrGGAtgJPTPT6OcqRPyQnxkgLR4bXgB
    dnnckw3vqAitPSHABPCM7Oug0lUY921h6db8EA7IvXPvkhdYoCqYvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfpohfkff
    culddutddmnecujfgurhepofgtggfghffvfffuvegjfhesthektddtredtjeenucfhrhho
    mheplfgrvhhivghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrth
    htvghrnheptdduhefhleehvdeujedtjefftdehfeeggfejvdfhkedvkeffueeufeehteel
    udefnecuffhomhgrihhnpehsrghshhhikhhordguvghvpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhs
    sehjvghtmhdrmhgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgho
    lhhlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgt
    phhtthhopehluhgsnhhinhdrihhvrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    huihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghs
    rdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgvlhhinhhkohdvtddtfeesgh
    hmrghilhdrtghomhdprhgtphhtthhopehnihhtihhnrdhrvgguugihkeeksehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepgigvlhhnrghgrgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:FADMaYZDV5-erLfmX3oNSncQKKMaApAqEays0jplSuwfYNEG1pPKQQ>
    <xmx:FADMacxvwIMqp4CwpzPz0yZ5QjsYqtUyjCyXAuQx2Z8RFc18MCrtEQ>
    <xmx:FADMabcfcMXCz69OnkyfCCwWXczlfi5zmSkYFSbCzXS3EA5ixniVCg>
    <xmx:FADMaSJpKPj3gqnD4XcsFAnuz4AWpsuJb95YfzOAyjDuit3g6BCmHw>
    <xmx:FADMaQ_d2sgQ6C227okyu7QGPX8ZiitSe8QJrRgBR3lV0Uq_-QaJe95r>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1C481EA006B; Tue, 31 Mar 2026 13:10:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 31 Mar 2026 11:10:02 -0600
Subject: Re: [PATCH v4 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, Ivan Lubnin <lubnin.ivan@gmail.com>
In-Reply-To: CABBYNZ+MFJU=LLEaizYEt1b-7VzosErkav7dyneZExr_rLUnRA@mail.gmail.com
References: 20260330-mt7927-bt-support-v4-0-cecc025e7062@jetm.me CABBYNZ+MFJU=LLEaizYEt1b-7VzosErkav7dyneZExr_rLUnRA@mail.gmail.com
Message-Id: <20260331171043.F1C481EA006B@mailuser.phl.internal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_181050_037724_FEA4D83E 
X-CRM114-Status: UNSURE (   9.51  )
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

On Tue, 31 Mar 2026 Luiz Augusto von Dentz wrote:
> Ok, but on 8/8 it seem to suggest the problem still exists which
> trigger the following review:
>
> https://sashiko.dev/#/patchset/20260330-mt7927-bt-support-v4-0-cecc025e7062%40jetm.me
>
> Perhaps we should ajust the commit description if the 19 seconds
> doesn't really occurs when 2/8 is applied.

Good catch. The ~19 second delay is indeed fixed by patch 2/8, so the
note in 8/8 was misleading as written.

I've updated the commit message in 8/8 to clarify:

  Note: boards with this USB ID expose only one ISO alternate setting
  (alt 0). Without the fix in patch 2/8 ("btmtk: fix ISO interface
  setup for single alt setting"), this caused ~19 second initialization
  delays. With the fix applied, initialization completes in ~2.6
  seconds.

This is addressed in v5:
https://lore.kernel.org/linux-bluetooth/20260331-mt7927-bt-support-v5-0-6f31b4342daa@jetm.me/

Best,
Javier

