Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65465F3380C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO5ulInoe1Z4PJWUeqIRmGVQ1wGWuYCkPGJod5QhfG0=; b=cxgykqQxaGf/U9gVhBC5Tl2UpD
	TcB0W0YA9+/CG1dRxj5rmVPEShOVDDg0ZU+YdvD4xsAlwFKz6D+YIKdHAg08T3jt/c4NnWoPLz6kL
	ZwLN0X6QoYjJgcK/BhMv0cY3J1+EtAlFpf5BqnQ3YE8L34gpOthpTVhRGOxtv7jNlZnMhXazNj6XJ
	T8vX693Jtx0WYwgr9JMzMaayXS5ttMSQxQztg98UBdXeEsPTXckZx4Pb/ohunOX7aq3/Me0bYirAd
	deliret2NGwX84Jn+qDZcz44CRe2gICpU8DmsR3z8eV7tOaEKo1S+lJKYvnkRR6eaTI0MXg02kAo4
	F9mOLGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PrM-00000005jiT-47o4;
	Tue, 17 Mar 2026 08:33:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PrK-00000005jhz-2uQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFA5C40A17;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAF4C4CEF7;
	Tue, 17 Mar 2026 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773736381;
	bh=/8Mm9f4wVRAQRaL9ESTSosSt03cNCq/bqKwrcekeK7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+5SsNIDLHqHiF4ok0mD4BeGa9VRdXLvQUqHUq5v+0V8GJX2SjWmumNJXhwGtceAw
	 ng3r8yxFs+8y3X2uJbtLhEqBSvJ4uarpXQk1nD0c6zPcd/CZM1DoogIc1SniF+L/nN
	 vEs5/3zHIQQWCj5G7FDyboHgXdBpAiqReuOIHe3tQph8jgp0YxOEjy9/zr0vSD8dx3
	 wGQBKkXnEziG2VWytHqYIoJSkLajMJDEM6cBkRRqcmwqCeaplvAhaQPQOubIssmNur
	 evryn3ngLbkLE9syOLic6E/ckc8El5JHZvmwWPR8uR6RXPgurTR0WEglUZ1A0Ogi3C
	 4W0speqf+Hevw==
Date: Tue, 17 Mar 2026 09:32:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Message-ID: <20260317-spirited-mahogany-swift-b1ac53@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_013302_749075_22FE7B68 
X-CRM114-Status: UNSURE (   9.04  )
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

On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> 	Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.1.
> 
> It consists of 4 parts:

I think pw-bot did not reply to any of these pulls, but I applied now
all of them.


Best regards,
Krzysztof


