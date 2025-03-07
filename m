Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3596EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5nvb3Lmc3aVEx9Mn1Evebe1b7cZvanQFlx7FY2FCxFs=; b=lQ5Qshgwu7B+Nm1YMMwi8ReHPQ
	rnACOcvsG3x1PbPdEvGlgFULzZg2X7zNp/F5/gduBdGQfwVAUNSureTKuwz0kjLixdHDAoXlYnJSR
	BlWHt4DN1WBVPhFQ1jkbIEdW7bw4mGbTnQgTwJcYHtJ/IfqjXBQKl9M83mS/YRObqGo0fF70NCbFX
	mw925p4z86egFHfquxEqi9sAl3zPtIuOeSfhnMbrBSRhTcF9AmPkO3qToCXW7gLlE/e/1IX8fLoOj
	pJOSgkjTTi8c3qEfcwEqGompateMje5f+kdcanS3txwGLHcVgsEZe8iB78gW1zjI8OchyxUqV/D0N
	aIOMENuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPYV-0000000D98e-0Etp;
	Fri, 07 Mar 2025 04:43:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqP5F-0000000D5m8-1xW2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 04:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741320791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5nvb3Lmc3aVEx9Mn1Evebe1b7cZvanQFlx7FY2FCxFs=;
	b=Z7Lrmgb/GsaTjnM3jvSvrBsFlgXnG+4Txe8BAN1scVPKzx84ArYMH5hZ9tNApNuWege2Kr
	DEVZTVNMWLgH9eYgAh625bl2cfqzyYeu34EXom+kXGo5Ro9h3HK53r/1ULzypTuJpjznxl
	MHm48YVDaQoALqTXHb8ijw6qyp+z+6o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-uZ-rx1TnMLGnHqgHBdufQQ-1; Thu,
 06 Mar 2025 23:13:09 -0500
X-MC-Unique: uZ-rx1TnMLGnHqgHBdufQQ-1
X-Mimecast-MFC-AGG-ID: uZ-rx1TnMLGnHqgHBdufQQ_1741320788
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A62419560B3;
	Fri,  7 Mar 2025 04:13:08 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 732D71801748;
	Fri,  7 Mar 2025 04:13:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc5,
 upstream-arm-next, 14d05f12)
Date: Fri, 07 Mar 2025 04:13:07 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <04467.125030623130900365@us-mta-590.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dcQwFuoiW6eGoAtFpJ1qP5ORYhfIv4Ui3YSojwkKyCw_1741320788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_201313_599993_764DF291 
X-CRM114-Status: UNSURE (   6.46  )
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
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1704151736

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704151736-aarch64-kernel
                   Issue: [upstream] error: initializer-string for array of=
 'char' is too long [-Werror=3Dunterminated-string-initialization]
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/473


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


