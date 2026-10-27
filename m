Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o7pJ4Wdq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GxUj9QwG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DVZYAzp5y3OZA2PjGNx37RsXlUC5F7cYH3MmvY5PMVk=; b=o7pJ4WdqU/6SuYOeeEDrt48LPm
	/1BNMvyI4gLt9hgx/k6jy4V/5hr9pi2HnoskrLf4hLdBYeNdiuq+H7ivQ72Ry+EUWyAt09nW3g7hD
	/ArihxM/FtU45J3F7TndKypecqTV7m/eJblBzYf2M2B82VJiZn16ZaSbUga0ySqb2Cx19fgXdVxBl
	3qMAo7x2hFrSXAWtWDyaHR4G3XEyAcMcLsf56BVHezGVQDn1E1hPyvVkEKcN66fvJlwvj7Cx/Bkj/
	EEVlbhJMHuc5IPHYK9RsrHHKTfYsg0WkJs2EJf5wUt/u9/fNT2kpWeaTEdZWBw5wCak5sLWF1g6pm
	zuMKR+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXPQ-00000003foY-0XfO;
	Tue, 27 Oct 2026 02:59:32 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXPN-00000003fnl-2bCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:59:30 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id LS3ZxugV6v0ndLXPMxFugx; Tue, 27 Oct 2026 02:59:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LXPKxcVRA7CfWLXPKxzJcz; Tue, 27 Oct 2026 02:59:26 +0000
X-Authority-Analysis: v=2.4 cv=Z8HsHGRA c=1 sm=1 tr=0 ts=6ae0138e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=mitAZJTLCVS27zc7Mg0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DVZYAzp5y3OZA2PjGNx37RsXlUC5F7cYH3MmvY5PMVk=; b=GxUj9QwG56pBayE0cKAJfw7cw+
	Wk73qh/ugxciGuEcKJvE39S+9pEZnrcM95ki2IDBrqYdx+kprmRMNxrloLsdQXR0aQs87VTPMtcca
	7kG91AWECmiiPHhfZDbOTMf1tmpc2Z+03QU96mSDIwDUk9ZelIPxkyOF5x+zZDSiQTtgpl9pOv62N
	R10DRSTq4g7LptaXSbZgEl9V6PSPVQffYosI8wWNeKgz8Ru7iYMtIGPUNIgEjtDmaCglhfmI0rAL1
	IN7IEZynP9YMYZiPBBIgHkRxKyFNL9COZb4BPfJELtJ4V+GP5qxB1Fuqw7nuoqZ4dpEvxvU+bjqxR
	rckPkmag==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45506 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLXPJ-00000001xoi-2zHC;
	Tue, 27 Oct 2026 08:29:25 +0530
Date: Mon, 26 Oct 2026 19:59:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philippe Boos <pboos@baylibre.com>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: fix suspend/resume handling of
 HW_RUNNING watchdog
Message-ID: <5e77e129-f822-4134-afaa-1a0cc088978e@roeck-us.net>
References: <20261020-meson-gxbb-wdt-suspend-v1-1-d5abe4340008@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-meson-gxbb-wdt-suspend-v1-1-d5abe4340008@iav.lv>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLXPJ-00000001xoi-2zHC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45506
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNDv1L8SJLIhfHTe2gQOT80d6PGTV4xdgCvoZ5/pwtAHOAR+CLLdY1K9KJGTDX/8AKpIdXP03Ja84Sj01yb7OmzxocNBGDXjqym0RIcVAe2HSoeQlYtC
 Ob+KN59fpOTkMSDsktVDYDszBnywBjMm3XYTZIa8uWNJgjvDUVuBHqcJB8EXk7IWxKgA2gtsjsUo/7R6d674WEh4EFVkIlYR9yg45UAoGUm/Tsttjnx34Y+D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_195929_724562_A69F7E3B 
X-CRM114-Status: GOOD (  10.35  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 08:28:37PM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gxbb_wdt_suspend() and meson_gxbb_wdt_resume() only check
> watchdog_active(). Since commit 6adbfbab0f03 ("watchdog: meson: keep
> running if already active"), probe keeps a watchdog left running by the
> bootloader and sets WDOG_HW_RUNNING. If userspace never opens the
> device, WDOG_ACTIVE stays clear and the timer is not stopped for system
> suspend.
> 
> On an ODROID-HC4 (S905X3) whose U-Boot starts the watchdog, with no
> userspace owner, the board does not wake from deep suspend
> (rtcwake -m mem -s 60) in 2 of 2 attempts and needs a power cycle.
> 
> Stop the timer on suspend and restart it on resume also when it is only
> running in hardware, as sp805_wdt does. With this change the board
> wakes from deep suspend in 4 of 4 attempts, and the kernel pings the
> watchdog again after resume.
> 
> Fixes: 6adbfbab0f03 ("watchdog: meson: keep running if already active")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter

