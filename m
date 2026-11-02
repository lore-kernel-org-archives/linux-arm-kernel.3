Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ckSU+dh+;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gMNlcfdI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pspFCwZK0uUittOLVFwBxDEYM+Bon0qCG8snuHiLGJg=; b=ckSU+dh+Cbcu7tpo+aJKVkY4X/
	Y3rPue45k+7RWo7lqTU4lQIVuKepLAU7MDMD/wCdYJIrer/q+Mq1DiqGbWinPc8JG2HPbfUYpjVS8
	rfW4a8If628P+9Jz0fHq8TNbi1NDZAVU1hteEW7cxwh1XTAmmCV5Ohei0K2CE3GnUgddfnKEBASNy
	gIAVexJbYUsEoswROKd3jMOd7OJHSDfsdODvfy/SJuGx+/4dHRWcB7mWEl8cffM/lC83J9stIVsQv
	WcdMPyZXGDjTUqDFoVNlTHzseMIaRco1wGUYhuCs3k79zTy+JVE6u8hQwZo43R8rRzbZSBtENrmWC
	VRCBW6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsTM-0000000GgR9-0L9K;
	Mon, 02 Nov 2026 13:53:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsTI-0000000GgQV-2At6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793627590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pspFCwZK0uUittOLVFwBxDEYM+Bon0qCG8snuHiLGJg=;
	b=gMNlcfdIepnZo7X4ZSPy6RWOIZyYnooyGfWpAKqQ7tBhLG60d4dQVu9SJadHyjueENh6sx
	Qtbe/+vj12yn/MECrw5t7RRjkUYbqVhjL9ZLPvuJ2/UBCG+zoUqnn/uXaTp6BrcPU+1LqC
	re7C26zrwWpPgEm1TMgryuwNYuXyvok=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-nRjytpMmMyuCzqlzW4aDbQ-1; Mon,
 02 Nov 2026 08:53:07 -0500
X-MC-Unique: nRjytpMmMyuCzqlzW4aDbQ-1
X-Mimecast-MFC-AGG-ID: nRjytpMmMyuCzqlzW4aDbQ_1793627586
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37E621955F28;
	Mon,  2 Nov 2026 13:53:06 +0000 (UTC)
Received: from [172.20.94.172] (unknown [10.30.45.107])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E77DA1956087;
	Mon,  2 Nov 2026 13:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 54): Test report for for-kernelci
 (7.4.0-rc1, upstream-arm-next, 6628e7d4)
Date: Mon, 02 Nov 2026 13:53:04 -0000
To: mpatalan@redhat.com, ftjahjad@redhat.com, fsuba@redhat.com,
 linux-arm-kernel@lists.infradead.org, jmoyer@redhat.com,
 catalin.marinas@arm.com, will@kernel.org, bgoncalv@redhat.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <13572.126110208530702698@us-mta-627.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QFUXJArMP5Yrf7NzgGOyzaABv_cv1QUrqNAZ4pfWug0_1793627586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_055312_624954_97913452 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.5 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Linux 7.4-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:3017229113

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3017229113_aarch64_kernel_kcidb_tool_1200606255_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic: Oops:
                       =E2=9A=A1 ERROR Warn: External Watchdog Expired
        Storage - blktests - throtl
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:3017229113_aarch64_kernel_kcidb_tool_1200606256_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic: Oops:
                       =E2=9A=A1 ERROR Warn: External Watchdog Expired

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]
        Issue: selinux-policy: serge-testsuite: Client ioctl BINDER_WRITE_R=
EAD error: Invalid argument
            URL: https://lore.kernel.org/selinux/CAAUqJDt1pXQ2KVBvMoMiDrzz8=
ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com/T/
            Affected tests:
                selinux-policy: serge-testsuite [aarch64]


Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
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


