Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3796DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IWLhMtPmFMuDBi8nE11mfbblZDKaB0YiSOyw42ff0Ao=; b=wFkVtRw332R72mfTYwLhNFzb6x
	7myUKBZQkBvXLuR15cNPZeeDiZ9fXOiap6f6q5oo52NGslJb/1/fMOrjDEmlu0v4rHTMoY0wjkyq+
	NGSP9KnRMNi74UQU5+Mjl82uLJuNAyaIJ2hXJ4XalEHtJ3EANxQLyYFFW8/pxDxZD+IBb1ijAUziM
	ogVNF94Ccbh5ZOGe7EstcajueXtYFsp4Ms0jXgk2rhShassB8Bl3HLtHz9lq+IyLbWkYRcHRVnR5E
	VqIYt/+JDeRZCb7fb2I5UwtCeZsBDPFt0QJ+jIC8xyudzRRHG22MWhPxt2p/RNXKuziGaD2bnOrTX
	AfiBG0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF3H-0000000BhBg-3bqV;
	Thu, 06 Mar 2025 17:30:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEwR-0000000Bg74-1hBp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 17:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Message-Id:MIME-Version:To:Date:Subject:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IWLhMtPmFMuDBi8nE11mfbblZDKaB0YiSOyw42ff0Ao=; b=m3dOn0HijNoAg6oWahL5IRSP1P
	3nUEl4JX10YHRoSexGxtpC6aH7QBeRQeMJwQ8djQTzMKOLjQQLLedbIdvZO9kgndIkyfHQUgoYtmq
	IUq4NCi661hGyTEG/v0ct7+9lHfPFdhJa+kWSO8jGn2UHmEg4sC03lE1pj/uKlKtcGYwEg0vi+olg
	0C9GuN1SP/YEYIeVjkC5WEZyP6ffFveZBzyZcq9eJdglfs/bVUTwL4Wg1kGQ0gLZw6X95Md1H+u+e
	jU1hZXIXCq0pnSA6Pb0zOi+TK9nNRLh4ML94d/6tVOWM2/AzSkEFSRgHiLmr56Ph6RUSWHFJq6DLB
	wqDXex9g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEwN-0000000AzRa-3ypE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741281792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWLhMtPmFMuDBi8nE11mfbblZDKaB0YiSOyw42ff0Ao=;
	b=VK4ngJfqYKwWDyNj/Wq/gqH2UMcZaVytvurjSgAW843smE10kIG3aa9sHa5v3oalp1T+r1
	tK6osbbURDcwBrZ49i31AWpOM4X2b0eKUvIgIyTSI1J+iun2AZwAO6WLaGO0Lu7fAFJhD5
	Nw39jLh/Chuf9fNVMra8N783vCs2JKg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741281792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWLhMtPmFMuDBi8nE11mfbblZDKaB0YiSOyw42ff0Ao=;
	b=VK4ngJfqYKwWDyNj/Wq/gqH2UMcZaVytvurjSgAW843smE10kIG3aa9sHa5v3oalp1T+r1
	tK6osbbURDcwBrZ49i31AWpOM4X2b0eKUvIgIyTSI1J+iun2AZwAO6WLaGO0Lu7fAFJhD5
	Nw39jLh/Chuf9fNVMra8N783vCs2JKg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741281801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IWLhMtPmFMuDBi8nE11mfbblZDKaB0YiSOyw42ff0Ao=;
	b=fXJwutQQgqitJyNjwqWVaMgvBt0fYVC/LUqJebXWtXLmgPs7dPxQVw5+lWlADSuPeHN/3Q
	SBpbT4AcL+QjVb6RdNhWUHBfzUvFd+jYnzsGjtijBHy+8k94JorbzIpycL181D2s82nrCL
	IwdJsDLZFnosZOZ1XjMRz5uxjHaeMaw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-x6f2Y7pNNr-2qZow0WRFcA-1; Thu,
 06 Mar 2025 12:23:08 -0500
X-MC-Unique: x6f2Y7pNNr-2qZow0WRFcA-1
X-Mimecast-MFC-AGG-ID: x6f2Y7pNNr-2qZow0WRFcA_1741281788
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9924E1956070;
	Thu,  6 Mar 2025 17:23:07 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B3F591956095;
	Thu,  6 Mar 2025 17:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc5,
 upstream-arm-next, 14d05f12)
Date: Thu, 06 Mar 2025 17:23:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <06769.125030612230803399@us-mta-128.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -4BuGLtMJy8EbUv1ffC92Ot2fH6KgcKVKXbHOhgsigc_1741281788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_172324_083409_437B3954 
X-CRM114-Status: UNSURE (   5.60  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703414689

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703414689-aarch64-kernel
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


