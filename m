Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0569FF9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 00:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgQGxFoxLDltZ1JPw5sDwkv0KcQRI/z1RDM6bOge0Nk=; b=pYuq2H1gx207rpHM5etRrM+pKO
	OrO16IwQyzqFW90r2/e8vZmDqAOv8IE8Id8TFplNiKq9b08XOYcp4yH3CMpV22CsU9pDAXX9a3THe
	PfFH7qCSFEr+LngxKdUyhCjw4ohdRN1rqpqyEYNI1OhAhAj/x6fQ27/ju04Lmndn5Yw+wc3g8sDKN
	VHhyif0UZ6Vb2CpXrhiLP5AMKRjdheZQ9B5haXjl7Zpo72iMVvzDuLgHSapUsS4l8mtilylw5ZUno
	Fu78Qpfvv8225NukDhaQ5e/H9oStwXJ+OUoxOhsVZDYWDNGdd7dd0eWJmbZ1s1GeajLBGV0HOeRmr
	7L/kEB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnhx-00000000Ly0-1SDM;
	Wed, 15 Apr 2026 00:02:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnhu-00000000Lxe-0BiQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 00:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776211331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hgQGxFoxLDltZ1JPw5sDwkv0KcQRI/z1RDM6bOge0Nk=;
	b=jWpl5VGcxejHi/LafMIyv8Eq9nPfhT+mkjt8SBGDiq8DL0Cqmi2hh4nFouSeeKtPgABuvj
	6GM1GNx1FRHcJmVRxVhhR1jMqU1dSP83K7wDOOZVTAljBMlcZ25T2FEN29TIGJvSPAWaUp
	PujutM0t87g+WaQzMdPrlcOMFBdULvY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-jOUIMPoUOYCoI1TTxa_C1w-1; Tue,
 14 Apr 2026 20:02:08 -0400
X-MC-Unique: jOUIMPoUOYCoI1TTxa_C1w-1
X-Mimecast-MFC-AGG-ID: jOUIMPoUOYCoI1TTxa_C1w_1776211328
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAC0C195608E;
	Wed, 15 Apr 2026 00:02:07 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09EC6195608E;
	Wed, 15 Apr 2026 00:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 51 of 56): Test report for for-kernelci
 (7.0.0-0, upstream-arm-next, 986cb454)
Date: Wed, 15 Apr 2026 00:02:05 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <90810.126041420020900151@us-mta-20.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MRnH1uR-Cu-86OYKBpkE7ZDpFOJwNOQMkvap7S9oPW4_1776211328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_170214_179044_412AB370 
X-CRM114-Status: UNSURE (   6.24  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2453129617

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Hardware - Firmware test suite [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    selinux-policy: serge-testsuite [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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


