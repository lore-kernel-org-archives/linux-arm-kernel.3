Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B5ACD0431
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 03:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9UiSdJQkCE8dCSmYDys14tGXl3J4AScrmuTYbr+amg=; b=k67J0CPuZK7HM1QHaIMBR/z9Cu
	Z6/8u14Ov+WGgN1Zmd681X11zVNh44EaZtMZ2UbKFil+pDopaOWBCBCaVPZRYbo7L5yoUnU/ovmiO
	WDolUMzQKN8HHtZVSoshNS5laK++SNrZDo4CSYQgI/hEoHW/CbHA05srxglTFeb1Dgp62Mkf9YgrV
	3aImr1t2zERZw0RTACP/cIdagWcxfEIkSXYIw/BA0+3LEGhwkmdacWYG7xQE4nqI6lM+1xcEyODKE
	EdXHXTzQkuLj98GI4Dx7lkx6j5xO0cD0Ch1uBQCjI4nCYWYeOxYwC/5icHuSCluWLRat9JpN+UWxq
	Tb/uGCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxxi-0000000CNsv-3PID;
	Tue, 06 Jan 2026 03:42:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxxf-0000000CNsT-0910
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 03:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767670938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t9UiSdJQkCE8dCSmYDys14tGXl3J4AScrmuTYbr+amg=;
	b=WbdqAlmwGt9ALdomqKrJg8/PxdQgDLnpONTM8S5Ud52vNjQMmXi9vmSa0Rs/fAFeez+M/R
	rfOgPRHcjcq/BSYovRjOyRv6NiS4J3HcEBVrjj9v+j0v7b7m4ezcC7P+nT6iDoKXLH9Vrw
	HHWHgXJtGkWyAmeJjwQMvaRPGf6IZcc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138-nl7b71W0MJaKZXoxZ-DdFw-1; Mon,
 05 Jan 2026 22:42:14 -0500
X-MC-Unique: nl7b71W0MJaKZXoxZ-DdFw-1
X-Mimecast-MFC-AGG-ID: nl7b71W0MJaKZXoxZ-DdFw_1767670929
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CA3D18011DF;
	Tue,  6 Jan 2026 03:42:09 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B78EE180045B;
	Tue,  6 Jan 2026 03:42:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.19.0-rc4,
 upstream-arm-next, 736d7721)
Date: Tue, 06 Jan 2026 03:42:08 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org, yoyang@redhat.com,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <91767.126010522421400283@us-mta-138.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IK-PusujZH9MCetC7Qg5wyWHVeW_PZ1jZDSC7r4AZ00_1767670929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_194223_148300_1D940E11 
X-CRM114-Status: UNSURE (   7.84  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2246216365

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2246216365_aarch64_kernel_kcidb_tool_20355208_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [cki] [tests] unblocking setup-task failures (SELinux Custom=
 Module Setup|CKI/restraint|machineinfo|setup-nfsdump)
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/777
            Affected tests:
                /test/misc/machineinfo [aarch64]
        Issue: [rawhide] [aarch64] avc:  denied  { open } for  pid=3D14791 =
comm=3D"systemd-user-ru" path=3D"/sys/kernel/mm/transparent_hugepage/enable=
d" dev=3D"sysfs" ino=3D1784 scontext=3Dsystem_u:system_r:systemd_user_runti=
medir_t:s0 tcontext=3Dsystem_u:object_r:sysfs_t:s0 tclass=3Dfile permissive=
=3D1
            URL: https://redhat-internal.slack.com/archives/C04EX425HP1/p17=
65900650445969
            Affected tests:
                /test/misc/machineinfo [aarch64]
                Boot test [aarch64]
                Hardware - Firmware test suite [aarch64]
                Reboot test [aarch64]
                Storage - blktests - ublk [aarch64]
                stress: stress-ng - cpu-cache [aarch64]
                xfstests - btrfs [aarch64]
                xfstests - ext4 [aarch64]
                xfstests - xfs [aarch64]
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


