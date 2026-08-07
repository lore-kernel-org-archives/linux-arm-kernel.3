Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFD9C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5wfVPe4pHkiV+3qFX90kAEBpHZcNk0vzhENmzK7Lq8=; b=ruHhdY82ETdiTnBwobARqocBFK
	zlxPhg2reHmBaBKg51ksbOt2ry7dt7bzb/CRlICLKb6CpSMhnKkzDViBFm0PmJI4nvImPusUL2zlp
	udqzkrYNVF1IWwEd6oQermxhTzk3jw5sPYHxuWHOyKLvWvc4HD6Szh1wPILRYYjqxc38XmPeD9AJS
	EQO6Qusu5M/MT59SlU9UL9QbpGqQSu+P+ojgF0eQtM5VvcYCBTzrzhQ42/l2z3eGFpsPYoG1/55Wq
	qKw90I/M+iZo1zxQ4i95JyWRtgF2P9OmtpBzUJk01bVzqyyQ0sQZ0m5H/uJc3UtaE2gmRhDOipeSi
	SaGpQM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDer-000000078oy-4C5a;
	Fri, 07 Aug 2026 06:02:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDeo-000000078nx-1lek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786082532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F5wfVPe4pHkiV+3qFX90kAEBpHZcNk0vzhENmzK7Lq8=;
	b=OxTNOA0yp2y8k/X9POTxFvGYddYXxzwwYAA7iELsUPvU8eo+J5ON7EDtVavTbQLr1Sf84x
	lJHhIEAFrOI0k+J+JmKqektmPKuAdyZoq1U991fi8qrvGponOMt4RlSg2TxT1+ydosnXGj
	pnxIIy/ymMjNLamNrZjKu2ZlTWUZG6E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-MOAQU8-vMyqKsvd5IbYs8A-1; Fri,
 07 Aug 2026 02:02:08 -0400
X-MC-Unique: MOAQU8-vMyqKsvd5IbYs8A-1
X-Mimecast-MFC-AGG-ID: MOAQU8-vMyqKsvd5IbYs8A_1786082527
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE02B1800614;
	Fri,  7 Aug 2026 06:02:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3CA551956094;
	Fri,  7 Aug 2026 06:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 51 of 56): Test report for for-kernelci
 (7.2.0-rc6, upstream-arm-next, db788396)
Date: Fri, 07 Aug 2026 06:02:05 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <60634.126080702020800375@us-mta-623.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: egcGXB4w1E7Te_CJSXlMBIU1Pt6MWbRxB1SWntu7Zak_1786082527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230214_533730_6F2A1ED7 
X-CRM114-Status: UNSURE (   6.36  )
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

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2738163429

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Hardware - Firmware test suite [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    selinux-policy: serge-testsuite [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


