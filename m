Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C1CD6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcD7lpOvfok8iwoAEQ7O4TR/rmcLTmp0Xw+RedPXt7g=; b=efhCFtqM986I8MaH4r78h20BGo
	ahkWkOCSAdSUCWL0goAIunA+vlfs4tS8YoqLhCWs55adxsL2ZqC6768yItsy/jbkjvlBNlC42F9Z0
	ZrFDTrYOdAuonCXTucdAGQ0LjbxWujk48gU7JO71ENSrN/GYOr6fOxtpRr0ntIhxpAs8IDKHOAggK
	F+qKZPkR42C/WdUG2xB0Q/yXR2Aljvgsz2X8JWBMZvLNcwprkvmWFvVSkPq7o2miTq2pBKqNmmM5H
	waiwyI32Ba3OaLUq0vN3g9lJyqc9rZxKv5LfGlJx8jdb3Yydd2jsqFwH5QnDSJ1PfG5gTbp2oM7b3
	rAW0wSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgVz-00000000lWh-2oTN;
	Thu, 14 Nov 2024 20:32:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgV4-00000000lS9-0pja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EB2A5C5906;
	Thu, 14 Nov 2024 20:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6A2C4CECD;
	Thu, 14 Nov 2024 20:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616293;
	bh=kcD7lpOvfok8iwoAEQ7O4TR/rmcLTmp0Xw+RedPXt7g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WNorJ7yEDMNplHX5dphQlyW2bmGqbBL/yHqyMpEVOWl8vc+gXWYFFf9qImfUN3Ppe
	 iT1gtyjYWUKT1F3D14m9rrxT5iwVmet+27+3hMrT2Se6u8fW+sP0/zFzsE33UsXXQN
	 J+QmUbzuaaHZEa8f8inIbdFwWh7RA1sNNzlUi1+TRqW38WH5qWmV/2yiiIW/ZLCNjw
	 zzs12lf3/ihZapP21fK+ZYZI0J3QQz6m9eQfp4KmVRuyG27MEljFs12181TswPg60A
	 /akts2gMDE3j8xSsG8GT05HqyWHKTj9OtoaKB4/1Z3ASvBIHGGPQqCuPP6yTLbaYTE
	 yzW2qWJFzL7CA==
Message-ID: <c6d1d80e4e32439de589e241a596d3bb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241114072820.3071-1-hanchunchao@inspur.com>
References: <20241114072820.3071-1-hanchunchao@inspur.com>
Subject: Re: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Charles Han <hanchunchao@inspur.com>
To: Charles Han <hanchunchao@inspur.com>, alyssa@rosenzweig.io, marcan@marcan.st, povik+lin@cutebit.org, sven@svenpeter.dev
Date: Thu, 14 Nov 2024 12:31:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_123134_279522_556D2521 
X-CRM114-Status: UNSURE (   5.88  )
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

Quoting Charles Han (2024-11-13 23:28:20)
> Add NULL check in applnco_probe, to handle kernel NULL pointer
> dereference error.
>=20
> Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---

Applied to clk-next

