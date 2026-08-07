Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DA6C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 19:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWUQhfWN2AxKv1T6fLVv0tpgkaw4ky6B2xJknNGIdKM=; b=P25Nuk66SFEMRiuvfv24ju+5bH
	WmtYpnwEVdQhPJkovv9IZmSuPtuFFzDC6afiMTDLOQGDFE9JLMOOaLJL30OhwQoLxEs5Mut9qLP4m
	wNO2/oDHGKtRmWe5aMFisDQFLobYdJg9BcPNxE1wO6tnGVAkdas3eysYdyHgFDCw4jeOqwywBOeaH
	ybt//3vTK4au0vRRkxj84v2flr/5DUHtG1MIZSLNsfpJNsIOS7+7qIngovTKti1F9HSBE5JU6APNx
	axnY09+DE57pdoKmPyX6SBEGxKEccJUj+0JAliFib1sbBif29fmK4BpaXTYGhIH/ybixhgRlVNd8W
	u6LIDG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPpq-00000008dxj-326L;
	Fri, 07 Aug 2026 19:02:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPpo-00000008dwp-0fWS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 19:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786129342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hWUQhfWN2AxKv1T6fLVv0tpgkaw4ky6B2xJknNGIdKM=;
	b=aOLssnplqLXdqzoCWKwQZpoC1SKY6OxFnjVEXKCn80rDah7+NZroCFkARjtAvOqZQs9LED
	0oWe2IUUHUUtHaFACCrSknRtD72xr2+qEz59GozhlEsHcWzcPV9xxSKBBmu8hO/Ob+zj1h
	BpRh9Bwj+VosIueb5nA6n0/FvDqeYug=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-HTO_olXrPkexS8gdYu3NWw-1; Fri,
 07 Aug 2026 15:02:09 -0400
X-MC-Unique: HTO_olXrPkexS8gdYu3NWw-1
X-Mimecast-MFC-AGG-ID: HTO_olXrPkexS8gdYu3NWw_1786129328
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3B5A19560AE;
	Fri,  7 Aug 2026 19:02:07 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B07A426;
	Fri,  7 Aug 2026 19:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 51 of 56): Test report for for-kernelci
 (7.2.0-rc6, upstream-arm-next, ba5cc80f)
Date: Fri, 07 Aug 2026 19:02:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <62722.126080715020900620@us-mta-425.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mXELCkx7PASMWGGuSjBJGwKyIB57Nn9k1IB2VWure-c_1786129328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_120224_268155_76B968F2 
X-CRM114-Status: UNSURE (   6.36  )
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2741333507

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Hardware - Firmware test suite [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    selinux-policy: serge-testsuite [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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


