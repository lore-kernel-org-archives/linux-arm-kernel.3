Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dLv0GXC+slve9E841IRK/PUU7FIq86y2vNT/3OoJ8is=; b=FjPVwV6G+a35z/Hx+4krQ3VwPU
	IV730tSTfMyEazUvYYgzyyy4UHx4IEORF3CouWXPG1KTErY48lFUlhpaWFwrxvbH5BxihZ+60X+bX
	MmhX/Iqq77N1kXtvrg7KPNs33geCDMjyeskh2BliOplu5jtzilVMa0EfHrx8NGYT/2iLhGh/yX7HM
	FKFW/utKu5SEmkpWPICi3Ov0Ajx1yQhx9bG9eP5FX+zWj//XxWs6Q4fqzaTTNLM1w48+XJL4woaaZ
	iSbPwBOd6JwIFgOTaljr0tON7dxFgUrzq9lZKMo9HIVaXY9c4sSTcDP1qveAJxwhoYMm/XWpm8Z/z
	F0gZPB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajK-0000000HKQh-2VU7;
	Mon, 24 Aug 2026 19:53:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajH-0000000HKNf-2pUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787601189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dLv0GXC+slve9E841IRK/PUU7FIq86y2vNT/3OoJ8is=;
	b=ErD+FXZ6aaH1HEqeeiMFHsxd87fwWzPY485bv0ToKnw+RgrnmIVfuJJRDqgkWLtF41zu5q
	t9PDOTW00deQHiJpA6hEGOGnDno3HGEyUv+MPUHOBly2HZHfaw9EJsiEwjRIX2+GwLWlxu
	kMmJj1eny8ydW0ZaFWYJeOCyrO8N4YI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-SdIY2yGjM7aATiUx-vs4-g-1; Mon,
 24 Aug 2026 15:53:07 -0400
X-MC-Unique: SdIY2yGjM7aATiUx-vs4-g-1
X-Mimecast-MFC-AGG-ID: SdIY2yGjM7aATiUx-vs4-g_1787601186
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B308419344AD;
	Mon, 24 Aug 2026 19:53:05 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B723D1944DCD;
	Mon, 24 Aug 2026 19:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.2.0-0,
 upstream-arm-next, 68f892e9)
Date: Mon, 24 Aug 2026 19:53:04 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org, fs-test@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <48084.126082415530700603@us-mta-193.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MaDd7ZAPWm1otlPffeBomKr3VP6GbEAehkzzXjXmMjc_1787601186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125311_839928_95EAC60D 
X-CRM114-Status: UNSURE (   6.80  )
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

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2786230383

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2786230383_aarch64_kernel_kcidb_tool_1200070648_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/363
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2786230383_aarch64_kernel_kcidb_tool_1200071179_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/363

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



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


