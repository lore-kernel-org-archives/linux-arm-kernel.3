Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840D4CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AXwRCxQpIxhB8ePIdkz6IP5ZGwtF21dX7NHAHm2LnGE=; b=YT840ik0eUcewDXstbBkQqVzB4
	kaI4wB8q7XcHuYMikZC7XUxUU3VGI6hdZZYFs2dkTACuaOWcMCsfZprEck5HOwo6NAmBUQRt4QzPB
	kMxLLjQmvASYEKcbAXoRysBwTawNxhv00tr3LXCycip+dDVgw5A/HyOmWZxP+P/mhSx5WZ9/v8Sk7
	dq76JsgQUOACLvjgLc8gIBfWT4KShOi0WH1l57rNyIVtVNR3deTRb3Det6TguM+BAA+jDkvP8aeLV
	hmZA1il+PlQ3quLCtoS58dpcZKMb/qOVi03yF/kmqi4khtlXHJ5s/CCTIhExfq5QxJt0VNly6DdT1
	oRXYUpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnIq-0000000DACo-1yWe;
	Sun, 14 Jun 2026 16:03:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnIm-0000000DACN-3s0U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781452989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AXwRCxQpIxhB8ePIdkz6IP5ZGwtF21dX7NHAHm2LnGE=;
	b=VA1kNYS7mLZ8T3G6k4if7MYUwungLVZBTMsrqx7vL1ff8enlvlj7C5QVK/+dOXSqhOWyBc
	bIqsydHysOBDpn6PZsy2KpqtK5INkRskWwBAyNRbJiDQ9ltTfg4e8TsZFP9niH8GQV2sFD
	9HREC+D5xTIMoi8klprouff4AzbJL14=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-pd5CEGVIOzOE7EwCDCDlXg-1; Sun,
 14 Jun 2026 12:03:05 -0400
X-MC-Unique: pd5CEGVIOzOE7EwCDCDlXg-1
X-Mimecast-MFC-AGG-ID: pd5CEGVIOzOE7EwCDCDlXg_1781452984
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70D6219560BA;
	Sun, 14 Jun 2026 16:03:04 +0000 (UTC)
Received: from [172.20.201.113] (unknown [10.30.45.66])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AAE121956053;
	Sun, 14 Jun 2026 16:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.1.0-rc7,
 upstream-arm-next, c2a9495b)
Date: Sun, 14 Jun 2026 16:03:02 -0000
To: linux-arm-kernel@lists.infradead.org, yoyang@redhat.com, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <58640.126061412030500204@us-mta-410.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -griLdHfnOivUKhY18I6G-_YFo8cgMnWEKuzaMtMmcE_1781452984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_090313_058507_484ED187 
X-CRM114-Status: UNSURE (   6.46  )
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2600134910

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2600134910_aarch64_kernel_kcidb_tool_21463752_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2600134910_aarch64_kernel_kcidb_tool_21463753_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



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


