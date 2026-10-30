Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10244606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KWCqUgdE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=IokEpGXr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tGRSe9LvYJDXqnyp9hHRUXYwQf0o1AOnoi+Z+9njJw0=; b=KWCqUgdEGzanZ84MM9uLhAfCt5
	J2bNDt1KnbTGbo/L75FVR7RQUtFcE4RvFEFA/KKp3fIvUdbwbi/TSVJp+ETdADgTMUoDBHW9AF1ae
	8ZdcbyRabSA5bdNuGIDGLp+m5JB+6bCzuXE7TcIimPzAKfr2OVBaTthJOI4MctwWzgHF670M5v52b
	dnZvEewHUeAS1ZxnlT6ZfG1OhKjT4rH3CV+S+ebGUpT4ScGaEH9/1TnD5DGRlrND9uxKQSZbcSdnH
	P8uEOW2z10IzBf3X0YHjpXvZ5+KxB5GHglm5M/tQBV3ja9whp3SK7rx8HT5klHY7jXx7tOz5Gld5U
	N56eEE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsbw-0000000CW31-1dlr;
	Fri, 30 Oct 2026 19:50:00 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsbr-0000000CW1S-24MP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 19:49:59 +0000
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id MpHWxNhOwLvgbMsbfxRx3v; Fri, 30 Oct 2026 19:49:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MsbexHuukQfwNMsbfxpra6; Fri, 30 Oct 2026 19:49:43 +0000
X-Authority-Analysis: v=2.4 cv=bfprUPPB c=1 sm=1 tr=0 ts=6ae4f4d7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=EUspDBNiAAAA:8
 a=yaG995DJD8wxKFCFxIQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tGRSe9LvYJDXqnyp9hHRUXYwQf0o1AOnoi+Z+9njJw0=; b=IokEpGXrQD0n5OejTKC1338Lv7
	nB2qbLUNlHV5stnP9rXGgDLsrG1BzzezifwGK+1Puq504s+/CK+qQZeSYHUy+fWe6vTpXRoNLCcG+
	xvj3fW0MOJ4Nzk1pmdgFcsYZ+Y7Q0K25aG5ngASEqC8zCK+3rmRE4ZqwKU0PVdKMHaqK+/Tcy7JVE
	KY7aoSpK4cWkeF0Qp5vCUmFXS84V+Ti3rKMhaw3CjyFBic+m/0+8CJAZmJkRiKE+zLuQv7G6Q29R3
	MG6D1JOrDScGhEV5WilZ+4rKPqslkRjJgFrVsJqNU3FmWJw5kITj11QQJk1KvoCLL1e7dmb7RY0D0
	PrjC/Iog==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56876 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsbc-00000003tp5-2F1r;
	Sat, 31 Oct 2026 01:19:40 +0530
Date: Fri, 30 Oct 2026 12:49:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: watchdog: apple,wdt: Add t8142
 compatible
Message-ID: <ee5a1127-1591-4720-ab34-896c1f037276@roeck-us.net>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-1-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-1-1356181bc50d@cyberchaos.dev>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsbc-00000003tp5-2F1r
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:56876
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 55
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCehYudIS1QOQTuN9yH2HSvewpbRpF8VsNTSE6AUQtxwGyJUIxJnk/CJw+F41+bJ4ckMYe/S8g44jskQ+CfbksQ3oOXJQRuM2sw/Ejm8mKCHtE/wvo+O
 8Le540id4s8tI9O5cQHh0Qa9hr+pcrdqiEIyTIeweJGvMAeTSHz2Ly+qonby2s2zHzmNwps8jqSz19l+5g+wPfq1NNp2x/+yteMbbNuK2ISrn6yjRf40ze/N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_124955_603603_7FAC5664 
X-CRM114-Status: UNSURE (   4.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:03:21AM +0100, Yureka Lilian wrote:
> The watchdog on the Apple t8142 (M5) SoC is compatible with the M1-M4
> SoCs. Add "apple,t8142-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

