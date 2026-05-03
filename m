Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE52ACD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJ8tGqBUvuWKGLXB7Csu+pVgqW3xVtDUmv09UATg8tE=; b=2t/xFd6SIqesnR01WYsiXF/CaC
	HMFZJ5dMZZtBVWCej52hXtMqDHHg0FwtE0dJSZknUpge1seTyG0Kav9Tv3zRHOHquUwWmHdonO+m1
	UwPBTaZxPJgQhgonHPUAp70rF/qDrbDYNVXjqlkeu3hpuRPWpR7P7FmpqDpp0j2tBFE2IRSgCxw2w
	abw3I+mdtd1s0AjGKEcIbfPUbvOJQyFjBtJ2rJeA8i684F/dlwUrm4Om9M/Vwe+phDxSozlng33GJ
	EXae78g9/p8JtwOikOqHMjyC9EOuFzcqumvoMxy4cc8vQsPBatSErX/fxPuUGgZdO3VmSSeOABxI0
	SYFdm9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJagu-0000000BPmK-2IIt;
	Sun, 03 May 2026 17:33:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJagr-0000000BPlY-2j9y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 17:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777829591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vJ8tGqBUvuWKGLXB7Csu+pVgqW3xVtDUmv09UATg8tE=;
	b=d2TcMiJd1zbnYCDGkSPUGvhRyQ/tCT3Z7J5mnGCa3F0JBw01bwvsknDu7tqflH9DytHDWl
	h3FlrQxjeZu+63a3qLjm7crEbOSwaqXCiY1Yn2RElgzQp8zm1f5P/DUFehiLX8F26/uWwg
	yxILcTXIOC+kGwPhNUc0UI5/rz79sYk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-JTW3Hoc9PvWebp-tpvAUxg-1; Sun,
 03 May 2026 13:33:08 -0400
X-MC-Unique: JTW3Hoc9PvWebp-tpvAUxg-1
X-Mimecast-MFC-AGG-ID: JTW3Hoc9PvWebp-tpvAUxg_1777829587
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85DB71800473;
	Sun,  3 May 2026 17:33:06 +0000 (UTC)
Received: from [172.20.231.189] (unknown [10.30.44.222])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBA0A19560A6;
	Sun,  3 May 2026 17:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 51 of 56): Test report for for-kernelci
 (7.1.0-rc1, upstream-arm-next, 4d8e74ad)
Date: Sun, 03 May 2026 17:33:04 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <69528.126050313330800229@us-mta-169.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f25hErOR9rOlbFf3fkwFiCDUmza7GO8sGB2DoQJKE-g_1777829587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_103313_761889_A4097B6C 
X-CRM114-Status: UNSURE (   6.67  )
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
    Commit message: arm64: Reserve an extra page for early kernel mapping

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2493907638

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


