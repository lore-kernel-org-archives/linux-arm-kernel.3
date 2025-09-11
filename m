Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E62CCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5T2t0/IGk9CGlZb9jl1TJ8xTJIvPFhjvf8NXKtFYSQ=; b=cPcPTSVLyUHa1xj6MKjB7cQbhq
	Am1AA8Alrl4GZYtqy+eA7eSMbouGFIUphdRul9b4mdrfRk7B/AsknoSD1G24sXU68BlCQ6PQyXigj
	Hd8PXPw8ckuWsuCwgZ+xBHmKNwVg2V9+Dt509HLHtinXIPivsN7Z40qkXcQgZ+xgn/cZtOkO+8OQS
	eYa4oNxJsQCXo1uWgZ+HW/i0oKvWx53SXwblT2MC1X09PGPrZkQTRUXJUOSnFxXZpJEHvqm0nibjY
	5i29bZU9O9Rf0MQH2QVmJhbQ9XGwudtuTKxBp12E6Wyj87te61u+3oPYqSN9iJwfquWi6DwVWgolz
	dGyZ1owg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwYSa-00000000idY-33vT;
	Thu, 11 Sep 2025 03:59:00 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwYSX-00000000icv-3XZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=J5T2t0/IGk9CGlZb9jl1TJ8xTJIvPFhjvf8NXKtFYSQ=;
	b=PXJalUMeEhhOG5WL8o047muptjLhbsA+dI5Qmt9A87rNfMm93Rk5NMn8cKwAk0
	uGL2TYWQNE+/zVlXknuXB6rUBnWsYIP2NwYOirgkiItXuFeJCo2x2YeFfYL77zDI
	ORmnVFNxdBlG+DNS2vR2CHBxfUfYx5wkmybQJz4FDDBNc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rLzSMJoTqlPBA--.59352S3;
	Thu, 11 Sep 2025 11:58:45 +0800 (CST)
Date: Thu, 11 Sep 2025 11:58:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jan Remmet <j.remmet@phytec.de>
Cc: linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mm-phycore-som: optimize drive strengh
Message-ID: <aMJI8zaYGFfai1Ft@dragon>
References: <20250910061739.9800-1-j.remmet@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910061739.9800-1-j.remmet@phytec.de>
X-CM-TRANSID: Mc8vCgCn1rLzSMJoTqlPBA--.59352S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU52NtUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBUaf2jCSPUr2QAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_205858_274790_652842A5 
X-CRM114-Status: UNSURE (   5.77  )
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

On Wed, Sep 10, 2025 at 08:17:39AM +0200, Jan Remmet wrote:
> Reduce ENET pin drive strength from X6 to X4 to optimize signal
> quality and reduce potential signal integrity issues.
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Applied, thanks!


