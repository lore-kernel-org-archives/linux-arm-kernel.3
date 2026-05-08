Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819AFCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFQkQXyKv84NgZJKUYb0Iy0idhOUNRSndREaqQZIkRk=; b=Tf+z/v/Dg3gZ0Am7QBCREE6T40
	2LNV1Y2I3TpWFwoHhHQOZQxIuBeE2ndU/VWUv8Uu3yzDwlqdyhefWWlawAhsWR9jw2OF/v2hP8AX/
	/95lr02wBSfpfgmr64D68dD/6nCmW0AiuIew2pY4Fii24KFyK2P/vmnmo6eFtt0YwFCB9Ty+5Ad95
	Zcc2n2HcpV+kPYVASvUdP/ahLm31DbCTglFW8FeDR2MaGmMs3Ylwv+2C5TTXqLFaxsxP/U0Pe10h5
	PpD4lRvAYHtb7htvJbQsBdQwhRDvFsHA8gRDqigAirGgTq4W+YlcfjC8SYoznEwylBO7fNigKggU6
	ybeSrP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOvA-000000077nD-0IQ7;
	Fri, 08 May 2026 17:23:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOv8-000000077lK-1eAY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62DDB60583;
	Fri,  8 May 2026 17:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA012C2BCF4;
	Fri,  8 May 2026 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778261005;
	bh=TFQkQXyKv84NgZJKUYb0Iy0idhOUNRSndREaqQZIkRk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GCgdHjfGZXy8jGGE+xmSpJfA7e104Hd0MQ1+eazHw13oTcfTUS0g7Bx/0Ojk07LkA
	 wKSUSITlY3ljYTdo6nJgzELgkJ/3XBdoD1tg37Rz9ca6zSkrHhulQRmHY5cwZ+jq2/
	 B2hiqx1b0gpcrWqNHO+ka4O0Yt6V1zPmu7KvJfwRQjaPi8nVt0BCRoLQwEH3YFGvcP
	 QEhTmPHqW45DA8FwVgJuFjhARA/tbdtXFqZGka47L+BZhmoiyxDV+CKwTRHvvYHS73
	 1r5Eyn/0NDE1FZ0DOlZYBUgOXgeM0aXq9KHKmaa4cDlRyRtqVgLsMgnVY0vD1Gz3EP
	 jC5xmtMdHSHxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 19:23:18 +0200
Message-Id: <DIDGWX6SA86X.29W19V2YX54GX@kernel.org>
Subject: Re: [PATCH v3 01/13] Revert "driver core: move dev_has_sync_state()
 to drivers/base/base.h"
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <driver-core@lists.linux.dev>, <linux-pm@vger.kernel.org>, "Sudeep Holla"
 <sudeep.holla@kernel.org>, "Cristian Marussi" <cristian.marussi@arm.com>,
 "Kevin Hilman" <khilman@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@oss.qualcomm.com>, "Peng
 Fan" <peng.fan@oss.nxp.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-2-ulf.hansson@linaro.org>
In-Reply-To: <20260508123910.114273-2-ulf.hansson@linaro.org>
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

On Fri May 8, 2026 at 2:38 PM CEST, Ulf Hansson wrote:
> It turns out that the dev_has_sync_state() is needed outside the driver
> core. A subsequent change to the pmdomain subsystem starts making use of
> it.
>
> Fixes: 9db268212e0d ("driver core: move dev_has_sync_state() to drivers/b=
ase/base.h")

Hm...the commit was correct, it's just that you now want to use it outside =
of
the driver-core code, so I'd drop this tag.

> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

