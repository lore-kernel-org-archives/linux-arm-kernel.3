Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FBCAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dNuwv3LOpG/SIYNGwHlD6XZhvGKrxUZbnFnRTpkA5Q=; b=WxTpprCKJe1Q35UovBy/zpkWXk
	feuJFXP5Mkp/AmCIlTXHe75e/IQSBtk02xoWus3d1jpELBzmuIAQoVRjoG825F4unSyFr1O2V1mzr
	D5x3/sHo1JMyXycKGLFpy5jlto0gaQPfkPAtzO+0BfWlmkVFwA5AQTT2bEm4OjhG51jcrxpogOpzM
	QgSqqho9L2/5tRC7d69f6lM67Wei4/aocRIPOD21+XQy2I1e2TaVjcPQh61TruCD6gcDNInwjcyF0
	6fm6rvt7dT2a5Ehyf/ySfPHwD0Clt0eLJ+ks5AhWbPChnQyIheSsQA8ZInZVBSo2t9wIdVbKInPEm
	lRyKAr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFA-00000004td4-3MA2;
	Tue, 09 Sep 2025 06:54:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmR2-00000003HcX-2tRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 00:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757378530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1dNuwv3LOpG/SIYNGwHlD6XZhvGKrxUZbnFnRTpkA5Q=;
	b=K4u/yST+YmU3/VYqvafNAbIiGS8aMlDI0r0DXe9nQJUMsIkR9dWfmQSWukIxVPrZLjX5EK
	ZYIHEIpcb9amVA9VadWakzjBOWC40zC/xvoOUUqMIzu6MbgnLLmklA9+yZegNj0oZR1UjM
	2RncP3P53ttZKBcn6Ry8vlMZrnaLWPs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-189-JKQt9VG_PmiyBR262yObsQ-1; Mon,
 08 Sep 2025 20:42:06 -0400
X-MC-Unique: JKQt9VG_PmiyBR262yObsQ-1
X-Mimecast-MFC-AGG-ID: JKQt9VG_PmiyBR262yObsQ_1757378525
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53857195609E;
	Tue,  9 Sep 2025 00:42:05 +0000 (UTC)
Received: from [172.20.60.197] (unknown [10.30.45.107])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DFE2180035E;
	Tue,  9 Sep 2025 00:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.17.0-rc5,
 upstream-arm-next, c199ef1f)
Date: Tue, 09 Sep 2025 00:42:04 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <21040.125090820420600521@us-mta-189.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y0rJREE0w9qINRVHKtzDDRae4ZyBIhT6PHCWSJra5ts_1757378525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174212_799320_E965008F 
X-CRM114-Status: UNSURE (   7.28  )
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

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2028637624

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2028637624_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897


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


