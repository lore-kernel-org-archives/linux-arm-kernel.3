Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09397E94108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mU2NxAwGDX2BKvlg8X3/oZIMbCBK91zzb/auKihzFS0=; b=HL2LZojdb3Up9j+6xy6ddQX8zU
	yxd51nwVk5neAzofUawnyW818m8ECA/VokOGo+dQkBYBig4SUmqpvOrhqev2I3iMY5R0nlC4O93cA
	2me+6wW7yqMjLdPiqjqbdpJkZ+7jPUk88ywYQqBh617lPm0zHvK9WYDso90wJ32kaxedfh7ENWfgU
	FLSN9KR2oHRN9DytcH3S73hmZrBjygOghDM8rNi/hU5nZsfwNUmE1iL3fGIQaF2X2cROOVytXD4UR
	9SbWq99UX4PkRRVtxrTYJ6BfMVuLgw4eKML0uF+1bs56e6KTmBdekf6j2xon4QGbm9q+b1YVSHqMD
	igmEaM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV7s-00000004aLf-3UvU;
	Tue, 30 Dec 2025 08:30:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV7p-00000004aLV-2uf5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 767D860018;
	Tue, 30 Dec 2025 08:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC6BC4CEFB;
	Tue, 30 Dec 2025 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083440;
	bh=6+4hcyKs8Ymf4oWdbMF9mQ98nLVcjC0b5v4lZAALdj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgHEBH/x4S3RSpFxF3Z8rG8oMKJW/nApb4fKeYuTS1d5efEyuEfg8MgXTR3ltwn6R
	 Z2BsB+d9PseMFU2c1a2kZPDoAit6uAfiaL+1P50MV14Rzp5Sn+oizVioGZzj0ZTp0/
	 o1hbqwll+K0wQzQJFMeREEj7eweKyEX2oSQCSwpqFZFJBH6PIx6hW6YwjQDkPqCUYG
	 CKhFKnzR5ujIeB/zbCvJOrT7y5wcGraLrArsJYWFpwzyJI8Acmdvw+ILwgeCozFcSR
	 W8bWo+WA/1tQkMtLrwNCtJ8JI379rZedFuweSTlt2o087U/xoWC1ObgWDsA9wCLk9k
	 YAuEymA11pcIQ==
Date: Tue, 30 Dec 2025 16:30:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: mb-smarc-2: Add PCIe support
Message-ID: <aVONq0pHbzhQABZ0@dragon>
References: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>
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

On Wed, Dec 17, 2025 at 09:48:04AM +0100, Alexander Stein wrote:
> TQMa8XxS on MB-SMARC-2 supports mPCIe on X44.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

