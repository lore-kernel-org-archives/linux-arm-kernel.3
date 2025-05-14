Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D67C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G9WYGzM+OuT/ZdnIEFUfOMYuPwPRyPHxTO4BjcIjIow=; b=Z/91vflGP4RPDDn6vDKP3OvBLs
	FOgrlxRJZg4T2sIHqf/HFwrO8/WGIqwbSF8MoAKvwGIAhohrLGKGvZKmfzueeVf5vcKWiuzoHuHJO
	QPhE5esdsCcrNahq3Rci/VIyqJTV07Wqs2JxBUdZRuZnSJM/hhdSLlsDEW8GEExun8ZKMt0Xjvozj
	1rye3+fo/lF7TCsNWcuHVymFMhKOAww9pgSuFet0i7iiYziV+DkRiGRBgTCS7nlLHaDWBOiN7v63f
	d5Bl1GdxtNTGjEygiXcGKNy5y3HwfbIiWThW5tg//jU5KKQB9d50vMfE1e3+xL2AD1uyCt/q41OZG
	0UuReWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJtp-0000000GQ8P-3lxz;
	Wed, 14 May 2025 21:44:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJrn-0000000GQ3F-0FCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747258935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G9WYGzM+OuT/ZdnIEFUfOMYuPwPRyPHxTO4BjcIjIow=;
	b=ZrdpNh7UzoZ+UWaocn3ztBAjdQCQlhlyJia48WMXmehBqeV6afo5VggYVUK6QtfbKFF5p5
	NbD6sIklogAXCi4l8cqeSwyewmKrOdWNoWyk6ycv5EsXL7S8NX4nLy+OecFqulvqD/zZSC
	yPoVjegiIZgw/R4htox+QWV+Ml5a90g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-gML9DushPke6F9QXZj3U6w-1; Wed,
 14 May 2025 17:42:12 -0400
X-MC-Unique: gML9DushPke6F9QXZj3U6w-1
X-Mimecast-MFC-AGG-ID: gML9DushPke6F9QXZj3U6w_1747258927
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29FA2180036F;
	Wed, 14 May 2025 21:42:07 +0000 (UTC)
Received: from [172.20.90.206] (unknown [10.30.45.71])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AE4E1955F24;
	Wed, 14 May 2025 21:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.15.0-rc6,
 upstream-arm-next, c919f087)
Date: Wed, 14 May 2025 21:42:05 -0000
To: ftjahjad@redhat.com, will@kernel.org, catalin.marinas@arm.com,
 bgoncalv@redhat.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <92816.125051417421200539@us-mta-256.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dtndknIPDx4s4IMFzuoKS5SgSqYgjBhGULORbIZb8Uc_1747258927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_144219_188501_84B58588 
X-CRM114-Status: UNSURE (   6.82  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1817830955

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1817830955-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1817830955-aarch64-kernel_upt_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check



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


