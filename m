Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBCDC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxhOie9TpAvh02yEa9U51fy1SiMxp6r4cfMmJD0K2pc=; b=Dtdaqd92nNn+X7F/tRT/EnXCPA
	4xNj9TcVNjAmsxMMknec77hNhwxKz5Rv3hXAqcLfKswDftWlgQoBtJ3bglA/eAngSNbuG3lz0jvgq
	iJ0pByNIQF3ZvvChI8/IOibrx3w+Ben+Ly8Yj7ngec6Ez2n/2CUFVZcXnigfTLA9tFgeYY4/GJPss
	c2mTwnfZo4gxyszBG1Tt3HYIp/e+7gj9ftZlVa6JGKcWrqGYrMKfJ7VvAGxl3hhlPZOZbvCgFniSE
	ltcyVGib62zu1d76Drj2wPYzh+s1WJk8mkVtWQyEMqK3VXKxe7HePuDNLekOu9UzCnNcprUTHhcZQ
	s7eOW5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWG7-0000000D4sj-184S;
	Fri, 04 Jul 2025 02:34:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWDl-0000000D4lI-3Ah7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751596332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XxhOie9TpAvh02yEa9U51fy1SiMxp6r4cfMmJD0K2pc=;
	b=ePqfgaTF/R28YjoyQgKPN45tkfxl/TZqmifbOVotbwDPD6Ki2BI8itTXi5GrqTmibv1+qP
	oGKqxH7WM43r9c3iI7N5gONfioIE/11BxOoiTp/QkGunZ7ZqcWPGCv0GnjOtraLXQ4UXFR
	2HdmhuzAc1FgAdyIVtcnV2K3WGw7LBU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-1TwzOVbhOJmhKPw7iNNvhw-1; Thu,
 03 Jul 2025 22:32:09 -0400
X-MC-Unique: 1TwzOVbhOJmhKPw7iNNvhw-1
X-Mimecast-MFC-AGG-ID: 1TwzOVbhOJmhKPw7iNNvhw_1751596328
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B7A3180028D;
	Fri,  4 Jul 2025 02:32:07 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 941291956087;
	Fri,  4 Jul 2025 02:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.16.0-rc4,
 upstream-arm-next, 7482bb14)
Date: Fri, 04 Jul 2025 02:32:06 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <28602.125070322320900185@us-mta-190.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xy8RtPkb_JNeRhN2VE4r3zeanqb8Nk_R1Xg1j-9tsIo_1751596328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_193213_864204_CC7C2458 
X-CRM114-Status: UNSURE (   6.56  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1905584551


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


