Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD69CD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBs7aK9Ax6fMaFCay5iPgFUdd3Tp5vEneucNpM5vdFM=; b=cusZKcjo1R1jaT2RDyXLQrkcZt
	tNxB7jR0pjomjyaPmNfpUkkN5Hal1UYQTHjPXmXYfyWW12U1rq2Cdnxal7g2SZwdOvRYRQiHVxMUR
	eZCvutqiY2Ctp9YLsNFpiDNr5rDVnymJ9sPYPnqbjOuCenGhj+A/KIrPEw7RzzpFmTKMfIryfMmda
	VOm4+Vie7fFVLDgbc2FJo/vmYw4Nw+Io2SyxG5IE4jz0nURYzbGwhBr/CfJqQ4p2MVpTB2T88ZMMT
	eHSOvCqQcDIYrOuCLVTFJZzSZnOPTLhqgxKtX2WggGdlO2lHNEtH3EAvshBtyl3rSNxEEBXxqHz0G
	Seboec4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOw-0000000Fyku-29Py;
	Tue, 16 Jun 2026 15:08:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOY-0000000Fybc-0CQg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:08:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AA4A1A395A;
	Tue, 16 Jun 2026 15:08:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D096B601A9;
	Tue, 16 Jun 2026 15:08:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEA1D106C9EBE;
	Tue, 16 Jun 2026 17:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EBs7aK9Ax6fMaFCay5iPgFUdd3Tp5vEneucNpM5vdFM=;
	b=NVv3zruaGYxD6uLc0Dkz0jkCucJNGC7apCS+4WPn2sVbSFDx2QGIYsz261nmI+KsXjmz6C
	KPHnro43cSEKKy2lbClsVYbRKSOLJJwjav+H+tvFIelYyNA1APl2ElxYXKrp58GcZtNNT9
	0/xnKQyZWDnb0nQqGI5kQVH+bLnFji5CX1PmxXrpqllh56i1F49ui10N5G+WqtfP1nkXL/
	8ptRGhQhgawEHVGSyGYwvTcbdLp58+T88NcQx31GPXc53ycBQy3ZUkkyvUAx+kndq2r05h
	z2w9pUPkCscZ3sxtvljDmyUQz91sy1Ur4jImarFbfRLL3l5xUYAMq2SumoiVLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:07:54 +0200
Message-Id: <DJAKGHKZGUI2.29AHYNFX4LGBJ@bootlin.com>
Cc: "Lukasz Raczylo" <lukasz@raczylo.com>, "Steffen Jaeckel"
 <sjaeckel@suse.de>
To: "Andrea della Porta" <andrea.porta@suse.com>, <netdev@vger.kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rpi-kernel@lists.infradead.org>, "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
In-Reply-To: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_080806_245240_02FA56A6 
X-CRM114-Status: UNSURE (   8.82  )
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

Hello Andrea,

On Tue Jun 16, 2026 at 3:23 PM CEST, Andrea della Porta wrote:
> From: Lukasz Raczylo <lukasz@raczylo.com>
>
> The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> the TX queue.
> While the exact root cause is not yet fully understood, it is likely
> related to a hardware issue where a TSTART write to the NCR register
> is missed, preventing the transmission from being kicked off.
>
> Implement a timeout callback to handle TX queue stalls, triggering the
> existing restart mechanism to recover.
>
> Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.c=
om/
> Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi R=
P1 ethernet controller")
> Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Thanks for this V2.

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Any news from the Raspberry Pi community about this bug investigation?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


