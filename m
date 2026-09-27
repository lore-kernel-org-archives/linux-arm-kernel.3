Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F65C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmbMvMbNo21iDIQcPjYiZ8rxZbILeVSsn31zI9BczIM=; b=VYvfviS00QCGVREkZOXwi8Alj1
	KosbLAfoY0Ew2q/pVHHPmA7eoqiy46dQMeD0cOQjyHHWFxuiXajoLvStG8YwDwuhYpyMX2GefgAjY
	sFqMkZ8L+8S0KGOkDpkznI50DOUFhZCL/q1anLgeBxwP6olOeR1lEOMIySf34GqpqScVAc/OQYs3x
	QvnUQ/j9AnAYjRMExBmZFnB7mG6Px/fQyK8k7qb0K0oomy55KxbFpBmawXAV9y03pddwVBRK5SJ9m
	m0cteMvTX+Jn9TbKM8WIbP1B8XvBGWxgmiGRfHs8WAdV9FDtVWazZEgle3HPc7vXbvZMus7b1QMXw
	m2Rmzb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFJ-0000000GFLN-2bjU;
	Sun, 27 Sep 2026 11:40:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFI-0000000GFKm-2qMM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A50434EE;
	Sun, 27 Sep 2026 11:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A972D1F000FF;
	Sun, 27 Sep 2026 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790509239;
	bh=vmbMvMbNo21iDIQcPjYiZ8rxZbILeVSsn31zI9BczIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FZk/je4ruH0VKxzN7nZdZENF9BdMt81miKiYG40Kbr3s+9s2grquDGd+Lyz4MPjyO
	 uWMLZqN3+ltV+QR9jcceqmehRMiAbsLI5Y6wXXDb98IGn6ddbn5YIT5HgG8Rpj4qaO
	 DtjVVTVDBCF8Eh0r+oDumhe7om23JSo+Afej2FZNb0ya/dXKwQ0NgKBxJeGOqR1pAy
	 9RnTKgnhktjFOsz4X1DkOVG1Ze7j9RSQcrnHDAMApESxGFDCU1c2pW8UZgt3h2FtBg
	 zbHE7j6aca/hbFfkQmj2ds/0JAFcBJ5eeLFQS8BaVrRc4QYl6MOQGnjjHo2V3HRaS7
	 Y8GoTGlBrnb2A==
Date: Sun, 27 Sep 2026 13:40:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
	Wolfram Sang <wsa@kernel.org>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [SPAM] [PATCH v7 0/3] i2c: xiic: fix SMBus block read and PEC
 support
Message-ID: <arkAZJEJTtNsCjmF@zenone.zhora.eu>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
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

Hi Abdurraham,

> Abdurrahman Hussain (3):
>       i2c: xiic: preserve PEC byte length in SMBus block read setup
>       i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
>       i2c: xiic: don't clobber msg->len to signal block-read completion

pushed to i2c/i2c-fixes-2.

Thanks,
Andi

