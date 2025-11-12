Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E7BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXiJfkrJiRraDw14pGgz1Awhlrxp0PJD+c+dIYS5Q8M=; b=kal8aQQjLJB2EMe1+a1S/j9ZZA
	Opzm14PInZgujzyZz11eMaT0KJq3codtIKP0/UXI9o7rUmVnBlW5vKTiEV9gw+gKIqTixCQSw7h9V
	cicEjC6LPRaao2NeS2j0CnLKDYA5qSu8JOAa/aDI3qVPIQdo9FpFd00EKr9+Mjtze+l1JZt9oDiUn
	6OP9CXYhsdnpr4AeduZK9TEpg6+yvR3v4RUU7unTnjs6nYahfnb7omIPVIG1HyiGf8Tqh3YeSOlrj
	TGrZJVbMkHVmAPBY/0ug5xcoXGZgv/kY/lGwsRt1gUIz6Zd0F1jraE/sc4TZlcTEIqJJ1kYG0DC6+
	3AVWs9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0TT-000000081Ce-3Q1q;
	Wed, 12 Nov 2025 02:20:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0TR-000000081Bl-0poI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 02:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E22E42DF7;
	Wed, 12 Nov 2025 02:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB561C4CEFB;
	Wed, 12 Nov 2025 02:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762914040;
	bh=PKFt6Yalq58XwDx0B7O/4lvJWYHogc48BPfJjedBd7M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=giOWRU/WSP2OMU59905oSZ9RuACnDeC40ubBUVrWy9edarQsNyto/s+2ayQkdgAGs
	 HZy66tFZQUl1Q9GpT1AZt7Um8f4D7dyEFGTITIS+EXsRdNOgpEDzRr41Ef1o1gp3Mr
	 1KUo4nllZMwoatg3e1O345bWADAXXbMbonDuyvUJRvsTY8Tf+z9xHl7ZlfV2q5lUjR
	 8MqyQe/lvAK9aHU5F+6tofYjNdrM0mz3sP5tt3NNQ1qexba0afJpEPiDmWrwrzHZSz
	 /u9wdGoIdfcjrZFAANWpHy9B+KZPhu096pYqe08etjdcEi6FibAldL8eJP/5d5/Z9H
	 Edff8NmTBLgcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E47380DBCD;
	Wed, 12 Nov 2025 02:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: sparx5/lan969x: populate netdev of_node
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176291401005.3638373.13399980583922372117.git-patchwork-notify@kernel.org>
Date: Wed, 12 Nov 2025 02:20:10 +0000
References: <20251110124342.199216-1-robert.marko@sartura.hr>
In-Reply-To: <20251110124342.199216-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 horatiu.vultur@microchip.com, rmk+kernel@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_182041_259312_D8AB7908 
X-CRM114-Status: GOOD (  10.08  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 10 Nov 2025 13:42:53 +0100 you wrote:
> Populate of_node for the port netdevs, to make the individual ports
> of_nodes available in sysfs.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Per Daniels suggestion, set it directly in sparx5_create_port()
> instead of doing it in the dedicated netdev registration function.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: sparx5/lan969x: populate netdev of_node
    https://git.kernel.org/netdev/net-next/c/fc6aa0e470e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



