Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDF7CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma7XxmUzkfa2Jk15P47t5PgvIpukZD4s2/DyIVuA0k8=; b=0J4jlzACxfv1iZJwrHqCpvOczA
	TdgM3Cqp9SIxvRwL3vDh6wWXhB5NxQQijqzTjis+X1TR1+tKHeXdp5OIxmAREStbq9ZzYCjt5YgQ9
	RFgM30nVzDEZblsGD/cqSeBtqQMRlfEowKO3RzpczaWGapqotwuUMmTZtUu6MIMMrVg7gfrDsQ0yL
	hOrUd6tRSKKqXbKWYUedIphD1mJu/G+2In2NT6w5DDU593BrlHZCUbK4JrVNR9gcpoxgksRCGZWFy
	tX1UbHLA0zEZbGNf9L0b6XKPnkqVgm+AJQjk49J+onQAWfjYUqIiaVG8s8/g0gRUdRIm2mWD4YyxH
	LLI1KNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64ub-00000001nZk-34zJ;
	Tue, 07 Oct 2025 10:27:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64uY-00000001nY6-2WDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ma7X
	xmUzkfa2Jk15P47t5PgvIpukZD4s2/DyIVuA0k8=; b=JnRMLyg7ryRV4b8MAvMh
	SRCrNvF80NdZaABB50HAeXwZ4kqrfgQVqK/NFekXlem2D/e64D5gk1W2MBFHuHER
	eTRd7NggpUjmdY5q5I59Cekmpuu4g7rBM4rBBUEOsvm8uOP2c6+oMV+zH6SS426X
	LNHYuRV7DI6czLcN5Lp55Hhf5mltmpmIKaEQ5IGz09ln9Nk8mGAAil9+BGhP21C6
	yLpdCpzO1aLwqLx3Fq4u83nj+STSrQwjJOC5h0q4HKn6bFA+3GKlPa95sTVGY+v9
	4HhEzFYbWQFE7+xVdhGS8c4Ar0R18FmquQAV0Z20q/M6/OWc+q66yM3oQEcJp7ST
	oA==
Received: (qmail 223477 invoked from network); 7 Oct 2025 12:27:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 12:27:07 +0200
X-UD-Smtp-Session: l3s3148p1@vgCEAo9AIK8ujntU
Date: Tue, 7 Oct 2025 12:27:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: Enable watchdog timer
Message-ID: <aOTq-bD_9ofjo3_t@shikoro>
References: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_032715_490704_5A51784B 
X-CRM114-Status: UNSURE (   7.71  )
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

On Tue, Oct 07, 2025 at 11:45:16AM +0200, Geert Uytterhoeven wrote:
> Enable the watchdog timer on the R-Car V3M Starter Kit board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


