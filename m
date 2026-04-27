Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DA4FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZmH/w760TYcI74FXyflnlfIu7N7k2ot0kGPF7isNB6Y=; b=PjiJpLJOYxluSec6XcmN+2I3ZF
	RXNQyVUfMGsbSt8zNJgYuh52jar4pD8fOaAsxHdqgJjRL1SRFWkJAyw3IjPNG74or+2nKjUe5pH5R
	z+dBF4LvdDi9jd6Z62kyoDN0A9b1ZxHbPvqOcV8/++Ib0U4abR6qrl8tdh15MvSyHh7r46ELi1cFp
	DnfY+L4Kzt0uHTKZ5BKjOZNToO25FGngT3zmiaQLN7iOyj3US6fmCcr3A2O6VGoBgs4i+at0ZMioj
	gWCyN87eQanJAPYi6HgYoJfGMquBKpUJmzzlDOFpk5QtO1pmlozzRf4mpypm7QUOe1TccdRoHPXkl
	BGWdXxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQRN-0000000HYd9-3HXN;
	Mon, 27 Apr 2026 18:12:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQRK-0000000HYcW-1W00
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 18:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777313531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZmH/w760TYcI74FXyflnlfIu7N7k2ot0kGPF7isNB6Y=;
	b=DaGdbvFOPM29VGUbZR5uX/h6W9uc9h7Km6w5X/GIhRsCd6QsGGFWTrygLL/ntpa7VUUwtL
	WvEk+LFcjzSuYklp0Krr8QmKC7wksMysXq5rP/51S/dE8loGD2Fz4nrlhIr8wOhF5duZiC
	S7Vt/2whwZ/o3fdqCgIDZe7YiVIx6ZY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-PbWQpnicMMuphlidqsd5yQ-1; Mon,
 27 Apr 2026 14:12:08 -0400
X-MC-Unique: PbWQpnicMMuphlidqsd5yQ-1
X-Mimecast-MFC-AGG-ID: PbWQpnicMMuphlidqsd5yQ_1777313527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 290AD195605C;
	Mon, 27 Apr 2026 18:12:07 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F1E86195608E;
	Mon, 27 Apr 2026 18:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.1.0-rc1,
 upstream-arm-next, 3ea44150)
Date: Mon, 27 Apr 2026 18:12:05 -0000
To: yoyang@redhat.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <85586.126042714120801282@us-mta-678.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M_7hPzlWLyQ0iCFWDn0DrI6c8aFrXylV13hI4bJOnDE_1777313527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_111214_496690_2BF593BE 
X-CRM114-Status: UNSURE (   6.63  )
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
    Commit message: ACPI: arm64: cpuidle: Tolerate platforms with no deep P=
SCI idle states

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2482691236

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2482691236_aarch64_kernel_kcidb_tool_21181696_9
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


