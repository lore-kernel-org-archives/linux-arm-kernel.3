Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75561CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRjTLPlPgo4RP++aNKoyqSFzF5p07vlm/FWH4+ncEtw=; b=iMz8QyBYOGuKXTtP5QoiKtPgbS
	0iFac3v9/bos4cdkWGFtlJ4ffGcxFUUlot42VPqN3Hae5RFL/BtQBOXvS2qMKsRL+gtLBi7UaEwbN
	cMKmAMZGmC0ud577I9h2atA3ica6VX+GtwBeTPxAitzG5/hUdknWQxFCV8BpSLtKP2yH1utghn6pY
	f0mu5Nx9gNOV2gbCLj41xZpkEkgTM3JsENyYA2YbYZHGcZkh9EatdguymhjWX23fUsa2O5hALwOdn
	9/kCrAxa4oO/853MCaZLz83YfSCjmh+3SCYJBP0W8ddXO/Tj2xqEsDiHX8JGq2AETn+RyvA8a6gh9
	O26HIZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Io-0000000B2ke-2Mi0;
	Fri, 26 Jun 2026 09:56:50 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Il-0000000B2kI-1DDb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PRjTLPlPgo4RP++aNKoyqSFzF5p07vlm/FWH4+ncEtw=; b=YTvn0uMWt750zGg234gGUAVN7X
	LWkp3LeykRqkJumToA5aojtkKJSYnrjisD72fARWxKnZaPAJo6g3mnuO1DveLBo7hiNmf/KK7GYSb
	dj+3REQZHHnhx3RzLlznr8PdcGeYv3Bl0nET1BrUnoFNLUu3Xqz4rQLGfsZXNWrJIMZA4sYF03/AZ
	VuY2wx6XtWua6K/LoSD/iz4eG6xMLIVACguZDf0wU4ram5A739/cZKMcEN7axoOt/6oqgBDNATGwa
	D3pCB318HoLQwcmGabF4HWG4WvIKIxLmD9DuLX4Ujt2CLKI4T7W3C7wJs9yi8kXsRBshtRu/Jd0YP
	IPgzfzjg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd3Ie-003t3h-3C;
	Fri, 26 Jun 2026 09:56:41 +0000
Date: Fri, 26 Jun 2026 02:56:34 -0700
From: Breno Leitao <leitao@debian.org>
To: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, linux-mm@kvack.org
Cc: Breno Leitao <leitao@debian.org>, kerneljasonxing@gmail.com, 
	iipeace5@gmail.com, gavinguo@igalia.com, linux@jordanrome.com, amscanne@meta.com, 
	sj@kernel.org, gpiccoli@igalia.com, Daniel Gomez <da.gomez@kernel.org>, 
	mfo@igalia.com, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Subject: [ANNOUNCEMENT] LPC 2026: System Monitoring and Observability
 Microconference
Message-ID: <aj5KJEIsTl6IK0nX@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_025647_486523_530BCD56 
X-CRM114-Status: UNSURE (   5.44  )
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

We are pleased to announce the Call for Proposals (CFP) for another
edition of  System Monitoring and Observability Microconference, this
time at the 2026 Linux Plumbers Conference (LPC), taking place in
Prague, Czechia, from Oct 5-7, 2026.

  https://lpc.events/event/20/sessions/262/

This microconference provides a valuable forum for key engineering areas
such as:

   - Kernel Health and Runtime Monitoring
   - Hardware Integration and Error Detection
   - Correlation of Issues (crashes, stalls, bugs)
   - Virtualization Stack Monitoring
   - Memory Management Monitoring and Observability
   - Anomaly Detection Algorithms for System Behavior
   - Automated Analysis, Remediation and post mortem analyzes

The purpose of each talk is to share challenges and discuss potential
improvements. Sessions will last 20 to 30 minutes and aim to encourage
brainstorming and open dialogue about ongoing issues rather than
delivering immediate solutions.

The conference acts as both a knowledge-sharing platform and a strategic
venue for guiding the future of kernel technologies to better meet the
demands of large-scale infrastructure.

We invite you to submit your proposals here:
	https://lpc.events/event/20/abstracts/

Please select track "Linux System Monitoring and Observability MC"

