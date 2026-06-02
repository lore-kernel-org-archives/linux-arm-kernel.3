Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488F1CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 00:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSv5f2xonG2jwEtIkq1PsvlV+gdAZE4pvna2aJ3ZHYg=; b=UinDKz1ImGMNryE/K0ZnqsdO42
	joUrmZS2on0MvIkUcv8ZKN4mx2rcEbo7CgLSDpRcmrNRYxREg45+oRrMXtBNvTmnj96/vGd+JE74p
	T4/tFehAlMHuem9GuV4NmSoWchHlPJKUvUY6p3yPI2qxsWVFlx3I/C97qvJo3asUFubAqpIznm8/V
	B9NTe4ZSub6FoGN4z7BT24c6sRgcdhQWRXh0542cpA1Df/r5d+SznkU8oBaSnDftX7Dr/yGiwRbbO
	Jxme+JgvG6OW4oghoGFSXFlpCFzh63X6bFa2of6sZm1/TGuwi3QL23BCF0FpozcO4akZfczVVZ8fj
	36BkqMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUD54-0000000C6cW-1CDr;
	Tue, 02 Jun 2026 00:34:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUD52-0000000C6c9-2t3k;
	Tue, 02 Jun 2026 00:34:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C61FD60141;
	Tue,  2 Jun 2026 00:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A733E1F00893;
	Tue,  2 Jun 2026 00:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780360443;
	bh=XSv5f2xonG2jwEtIkq1PsvlV+gdAZE4pvna2aJ3ZHYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LrT4R1FnMFeZReAD7nfvr5RIo8JWtky/udCbBY2ZhqtUi+Q76cohHUOPZEQPcXUps
	 /Wj/tNIkm21gcNkRQqvwgEaMJsPAuURBo/GbsQiq5cFFN0tkEBlVPx7i/uVfJC7tQF
	 wnAlEDYIXPyXCrf+GobQyRYufJVMTSwCUzIitoFrSEY34U6fvlPL5Ur9kaeBbEkAY+
	 myNvh3CyNWI90Ti4L4ErSZvJS0Fsr+z07/P7LS6Elm648euQ6BzA/kxhi+gaCFHoVi
	 so0N9r4ezQYgbcSKF/7yU6B1PE6RMNVv9KDF62FV/0Sr6Y5/FxFfEbECoKmrjnHaDF
	 TBiI9b+sUDkaA==
Date: Mon, 1 Jun 2026 17:34:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20260601173401.2c892526@kernel.org>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 29 May 2026 18:31:39 +0800 Jack Wu via B4 Relay wrote:
>  43 files changed, 14761 insertions(+)

Please try to cut this down to ~5kLoC for the initial submission.
Whatever the absolute minimum sensible chunk of code is.

Each patch must build cleanly with W=1

