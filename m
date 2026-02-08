Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA70EF06E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46PzWKkbN8jaQfyJt6a02ES7KOmaGqvgJN82/XjPPqc=; b=xcfkV1xjorAZqQ0jtxRZyyAs+i
	UDpd0svucp3e4JUumPAlrwZ1XmGswfC27XxysGgl8sjNLCSFbRhOMlPkaKv3hablmAblA9FyZ1SCc
	G1Rc0HUJ0R096bTS3+c0zHMdcz4pKDfAPAYhYNC9vnzsgNQviIThFx/nsT3tyPEsuroMy736NEnHR
	ADNutNEcnQ335oywJaS7ygLdxHU6ADrbGoq/cA8vQcoH5Jg5rA5fRnldoST7Csqd/6Udj0UT6ciNP
	KoXfm+/0crjzJVYGvxAZye9BhtyYo2m3+E/rsloJV9sGuO+Y/5fhoqZ0y6/4Kr82/hf4dJvyhRqxV
	Q0D7ByAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5Cu-0000000DMYQ-2YE0;
	Sun, 08 Feb 2026 13:52:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5Cr-0000000DMXd-3GUL;
	Sun, 08 Feb 2026 13:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E48B943594;
	Sun,  8 Feb 2026 13:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369A8C4CEF7;
	Sun,  8 Feb 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770558722;
	bh=SCOqPgpOs6JgrzzzsvNoYMWOkNcynFFT/x+hV44QYUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qao9non0j1tzkdoEdZwRijuNi52bWkVmumJL4E43t7LOt8/MrW5144wVtvp2TbMWz
	 ceI7SVKDR4vUD4UilwYHHGO7c4KFOrQAEwlD/vkbJxi3+8mAkFChUyETXbTx+64+ZW
	 O+DWMA58QQh6vgyZHSfyLGcJVs/JjJ4AwpwwP/Y/7rkSkH0YGL3HvROOthe+1siHAb
	 Zl/KyZaaqjPFtDsfUtuHn/5t9VRZh6EWcrMUo7HxWJTa4QezEl0L3IYFnj2onglw3t
	 cTMzHCX61EVPz67awaI1TvrnU4/MHTdA9wgnKbUHcxDNRaL0CEsvX1HScM+tK0faHS
	 2n5zrtuvhjN0Q==
Date: Sun, 8 Feb 2026 14:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B
 compatibles
Message-ID: <20260208-analytic-fine-grouse-e17baa@quoll>
References: <20260207131803.2834749-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207131803.2834749-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_055209_865768_633E24D9 
X-CRM114-Status: UNSURE (   8.10  )
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

On Sat, Feb 07, 2026 at 10:18:00AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add the GRF and IOC compatible strings for the RV1103B SoC.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> -  Update to the list of children.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


