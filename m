Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376AFD49225
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ru1V+zcTEpVi8GqUTMSxkwoNUzXvSgnFn8uuwcsMGHc=; b=JTNyoOQjMwHUZh2LZ9xQMdzLKB
	E1LtbtLBp6xVnxppXWOBt9npWq8wYjPkd4No+80COO1YvLjxJ/mIyqobu07L5tiZxr3IjxFh3a/Bj
	caubbOEb99CdlJ2RBkOXF3ye3jcxhEv7/RvaLLfepdXg16aMpxolL/Yc7vH45Qv2v9B1EsQ6uD406
	Yciff95s8JreF5z3f2WrgNkjQH5o3QBn+QW92BtmNtgXnPY5QoIzHXF2wTwyCjHubQw8J+Lbz2bwj
	3KoJuzrHBs9iwvrvVPChcfdg3afHVLpIDwC8NqYkfz7Rf7LE/jUeSeDXNl4LqI5BXiJ+UNYfHgkRw
	21ILXVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2ek-00000009k2x-2Q4l;
	Mon, 18 Nov 2024 14:23:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2dm-00000009jp5-0i4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 14:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731939727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ru1V+zcTEpVi8GqUTMSxkwoNUzXvSgnFn8uuwcsMGHc=;
	b=GDnI4UYUIapPDLQqn2ZiPEh694cr42/PwINuUw+M49rcaQbtg43hK4xGLleKRF7dZuSmUf
	lDPIxJ43FlRTYxl+iuhps/MQFiyzyPKTDy8hr7A9KlHlJ5w68x0Am+a3ek9HNgenvnTLs4
	93Bia6s7OKGO9k3lc9ynN+xthCmQnnY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-vuAfVu-KPVejwP1x3kkxbA-1; Mon,
 18 Nov 2024 09:22:06 -0500
X-MC-Unique: vuAfVu-KPVejwP1x3kkxbA-1
X-Mimecast-MFC-AGG-ID: vuAfVu-KPVejwP1x3kkxbA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 42C341954B03;
	Mon, 18 Nov 2024 14:22:05 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 58F7F300019E;
	Mon, 18 Nov 2024 14:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 10 of 69): Test report for for-kernelci
 (6.12.0, upstream-arm-next, 7b1d1d4c)
Date: Mon, 18 Nov 2024 14:22:04 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <51055.124111809220601001@us-mta-114.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3bRehUmwBkZKoISmsbaaCYnVucbANly5swLLX1Mqk_w_1731939725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_062210_272766_920BEFD7 
X-CRM114-Status: UNSURE (   6.63  )
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
    Commit message: Merge remote-tracking branch 'iommu/arm/smmu' into for-=
kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1548763257

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


