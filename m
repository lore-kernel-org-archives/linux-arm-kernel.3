Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqYwf5Ub7H9RImvha677RgfRRKhB24bI7dgvnJ7lt7Q=; b=tbf4BlkMrwoOOY7r9vVfaOyLdS
	wAfDO4bHrwVfTUI7UotgGIR5PyydkK1ag05UISBkFD2Y4FcOpeDF0ZNIlzpb94L/hf57zmgVJ+IY3
	DsRA8jpiskitvSbJE+4uVO89DKD8oAjDunszkRolws6yaXlXpjZNrSn09GkthU8FGNMF4Vu5LbwJR
	Dqc6wGE61n6KtkKuor0JnpF1ooSejO79lcvFTRKwqgzJm44OIW3P+/A0q9TTcFtQ34nCjD6aGhavv
	7aX2qOQvTYbDZYixcvtaTG4XN0QM0dFoDaP1fwNcQEBTCM5d3Mc1P5urZVCm1HDZNZImPqtg8ZI3V
	5qsAg6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeeu-000000009ne-349P;
	Tue, 30 Jun 2026 20:02:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weees-000000009nC-13Bb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 20:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782849730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PqYwf5Ub7H9RImvha677RgfRRKhB24bI7dgvnJ7lt7Q=;
	b=EpwZ4qOMJHsa+xknZ8x+oAZs3aEI8THSkxXyqqLmm6ZTgM8crwEvKw6s3xaTlKlJORQ17c
	dQL0/bwgJQyXqVSNI+qaLn2utGa15ZGkfnmHCd0TgddVAN9yjdCnyXuujJsTM0ckVkS6Aw
	j3l8K8VGmc7XW6DEvTYqaAxZL898W74=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-201-kq3kZmxvO5Go6VomiM3zpQ-1; Tue,
 30 Jun 2026 16:02:08 -0400
X-MC-Unique: kq3kZmxvO5Go6VomiM3zpQ-1
X-Mimecast-MFC-AGG-ID: kq3kZmxvO5Go6VomiM3zpQ_1782849727
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CC75184A090;
	Tue, 30 Jun 2026 20:02:07 +0000 (UTC)
Received: from [172.20.74.181] (unknown [10.30.45.123])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 41AD11955D86;
	Tue, 30 Jun 2026 20:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.2.0-rc1,
 upstream-arm-next, ff4c5a0d)
Date: Tue, 30 Jun 2026 20:02:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <82344.126063016020802183@us-mta-201.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: axMpSYA4WBZN3BS1ROQP5ksZN4QbHGiuiAYKlODLVeY_1782849727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_130214_471133_00A98DC3 
X-CRM114-Status: UNSURE (   6.90  )
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
    Commit message: arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]=
_range()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2640930305


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


