Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0866ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/mBS3ZFnd3CIKydCfbiLI5a5x0LmowvcxUhalFbz4MU=; b=PPJI5FJ+tWCmlYWfVdmgyC/md7
	t+s64JwDgX3k/rkMYpKFOjUeHZAeAuv7UkYoKM6tW1fU37odqeD/jXsb/VKmsKgmTv+wkB75loJ0E
	lXHqnTTPSD4ysMoHYGfJ5OfZ2+M/zupdbFKrTNpXIuBmVYjMyaOuThUXu0KRjiwEbpg+ZrQWgXevv
	F8m0601g8cq22MzZJcKolhSm0qjUk3yc/439teXUGLn16griilhP61dDXuIcLd3uTCv50l3K1y8JE
	C6ae3oMIhp4pKfx3yXrdPZjCikDtMJ+ZMGRMzt1jsQs3rBSsQ9gjnlJtm/aaDWNHm1GexuvLL/MvL
	zwmte9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQyC-00000002hyO-0dbt;
	Tue, 19 May 2026 20:23:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQy8-00000002hxn-3ifa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779222190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/mBS3ZFnd3CIKydCfbiLI5a5x0LmowvcxUhalFbz4MU=;
	b=LlKcbc42EAtMswpYbs/inetgEpVPxDVegAQdjgq/VKyYji4txLTFAw2KYWImFaFQVyR0Tp
	v6//1aD14A9Fp82l2snewpWHXxtW76P6tyo4n0r/xdIFNShMUTdelTJKEBlaS7C/TNF9zX
	8z2P1T7gDviXuvXa3XjJrI/Pe6I+LrU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-II-zDieZOqGh35_uUwe_6g-1; Tue,
 19 May 2026 16:23:06 -0400
X-MC-Unique: II-zDieZOqGh35_uUwe_6g-1
X-Mimecast-MFC-AGG-ID: II-zDieZOqGh35_uUwe_6g_1779222184
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 068CC1800367;
	Tue, 19 May 2026 20:23:04 +0000 (UTC)
Received: from [172.20.155.151] (unknown [10.30.44.186])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D730230002DD;
	Tue, 19 May 2026 20:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.1.0-rc4,
 upstream-arm-next, 4b436297)
Date: Tue, 19 May 2026 20:23:02 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 yoyang@redhat.com, will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <55502.126051916230600267@us-mta-352.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3zQ7GXGBVC2J5pcYTtEHu3IGpwFxjXlP3oTs3PoajwM_1779222184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_132312_999421_46C3F56C 
X-CRM114-Status: UNSURE (   7.18  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2537988036

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2537988036_aarch64_kernel_kcidb_tool_21313904_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2537988036_aarch64_kernel_kcidb_tool_21313905_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

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


