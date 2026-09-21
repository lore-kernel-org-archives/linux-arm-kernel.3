Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E6C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBqt0mh6pcap7thNEZ0vvpX8jJ6tpmFAZKqxiel3dQQ=; b=rLP7pluX8MjkneNXqeVNqZ2M+T
	J42cN8I5qSlR8TLM/x4zSRYhEemxFs6QR1NpvDEKKqIn8ZHeKy4r5REC5SG7kJCcefD64FxNRjLZ+
	dG0GUUt7xxGwGG3aYleoaDEMYGV805Btj2lLWi8j2TvEUq97rMjCcK/VCeH+91KPznHYN19TvhgPW
	eP+mTDzqmD3N1l+Xup/Ky1604l0VQKOR8Ob3GLsNI4rvZR/PvS4lpigjPacrdC1Olft6GlUo/V7Yu
	NrbRy2HTcj+sDzTFQ1nuuJ7YcqC28Czztk6LIpw24DON6lj4Z+j9qdrzB9MhKp+9hl4M9m+OhLh0K
	M8V4T1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mdf-00000003ade-10ei;
	Mon, 21 Sep 2026 22:37:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8md7-00000003aEA-2zee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:36:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26ACD44A35;
	Mon, 21 Sep 2026 22:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39C01F008A3;
	Mon, 21 Sep 2026 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790030217;
	bh=BBqt0mh6pcap7thNEZ0vvpX8jJ6tpmFAZKqxiel3dQQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LZUyPM+4AUnm1jMP9gskBVuXFWVxpsC68r/4p97UNpFVYIeJBS8PiccQtMfM9l/FE
	 kBnRuYLfjzDUeIX1qPl0bBeS+t16BD+rXBmw3/bQSvtgpnonkswSDHJA+a8QErLu5+
	 13b6fqyxV4TDduKl3AZUPXnd6rXmOPdCbjFR9nGCLRFy1jLLrijyDCy0AL6slnCUsE
	 zAPxUtYlXsrxQab7dlp7Q66MJ9tsF9OSIFZcSzKzy/JlSr6jyB7Sf+aDiZruktV2F/
	 VtBXKqx19NASAMT7X4dv7NmAVzUpimF1tPQAjGYHxmayg1virnmIRjlzh8jnI8a22o
	 Sh6uPkzrx3ZMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ACB3930205;
	Mon, 21 Sep 2026 21:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit
 tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179002561414.3241479.7487658463570218195.git-patchwork-notify@kernel.org>
Date: Mon, 21 Sep 2026 21:20:14 +0000
References: <20260917064736.77354-1-kmehltretter@gmail.com>
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 geert@linux-m68k.org, brendan.higgins@linux.dev, david@davidgow.net,
 raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
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

On Thu, 17 Sep 2026 08:47:36 +0200 you wrote:
> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> [...]

Here is the summary with links:
  - [net] net: microchip: vcap: Stop selecting DEBUG_FS for KUnit tests
    https://git.kernel.org/netdev/net-next/c/2fba93180872

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



