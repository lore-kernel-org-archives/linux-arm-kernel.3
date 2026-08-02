Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00181C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJB14jEiokwyrjNSBVf3mN1an/zxGAUApRXoTaMn9VQ=; b=TIUI5LV97PjtOk7hriICLavHDp
	YITFbFQl0i8+I47bKHyIQ7VikJ72C9dFZuxa+1495p5HSmczYEVdF7xVoQLUBgJ82i5GbJxiaTrTv
	0zBy4u1rzFHYRosrenhkwMfwBRJ1oVPdcZKOoT6PpYRuFEjeOZgRfpqR/sC1SOjKtzsl1h/D/2m6o
	vEPzO+DdWQGPtRpT640LSRMBDgrQR+nYiOvNR++XjRlsxCHRp/PNhNLsknEnyUluoqfJy5m5AyJQ0
	O8ybYJvk1YlSj9hHOG77GUoXXDTsHXuZLvtPM9bt5hYdehMHCBM24v4oKpQDkjsC4H+b69qx4ZSk/
	v8t+oPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXhg-0000000Flrq-2457;
	Sun, 02 Aug 2026 15:02:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXhc-0000000Flr6-2kZ2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785682929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EJB14jEiokwyrjNSBVf3mN1an/zxGAUApRXoTaMn9VQ=;
	b=RqDeJV+MIkHmYuAONWNlQclyAdceAJvml9iKfRW+98bQdAyrnXeT6bQW80B/WAPZXkuumm
	rpIzt+oiXLm0QF1+GHmgqpdRPGAbVstcpfImRPp9tJ1yRBE9rgzgejPCwn2Ol6ftKCFxp8
	thKNFiGcuddo6OwStZuPPzDczQYVc1o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-wPdM32HPMQWZW3FCT8yFCA-1; Sun,
 02 Aug 2026 11:02:08 -0400
X-MC-Unique: wPdM32HPMQWZW3FCT8yFCA-1
X-Mimecast-MFC-AGG-ID: wPdM32HPMQWZW3FCT8yFCA_1785682927
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FC4C1956096;
	Sun,  2 Aug 2026 15:02:07 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 508D9423;
	Sun,  2 Aug 2026 15:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.2.0-rc5,
 upstream-arm-next, 7235a3e7)
Date: Sun, 02 Aug 2026 15:02:05 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 fs-test@redhat.com, will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <55233.126080211020800743@us-mta-145.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: soYR_h3fdHKRqx83U9oBYc5YTvG2wxAtJKiAlSgpvYo_1785682927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_080212_767513_DFDD55CA 
X-CRM114-Status: UNSURE (   6.50  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2725132975

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2725132975_aarch64_kernel_kcidb_tool_21782258_9
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


