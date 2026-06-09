Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA73CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4iCZ2GB2DAP/jtWUuhXEpTanDN24DMTGAgyHy3foqo=; b=4NLwFj3Hk5OmMCAK0N49i8FHeA
	LtvuclmcD68iPcnl5YgaSiELv5iCKVwMHUf0qK5F3Azxb9zz3zCFwK/ZYFJ3pOLKhXD/v3RVDBQ5P
	iq5ExlC+dfwjo8+v3/11Wq6jAiWwNRg5zU9SFAynwtFmfquEdbj8bKaiUQeSqqHDuC/rTPraDKumD
	j5ObMPiWRjxSeHritFiD+M6ZXCruJBj3m+gwVE2B7fS3dBjukQl92sO6WLQEFMEcN87ZDXfWY7x06
	Lp0GunL1Ob4T+ZgDmBCsgT1B1xvYT/iD6Yoz+IEYv8tbWwRWcBqPNRQ/Rf4ZBsbi/C8gxKzKR7nxO
	UR0Nv+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWus2-00000005SaO-2z3P;
	Tue, 09 Jun 2026 11:43:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWus1-00000005SaF-262L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:43:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90C1A601D6;
	Tue,  9 Jun 2026 11:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504F01F00893;
	Tue,  9 Jun 2026 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005428;
	bh=e4iCZ2GB2DAP/jtWUuhXEpTanDN24DMTGAgyHy3foqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PT6BIz79OzZWACODFzb0CeV6fYUh2v5mwAJnGIsyqKeM2+80I6Hqt2FfxXMpiIGTu
	 zaMQOsyyfPYZw8dJj66gXMtTjk7OQ9wUrUunK6VsX2tYwXwyjvcwSm27FzzY+MRCKC
	 TMHqiukZHXUMdDXUO6T6+ws88L8766OVd5aQafUtd3KNOypEcAPh4iUVXR56rN1Nr+
	 iohu9job2JaeBBaB/MyPnx8y/Z47Y2zP0HFm7FG286vAeMw+GFxNnJ9I4lPzEPuoWP
	 ZGcbLoqI03n9t/DElZ8fVl6DL4KrV/x666h1f4WgZdsXuB7CmktfUb81tMuvcmqxqx
	 Se67S9F4s2m8g==
Date: Tue, 9 Jun 2026 13:43:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
Message-ID: <20260609-mighty-excellent-shoebill-04d7fa@quoll>
References: <ah3ZAPLzh8ORGmpH@home.wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ah3ZAPLzh8ORGmpH@home.wens.tw>
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

On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-7.2
> 
> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c247e565f:
> 
>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:58 +0800)
> 
> 
> As mentioned in the tag, this pull request contains a change that should
> be shared between the soc and clk trees. However since I don't have any
> clk changes to send this cycle, I think it can just go through the soc
> tree without any issues.

But the clock driver change cannot be in the DTS branch. This should go
via clock tree even if it is one change. And definitely not via DTS
branch.

Best regards,
Krzysztof


