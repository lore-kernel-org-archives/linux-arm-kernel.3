Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE77C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRs+rpiC3/VhrQsbrr9qvxe1fpYZixcXZE7qLlDooM4=; b=GeeDCBNfbnSj/Jysl+AvbFzIhJ
	p1YDcUCZhGDzZk4OLQvl/1Vfr2IzmCnyjEpfHn5i4kc3zwq4s9i6OwA5unbp7FErYjUzwTHj6jhvs
	D+TNTlRZbkNbKlCjlIcnZtVPQujJXAlNztEx78oY14aLyVJESJxLSzqla7WxAEk2SqM8spQOW0qMk
	f+jRq0CuKgvntfmFfzBhUJDW69AOhaAN1TUwKeMm2q6EkKpo/tYsAz+KWnsM+nOQS8Ybc7zjzrpNz
	+GHpxE8VsP9avQv9wWs8cl7ORTr9h8CWX3vfnBjCXRTt+ZvHk1p4SFkFYEHJXKvglWT3Gfj03ofoi
	8mM1K74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu29k-0000000FULB-1Qsk;
	Wed, 12 Aug 2026 06:09:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu29i-0000000FUL3-3YqR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:09:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAE5B600E2;
	Wed, 12 Aug 2026 06:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607D61F000E9;
	Wed, 12 Aug 2026 06:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514977;
	bh=bRs+rpiC3/VhrQsbrr9qvxe1fpYZixcXZE7qLlDooM4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Cxrs+pqYOdzHdNvsJf2TXj7j7wEU0yjx6Tm+uOTQnX9+II7HDgEuFacnHFuXcdRiL
	 g+gxF2Q1WFL4O14R+/QO7aUyd7l/KkzSR6oHeE8CLn896uwpBmOZ9w7Tuy74y12TNK
	 fZPvyZt08vCvnsqutQQrq/l1Y+1jOPyUxlk+fq2UoGjWxX1yNegAiD+MBOCJHD2qNC
	 Jbnts5dBtfb8XCjamnxNVAy9/mMG5WN6cogmDY3PYgtotOW5V8K0t/1dxatJMfbMzB
	 cF6XVbrQQb1/tfBkPfKaX94g+56xNDb7CYwGUjnrTBKBfTym3cwIOPWy0k+FqW1XqY
	 psBrtjuGdXntQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <anhkNLxcGaC41mgN@home.wens.tw>
References: <anhkNLxcGaC41mgN@home.wens.tw>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To: Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Aug 2026 23:09:35 -0700
Message-ID: <178651497559.5862.10057160570958744364@lazor>
User-Agent: alot/0.12
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

Quoting Chen-Yu Tsai (2026-08-09 04:27:48)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-7.3
>=20
> for you to fetch changes up to 0a136efc0fc2d53b1b1389b3c3fb0f76edca38bf:
>=20
>   clk: sunxi-ng: sun6i-rtc: add a733 support (2026-07-24 00:02:02 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

