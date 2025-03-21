Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B596C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6gbV/CUJbkFbYiBDMsj4o0WO/etR+edmTxBPDTaVTo=; b=wiObAxZMpBwyHS88sSdzQaHH6U
	vjYFywSpSlCOVZdEkj8drC8JONN4Tj1kMAKVL+azRXIy4q2UYI8IaEtGjWCNvBHNY3idoudJMHhGR
	fiv8yLJNpmBEc4OMCT3h26ekFjAtivNRNzNQPbRp0LNX69LXtJg5hR0X0EojpFi4VO+6uXNq4OfKt
	87R4mzdB4lGLZZVvw0h6xyzck+5KWQePbAz/BYyLLep4I9f94TaUYdGgptFvN/1TGvzUn/2s1jCI/
	orcIYUKXNdFHGXuYr2Fv9AKlYM+SwZsW8ZHnru0ZwggwMh3zu0dUeYDz/NNp8NbwtVG8S6bx0GceI
	wtRsP8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvU5v-0000000Doo2-1Osv;
	Fri, 21 Mar 2025 04:34:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvU4D-0000000DohX-07mV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 04:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742531587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c6gbV/CUJbkFbYiBDMsj4o0WO/etR+edmTxBPDTaVTo=;
	b=MbMozy56aUYFUqHRRlvOJozluxg6eEJK3+Lqvk+WL04XbZoJkz0aRHkvNyJK4pvBrpJj8S
	JS+T4gZcoVVjnQ5O2MnCAStQqTktXuZxQ3J8kFzXlt7K69g49WocvBTZakELPc0DzQ1+0q
	gwa9pqf9RY+QS6Bs0zG2+XIh46NcWMI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-AIbN104qMTC9QOJzrPHIuA-1; Fri,
 21 Mar 2025 00:33:05 -0400
X-MC-Unique: AIbN104qMTC9QOJzrPHIuA-1
X-Mimecast-MFC-AGG-ID: AIbN104qMTC9QOJzrPHIuA_1742531584
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9F3C19560AA;
	Fri, 21 Mar 2025 04:33:04 +0000 (UTC)
Received: from [172.64.12.41] (unknown [10.30.33.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE8631800268;
	Fri, 21 Mar 2025 04:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 9 of 41): Test report for for-kernelci
 (6.14.0-rc7, upstream-arm-next, cc8f5087)
Date: Fri, 21 Mar 2025 04:33:03 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <61845.125032100330501992@us-mta-629.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: znB7ioV1unJOCx6nGQKeDhZ2iV2g85-2h1PpeXnRSME_1742531584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_213309_151600_A5A048B9 
X-CRM114-Status: UNSURE (   6.27  )
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
    Commit message: drm/panthor: Clean up FW version information display

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1727289952

Tests that were not ran because of internal issues:
    Boot test [aarch64]
    CKI/restraint [aarch64]
    machineinfo [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


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


