Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBABC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+/rhBP8KQx/YWJt8eXm/+AkyHsUlWrW8px5nRnzrtE=; b=fBSdVWGaxIeSKHhXDS+i6QZ7tt
	Sqp+MPYSzExwJmwhezaSvevMbSDQih6tKD5H+WzE/NlVueWeX81khhBYONFT85CeKhbv06mIWeWeT
	xgjo9bHjJMK1QVSCQEad2l2SzYy1FJujx0nVir3R1plDVGXVPQjqi4BIP+kOaqf5JMIcR5jr8RZK6
	cLE34k2VxUHEbRjK588GS29NU4pJSfubCPUyWKRnNqhJQVFfTykHzR9vcJX22kaw6eHGUnTJxoqFp
	dEC/sYKb/3EDluLGmaXiptAmJ3md+2wMz7o2/1KW1Y1XmUMo56N/D0scADrufriGlXz9gY3n0PKua
	WanekEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3IF-00000006jiz-25Vd;
	Mon, 17 Aug 2026 19:46:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I8-00000006jbY-0PTT;
	Mon, 17 Aug 2026 19:46:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEE1D405C4;
	Mon, 17 Aug 2026 19:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3E21F00A3A;
	Mon, 17 Aug 2026 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786995997;
	bh=P+/rhBP8KQx/YWJt8eXm/+AkyHsUlWrW8px5nRnzrtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QBA8P8nlfZuaP5mblhmWvlabJEQZh/N7rc+C1uhxzYrGkzkTeiTVmhHpa5WMnC5G0
	 EOXjlebQjK9MEzFbqV7MImVIfPuYr06xx2ciOV3i2OEilBkrmlvdW+8aeyhpDrh8JV
	 dUOYNYYufZRfs+a0KkEnwUb14mmmeamo8hBJGFY1Jfad2YXd4wg64gORzvRmgxE7Gd
	 92BieTwqCF11Mp/cMWc+DZBPAsGzicxO6XdE2T51d5nNVnj8i8VNsAXkhWmmlbGnZ3
	 eBL0hLl1PfXopGwAGtm17QzMlCDz8O5R7btjAmZLttGKxfkzFUoT5wmywOxK6zZlmR
	 Y67khiOo8uRXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E63926262;
	Mon, 17 Aug 2026 19:45:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178699594964.1691257.13662709727520463245.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:45:49 +0000
References: <20260813030708.37609-1-marcelomspessoto@gmail.com>
In-Reply-To: <20260813030708.37609-1-marcelomspessoto@gmail.com>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, afaerber@suse.de,
 mani@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org
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

On Thu, 13 Aug 2026 00:07:05 -0300 you wrote:
> The ipv6_flowlabel_mgr used to be a component of a broader overall
> flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
> script called tests defined on ipv6_flowlabel.c and
> ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
> the in_netns.sh helper to set network namespaces for each test env.
> 
> However, the ipv6_flowlabel_mgr.c was drastically changed recently.
> These modifications led to the mgr tests becoming a self contained and
> independent test suite, enforcing netns creation by itself and
> not relying on the ipv6_flowlabel.sh wrapper for proper test execution
> anymore. Therefore, remove the mgr tests from the wrapper and update
> the Makefile to handle it as a standalone test program instead.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: separate ipv6_flowlabel_mgr test
    https://git.kernel.org/netdev/net-next/c/96bf660d4c14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



