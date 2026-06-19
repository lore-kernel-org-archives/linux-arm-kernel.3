Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53B9CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jFbJaXWwIsRqXcz6nmiZlI6mm/dyIqaatsWv+mX0WuQ=; b=30xwJg5NxbihJHHsFO3UO6j1rf
	RBqAY8stejJ/fFVUTBvgWSX3FO9R32x16Qgc2+mVhdGrL9UBZswSNYI4TC7eRMl7Q+qCqIA4zVUT2
	5rVc9G8dv6bjgbsZ0XcSWCDjWG7UJDXGQIgce1OKnIv+sqb1oKAW6F0D3Hwps59AFlJFbhmAJ/l/A
	p2BNJROb/ypAraiU4DpJrG9zknNRP9MX211TMxPBqhn5qm1eyi2qldFQXQufcFqcrZs0fL083aT6g
	lXPJ5W36uyavRieeG9e9Jwr09gp3OM6DD8sA5EJvp6Ov6LlrrPhihqHjwFPoco5nYFzQjFYAcxAP/
	kLPLssjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wafGD-00000002vy7-2dpN;
	Fri, 19 Jun 2026 19:52:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wafGA-00000002vxn-3FOB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 19:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781898731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jFbJaXWwIsRqXcz6nmiZlI6mm/dyIqaatsWv+mX0WuQ=;
	b=UuuExTSJZBAOYVQxtQEzcKSLcahASqGU3qffOPgfoZ3mCADvJVIPtaHrWrKeq67ye6zL8o
	su3g5yD5qdxMvfx8pp3qwSIhxX7J1Fwke7Jx07bqcXlPo+Gi1jun83etBq/uWg0jBGZksB
	jG0Ff16639ROimULzxSv5nYrgdhScgQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-E56N6WpqM_OcSeC8czqd0g-1; Fri,
 19 Jun 2026 15:52:08 -0400
X-MC-Unique: E56N6WpqM_OcSeC8czqd0g-1
X-Mimecast-MFC-AGG-ID: E56N6WpqM_OcSeC8czqd0g_1781898727
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F8BD195604D;
	Fri, 19 Jun 2026 19:52:07 +0000 (UTC)
Received: from [172.20.107.180] (unknown [10.30.44.89])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 801E8414;
	Fri, 19 Jun 2026 19:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.1.0-rc7,
 upstream-arm-next, 92e3f6ef)
Date: Fri, 19 Jun 2026 19:52:05 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, fs-test@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <91438.126061915520801117@us-mta-230.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2yOaWj8ukgLd_olefnYKlq-oxLVjzbC4skTXdPgmmwM_1781898727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_125214_895952_7487FCC3 
X-CRM114-Status: UNSURE (   6.75  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2615019607

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2615019607_aarch64_kernel_kcidb_tool_21495614_9
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


