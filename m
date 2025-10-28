Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF0ECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2vhdIyk9xTu0J+xrZ61nHBeMbfH99ASOuP0yZq/9Lc=; b=B/JKangWQGGx0WRLITeBfeuOq9
	/oEMNVsHoT9GHbTQRep0H+haW9XtSDvwk8tQtGaxrx08WMNooSrGyVjk8prIjY2dU/hTI/wRF365A
	mvlMZGVhrD0tH4PbZ0iqHn+1WM6bGiqh7+DLg2ZS+f7+R9LueBuoA2Hm7TJYY9QutoooSPf4tjJm4
	eeZWBjJ/7V5Y8yFWYkGhfx9wTfhDj/Ya3zTay1wWWzgVuEg5NLfYqadd7ISk6wwX/DqCWbiUBN2Te
	enO8PdbP/IOUD8Sph8WAuAmKivf2Jyw0blbD1+8UOYR2GOa9pxQCkSiEh8ZAHxdlqYIv0sFt/gF4W
	xqiCeWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYXh-0000000F4J6-2JSU;
	Tue, 28 Oct 2025 01:30:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYXf-0000000F4Iy-1vcf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 01:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 821836175A;
	Tue, 28 Oct 2025 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E557C4CEF1;
	Tue, 28 Oct 2025 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761615030;
	bh=Bm2irc7gXUY0CPdzzsQ3acckBICJU4QlM8eFUNd3X5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hnr26WG3OLnFInlblb0f266rA6wtxVdNFWKC/epftIgZJ7fXAroehIm+TrueFE5IM
	 daxlCSD8Z8HuN9z/PFR9JGDRwnPt5CAZmGEKyfMIdPXmGMt8V3DoME7GnOOUYzPAhE
	 bfYXIsykI1KMN5VSL8qjV5FcTRyOZ/FUMV28JQFiiNdj+at8YB5aaOAyf7RIRLm4AX
	 iobP3RB9fzN/ZZKifiiU6T5DhB31l+EMAF26B0mrakbs57ZUl2dvvGQdPBRkP2X+xW
	 qZahuqyLgeiKIbbcwLiqTMynhl0my8EBErqLg3hicCuhDjgZBcndqydxadn853f1vi
	 FF7/G9uD2b5Vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7131E39D60B9;
	Tue, 28 Oct 2025 01:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] dt-bindings: net: sparx5: Narrow properly LAN969x
 register space windows
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176161500826.1653952.7154756553118848296.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 01:30:08 +0000
References: <20251026101741.20507-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251026101741.20507-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 lars.povlsen@microchip.com, robert.marko@sartura.hr, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 26 Oct 2025 11:17:42 +0100 you wrote:
> Commit 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register
> space windows") said that LAN969x has exactly two address spaces ("reg"
> property) but implemented it as 2 or more.  Narrow the constraint to
> properly express that only two items are allowed, which also matches
> Linux driver.
> 
> Fixes: 267bca002c50 ("dt-bindings: net: sparx5: correct LAN969x register space windows")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] dt-bindings: net: sparx5: Narrow properly LAN969x register space windows
    https://git.kernel.org/netdev/net/c/210b35d6a7ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



