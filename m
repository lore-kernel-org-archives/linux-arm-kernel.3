Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F6C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R8UU9AhIT4eFDbiN/1dEzKY7asXGitgeeDBUFr3qr2c=; b=Z15JUw/Oorp5pBMHfCqjhnWBOk
	h363hIEcdJM2ivy2f59ARCUnz00GN743GCwN1aKAuD5d3i19oWUiV+GxE7PuVR75+bG4wSPT3PGj7
	EsiZ+4IHtkMQBcATRjg59WBWrAAAUIy6ducZu8szo05js627zsB7s6iZvJi2j5xhoHHhTIvXH3GEV
	cxZuCRWMwTqofe2lz5+Ir5fHtUlmE1KnDOOnPOlOR9rtVD7bE5R32W4nq08ehCtNV/eSGwEq+0nwZ
	y4AhN0wkjTJWIhCZlVz1gxZ8pYew0kGyV/1hRbUuQ1rWZW/HLZ0OMrFzF93n2cZw3/yiwf2Jd8XzR
	ybUbAoPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlCW-00000008s5j-29Vh;
	Thu, 27 Feb 2025 21:13:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlAy-00000008rkF-0QGU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 21:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740690730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R8UU9AhIT4eFDbiN/1dEzKY7asXGitgeeDBUFr3qr2c=;
	b=ZUILlb22PPPGBR4Dq1PWBw0wa9CF2aHAHsr2gg7YIrwyfmLBVYl8WjhRVh1DVlQpxphEz4
	RGcPvqhtJB1oyhhi1noUxFWxRQa7mg+e34z7fDWDHfqt0cmpIqrzY5WWBVuPAUriwZE1EK
	299lQ/Fp/qdX0OET9xxWw6FibNmprYw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-V7zhxVywPwK4LbDAEe-Ptw-1; Thu,
 27 Feb 2025 16:12:06 -0500
X-MC-Unique: V7zhxVywPwK4LbDAEe-Ptw-1
X-Mimecast-MFC-AGG-ID: V7zhxVywPwK4LbDAEe-Ptw_1740690725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FACF1800876;
	Thu, 27 Feb 2025 21:12:05 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14D631800359;
	Thu, 27 Feb 2025 21:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc4,
 upstream-arm-next, 017f704f)
Date: Thu, 27 Feb 2025 21:12:04 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <67742.125022716120601079@us-mta-198.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EjZrSaeIcfhWYnA1b-pMNqwA8khI3Dc6sW2hdJvqr2Q_1740690725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_131212_208258_FFC9E993 
X-CRM114-Status: UNSURE (   6.47  )
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1692309366

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1692309366-aarch64-kernel
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


