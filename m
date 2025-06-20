Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xoHSMJtKi5BRhCoYEJn3Xc3XwdGkYOZPG2TpLbGt5j0=; b=udrPKFHgniJWFsiT/l8OVxOEMf
	7lWLrOESAdkpjlxBncYdSWLSBiHvVBYLzHA562dp5sNCaaFo8Pi2fzu9VcrNBrJRtCZKsRRbKZP+Y
	CI2pjKEzWI0UNDRuW5tnMqA/IN5OqRUUFd1JqG/t+HpxdJaUjMAbGc5QuidDUnOSpGIgwZ1EauK7M
	Vq0RoV/wFx+xotNNaPHNbVALZ/O/0W+pyP6Hu0zN/RCHahBe6fMwK5ASE3wZOQuWRbLcNrlj19bs2
	o2arvqXvKGKaqtOCLAreW9mLpReRtHA7mp4BS1/OBVu8RH28FPoIDGAlpJ5IzAz2+0ehVekczeqEe
	mFjXPjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSftl-0000000GIGm-35Um;
	Fri, 20 Jun 2025 17:51:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfc0-0000000GFKl-20qM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750440790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xoHSMJtKi5BRhCoYEJn3Xc3XwdGkYOZPG2TpLbGt5j0=;
	b=PiiuZshFExIFVvr+iL2zbWLG73MO3hnI3lGxaOejOYTQafVbwwaLWAOMRx91QS/6Vzmwjk
	i/NSFSjq+8CPxSn+5ZlDUel9Qfl3oTYalhtxErD7cS20atJxDK8wUa6FRUc1hgPNPSgz+R
	y3uFF7kYEdVbrTjzUl3KeZ2Zc1cKh8s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-x8UVNNTDOM6-EsXZEjKKwg-1; Fri,
 20 Jun 2025 13:33:07 -0400
X-MC-Unique: x8UVNNTDOM6-EsXZEjKKwg-1
X-Mimecast-MFC-AGG-ID: x8UVNNTDOM6-EsXZEjKKwg_1750440785
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9176419560AA;
	Fri, 20 Jun 2025 17:33:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B447718003FC;
	Fri, 20 Jun 2025 17:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.16.0-rc2,
 upstream-arm-next, 9aa9b43d)
Date: Fri, 20 Jun 2025 17:33:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <78705.125062013330700400@us-mta-510.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _aJgXWoTZX9LTik4syPSH_CGbdBTvlu1-PIXON4FJdI_1750440785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_103312_933058_DFCE5FD9 
X-CRM114-Status: UNSURE (   5.95  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1880607722


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


