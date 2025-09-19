Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FFFCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 01:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+vx6SOgV6BeEUYlo+LmSaMpQmh03x0ZEMmulZGHYn/I=; b=kGSUb2tHvGj0etUmgEm6x1x/HQ
	UeMUwVEvGSM7b3h/q3qHO/G/+qGK2lJ2Ehu4EzjtkUqb8GNlCKNCIg1SdesGkfK4Vq4uZk8fuO/GI
	BLyCuogZgjwWuL6G7NAtikBPZufuTkNFy01Og/ZfvCikLQRQ85nfANoxQRSNI/I0XeT99KxgQWfE2
	xR8R9Pv+uAav+GAPgdXMk90WhIgEPw2vTcEoXdpvg/xYRKfwQOPbx3PeHDtKIFYuHFvVJ8IADAef5
	p1y44QAuA/NFkhQMnFqhN4RB1pMf0egVCKcK9BKWvogkRk+4Nu6Cy+4ME7d8SjNJ3qsW3WeKgYvEA
	FwP9PZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPqL-00000001adO-1NVe;
	Fri, 19 Sep 2025 01:23:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPqH-00000001acw-24ri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 01:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758244994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+vx6SOgV6BeEUYlo+LmSaMpQmh03x0ZEMmulZGHYn/I=;
	b=QRwJJfDhaefj4wsXqcLt2splGgFuLpdTnOD3yRb0DQ7EOyXQBmfgqNIz9Ippl7r9pBMJQH
	mn29RTdXS7NjhrtUPDC7Kq6tQ4iGzRSiWBVT9UFv6E7P2U6saSKIIMr6HsT5IKTMRBtCsW
	v3Nu28vMRB7BrgjN9Dr6HaOOxWJYIY0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-GDCAZSLbMe-R7bYt1qducQ-1; Thu,
 18 Sep 2025 21:23:08 -0400
X-MC-Unique: GDCAZSLbMe-R7bYt1qducQ-1
X-Mimecast-MFC-AGG-ID: GDCAZSLbMe-R7bYt1qducQ_1758244985
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C1311956067;
	Fri, 19 Sep 2025 01:23:05 +0000 (UTC)
Received: from [172.20.26.51] (unknown [10.30.44.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABDF8180035E;
	Fri, 19 Sep 2025 01:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.17.0-rc6,
 upstream-arm-next, c9d61056)
Date: Fri, 19 Sep 2025 01:23:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <00799.125091821230801079@us-mta-447.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8jcoYbb0eYWalF3U-WeNK2yYfUKAychs7l16c2m3HCg_1758244985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_182317_609673_2D4BAEF1 
X-CRM114-Status: UNSURE (   7.03  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2048370191


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


