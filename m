Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6731CC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dittuI7Jo/Uhew1jMl8JLGUl5/koRCSwkzAOXH6YsVQ=; b=d6u3F/eGJjSQjOT4phUMzHkBXn
	Q1RcBPda+cOsYnBa0eBGXiQvffhXL53RdkGeAljpnri3O+r9X6JcBjDqR/ImCMBTgUaXef1wVNqwj
	ZkqDvVd0B85Ko6g5qlpVKEOlVDuNLHRkfsleM3aZJKlqLCX2Fo7D6bQ/Y3NPYOHXK7S2ms098pfcX
	wdwx/xUb4W9r+2wkgoTHqtIU7QLIbEP3AZeTL2F5aHhlLhsRjgt5T1qxJRDGHQkojCgCPNwLdhSTC
	g7XBQMvUDNTzODlbIOMpVSGLeTP8fUNjh3L3+8HMVMUmc7SduMgGtB6x6M+Xnry+5AEfcxGzMrLQO
	wASNbHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kne-00000003NPc-3yHn;
	Mon, 21 Sep 2026 20:39:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8knd-00000003NPF-17sW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 20:39:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5550E601F9;
	Mon, 21 Sep 2026 20:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BB51F000FF;
	Mon, 21 Sep 2026 20:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023180;
	bh=dittuI7Jo/Uhew1jMl8JLGUl5/koRCSwkzAOXH6YsVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=A5bqOBoiV0iFung/gNNn0OXJDT+OpJ947kSAPW5YwL8UXBtg8U4WVecDtbGOGnc7E
	 /7JzcmUTugW+5QTLMxMF1k0E/WZHataiZXGeNHsMsOvmyFnr9VAUXaRWg/rQmjbC2E
	 +ihBhIxYm/QOL3Y8ncEoR/fwW8PgX5cEBygEimw+qdtwP30Da3y3ZWTEbiC9DI2WIy
	 rlkZLG7Ojv3nQQIKjw1aNhSwCYEWwzyR7B9zSmxDjrlg1xJbwSCodFfzN0G7v0GT2B
	 mso2UPRTM0H3JrPnkfhvxP6m1HxGY2pasFARkMF0tRYfleF/9NLDsT4pXjgPmzH0tG
	 TRl9HgxOO77qA==
Date: Mon, 21 Sep 2026 13:39:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Add Agilex5 SoCDK TSN Config2 board support
Message-ID: <20260921133938.003a5a19@kernel.org>
In-Reply-To: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Tue,  8 Sep 2026 00:05:53 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> Subject: [PATCH v6 0/4] Add Agilex5 SoCDK TSN Config2 board support

This is about to drop out of patchwork, and we need acks.
Please repost just patches 3,4 as a separate series for networking
(if the series is still relevant of course).

