Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E56C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2u+AYNjR54TuVtuTd0JKNLDd/8QYTDW2P5ndIS/XP0=; b=qDPDHWTw/kYXjGxb+epZ6cw4nQ
	qHRmSUocpB6Vs7faj03/iJXJfwGMiEAGoBM7a/nhcC48qMVs2FiO6iwKj2cQXclXdUFd/n8+o5xdT
	Ubln8zEHosLfiXm7hUqGUdfK2YF88PC3/TS15/iwgxlxP5I9EKb8nJzCwU03vXUgnphjbDkg6qfnh
	suBqtvFKK8IQg4Zq1R1D1p0gBkq/AOq+FVNAzeG6jRJZiEpE+mToeRnNm2v2EVIETV4UTT5lVVofa
	wAtnn2arhjCHhBu3ALaep/p0BnPZnwyUBeGGq7tz/k4M6mpDpPhlHVsYNYbY5Xobzm2GHV5wiFcMq
	ntXScXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHl9-0000000AQme-3yoY;
	Tue, 21 Jul 2026 21:12:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHl6-0000000AQlp-0WID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 21:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784668329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G2u+AYNjR54TuVtuTd0JKNLDd/8QYTDW2P5ndIS/XP0=;
	b=iG9mu+yQHnFNLXYRAjH6RJHU/ZRjkEZmyAWzZAv6ntQd6r7PlA1R+LovnIM3bjMOluGDHs
	e7BIbugV/ZuSyOlYzPwhSzWsAvLvC2Pb5dbmwyiwSy5zzvmKiGRZO1G8tJd6QMUm6uyrVW
	J7wPTnmsIZ4XZxD+cxwRaRrdfnYHEQM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-LifyLeeRMx6Gesg_S4-84w-1; Tue,
 21 Jul 2026 17:12:05 -0400
X-MC-Unique: LifyLeeRMx6Gesg_S4-84w-1
X-Mimecast-MFC-AGG-ID: LifyLeeRMx6Gesg_S4-84w_1784668324
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99643180063B;
	Tue, 21 Jul 2026 21:12:04 +0000 (UTC)
Received: from [172.20.157.123] (unknown [10.30.44.126])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBF78300419C;
	Tue, 21 Jul 2026 21:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.2.0-rc4,
 upstream-arm-next, f732c1bf)
Date: Tue, 21 Jul 2026 21:12:03 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <81238.126072117120500965@us-mta-135.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AA_qE8PbYN3LRUb76BUUSEsYmHOWZiZkGVkDVSSEQ6Y_1784668324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_141212_240496_2219E8BF 
X-CRM114-Status: UNSURE (   6.96  )
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
    Commit message: Merge branch 'for-next/fixes' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2694630685


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


