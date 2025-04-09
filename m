Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tko9Q41qFv+8nesmuDU9NZCq/qixhZ39CbmNgrGnKgY=; b=daZ40guVQGxalRjQGlnzCDF87B
	93xntjL1ka13+TGVyWh6EMZxAy9UplBUoKwOtOH5TLAcl7zVfgvAGc+12GKTZlT1VkxFqoalhpuSS
	EtVGhYJzMg0GN4GeBRWKa8FdvvNNLI8EBR0mLchu7jegAAca2EWHPX5NiPOCks6oO6OhsQT9tTbOi
	PAMFDsPV0Pi162UPmgtfxJR4wLNR2jPblQp1pTTPaAqAqXPOtu2DGvt0GqLav/IaSQmPCt089Ucds
	MqFLPng7GB8s4e1vLuWhDCDf5+h5zyVIMIUIGvlDcwAPJFIcAQ6f6IfjGxb2Foj5o14QEePjYXU22
	Crs7XC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dJy-00000008dDT-1Gn5;
	Wed, 09 Apr 2025 21:50:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cZi-00000008WTb-0tpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 21:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744232589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tko9Q41qFv+8nesmuDU9NZCq/qixhZ39CbmNgrGnKgY=;
	b=a7wkx158McHF/VdoVEO7WhtL7rhnxvTEzWatMkHpMZuC6DHBJ54RRwAluFErVMh7xWFnhR
	olHEiFV0vQs6Xih+LA2V05mnMEg03sdNVIVQg/N66yUe0PZ9uqUpRHM2DGW8EwZdvAWdHB
	L5Q/r9n/A7FUuUIAFkRLna/jJ11fzdo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-PvRV79_lOumwXpaE8I1a1w-1; Wed,
 09 Apr 2025 17:03:07 -0400
X-MC-Unique: PvRV79_lOumwXpaE8I1a1w-1
X-Mimecast-MFC-AGG-ID: PvRV79_lOumwXpaE8I1a1w_1744232586
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 804C31955DCD;
	Wed,  9 Apr 2025 21:03:06 +0000 (UTC)
Received: from [172.20.65.13] (unknown [10.30.44.73])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEA45180175D;
	Wed,  9 Apr 2025 21:03:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.15.0-rc1,
 upstream-arm-next, 2fe2b96c)
Date: Wed, 09 Apr 2025 21:03:04 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <15492.125040917030701453@us-mta-248.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jtFiB0NegaFJfeoJbq9jJdtb5YEEDpzeIF-vtIorCL0_1744232586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_140310_318217_31141C62 
X-CRM114-Status: UNSURE (   6.45  )
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
    Commit message: arm64/fpsimd: signal: Simplify preserve_tpidr2_context(=
)

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1760918513


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


