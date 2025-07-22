Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B38C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GqB0kzuRBIPPsc8BtxZ0yfOlcDJR4pMRTqnL4XMBxN4=; b=ppA+EVGlJom8z5/ZXnIG5HiCc6
	J2CRGUv5yvVVOZgvC4j33dwht1IPbjv7WCPJEsf61MfeYS+xt5g6rm08XBYGF1wgBF55VNdN5cxvT
	70p9+NbomClTdcRij01q2Qh1hjwtb2apd9YvOVxrVz5xo4qi3kUd/iZ3C8wGhNqqtVUU0uzdueqzy
	Ch9nbkKG312oUWiAoP0nT4dd//AOZREZ1sJiYKghM8cnjGIK9FhbIBDFVnXsjWdpAmAIyIpMJWSrJ
	ux4gJgp/qRdmpxMDdZbIFeVtA5f130BF4FFUhUgO1o1gvhsXxeX+6n6AqJj8clzz4WKU4OQs649nZ
	1ZgYn1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueHLh-00000003D7h-1dIO;
	Tue, 22 Jul 2025 18:04:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFvX-000000032M9-0t44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 16:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753201993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GqB0kzuRBIPPsc8BtxZ0yfOlcDJR4pMRTqnL4XMBxN4=;
	b=HSrfjPLY8P+0SeOq3CWPhBXb6f/9PAp5208upf8aEZmaLG953h9nU0NQtqxzihTSzZB+VB
	75EtTLFHGzdnUV5Q/lxAUzL0v9hqXYyTyv1sc15KAoCMB1smTk4+x/EZ4njxK/szVi8qs2
	Sg2zW7xdpCyEuecF5yP1wiLKfRVkKFg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606--wzeF5jPMpaRyettMgxwog-1; Tue,
 22 Jul 2025 12:33:09 -0400
X-MC-Unique: -wzeF5jPMpaRyettMgxwog-1
X-Mimecast-MFC-AGG-ID: -wzeF5jPMpaRyettMgxwog_1753201989
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE79919560A5;
	Tue, 22 Jul 2025 16:33:08 +0000 (UTC)
Received: from [172.20.247.27] (unknown [10.30.45.30])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A041230001A4;
	Tue, 22 Jul 2025 16:33:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.16.0-rc7,
 upstream-arm-next, 29e0a1d9)
Date: Tue, 22 Jul 2025 16:33:06 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <70472.125072212330904758@us-mta-606.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 216JthRyLyL_6k-Hc338vt6wboNDe7AxoPCuGKczoDU_1753201989
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_093315_328642_46F18197 
X-CRM114-Status: UNSURE (   7.19  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1941622363

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc: denied { write } for pid=3D24032 comm=3D"stre=
ss-ng" name=3D"secretmem" dev=3D"secretmem" ino=3D26612 scontext=3Dunconfin=
ed_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 tcontext=3Dunconfined_u:objec=
t_r:secretmem_t:s0 tclass=3Danon_inode permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2380869
            Affected tests:
                stress: stress-ng - memory [aarch64]
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


