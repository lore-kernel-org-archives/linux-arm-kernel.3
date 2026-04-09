Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2AB10FC456
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 00:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eWYdUBjZvJIDVIjkFjhwd0NfHWA3cxh1hsLdF2yjon0=; b=Ubtmytbpu52bnfu+CZLF90vRH8
	abbOZD+b6KzeGn8mnzo8vljfWx0USKX198oeE3Ka+9wfrzt1Z+qKrQ1+t53CkUJlvG0B4X0o54K/p
	7HjjN3JoKb0UtecpsPL5aNPJfqQzSPGY5hyKWhOmcF1owK+/lPDTFqDMBNE4T/SVjMdeK//nB89Mt
	YHCCAvchFEwh70d8NgFoKAPHgWmzHAGUkNB+rM7PneLU8V5tirsjjkYf8XFrXmv3bvbpesvYn97vv
	m8y1fjhDFYxlX1V9QRfJ+H/C8Q1TCcstFjwjbDknSBfadW3q36wDWSC5XsNdKl2WPolUQLE4Kin30
	09oylZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAcrc-00000009XDD-2bsP;
	Thu, 09 Apr 2026 00:03:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAcrZ-00000009XCR-1oCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 00:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775692989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eWYdUBjZvJIDVIjkFjhwd0NfHWA3cxh1hsLdF2yjon0=;
	b=OvTUsKaOHrwI469c+Ij1kWkQ9IS1S0WeOqh+MhprLtOQrdhCnt/72JDBN1IdeAy/hOF046
	tBizSjisOIeUUFydRvTgRuoqo0uMFRGn+SGJtqnWM6dPt2kFL+1rDddiJzuXdaG0bOZdWA
	x86bA11j9wLQMsD7xmNLCvoER168y9k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-16-pTGzxTBDO2KFYhC4lanBYA-1; Wed,
 08 Apr 2026 20:03:06 -0400
X-MC-Unique: pTGzxTBDO2KFYhC4lanBYA-1
X-Mimecast-MFC-AGG-ID: pTGzxTBDO2KFYhC4lanBYA_1775692985
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 860FD195608C;
	Thu,  9 Apr 2026 00:03:04 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0D1C1800671;
	Thu,  9 Apr 2026 00:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.0.0-rc7,
 upstream-arm-next, af497322)
Date: Thu, 09 Apr 2026 00:03:03 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <88632.126040820030600315@us-mta-16.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QvPgBWFos64DxKjjPRdFcXUV0lzCuG7-p_Syx248xUQ_1775692985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_170313_543535_47A906C5 
X-CRM114-Status: UNSURE (   6.56  )
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
    Commit message: Merge remote-tracking branch 'origin/nocache-cleanup' i=
nto for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2438429461


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


