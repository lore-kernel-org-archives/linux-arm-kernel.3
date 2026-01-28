Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8C3D46BFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKd6d3G3TULxlSz6ZEWgvoFXJqouXnfIiJ5x6z93t70=; b=sesxnrzUDcIPCCahsld7QNKjqd
	0mSwcqi+rpwsjAvZLxijrfHV8V8gEaF7Pgy+wHTB+FbxFQtdAUUbIs+WN0Mp4Wdex7xZ9x+fLadHA
	tXUWAcGavaCjXm1AQrCoY9dcNwpJ+DLkHH0NR28Pq4lz2nnSS9naNRR4KRkhm58VINAbnKmGMZEZu
	H3sO0ZkAUBZl1C1ILpUgGLUl1EwbVcrnSODBCrZIgFKvv+cxlmpdS0kYkTRvIvNlAm30VsYb3MwUX
	Lr1V28HZ0PUCPFX0OMZtYXeC337iCBtWWd0kUkULvFdxr45fwMsw/LhMfu35f2s++jggTSeRSdi7d
	ilPxqJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBto-0000000GirQ-1b2j;
	Wed, 28 Jan 2026 20:12:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBtg-0000000Giqw-0EUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769631134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZKd6d3G3TULxlSz6ZEWgvoFXJqouXnfIiJ5x6z93t70=;
	b=EsV3Rkc1wJpw0uAUy/KlJ0zd8mIqs3JAMahChd7Cd4VU5TYJQZ++4Q9lu+xVCZ6XOqtoHc
	uSMpDoakGyO4wTpIdZrYpP2OsX6ot2Tr8aBhW2o0y1dJDe9spTfr+zD0PdEmTIXmg64eIv
	H/agTW55AnUpWjpZcEhqEKg2+4rSWPU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-oXJdvaKXN4WwYTJP_ElGHQ-1; Wed,
 28 Jan 2026 15:12:08 -0500
X-MC-Unique: oXJdvaKXN4WwYTJP_ElGHQ-1
X-Mimecast-MFC-AGG-ID: oXJdvaKXN4WwYTJP_ElGHQ_1769631127
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81E461956089;
	Wed, 28 Jan 2026 20:12:07 +0000 (UTC)
Received: from [172.20.60.237] (unknown [10.30.45.107])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48D111956095;
	Wed, 28 Jan 2026 20:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.19.0-rc7,
 upstream-arm-next, b5c31fab)
Date: Wed, 28 Jan 2026 20:12:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <60274.126012815120800855@us-mta-446.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iv9g1V3oVIKuRXuSJsLNndpJvYoByU1sd-PB-fyMA4I_1769631127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_121216_163186_FD428CFB 
X-CRM114-Status: UNSURE (   6.52  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2292193556


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


