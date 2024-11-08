Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D3D5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcFRV4maks92gyV2M0Dm8b/u1MKI812XLPBrpnA//XI=; b=cQe5OyFQ9mjlEJWMwLzr12xZ4R
	v0T5lxX7mPjp303CRZSoui25lH8sRtFku7kE1fPdaJw1QCbvAghH6OK2HRbmthgxzfsoP9kDj3M71
	RASvfdvrxklpnTARfm3HWErRKc0sdx8G9bFpJGRr9zy6Ve50MWE7an1vX266zDSsPw2iTWfhAlyxS
	kSNXG4MFhcgfFBGxms7d84JGsjnc6IId9QoJAlMP8tbvMGJGhAiyWm8CFmf0754b/SOq8kKUeu3xD
	elU71H+pLBYZPxmtSebNsGVEJeJ+29cj3v6aQWpLeyWOCQZTWRMxQgPWG6UarNwBDFQMznoA0L4P6
	kT2QpOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qyx-0000000B2ct-3Xub;
	Fri, 08 Nov 2024 15:33:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QLM-0000000AuqM-0BVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731077531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BcFRV4maks92gyV2M0Dm8b/u1MKI812XLPBrpnA//XI=;
	b=fNo4kkAWZr52/+JCkonfMIFZeoZYALwoa1k1/hBJ4FfbzvGRS/vm85d+tWLUiBlzaCsPMX
	DFjXNUrV6ibT7oEIjT+q48P/qw+gvdpHIIe10lLtLIRyOn7JOmGokX45VldKSr7iD9VoX+
	Z1Mraa7EGmqS0hT9noYrLgGi0sLm6oo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-ZKbG5SyHPa2yGSJnDfEoYA-1; Fri,
 08 Nov 2024 09:52:07 -0500
X-MC-Unique: ZKbG5SyHPa2yGSJnDfEoYA-1
X-Mimecast-MFC-AGG-ID: ZKbG5SyHPa2yGSJnDfEoYA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F0331954233;
	Fri,  8 Nov 2024 14:52:06 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E73F1955E93;
	Fri,  8 Nov 2024 14:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 2 of 69): Test report for for-kernelci
 (6.12.0-rc6, upstream-arm-next, ca3a5c08)
Date: Fri, 08 Nov 2024 14:52:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <16200.124110809520700332@us-mta-443.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngmreaB1V-2wBHewzSCUZXhcF9CbvnZWIWZYFjiIlxA_1731077526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065212_175510_38034159 
X-CRM114-Status: UNSURE (   6.45  )
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
    Commit message: Merge remote-tracking branch 'tip/irq/core' into for-ke=
rnelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1533343045

Tests that were not ran because of internal issues:=20
    Storage - blktests - throtl [aarch64]


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


