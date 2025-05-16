Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741EEC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DgisP+Gadj6VKhtsyPcYohCnUrm8TyqR5blZ7Hliw4w=; b=a1hGQCTO3QpqbCksqNpCHDJoV6
	w6hRuDewL0c9vspytNL1BBdHrYP9hmKF5lX59wmzl1GqXXZvN9L7ULzOf26Q2wAU9+wl0Mapa9ojz
	kbbwsLqV89dH1kDPTj73fCsDTXRTgQi3/Mw66lIYyf8qcxoV7SoiEt3rvRMi/bVVZ4A1YDljHhKTW
	dPxxTIshXmTH2TOvz3zD3YlJVRq9cWVRZRuVu3siswSJIMjFilG+lUI2tvpbQLs3rVlWMWCiUQM7Q
	pZPcKEeXlMoc+mIpDTSv2uliyfBw2iZbsnN1bPs9SE3FqmMifKH51x3xgEbICmdakJlINVdeI7oQP
	Qn6gmp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG24U-00000004bOn-3p0L;
	Fri, 16 May 2025 20:54:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG22R-00000004bF3-2SJ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 20:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747428732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DgisP+Gadj6VKhtsyPcYohCnUrm8TyqR5blZ7Hliw4w=;
	b=StOoA+FpbY9/RnBxWTmUSWI8UsVlrI77mDb8Zc5q/jmy8qKHmyi3iL6W685vbv1e/pE6q2
	8uh/9jrmQ1xcYCUbJvdpA8k3ZG0zh7jBcFcbNFkwU+XLaZz2fbqeStJ8ZmVj+4rhTQx9cK
	K62cMYUk3RTOZt39+Qygq6jYfzQC8lE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-uNQ_OJ18NzWILeMbVuf5Mw-1; Fri,
 16 May 2025 16:52:09 -0400
X-MC-Unique: uNQ_OJ18NzWILeMbVuf5Mw-1
X-Mimecast-MFC-AGG-ID: uNQ_OJ18NzWILeMbVuf5Mw_1747428728
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 741E619560A1;
	Fri, 16 May 2025 20:52:08 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D9DA1800359;
	Fri, 16 May 2025 20:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.15.0-rc6,
 upstream-arm-next, a82e9259)
Date: Fri, 16 May 2025 20:52:06 -0000
To: linux-arm-kernel@lists.infradead.org, mmalik@redhat.com, will@kernel.org,
 omosnace@redhat.com, catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <40420.125051616520901114@us-mta-457.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uy5yQw-4SpeSW8JS5MxAkpZiPfnpsC3e7uPOSarB0VU_1747428728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_135215_703328_7868C701 
X-CRM114-Status: UNSURE (   6.53  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1821799657

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1821799657-aarch64-kernel_upt_23
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test



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


