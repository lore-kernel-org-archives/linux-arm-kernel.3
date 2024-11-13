Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7FCD41C3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+PEQwa7l4DLT738WiQ6Ib5yUyJgE+xpzL/9h4q6jaqI=; b=geV/A4fWBFNaMR8J2gm1G8bDeO
	lVloONh/ITHeOPzpNeYlIYThFiYtLavh484ovTY9iqNYFimrHP1GaLKfrL/q8bnHy4KbpCHYjgmO+
	pBRXV+vjG0GnYHy1sIoojEi1TzzmXNgGx2MH2tATO8wJkyRPPiQykfHjwa9fOqJmQkgXToTjSGH+p
	kpUzqPwxShl0R2v3RdsFEfdMV99xyFXmDsCmqQjjp4MoOPM8BL73R+bEr4Yp07e6JodZ2G+Xdl2i1
	oz3zr9u8Jqsh1vVh13g60lYtngaQ+kE8hZYu65vS6xU8pxn3M0bvp228Rr9YkO8398sw0Bh1MryLy
	5FL+rETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDDx-00000006tAF-3Puj;
	Wed, 13 Nov 2024 13:15:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDBE-00000006sp9-2KmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731503587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+PEQwa7l4DLT738WiQ6Ib5yUyJgE+xpzL/9h4q6jaqI=;
	b=PjsOi9saLJkl7HtZohQpHPjuW5s1uyBiZeNLOEGFzQnQPdmHRf4a9vVCsu4NPR8olm4agi
	+emxq4YINUG9bCjPC7uBCeIO5iJJ5ScNBXU+bsp0TMDxFgZaFn6bDgkNgomh9D+gEnjE5Z
	1bxcqEHQ3jOlzsCBanfOGKf9msmHdyA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-V2qSKhXWMx29W0HufQae_w-1; Wed,
 13 Nov 2024 08:13:04 -0500
X-MC-Unique: V2qSKhXWMx29W0HufQae_w-1
X-Mimecast-MFC-AGG-ID: V2qSKhXWMx29W0HufQae_w
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A984195419F;
	Wed, 13 Nov 2024 13:13:03 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80E56195607C;
	Wed, 13 Nov 2024 13:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 10 of 69): Test report for for-kernelci
 (6.12.0-rc7, upstream-arm-next, 68556612)
Date: Wed, 13 Nov 2024 13:13:02 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <09983.124111308130401644@us-mta-654.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N_NZ2FeO4vt2E4XgwzDDVTiwVwRIVXD6xoj1gwhQFmQ_1731503583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_051308_694215_49B40F27 
X-CRM114-Status: UNSURE (   6.31  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1539937649

Tests that were not ran because of internal issues:=20
    Boot test [aarch64]
    CKI/restraint [aarch64]
    machineinfo [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    Storage - swraid scsi_raid [aarch64]
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


