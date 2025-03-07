Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01551C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WgeaBNIFtxakkyQFJqROax8VL+tYZf3yM6KtyuMVs0Q=; b=nFmDBcp9pugC/iG9eFKokzHrm1
	1tSAYQ7ekdwBD6+jTberOT6DryDHsWcLIuKycejuav0J/nFZdq3XGWIEg015G5ImGKGReYn+Wbajm
	zakPnTRJ7EbmLqyL3udwnjn/zvYc+AhF4DLYJCXaJyUHwBNKtaAiNoIBbJMRn0GhUMAWJ+cCFLnze
	o6NeLvNI1PPQDCxz3SJfxZHKig27ria2eM/rsrGE3IKiChGOIl8oZbw50VAf9mi46YYFx7YOdk/Pr
	lC7dWIHVLTJ2IKZfNq3RgUh6FkAUC4k/VqYJ3Wm5SYcDXDSmN3d9ZqFaMW3UokBg5qg8YIdt+qExL
	UXfH21gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWlL-0000000EB05-1wpT;
	Fri, 07 Mar 2025 12:25:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWiY-0000000EAjX-3xY6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 12:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741350137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WgeaBNIFtxakkyQFJqROax8VL+tYZf3yM6KtyuMVs0Q=;
	b=b8GWF7ucQ0LH819YY5lSX9YVQpv/3yaOdM1SaeeK8Ystp0bgTaF/jKu9TbkzQ7mFuUPa6N
	MAYhrqNDInYvI3VCNvVG7gDUcUA6FBFeGP1yDmKdachEOgv9UdYraixlP6LQMYbrnFQKyR
	SGwHz0Mm/2JiLX/sIWk0NHXV7yrklSM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-VMn1_8XCMnylYMD_wCvc8A-1; Fri,
 07 Mar 2025 07:22:14 -0500
X-MC-Unique: VMn1_8XCMnylYMD_wCvc8A-1
X-Mimecast-MFC-AGG-ID: VMn1_8XCMnylYMD_wCvc8A_1741350133
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE57D1828AAE;
	Fri,  7 Mar 2025 12:22:08 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A2A021956095;
	Fri,  7 Mar 2025 12:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc5,
 upstream-arm-next, 14d05f12)
Date: Fri, 07 Mar 2025 12:22:07 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <08392.125030707221400751@us-mta-412.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yh0sL6u7wzfa26-mzH_JYWAUtIofTSuRoPsHC1RqoBE_1741350133
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_042219_058476_6A94B076 
X-CRM114-Status: UNSURE (   6.59  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1704775335

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704775335-aarch64-kernel
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


