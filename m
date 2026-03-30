Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576E91061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDzWJJeJnFYCyM8HyNvPuoL5kQfzffNoq/HLAYKycUc=; b=v+EhvB18IAq9mD4eyz5kPuYToJ
	7Qa+NBMcj6rFNgCjakPbAKS3BKX7R899+9qL901+llrqeG3SVvhXmNZr91MFK3tjL5GaH0cVNKAtf
	iv2d7UZH0DQHkihu+KFvwTlvTy1ImGMGacrO33CLI1uk69eYbUIFRDfZPmVWPWoGuVo/qB5EILgCR
	MsJ3UVHhIl/5sTFsuANVuxGhEdGtI+E6+HzHQuO8bFrjHe/8UDOCp4veBuZzQYTj+GORHJEMUMFgt
	DTXQ2GxK95tE8seq05yofJ2rWPAXMB2ncYSTKavsFJYmFqL7TYcQg43+0eWjeKg+VHbYulvYhf/HC
	l2nxXc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jbk-0000000BsFM-1NDg;
	Mon, 30 Mar 2026 20:53:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jbi-0000000BsEt-0ZKK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774903987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uDzWJJeJnFYCyM8HyNvPuoL5kQfzffNoq/HLAYKycUc=;
	b=VQAixn74VCkGUPg8B6KnRyPp/XWWAYRNsOdck5uqyulN4inb5fd1oyfMRJ2rDNpfoz+vxp
	4VdLhTnrSBjWITSm+XOPCMi5tOSEIOvxhlI34O0dLsHodOaM6us66zsC9pCPi+7/f5mnHB
	T/yul94Bc/AbKVrKL12v05n/EUsgKtI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609--5m93wt6OHWOlZOTJAzIhQ-1; Mon,
 30 Mar 2026 16:53:03 -0400
X-MC-Unique: -5m93wt6OHWOlZOTJAzIhQ-1
X-Mimecast-MFC-AGG-ID: -5m93wt6OHWOlZOTJAzIhQ_1774903983
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFA3519560AA;
	Mon, 30 Mar 2026 20:53:02 +0000 (UTC)
Received: from [172.20.201.103] (unknown [10.30.44.137])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D3011954102;
	Mon, 30 Mar 2026 20:53:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc5,
 upstream-arm-next, f97a8538)
Date: Mon, 30 Mar 2026 20:53:01 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <71192.126033016530302887@us-mta-609.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k55Wo7P7quEq3Ereue89IOvxC4s6TVUSXZnepr5-f5Y_1774903983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_135310_268622_2CA709DB 
X-CRM114-Status: UNSURE (   7.13  )
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
    Commit message: Merge branch 'devel/linus-uaccess' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2418826285


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


