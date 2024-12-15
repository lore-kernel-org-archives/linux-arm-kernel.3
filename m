Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4153DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KS6+EL9vNqjG7g3+LvxPJ54SOryTLzCuwyoq1+EbnPE=; b=RZi2jxsi4BB33oxS2/SLTx1d/L
	76lfv3zepulpcelRa4qBCOT8brcLyG5kx6p/xkUHfGt1U0WVjeTwPnKgduLhHCA9TY4yiMeGsvf9u
	4mFZ4UWYcZmEoO+HAdAYqO3tYE/1SD7tDy6/yq05T+AH32InzeFEw7GT5OyvWJyHPOlA4tT7vtB7H
	SPZvshZ66B0P8qwvoMsI3xK5YoKUwO1LyDG0p/wb3R06BFTjLps/kuHS7CC55eUOHmgJgKLJCK9zi
	SBqaNRgfF8/6l+rWWIZL7yXsFf3woj6UJWezGawzzzN1tSnkE1+8S9XlJzoN+DHn890urz5/X2Byj
	Ur4cB50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMw6X-00000008TsB-22ol;
	Sun, 15 Dec 2024 21:24:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMw5Q-00000008Tml-2b7R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 21:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1271B5C5BE9;
	Sun, 15 Dec 2024 21:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B42C4CECE;
	Sun, 15 Dec 2024 21:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734297814;
	bh=KS6+EL9vNqjG7g3+LvxPJ54SOryTLzCuwyoq1+EbnPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcgpaNgaxmuYqSD4nv+IlmqHKoNg5m7pcNlJ2VkE+GMDAGbxnFA7hfbDtNMZNmoYh
	 y8MiXgbkzn7nay9hGIVf/ywW/uBdQvMS7tebxoz653/ce8/Ni686JXVLKKpOL3+R17
	 d9/MeLhXqBcEqHaN+rYaV8BW0rUIv+XvPqAxpoO2rPEx1h9GFaY1NO/Vnmq4xI1V9y
	 81qBJVMvmyGYnCYlcAMOtypnunVbm6GdJ+NDFyLHJggKhjtdn4SgE9Sn+WvSaPnrId
	 X0M8BhLb6BcqOZIPQhUgmWq42CN4pEjmbKBYHGJ6CfdVAm8p88hvXC2LqC7atNN6oV
	 CJUbMEWT9VBRA==
Date: Sun, 15 Dec 2024 22:23:29 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: bschnei@gmail.com, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benjamin Schneider <ben@bens.haus>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Message-ID: <fjdblv62k3nhqgy7decdldtieo4zyv6phxofx72dreyq7jbm4f@qmkp3e2wyplb>
References: <20241125211452.14987-1-ben@bens.haus>
 <20241212070712.txkxgmiugzji3doz@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212070712.txkxgmiugzji3doz@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_132336_993939_6FF2A4F6 
X-CRM114-Status: UNSURE (   6.73  )
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

On Thu, Dec 12, 2024 at 12:37:12PM +0530, Viresh Kumar wrote:
> Marek,

...

> Any inputs on this before I apply it ?

Viresh, let me try to test it this week on Turris Mox.

Marek

