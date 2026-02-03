Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6643AE83050
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6mX6FbYbzZTtB0JD5VqQ4iWuqV6UN06FrHcdgjzsyLE=; b=GuebR1fqP/7FtsOlyHrk7V6fga
	jF4lHL3SNVlPhTFjYV4AMBIHjr64y2J2w4eclpDJMK+f/yBVJYVA/+GAtp6FI9YSNgg33wv3X7a2S
	fbrQi3tN0lhMSuVXOb3Ed+EeMjVkL4HB7MWi26/GKSNG8j4MO1KeIb3HT4oGewGQ3pI0RHU/15hSG
	FlVrkbhlD65wdEhSU+7kjCGf1JtQ+dHkyPXqVyva/z/e88g8xFiN1cZTgqluaXsfL0lPA8EGoA8d4
	wpfUQiv5AIOYNiLN9GUwF+9c0GZVP8YO+3HCr3EtiS8u3fLAO2JBbA4hpJWYU0yNued3/h5qLjgh0
	KuwSurkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8YM-000000064R7-05R2;
	Tue, 03 Feb 2026 05:02:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8YI-000000064Q7-2wTK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770094932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6mX6FbYbzZTtB0JD5VqQ4iWuqV6UN06FrHcdgjzsyLE=;
	b=bQaq2+kpv7MtKFxGwqiO2GZBfuYkTC1KiwwESyLpmrsvAiZb6QU6+/T1vfqtzm6p5oPtQc
	pO1Mv9zXz/0vBWFg4RA9d3KdB3X1fUPqpfeQ/i5J058gED3aTVF/RrZtz5TwAcEX/cgq0t
	b1F7C+s/OGacOCabT/dARwb+mn/C3jQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-WIGpg1WsO6OtslFAZO8cWg-1; Tue,
 03 Feb 2026 00:02:08 -0500
X-MC-Unique: WIGpg1WsO6OtslFAZO8cWg-1
X-Mimecast-MFC-AGG-ID: WIGpg1WsO6OtslFAZO8cWg_1770094927
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78A63180035D;
	Tue,  3 Feb 2026 05:02:07 +0000 (UTC)
Received: from [172.20.163.214] (unknown [10.30.45.55])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A3CD718004D8;
	Tue,  3 Feb 2026 05:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.19.0-rc8,
 upstream-arm-next, 5ade908b)
Date: Tue, 03 Feb 2026 05:02:05 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <45547.126020300020800603@us-mta-3.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jrJEjzKqs2QzHL2xcYnCXjMPhvLOH2ygT2siL-lhdWs_1770094927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_210214_829411_76D9C976 
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2301514529


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


