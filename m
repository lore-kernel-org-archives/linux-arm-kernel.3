Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C90CF648C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 23:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fIlagoHlw8yrHqMv/O7Li/dX9UOEt3q7H5J0UIbTvqw=; b=vZ8KoAgQPMH22kyABXNDUKL9iD
	G+gq7tCC19S3OLCYun0iD5oQ6Jlbk9VPIrqkKCxESMaVYVq+GEjcdmCAmlUaVxoNB0S7lB7ePIXFh
	f+DVft2VpI/CM2YPYiaZ4iMCHRjNyt/MuhfA8xiFi+N9Boy9rXmDmM2rQvdeKtjuB1XCsVw6BoonZ
	BpPkYziVrT8dfsY27auQoLn3KLBkAMTM9tYjWGKl1xwBaDX4V2WHSIoyelSZ4oK8Z1vRzVmj9YKXc
	CD68lFh+V9trpGil67tqnJNiyoP8wHPqsfSGHg4rgVcsGxiqXjhc3bJZYx7kjpmckOw9GsjGdusVT
	GCWs+6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLrMR-00000005pcQ-0aOc;
	Wed, 19 Nov 2025 23:13:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLrMN-00000005pby-0ZFE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 23:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763593987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fIlagoHlw8yrHqMv/O7Li/dX9UOEt3q7H5J0UIbTvqw=;
	b=CtoVgY/iSRm0nXAN7003coS6cRLiHalpysGak9Cfw7vReICT72g336jFYh2ZKLGKyyHiB6
	pxxlTppzRnvRSExEtyLQqm4ruuTlhPU7Gs5g8NsoKjeSwFbdCDS/QdzhiXtrKlFL+h8vI3
	4XWehhC4dfodjfRnqqFiKGgjep9KCQo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-cf14ceJBO_2qXyhDxx-hDg-1; Wed,
 19 Nov 2025 18:13:05 -0500
X-MC-Unique: cf14ceJBO_2qXyhDxx-hDg-1
X-Mimecast-MFC-AGG-ID: cf14ceJBO_2qXyhDxx-hDg_1763593984
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F44518001FE;
	Wed, 19 Nov 2025 23:13:04 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79B9430001B9;
	Wed, 19 Nov 2025 23:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.18.0-rc6,
 upstream-arm-next, ef10811e)
Date: Wed, 19 Nov 2025 23:13:02 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <57499.125111918130501155@us-mta-632.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EiFumgupHprQizAVaycU_ni598HkAilur5hICOsaKoM_1763593984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_151311_322055_7E34B1DF 
X-CRM114-Status: UNSURE (   7.04  )
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
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2168365708


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


