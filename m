Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B053F45A19
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6BlbsQpplml5H487ypJGxYI/GzB20/kEVGk2DVpRx0=; b=Q4rg/YbVV1lqgdxHxO1ttab2HB
	e+JBFNU9gJFVW09RPWDgLjAGt0FB5Stg+f2xYGqNrQPpuxMmfDH8gbXB/H9A/dZ/xDZD9GMzz5qVx
	VwWUTlv3IMVdWdWWmOMYYFJ8HSsFBFP0cFSZz62t9hc9poyCan09gDEZUoPGQpEB6VbKgQ5w6Is3O
	T816xlyG5XPdSFcAxfrdW/BX8a4PymQAW878ksf8gRwcuDbfOpJQoPqrIgBSrAGpUKwldq82i0L3M
	J/Z5Q3Y8dcCwR8OrzAMCcdH8EeYyWl/0z9NIFNJhcH7V8Bj6i2bPhtwPs9e/BxsemVNAK7Cezx4Ug
	my3h6pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU7C-0000000DI4L-1qDn;
	Sat, 11 Apr 2026 08:54:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBU7B-0000000DI4F-18wO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D4E60141;
	Sat, 11 Apr 2026 08:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5231C4CEF7;
	Sat, 11 Apr 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775897692;
	bh=IO2YPV6AEKfJ4Hz9ub8GiQZXFSmfuRwPQfE4POfgvJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaKrykhFSF4ef54dIyhFrWVCBtT0ow/mmsohmXHRlf6bskYDFbpWDJQkglZulXJa7
	 PHpLn6tEBmYNTJztBLrshOkofYiGF01M9MtZylmqZi/7G+kkmGWTC3jWT9VLCG8LcO
	 pljHF4O7vblfysd+LJvABVBjJTPvWZQFER3MgodrWPISmvnhp63+Heh56ZC9/Hg777
	 tY1mwHWvbpevo8wQGy1etQGrETUPmx1xZlawIv59dflU6F5/NgSqPJkPkptFDm3zIp
	 d0VM7vnmes3BphrQQAyRzeeXwVa9lQb/bG4WVCj1ht9cX5T4yFi/kc0Wk7bM5+Y/By
	 I+7Pay5TllChg==
Date: Sat, 11 Apr 2026 10:54:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v7.0 (#1)
Message-ID: <20260411-inescapable-overjoyed-dinosaur-14130d@quoll>
References: <87tstk35d2.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tstk35d2.fsf@BLaptop.bootlin.com>
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

On Thu, Apr 09, 2026 at 10:28:09AM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v7.0.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-7.0-1
> 
> for you to fetch changes up to edb7efa767da8bb82d724b85178be251ec4e060e:
> 
>   dt-bindings: arm64: add Marvell 7k COMe boards (2026-03-13 16:41:11 +0100)
> 
> ----------------------------------------------------------------
> mvebu fixes for 7.0 (part 1)
> 
> A new device tree has been merged without a binding, which triggered
> warnings during dtb_checks. The commit in this pull request fixes this
> issue, enabling easier detection of new problems in device trees by
> reducing the number of false warnings.
> 

Thanks, applied

Best regards,
Krzysztof


