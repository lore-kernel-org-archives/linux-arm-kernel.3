Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1C7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mke0ullPx5kZtf85ENB8LmfusR1cvO37Km9W3R1CgUY=; b=ejbBDleMlkvVz5kJ7QksrDb4Gg
	hpanU4qX9EkWK7jD5JxjTw8N0eWg4Dhx6X14nVlw8RyZCouS4viPbeY7m8ShSzp2GqYwE4lYA0YOg
	UZ6bPjaULSjv9ZJE/UCd2ZP5Xc10aLwe4QjH6afd3h1gy7isG0oQYB5JwyQOghH6y9GGCH/RLhCvo
	cxp0QtRt17jjXk9nMgwfAQMetxqjNNKouGA3V/4ZsVw9mtsL0s7SmlaH70XuNQNCe4osNXraCX+vs
	FyqM1dmmv49+Dea9AFVQkFd5hZIoXk33udLyqNMGm2aTB4rmO1NfmXKDg8KEGwA+a0AWL3PvtzV+o
	HFgg7fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL97B-0000000D42e-3lMN;
	Tue, 10 Dec 2024 22:54:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL95Q-0000000D3Rx-1zpg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 22:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733871129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mke0ullPx5kZtf85ENB8LmfusR1cvO37Km9W3R1CgUY=;
	b=Yn8q79AoYY9nG7LEU7ElHilOTlYUkUjv8zxUsh/BOTb/oPM5WOH95hBDn9aHJfeulqelUt
	FAX/YdUgfmpoboalW8ZSCuyxYKvNyKtbfqVQiLuu39yhppFontaXu/6WwjGa0TIkT9cEkM
	jRGpRG5uKPX2IeFk7UVe21Vlk1tosyg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-hG4itbqSPi-St2YQ_aPlZg-1; Tue,
 10 Dec 2024 17:52:06 -0500
X-MC-Unique: hG4itbqSPi-St2YQ_aPlZg-1
X-Mimecast-MFC-AGG-ID: hG4itbqSPi-St2YQ_aPlZg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B08DF1955F3F;
	Tue, 10 Dec 2024 22:52:05 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C54E3300018D;
	Tue, 10 Dec 2024 22:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 69): Test report for for-kernelci
 (6.13.0-rc2, upstream-arm-next, 146ff2c2)
Date: Tue, 10 Dec 2024 22:52:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, bgoncalv@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <09245.124121017520601116@us-mta-625.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bK_V3uAok0FbPp4BRFMM58Y7qPSQuN6_-D5mxuWpobI_1733871126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_145212_586495_77868EFD 
X-CRM114-Status: UNSURE (   6.00  )
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
    Commit message: Merge branches 'for-next/cpufeature' and 'for-next/misc=
' into for-next/core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1582704765

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1582704765-aarch64-kernel_upt_53
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check


Tests that were not ran because of internal issues:=20
    Boot test [aarch64]
    CKI/restraint [aarch64]
    machineinfo [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    Storage - swraid scsi_raid [aarch64]
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


