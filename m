Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05FE107BCE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=On0n+ZgwGExywHbKGNex5GexKXAAeVsLqdDE9AFDmxc=; b=Nv13xH2oSlD0uTBjHBMpSZZbHa
	0QQeA3P4CRd/J6HBQ6kDD91fedQtol1nNlzU/ypCToKLk7MpnI1jKBDfxeW9Id+vTPGp/T3qCNu3z
	RddXcUt2EvcDP+GCUZbvpc13f9xI81prCH1Hvcb4ct3gbMyjIeszFnjiYsCRoVRFHAr9OVirzi3n0
	uy8P7KGMFyVFQJ4+/yn94eF97Ps12KW0lX1hHnB35XifI7nRBBZ6lt3PV26sF/N7tic4FmA7bjGrt
	48gAD0QrRr+yFYSMRvjbx+5B3zHJ8RVb0b7D/ZbZWgeyg/tFhN1xz23b79Asf27+hGHrMUY2CVjwh
	ykdcBS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1BWM-00000001IXM-3Ppr;
	Fri, 13 Mar 2026 23:02:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1BWJ-00000001IWS-1YEV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 23:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773442932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=On0n+ZgwGExywHbKGNex5GexKXAAeVsLqdDE9AFDmxc=;
	b=h8oMGMoT9+Sto2F2hAfO9r1dh6Z5GERCc2Ru4rU/FkzzMvFyjWQzIylhWME4h0YbPRZElf
	iADTsNr4woW4f/behhLb2nnMY3n0fryaeY/WjadMRHpzwn9sxN3vvPR1mVb47PYqc8pvuF
	zEo11/pMnoexpghK9/5ikI72AubzVLo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-KqpfImMLOfi3KmieCvJTeA-1; Fri,
 13 Mar 2026 19:02:08 -0400
X-MC-Unique: KqpfImMLOfi3KmieCvJTeA-1
X-Mimecast-MFC-AGG-ID: KqpfImMLOfi3KmieCvJTeA_1773442927
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1058B1956095;
	Fri, 13 Mar 2026 23:02:07 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7D1681800361;
	Fri, 13 Mar 2026 23:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc3,
 upstream-arm-next, d118f322)
Date: Fri, 13 Mar 2026 23:02:05 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <89370.126031319020801911@us-mta-614.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EP1UDLjkUJFVrsAdiFRI2HNl-Pb8XGZ_1oMv9McNItc_1773442927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_160215_823563_CD52E615 
X-CRM114-Status: UNSURE (   6.29  )
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
    Commit message: Merge branches 'for-next/misc' and 'for-next/tlbflush',=
 remote-tracking branch 'arm64/for-next/read-once' into for-next/core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2384491386


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


