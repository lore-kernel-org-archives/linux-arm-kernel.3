Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B9EE36A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/alW314q5AyfpS0UEK3w0Mhlx13Jx77jVJZ0BIm6Pr4=; b=M+pmLiz8rrWnuChT6WB69ZWhK9
	s1XEmPlpD+aJfRaPQisUHXty0BQsXbo3kLfK3AABn97XfkyQgKX5SjvtcnBd6oSnrJBlcbqoiQo1o
	WWKVyv/QjhwN0HqYwMdbaY3sTiAUJVTz9q+6u1i5TfMJ7hj3GHSB96nqquwmYNoF/oIyIQGGvLDJ3
	Pn7GpGRnKkFXEAg0PO1b6T+n+Wfa8IyRODybty66pq71JCiFuSE+ED5sQx4tP/fLzQS/KvZ7WbD4J
	pZuqslsNHgpU2K7h+YCJaSSUpn6ICesUzR6AMEGwLEiDm/G4rzme7XSfISWxcNFc1R/EoajzAmttI
	MiGAht2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZvG-00000002P0X-0pZm;
	Thu, 12 Feb 2026 16:52:10 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZvB-00000002P0D-430I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/alW314q5AyfpS0UEK3w0Mhlx13Jx77jVJZ0BIm6Pr4=; b=C+cCdQSrVswQdHZaYDlNI7OwZy
	rMeVGEUYVBYnb31goQrw2iZnZ4Wjm1fczCeLf227d//mC+tuvU1qRMuYBly7CfylMxbMdJEH/LUha
	7fgV2HN4VQ/7nCwM/8U1iF5yXzrGdmQiAfl3AxafN2WpzVzi6/JB1ggttm6fTNzaU9cEEUjJcO11o
	5A8GoUHyezo0yTok/qTmahMsmFhzCtHhM19iB+KUKqRFGV9F7o69LAV+lmClI77at8UcPFojtvoVL
	AdBew+ORxoenbYkX1NTUwEDgM7RBhD/Y3+LCuDE96SvRz+OFV9uOZCv886H8Wzo80DEK57wbcZLn+
	oBYwyBig==;
Date: Thu, 12 Feb 2026 17:52:00 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: <linux@armlinux.org.uk>, <arnd@arndb.de>, <khilman@baylibre.com>,
 <aaro.koskinen@iki.fi>, <rogerq@kernel.org>, <tony@atomide.com>,
 <krzk@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm: multi_v7_defconfig: Enable more OMAP related
 configs
Message-ID: <20260212175200.2d984ba4@kemnade.info>
In-Reply-To: <20260210060841.2362777-1-b-padhi@ti.com>
References: <20260210060841.2362777-1-b-padhi@ti.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_085206_008648_7C2F66E1 
X-CRM114-Status: UNSURE (   6.61  )
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

On Tue, 10 Feb 2026 11:38:41 +0530
Beleswar Padhi <b-padhi@ti.com> wrote:

> 
> EXTCON_PALMAS:
> Enable support for USB peripheral detection by external connector palmas
> USB on AM57XX platforms.
>
Why not fully enable Palmas PMIC support? That is just confusing to have
it partially enabled only. Its usage is widespread.
So just enable .*PALMAS.*

Regards,
Andreas

