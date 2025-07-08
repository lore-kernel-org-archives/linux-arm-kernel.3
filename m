Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA1C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/RHCicPNaylw3u5MEN+P3VctTp/I5kb3xjZUvaxcUiQ=; b=nIZw/5dfVDR1HWueELoJZDilwb
	UIlOnoOF2apoEd+t1rrdTnZ6tkWb2F31OgQmOAg59Hqgr7L1oZkmXlNHYXonCDM7F9N2pq4AAxaBk
	pKNFOsdb5FY0iodYsbd1tdMonNkfYna++rahEEj9+5DSwDOZMBI2f6R9Kf6KxW0+pya1GIpZanR3q
	vcXx7MST0r1WunAYhNHOz8O2tIi/67X96UC0vamxFk0BiT5a1fYCrMI5EHFLt2xJqM1Jyj03nSZUg
	CJqYrkj7xc1gfOyKS2rrsAXflW+azkTi9M60l7g8YPkYU3COD09YbhI4qz5RRrJ5EPiGjNPoaKOPK
	Hze2QtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFvS-00000006fyR-0gdV;
	Tue, 08 Jul 2025 21:32:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFmQ-00000006eJi-1hMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 21:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752009788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RHCicPNaylw3u5MEN+P3VctTp/I5kb3xjZUvaxcUiQ=;
	b=QVGx60B2+YjvQAoFOckKklIES6Mi/AEcEiZCZnrQsEkaGHWIlDpXLC3ZkR44oTByyiR80i
	4v0K2ak3V7o+tk8GvK4ZdPL5N0yaTsuJVoTzNUg7xyCtmo2bQGAMV3sBOSHtbbZSybzLhe
	iRPsiFcRrjKD+Ge6E055jUtL78wSUEo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-cVIaHqCSPEWLnl5ZHcPJlQ-1; Tue,
 08 Jul 2025 17:23:05 -0400
X-MC-Unique: cVIaHqCSPEWLnl5ZHcPJlQ-1
X-Mimecast-MFC-AGG-ID: cVIaHqCSPEWLnl5ZHcPJlQ_1752009784
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 523EA180028B;
	Tue,  8 Jul 2025 21:23:04 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2515319560B3;
	Tue,  8 Jul 2025 21:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 41): Test report for for-kernelci
 (6.16.0-rc5, upstream-arm-next, ec480130)
Date: Tue, 08 Jul 2025 21:23:02 -0000
To: bgoncalv@redhat.com, will@kernel.org, omosnace@redhat.com,
 linux-arm-kernel@lists.infradead.org, liwan@redhat.com, jbastian@redhat.com,
 catalin.marinas@arm.com, ftjahjad@redhat.com, mmalik@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <78490.125070817230501180@us-mta-669.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ybrYyYbObVk_m4Ywh4YnLod03lN5E7scg3PuIwCjxpA_1752009784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_142310_517629_A9447C49 
X-CRM114-Status: UNSURE (   6.92  )
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

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge branches 'for-next/core' and 'for-next/fixes' int=
o for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1914252947

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1914252947-aarch64-kernel_upt_13
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1914252947-aarch64-kernel_upt_24
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
        stress: stress-ng - memory
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1914252947-aarch64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]


Tests that were not ran because of internal issues:
    Reboot test [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


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


