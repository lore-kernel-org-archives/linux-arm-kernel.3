Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EEC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCwBqZ3Z1Ko+FK+TWDpxFERf1nGdWl32MbXodX0yeFc=; b=fPK+LD1n6SUzXvO6wtPglaSnlP
	a/mAr6eiPy1R1tuiAiajQLI5neB75Ayk7l5zgGq1RAN3KDcX2Yio6OoJEJiokEbiAkIP8uQvl7jwZ
	W9ZXU6cMknMT0dbUbMHU0gKP/0U/29cHMgBrFmAnJtjhI/BKf/dWL8x705ayAU7IAq31uhgWWieJj
	uirWPibnRMZToxhixqQLa+9mtbeLFPxNLBAUysjYfAk0R6wSUvzHLEikxUMHt0+FP5zywBClC0JOi
	aog2/ClcMuRPRVmln5hs+UFMZrig1+oXFqyNkGyn3C4T+WmQEstrL8SupLc1IROfixgxyYjHxP1nM
	9StrfajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DkK-0000000HAWi-30UG;
	Sun, 20 Sep 2026 09:22:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Dk6-0000000HAM4-18NE
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 09:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HCwBqZ3Z1Ko+FK+TWDpxFERf1nGdWl32MbXodX0yeFc=; b=CzUxvreECMLcdpuaQ3TxrbCugs
	qTHufpcsI843NJRy2q8rYTaayZBzxuHNf8FIlwGiVhR5J1xMq5kDAyZAjTXO5jZ3pCEERHFIyr9qT
	ALbRzsEm4PUZ8cV7reh/kr7yTid1MBlN0xynIiNxmxV7LX8kKzVV9CKnFNJ+oMC19+r3lT1s/Y26a
	9xdcsHqvVc6BqDFh5IzeI72RCgaukft/4sZjBCOacnbLd9m15FjiRWjvIzd8ayvNCAuL2qtgdgNfa
	2ZSHQ4unUhyD/5PhfMgrOG2qJHoFU1PY41wlyO9kQRzLSi4swHSWxDmpwui7YlsCataZE0eSmVO7L
	MiFLWY9A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Dk1-0000000BI1n-49sV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ECA21CE0;
	Sun, 20 Sep 2026 02:21:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5A243F59E;
	Sun, 20 Sep 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896105; bh=KpUnK9nTZ9MsjB64snnJysKC48S25Nf2oKGr+4tdw/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVau/WDnpjMz3xoAP2wRLiAFXpSlebj0Q1sjWx24eYjJv821CL8YqT6q3QUNwkL/j
	 s95UoEBw4/SEq/drGyKfSaUqXjUSOewzQ8lm7c3jsNsMzPEL5KlTFurCgECtvgXKGA
	 aGYUQObU4wcnscFNY76162qmTPtOwmbPBlk/SqmA=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v12 22/25] docs: ioctl-number: Add SCMI Ioctls
Date: Sun, 20 Sep 2026 10:19:25 +0100
Message-ID: <20260920091928.2014972-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_102146_261359_4D8D1879 
X-CRM114-Status: UNSURE (   7.07  )
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

Add SCMI Subsystem IOCTLs numbers

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..3a89b2065674 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -401,6 +401,7 @@ Code  Seq#    Include File                                             Comments
 0xE5  00-3F  linux/fuse.h
 0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF1  00-FF  uapi/linux/scmi.h					       ARM SCMI Subsystem
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
-- 
2.54.0


