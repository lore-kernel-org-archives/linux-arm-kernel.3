Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69A5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qGoQgnbOdoVq1YFMZKGg7BQZK4lBkHYejyCWzH067s=; b=2i2EVcklKMPGl2+qYBCQk4PQ1n
	bPTPkw3sdsNUChuZssTzrDTtSpCuhHb23C4tOpd3EWX73pD/9kWWAngXJCXItXrH5765+FuZDA2Q7
	fGI7LmMy8FZ93ucPkkmeZJaso7suBcl6FRRe7OIii/CMiNs/k1l2KYFtgax2BKHViLBXKFCa2TM+t
	fZ2eU46Ef/qBHVZQ0HkfTk8JS7YGeD/FWuO2Q1fFmL9Ss9vMWAAsjME4YD4QwTbK48IjcCZs1MAQ8
	jjJM98T3UFuBBzKBQB56IhQsjhmTbJgwboWDzJYL5Bnqn8tFpFjwkwD0YjOZeGnab5cICb6r5XPbY
	v+fXNqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfat-00000005Qdo-0T3P;
	Fri, 20 Dec 2024 16:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfZj-00000005QSM-2xIv;
	Fri, 20 Dec 2024 16:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/qGoQgnbOdoVq1YFMZKGg7BQZK4lBkHYejyCWzH067s=; b=cGKjcrMOqo6ztoYyMvkDjbH97u
	6byJM5JQvl+U9yQQ0tYg08jqNu3yVXSB0Nzl4YA6+TphmGXisaBRCpaix7jizmCwjmMOcQ/rWoiO3
	jfN7/MWIryY+m6/IqVgbg24JvVsH4YGXsMm2chfvM+QFqoXh/C5NSQtnt4XYIPoYkbh+Jm4OME67m
	EQv+owwCjMZqp63Rws1l9TCntnaDne7d3VTWE8W5VFcktPlwkUj9Iofb2JGwQ3b9xYcijjy5EhAbe
	4uT/c4BelSfYM0gKIQYIHc87wWHz4xy8/2oKYCcKdz4SxNLlsdbBvbvdM2AH6fThA2ESeVzqcmx1i
	zl/YoMjQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfZg-00000005hrF-1KuH;
	Fri, 20 Dec 2024 16:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734710994;
	bh=fSXg3M/0mE8dVreQMS+uKgIjGxP4AW3NuyFyKIkJBq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dqgar4bGC/BLTv2QAKUIkd2BygKD5e+I0N6V1xCCiHT4NcuJf81I2UBZKgl/I2g0I
	 xe9LrGIyhi7C1/heLBUBDO9Skf77DK2pj7i7SxlKOg/5f9AzGqx52JiQelpf/+sZZ0
	 u+Ty20bmSfwigAHVjK7LVjv7NACp3IIM0822nozSR64AdZiFSUZm1aDySRvxihfbnZ
	 5HvHwXOW8O7OYTTygAdQi5vEaXe6sZwaQKCGAkgRPGo8DxDVWt+YsSiZRyabLxHEml
	 5CCY8Q9OkSZe6yVrutIwuFPJwcNeQez0WcFSAZePgyev6fQJttjdxW1p/RjjvfFnW/
	 C85XNIPcbjE1g==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE71617E37AB;
	Fri, 20 Dec 2024 17:09:48 +0100 (CET)
Date: Fri, 20 Dec 2024 13:09:45 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: patchwork-bot+netdevbpf@kernel.org, Jakub Kicinski <kuba@kernel.org>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, bartosz.golaszewski@linaro.org,
	ahalaney@redhat.com, horms@kernel.org, kernel@collabora.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix inverted logic
 for mediatek,mac-wol
Message-ID: <876cf020-e2ba-46a7-b9b2-82dcd47f7a04@notapiano>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_161000_548634_36EA86F4 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Nov 14, 2024 at 04:00:27AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Sat, 09 Nov 2024 10:16:31 -0500 you wrote:
> > This series fixes the inverted handling of the mediatek,mac-wol DT
> > property. This was done with backwards compatibility in v1, but based on
> > the feedback received, all boards should be using MAC WOL, so many of
> > them were incorrectly described and didn't have working WOL tested
> > anyway. So for v2, the approach is simpler: just fix the driver handling
> > and update the DTs to enable MAC WOL everywhere.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v2,1/2] net: stmmac: dwmac-mediatek: Fix inverted handling of mediatek,mac-wol
>     https://git.kernel.org/netdev/net/c/a03b18a71c12
>   - [v2,2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards
>     (no matching commit)

Hi Jakub,

This message implies patch 2 was also applied, but I only see patch 1, not patch
2 there:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/log/?qt=grep&q=mac-wol

So I just wanted to confirm whether it was applied or not. It would be fine for
patch 2 to be merged through the mediatek tree as is usual if you haven't
already taken it.

(Also, FYI, I was not CC'ed in this message from the patchwork bot)

Thanks,
Nícolas

