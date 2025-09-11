Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC337CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Raijf0pxSNsl3FesVHkWVDpo58+B3Fa1eBdInzF1Pzo=; b=1M1iyThavpOkWaSUiyA6/rqg6N
	YuOk9ukwpafln3YMiaAzyqIRQhPrcVhTHv31VGAi6Vf50VnQwiAzBJQYXYNUQJ8M7wDqDwz3tzSms
	2oBQbtaIJdps66uSXhj5JrkYBpZPgrrDlZQtz+xlxCijOVFtXHPCCa03LQhc8sJ3XCK2JeIKrGZw8
	DZVs7q8IiXTBV+e6P9+39Yb1ePNyFRSXEMjv8+wkqp4PsIHlcf6KxqCwrt+C7/Z7WOYt0LB13fwJf
	s0+ZH4rlAtaeCFeWZ/XcEzIXaYlKPDRk5TkOPDnrNzQ+FG5ILlNUB+2xBPx2xENtr+Legwjhxhq79
	L0ngdvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXTz-00000000U3K-0mOR;
	Thu, 11 Sep 2025 02:56:23 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXTw-00000000U2M-35a6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Raijf0pxSNsl3FesVHkWVDpo58+B3Fa1eBdInzF1Pzo=;
	b=WlYgDmVJKeOz2HCf2T+/k5D8y+gVK/8GI5wnA3CJUtFKLCw3FKtT0HQ+SMWNbN
	r1wUJRj7/OCzAdF3qFfo7/QL143fSqZlCBNUoLAN0RUyGDl9hrO6ejStoJN9kwpN
	2v5r3juk1e+SmN/7wYQu30AYMQ0qkRkmT26/xaXEquwfs=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHe3scOsJocw1PBA--.47548S3;
	Thu, 11 Sep 2025 10:55:27 +0800 (CST)
Date: Thu, 11 Sep 2025 10:55:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	frieder.schrempf@kontron.de, primoz.fiser@norik.com,
	othacehe@gnu.org, Markus.Niebel@ew.tq-group.com,
	alexander.stein@ew.tq-group.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	netdev@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v10 0/6] Add i.MX91 platform support
Message-ID: <aMI6HNACh3y1UWhW@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
 <aMI0PJtHJyPom68X@dragon>
 <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
X-CM-TRANSID: Mc8vCgAHe3scOsJocw1PBA--.47548S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1DAFWDKryUWw18Wr18uFg_yoWxAwbEvF
	4UZw4kCws8GF4UK3Wktrn3AwnYya47Xa4xXr1UWw43Z3Z5ArWkXFWFgFWkJFn5KFWkJFna
	yr9IqrWq9rWa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8S1v3UUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwXFZWjCG0lVNgAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_195621_078123_103279C3 
X-CRM114-Status: GOOD (  10.80  )
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

On Wed, Sep 10, 2025 at 10:36:06PM -0400, Frank Li wrote:
> On Thu, Sep 11, 2025 at 10:30:20AM +0800, Shawn Guo wrote:
> > On Wed, Sep 03, 2025 at 11:40:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > > Hello:
> > >
> > > This series was applied to netdev/net-next.git (main)
> > > by Jakub Kicinski <kuba@kernel.org>:
> >
> > Jakub,
> >
> > Can you stop applying DTS changes via net tree?
> 
> shawn:
> 	Suppose Jaku only pick patch 6.
> 
>         - [v10,6/6] net: stmmac: imx: add i.MX91 support
>           https://git.kernel.org/netdev/net-next/c/59aec9138f30
> 
> other patches is "(no matching commit)"

Ah, sorry for missing that!  Thanks for pointing it out, Frank!

Shawn


