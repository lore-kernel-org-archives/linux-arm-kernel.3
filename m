Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537F9D1037A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 05:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqPBiub9YnM5ZlppPyyaW8AmCwAqg7HdGEp6h/Th4xk=; b=JpPXw7K1mTJ/1W/BssP+wTK77f
	x+xHbuSFINU4Iai129N5TExQ8U0uMwb+cFQPa0cV5VosIptRWcFNCHb0U7PFznnN2XSQQ/VPZCaiq
	C15o16K7tNuHzkReEhWfTxvtJujcSDaPous0Mb4qfNOG+faC5WIQ4GoIRZt5fEAem6atl9OfWBh8n
	xCXlqbZ4prIEDyItjv3QOeGBkv1dkpmzCuwl2f3ivuPLnkJmQFm+pDLmguPeyD1YmgqDU7qbYlQSS
	X0dtGDOuD5LWOOPP5hIDPRGPa2vxEyYIhvsqqjhtcuhtHzBGQVPGh1duN9IPj1D/0dxBtb3oEyFAO
	uKX5C/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7rF-0000000EO2D-2KoG;
	Wed, 26 Nov 2025 05:14:25 +0000
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7rC-0000000EO15-3tHt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 05:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1764134058; x=1764393258;
	bh=lqPBiub9YnM5ZlppPyyaW8AmCwAqg7HdGEp6h/Th4xk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IOB8bPAVEdHLY+mCRPcHNt5ZrI4GM+JpjLj4LajdqXqOSFUUxb9QrqCGRPN5ZysAY
	 szekhG9E1L8K9HuQpM9F3wZs2w36Xkzm7Xsys1lAbbbMHjX6imZtdUAO6L6PsEE9H7
	 9Iii8bVUv3LMf6l7CRqOFSOSriIi0hWeKhRYINz2GHRA5rfUgTXjb6lNhnSsEzkW00
	 Dhw0V+T1irb9OJIxMEVrn0L72Zf+grBDNwAzHXxfPa1+R/VA8ZCBcL4E0eoxt51jYF
	 7xtmhQKtVVMXfr6p69QH8TLhI4v7PwWri5YihPcQp9Y4NAXRz73+hTsaafB4/qMydO
	 rrkcEl5f4uC/g==
Date: Wed, 26 Nov 2025 05:14:15 +0000
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
From: incogcyberpunk@proton.me
Cc: patchwork-bot+bluetooth@kernel.org, Doug Anderson <dianders@chromium.org>, marcel@holtmann.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, regressions@leemhuis.info, regressions@lists.linux.dev, johan.hedberg@gmail.com, sean.wang@mediatek.com, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Message-ID: <GFrqLPSzlfDdtFVUTPC7SJgyvzo5-3iiu9t3nN0uxRe4hDjFtHvYlYolo4Y3uqGlcOgyj3xT8hCch66lBLVmiG-li3rzC8G0xvqqSRTeJbo=@proton.me>
In-Reply-To: <CABBYNZ+LrMOr-Bb-Sfk--FAHjMWxzeUCdDoGLuRqhF99xaGE3A@mail.gmail.com>
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid> <176366460701.1748676.511972373877694762.git-patchwork-notify@kernel.org> <fcMPe6V9vMYxkXRMnKXiaeTnOwAMBNRTmF1mgLePTpz3Q4hPqpb0WVQ5aXZljqkOtZ2W_47PVL1Q4lnf7kZJhFS4aGwP8_4QiqJl2ScKSi4=@proton.me> <CABBYNZ+LrMOr-Bb-Sfk--FAHjMWxzeUCdDoGLuRqhF99xaGE3A@mail.gmail.com>
Feedback-ID: 139104781:user:proton
X-Pm-Message-ID: 59420ca908e796d525920d09c3f8d014648bb468
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_211423_565158_D5208E4A 
X-CRM114-Status: UNSURE (   4.48  )
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

Hi,=20

Don't want to add trouble, just out of curiosity.

What is normally the route for patches to get into the mainline kernel?=20

Isn't it as follows , as suggested in the documentations ?=20
subsystem -> -next -> mainline -> stable ?=20

What's this net tree , and how are the patches cherrypicked onto the  mainl=
ine kernel? is there a certain process?=20

Regards,=20
IncogCyberpunk
 

