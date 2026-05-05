Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9CDCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1vrVuTofuhW/7Y59BXSVcjF1c/fsbeaXsqHvGLQuTQ=; b=17a3t995kLF1B4IgfsEYGmtqGn
	nCdVYwF8t2Q2wmV1H7UMP1OjhE2KXWxkIqnESyfrbA9X/lCDZhiLePgduSZIHhBFot1QOARFPXejh
	m2ot6E2FsmNgh6jGSqgLD6aJ9SgYSljWzeHnN4kpMz+IEGfMnSlGMtSHr744sZ9CYcEZJ1V0lrwOd
	sLIbAP4rG3wIqOFBozO4VcyhV+Dp/m6NF0wEeuSLdrv6b26cmnbgn5k2Vmc56s7fRiKN6qrhFInfA
	PSBb+J1z9u2KF6emXWF91mlBA6dkya6tEEewtPaHCaEhWJZlU2KP1viT7o29N1M90ejYmxRYx/PiP
	DwhqQxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJti-0000000H5n7-3OYY;
	Tue, 05 May 2026 17:49:30 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJtf-0000000H5mR-3SVv;
	Tue, 05 May 2026 17:49:29 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 73F42C0005EE;
	Tue,  5 May 2026 10:49:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 73F42C0005EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1778003364;
	bh=l7giaHTCkoJdWvk1he5rWZih7dSXbjACJNZpElEBKrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQqtdZF6JVDnnjAGZBJaO7vyQnpw/t/E/LWCXBbQOs4+4vtTM14vmMoCj/dN7zVZT
	 BG6vmxm0wrY2yHmadbhKWvdqCCROgn6FLVu/4AibPpu66BBs2xvvXSLuihSx74LtpN
	 C600bO8rQs61aX14S5S+Vl2fh7MnTXxswSo06Dko=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 11540B85;
	Tue,  5 May 2026 10:49:24 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST
Date: Tue,  5 May 2026 10:49:23 -0700
Message-ID: <20260505174923.636747-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427091058.2669812-1-wenst@chromium.org>
References: <20260427091058.2669812-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_104927_985670_3C105E40 
X-CRM114-Status: GOOD (  14.14  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Apr 2026 17:10:57 +0800, Chen-Yu Tsai <wenst@chromium.org> wrote:
> The Raspberry Pi firmware driver has no compile dependencies on the
> BCM2835 mailbox driver. It's just a indirect runtime dependency: the
> driver only works on a Raspberry Pi.
> 
> Change the dependency from BCM2835_MBOX to ARCH_BCM2835. Also allow
> compile tests. This allows drivers that have build time dependencies
> on this firmware driver to be compile tested as well. More dependencies
> are added to account for build time dependencies:
> 
>   - depends on MAILBOX for mailbox API (not stubbed) usage
>   - depends on ARM || ARM64 for dsb() usage
> 
> Also make it built by default if ARCH_BCM2835, since many functions will
> not work without this firmware driver.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

