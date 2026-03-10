Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247C7FD88CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 22:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NnGO8VbNiuScXTtylYgT+sWl1YPMkgIEnvTu3v5oaVc=; b=anoydpvt9UAdBSL4flx3OYZOQx
	pIfVIU9MlYwP9UxcwcudpUtGAMjQuOA3YhpNN/pkUC33KDI+5fo7Rc0EZZUOsmy7vYE5NaqTm0r83
	vA0RUibWbLxAgXbNhqc4THX9vVCEq/D+t4fWWVcfjftek0RfGnjN30pzIc3c5KivkUYzErL8C4EjZ
	RffgfQ58smaUsc3+TQIpDRjBOCdi+4ejhulLhOsr7eOvoxtiN/Dxnbtg+HDeynQAmd5MsJRqMOovf
	bqI9e+JlXUw95UVDiURYuGTveC4wUM6cFxB+8GTb6RdFXtu7cY9bLDH/2Q5MYRmd19MhdKkfJ9Ayu
	HxGfsO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05w1-0000000AMNU-3Wet;
	Tue, 10 Mar 2026 22:52:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05vx-0000000AMN8-3W2Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 22:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773183130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NnGO8VbNiuScXTtylYgT+sWl1YPMkgIEnvTu3v5oaVc=;
	b=RMQ9Tazxx5hHwdQf2rb7L9FcmbVnw0qdMuvngsilwEfGNuMEJVlITJ7zuO5KSyH4A6+c2w
	/PXcEBB5G28eJNtsA6WKGC+Uypm3KFjMrh7hpWB795fBja4lat+gguh6Wz5guK7AXOX1e8
	yp3mtw2jCOdV7et92qXTHQnmS72l0l0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-AURWXGJZN_af3Da9YQ24FA-1; Tue,
 10 Mar 2026 18:52:08 -0400
X-MC-Unique: AURWXGJZN_af3Da9YQ24FA-1
X-Mimecast-MFC-AGG-ID: AURWXGJZN_af3Da9YQ24FA_1773183127
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 723F419560AD;
	Tue, 10 Mar 2026 22:52:06 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01A991956095;
	Tue, 10 Mar 2026 22:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 11 of 56): Test report for for-kernelci
 (7.0.0-rc3, upstream-arm-next, 6712fcde)
Date: Tue, 10 Mar 2026 22:52:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <59886.126031018520800219@us-mta-61.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SFK6qPgk4bk2Nf4pInf_wtroT21RerfDD_ItCNWZcz0_1773183127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_155214_289057_21402529 
X-CRM114-Status: UNSURE (   6.67  )
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
    Commit message: arm64: remove ARCH_INLINE_*

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2376435189

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora: avc:  denied  { create } for  pid=3D1 comm=3D"system=
d" name=3D"io.systemd.Hostname" scontext=3Dsystem_u:system_r:init_t:s0 tcon=
text=3Dsystem_u:object_r:var_run_t:s0 tclass=3Dlnk_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2443788
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
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


