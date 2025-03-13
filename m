Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC37C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ni6/mLmYeiahRSaVJd/vQCBHqoB7AoG1SNCVrDnaq4Y=; b=Y5K7FYOPpInPbvvBwCQsMH3xmh
	Fm99l7rfokoE+gj0owapUE+BGFv4wNJQp/OFUqkc8k3cBoK6VhsY01TXEOWL5UxVr4Q/M6DEZXWeJ
	GRiuTOUqTE/dWEQXSyeenY2LTFi8l/1k+6qodUr7hueOHIOxQQmJhjz5qLHW1VgtUTvSVWqnRq0OS
	plgqD+IKWCFqQQeAM4gjZXWBvXlnl7tUPH2QeDVTJoABjdycqOWsYdGd6CR504PHe6gEBnqjyKvPg
	5LdrvRJTQz4QFyptdrwN4b8UODJN8f+XLhvUUOXaIOtxYES/BTSfgDN3bigoeXas+8qMUlw+Bv5Lg
	i82flbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjTi-0000000BWQM-1ITv;
	Thu, 13 Mar 2025 14:24:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjS4-0000000BWIO-0Ckp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 14:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Message-Id:MIME-Version:To:Date:Subject:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ni6/mLmYeiahRSaVJd/vQCBHqoB7AoG1SNCVrDnaq4Y=; b=ZQv1a8N5PoSTJn0aWVJqaCmypM
	13tm0sUsOgv+cH8dh/0YfGbWVuWZZ8noZxSAliDXUMSMC2eUdBn1b/u0mWulyol58QQDwozN2EKQ0
	7rY/cZflOD/n2Y0yd/RGezWU4F6CaqAOqPzT3AEq/rGSx6HbA0250JBv0Db6NF6zaCeYhdJg9VVPx
	B+tLqYXJNlhVMap8JchAL8Ey0KxqYQnPPNWp95K7UlkjvZcMAiQsquzkklpXTg3AI+hMs3NCi37Y2
	CDVOD3s6JLTwqGicApMDavk2wDLENm68V9SOePhIETEYROjIwB//4a2GEBOSLCjxZ+fJTUBQx2lge
	S3PV40xw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjS0-0000000H1Vb-27Wp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 14:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741875728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ni6/mLmYeiahRSaVJd/vQCBHqoB7AoG1SNCVrDnaq4Y=;
	b=GvWynKnXeVABFawMkkDpMZ4kaXMVULkw3949w2rjbRBN1NzZAsqt0p3cKQHLQuDcp8kvvX
	osC1kUg6406hrusDueNXsesgxQZgTjzqjBIRvmxrPN8KXQ1dPJ/uzhRXEcZ8aTWOM6C/Fj
	u50FYlmC8wJz7UFUH6+2ooAyz7Loj/g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741875728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ni6/mLmYeiahRSaVJd/vQCBHqoB7AoG1SNCVrDnaq4Y=;
	b=GvWynKnXeVABFawMkkDpMZ4kaXMVULkw3949w2rjbRBN1NzZAsqt0p3cKQHLQuDcp8kvvX
	osC1kUg6406hrusDueNXsesgxQZgTjzqjBIRvmxrPN8KXQ1dPJ/uzhRXEcZ8aTWOM6C/Fj
	u50FYlmC8wJz7UFUH6+2ooAyz7Loj/g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741875737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ni6/mLmYeiahRSaVJd/vQCBHqoB7AoG1SNCVrDnaq4Y=;
	b=IFWJUzIO/amydyGaqzwmtTngTJR9OyFf7efbBNC1Q1BArIc2/a19rCSuXjqdeDxJWl6Iks
	7xUGN7zoNzn09sPYIGAO7Z/bcq29ZxsUt5LYsDzQETpOsWPmU5maBNE92gGQQlyyyUMLI9
	l/0h729VFZve/tldDHhkzjvEfGN1bU0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557--ECXQCfFPKuInkhnjkuzZg-1; Thu,
 13 Mar 2025 10:22:04 -0400
X-MC-Unique: -ECXQCfFPKuInkhnjkuzZg-1
X-Mimecast-MFC-AGG-ID: -ECXQCfFPKuInkhnjkuzZg_1741875723
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F6C21800262;
	Thu, 13 Mar 2025 14:22:03 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DCA919560AB;
	Thu, 13 Mar 2025 14:22:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc6,
 upstream-arm-next, 78e3fd2b)
Date: Thu, 13 Mar 2025 14:22:02 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <04580.125031310220411118@us-mta-557.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zRm1XZG0WvQOYhHj13N9pZNreaQ8nog-3NoSIQE12yM_1741875723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_142220_644722_E7FE4D8E 
X-CRM114-Status: UNSURE (   5.63  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1714960581

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1714960581-aarch64-kernel
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


