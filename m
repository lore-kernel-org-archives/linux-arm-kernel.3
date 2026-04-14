Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F69F9D0DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt7jYtjwGFuclVO7ZJCqgMU1+C1Vky1GdU47nMEZF6g=; b=iFx3uxrNPWzZBTicxypbJvlBU+
	NcunT4BbX1xow0IA9RoVAADVBAv+zpocw1fWay9dI1nF9Gm3t+MFGQA2Xj+PWkNsIAqsP1ozfARqh
	IZRIESclKV+4R26/Xct5lJVh4gmpGrueprOf/HX815aSoC+ft+Ag/pfp1grShB6PvDehcqx7+quvO
	Vn3WuiOPjtSC8PisrwNheNCqJm0YQa8vYh4n1wn3Y8tdldNxuzPXye9zSZ+RH+k81sy0wvMlpQJ3G
	F6skjbxzMWAr6MNmH3SzYPE3wLApXhFcuTWAO8rtJ6pw7j/H5iMGdn90z1+W+jNSFkiO59JTZPmJy
	E0iprk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgoi-000000001eZ-28V6;
	Tue, 14 Apr 2026 16:40:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgof-000000001eD-35C7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80640408A7;
	Tue, 14 Apr 2026 16:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C4C19425;
	Tue, 14 Apr 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184844;
	bh=bWAXhLUbOAxRun08ft9x+2N6DT+CKZownG9+NFBU+44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0NJToNC8IM3A7Gfb11U42v4H5AX1/j91q+7QO8RTBVN7NaixHAs9VVeZ9Q7GQXA3
	 JEyPTVfX0pe9bOwvtmlSaCXBa8oDpGfaeUwgGtEIPMT8FNBIeKKtNomtN4dHdSlSIf
	 5rFXgtl8eS8WCI6KK1zuCTTC/FRSoBh4o1YscYit28gqp1Od9EdlgzzHqN1VXegDM6
	 TtFnGHMZ+oN9EcPq3RgrcsKLSYAz9FUnh+gV+3yJ7RlhrtdoC9/eCZWGFGEIutZwVQ
	 2QXHuXN5ILA9COBkMq1Za3ItqstiShWpqBnXjjBocmud0BAYQ89e4lZyPjjzEFIBOo
	 2FajLzu2zTgYg==
Date: Tue, 14 Apr 2026 18:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Message-ID: <20260414-nifty-conscious-fox-973b65@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cy072bho.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_094045_815183_7F87CF9A 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.1-1
> 
> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
> 
>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node (2026-04-09 10:14:40 +0200)
> 
> ----------------------------------------------------------------
> mvebu dt64 for 7.1 (part 1)

This was sent just 2 days before merge window open, thus I applied it as
late branch.

Best regards,
Krzysztof


