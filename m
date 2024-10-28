Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E50DD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ut6t7FZcAUGa8RQ2/hjJ00unz+iUqPCxG7le70TlUtM=; b=g0IJEPyvLDS2Zhit9h55Dczabe
	R2XBmug0tbljxv79ykm1w+xL2M8pBXISvj+qwWxmUJQ+RyZCIRb3zmx/hBIp+/cm6gbpVWujy69zg
	0+LTjL4kWhbM2RbIc2XTxVtV8+qZJ11wv9N4dH0Qk+Pidqw/GNQTr4599LaK+XYx5QETNV/D475U8
	AMWAloMWHyCiGSTVaws3X1L7PhN6094jSNa0WIwSuSnbyTYG1y1JKpJ6pk6Mmeo3yDkzSbLUwgZJT
	WDUUjWpR/YzbHNwfxuo7s3ASqSDJ38ZgL9zVIOuPK0ZZgaRm0+ojWGIaGksJZLQ0I1F2erf8nIaaE
	WkBR7nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Xes-0000000CPeX-3Jbm;
	Mon, 28 Oct 2024 21:52:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XLR-0000000CLMj-07ph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730151130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ut6t7FZcAUGa8RQ2/hjJ00unz+iUqPCxG7le70TlUtM=;
	b=jVxjIAY19D9T6bgTQPDp5bCdN8poGFJ2fBxYFWcJ0wET1bkNCjjR2cAjoVYbYDXB+9bNko
	kJlYzPeGAh2l2Dbjuyz49NchT2hgY2LZrZJ7hL2oWfssVZMOSqXMe4hY1WrTO0EyMmjU/7
	fKjd96Hq4qz1uarYowuPkELkPeWSokU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-KPUWmOQ2OSS9US5vnSpJZA-1; Mon,
 28 Oct 2024 17:32:07 -0400
X-MC-Unique: KPUWmOQ2OSS9US5vnSpJZA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C82D1955F40;
	Mon, 28 Oct 2024 21:32:06 +0000 (UTC)
Received: from [172.64.8.116] (unknown [10.30.32.116])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82D191956086;
	Mon, 28 Oct 2024 21:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.12.0-rc5,
 arm-next, 1bf329c6)
Date: Mon, 28 Oct 2024 21:32:05 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <20755.124102817320703848@us-mta-564.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143213_161850_D5F24A3C 
X-CRM114-Status: UNSURE (   6.12  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1516898072


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


