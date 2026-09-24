Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D06C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JZpVLydtEc27KJhodnas+IibFDhrR4fBdY5BhpMcjmQ=; b=CljGVk5G6yZ+YcxP654/ueHNu0
	dRYgPb8NI0B+PFIBaClaTO2rrDOmVp1z+0cfII3U0xgpMlnt6X1yZDyYfPdb/kzenngrJ2uMQie4R
	ivB238Y+LmGoFri9M63wZHY1CuN6IXFu0DsCsyYghYuDFpVxtpfOIvL2da6zBQ7nIhpRlMoWeYH4F
	ZDRTWw8sdsm8wBKlPqG4oqMmqj6TBJpBj68Yh3CTXeY+7gQfkxngd2Jid7yYjGham0UtilvslPKDM
	gRYIiT3Lx5RDDwLJzoOmz9PvdJQkGwnkIA2XVSxs5KlUzG3VVRrwq9KtiiAddHB4+7wf8TuUfNkpS
	we/KnpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJT-0000000CKNA-3Oor;
	Thu, 24 Sep 2026 22:53:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJR-0000000CKMM-0TOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790290388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JZpVLydtEc27KJhodnas+IibFDhrR4fBdY5BhpMcjmQ=;
	b=XyrkKii8GgW/Us1voYnEOedgiXH7yOEsUfh6+/FT80bIWnnoMB/1OKGutWRDKa4z25fOJO
	XqivtAg8yTVAFu2O8AOqXJqV+26TL0F18asE/cyLar7FgMjBnicpV8xB1tEE9dlOjMzCjJ
	6X8zC3zkXR2mWCdEtJ6aI8Ot2UjauXw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-X2BvvKF-NR2MmHecquwY1w-1; Thu,
 24 Sep 2026 18:53:04 -0400
X-MC-Unique: X2BvvKF-NR2MmHecquwY1w-1
X-Mimecast-MFC-AGG-ID: X2BvvKF-NR2MmHecquwY1w_1790290383
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35AD71954190;
	Thu, 24 Sep 2026 22:53:03 +0000 (UTC)
Received: from [172.20.117.44] (unknown [10.30.44.223])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F9F5433;
	Thu, 24 Sep 2026 22:53:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.3.0-rc4,
 upstream-arm-next, e8e60d3d)
Date: Thu, 24 Sep 2026 22:53:02 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <40761.126092418530400985@us-mta-190.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F8ygtrNqCyzfPbONH30rnd6TWwCAMzwgCwY4Fg7KMyM_1790290383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155309_225380_35FA71FE 
X-CRM114-Status: UNSURE (   7.00  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2879799741


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


