Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E7CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 00:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQz2XCBwRS8uLK6XBV7zSGPH2BY3UI9xhwr0H8YcNTM=; b=KcOI21C/Nwz5lm4Bj5NsspVMkd
	++59nAmr6E8pYIPa76b/tLPWjWtT5ZUQ7M9g6uGPNKXleqLzY0RrAD4TwxFh45kn3oPHviMhH85wD
	8EJRqo0YjjfKvVOweB9AkuvA9Dya2tUwlpukSHejIIfk73XcHLfcjflyTSt3rlkcX5a1UV3lWviIN
	YdVhUUW2RiJ5HShCRo5sFHiKvFCHfZW7IRyD5t0jZ4gsnx0zQBxT/nJqthHYcRPe93mlBUc521cLz
	/+UJyOGdLALo1nsGaUeumW30pXpCSUZjxia785rSKi/u0mx4Vzv/n9SCrkre2CuIztjVYLgq1faiS
	AsNCgIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXek-00000008SGP-07UO;
	Thu, 25 Jun 2026 00:09:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXei-00000008SGE-3FsY;
	Thu, 25 Jun 2026 00:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACB4243F10;
	Thu, 25 Jun 2026 00:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78491F000E9;
	Thu, 25 Jun 2026 00:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782346159;
	bh=EQz2XCBwRS8uLK6XBV7zSGPH2BY3UI9xhwr0H8YcNTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MpSBA7rI/ESXhoj9CFf1wpUgC6YJUA7qMDqhbRyBPAuDBK9Ia03yaI2I6ew/dbqJu
	 sss2bjJYZ3xFjU7SUn10PhUlBSTCkC3jZ+5d8+XWPcf0b0mTJ8YetSCIuQnV/4JhP8
	 P8IplKPYma/WqSQ3oTuKqFKsjQsjK4+ixeCCY7rVMaojpukWcsBA3hX2ffZ6pqF/TX
	 TQdn+BW6ED5QjuxjNwGZqtBFZ9TseAmoE+282nKTfiTlpipVnSkH6rqv9FJiNDXNaS
	 va5qPjm+KN3jX0XhZ+Py1CCPxU6lBx38jGoqyzWCGEln8G9SIirWiLNhXKj8/UXz2q
	 l6X96M/sVO7kA==
Date: Wed, 24 Jun 2026 17:09:17 -0700
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
Subject: Re: [PATCH v3 0/7] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
Message-ID: <20260624170917.09967c74@kernel.org>
In-Reply-To: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
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

On Wed, 24 Jun 2026 18:04:06 +0800 Jack Wu via B4 Relay wrote:
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.

Replying after a long delay and then immediately posting a new version
of patches is very bad. Don't bother replying and just put the comments
you had in the changelog of the new posting. Otherwise the discussion
may get split.

