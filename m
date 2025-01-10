Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE45E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEXom7njJPPcgDfPN8tnP9RpLKB7IRfp/aL/K+EUBbA=; b=feWjCZcb5Ysn1fYHZsTNt5fg3d
	paL9vtG0GC1b9JJSAhLkYdaum/Hfnk8471SeNQ/mIad6OP7Bi+qUE18gFICaIb835/WchZyXeFL6K
	scTIGSf4PuT9ymudlU7Y9Z05FfKWgraqkEfxa1JUmVNuDQgpoSnSaXEkR/1cUQbHr0u8guSi7QO67
	WPEszujj7UlKl8u6WzHi2SQc9viusU55pGgHHpMnl638EAcAFP3GubhWCdbF6tsW5yLEEXSKNl8fR
	cg7tq8mUPZjAKwXpGcFYu7MuO1lUCIxhTtD7dJG/4eCHjhAcT7bcTvGCNJ1w7UvksMLZGzzSAC6M9
	WfpPsDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK9M-0000000Geru-1gMC;
	Fri, 10 Jan 2025 18:54:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK86-0000000GeQh-2iYF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736535188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEXom7njJPPcgDfPN8tnP9RpLKB7IRfp/aL/K+EUBbA=;
	b=Fw5EwTTu4hNwGQeHWb61aA5I8A/NOkm+ZB58TMsRDbY2XKnCP7MJ4xxr2TbrZ8MR0LYjeo
	0ciAm4Edqq3EGvfbrwBix30I6VCDX/ajG98t8hFISLy9rr5syzrEr1dT9ubg0XG85cmg5z
	IyZRJAEbHl75gyUy/x4bk+J5uMXCDWE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624--mbj5mkON2Sg9zatQsqFAA-1; Fri,
 10 Jan 2025 13:53:06 -0500
X-MC-Unique: -mbj5mkON2Sg9zatQsqFAA-1
X-Mimecast-MFC-AGG-ID: -mbj5mkON2Sg9zatQsqFAA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85B971955DC9;
	Fri, 10 Jan 2025 18:53:05 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D9CBD30001BE;
	Fri, 10 Jan 2025 18:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.13.0-rc6,
 upstream-arm-next, 6251d177)
Date: Fri, 10 Jan 2025 18:53:04 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <69657.125011013530700129@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2LWdvl8MbckB2i0TzXFk9nT2jGJLKAN-gBH9ZszcnH8_1736535185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105310_757909_A655903E 
X-CRM114-Status: UNSURE (   7.27  )
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
    Commit message: Merge branches 'for-next/core' and 'for-next/perf' into=
 for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1619912410

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:431=
7 enable_work+0x104/0x120
            URL: https://lore.kernel.org/lkml/ff6461df-25d1-494f-ad34-763fa=
f249309@lucifer.local/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]



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


