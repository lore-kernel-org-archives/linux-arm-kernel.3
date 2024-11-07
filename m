Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91492D5D695
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 23:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/VrgH+3Y6IK1L8c6CMhl/ycRNgDdmyk6d9jeDEDXzg=; b=i/5hzR5V5Tsq4BHXp9o+lEXMke
	eNcwF5toCPxdvzgc3hIoirf/+ZqExnkaoJSwCQLGfCZ6Doy8+53XCL7k41g7uHxHaKIxYfcpRpsTx
	CTgLFMw0EDf9XVWZs2mQb4QOtkj0KmHbB3GSFhuhLoSPQlMrxdY92VOJ4F9m6VKrLrdv8R6VSxsi6
	IVf0u2mGNAekYJEk+eXesKL7CHtcYXN8VtcaLGqg4KIBt/roZB0cCngV6b5Kg4VSlusf86lHNQ62L
	cxqGLymqF63lx9+FSWCi68tZrrey0lPGUOnJluNc133MjCcChYTTXQEVjPNBvJnf1fJ1O/kHBQH/n
	vfJyS1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9CNQ-00000008mt7-0Dz7;
	Thu, 07 Nov 2024 23:57:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9CIR-00000008m64-3Wet
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 23:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731023532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5/VrgH+3Y6IK1L8c6CMhl/ycRNgDdmyk6d9jeDEDXzg=;
	b=QuPyLX1ItBBM0RD87T7YMRqytglteXYZ/hdZypJE5YJPDK9ZWCH3qQ0jji9/Q4PEh34S3p
	AskeyChh6v2vavp/BmBYk5uAY1JaPoUQb77xMokcITVFz2KwfbS84UOjuVonkdXAOMWjfc
	ivoUdihB+YF+LEP6TCBCgGSlnebV3L8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-ptjNxeIyMbqcxEJQtdpc3w-1; Thu,
 07 Nov 2024 18:52:09 -0500
X-MC-Unique: ptjNxeIyMbqcxEJQtdpc3w-1
X-Mimecast-MFC-AGG-ID: ptjNxeIyMbqcxEJQtdpc3w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A25319560B4;
	Thu,  7 Nov 2024 23:52:07 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38BD1195E481;
	Thu,  7 Nov 2024 23:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 69): Test report for for-kernelci
 (6.12.0-rc6, upstream-arm-next, eb17c12d)
Date: Thu, 07 Nov 2024 23:52:06 -0000
To: bgoncalv@redhat.com, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <80939.124110718520900519@us-mta-231.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qdDzn2DW6Kzk3Q_zRpqEaEW2tlfpLbtdsskqR2259fE_1731023528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_155215_978938_6B002765 
X-CRM114-Status: UNSURE (   6.68  )
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
    Commit message: Merge remote-tracking branch 'tip/irq/core' into for-ke=
rnelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1532073402

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1532073402-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1532073402-aarch64-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check


Tests that were not ran because of internal issues:=20
    Storage - blktests - throtl [aarch64]


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


