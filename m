Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25571C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQ06n/9MSTeWgZgZYvR1x63JBi/prHghMiykvG5JZW0=; b=ULw+9hjA5vO6KvYlkUPvMEn5Bo
	as7hrTM03rlGOqbwffUpdHIUA2XvRaLhk2XnaDyLdz1hMdV7gHOzXUiImBB1bf8YcQXu5kYrfgXIi
	ZWj5TZPtr4uFyQGz7eTpOZ6fjzLKeATe/4Nyu7lF0J40X51ELmb8pk3LdjlBitR11tNHwtRHBAgto
	3sHCANS6d+bpA3GSoSsy0ofFgwxFNeWJFMOP7z+wUuBAmar4ifUHQa8V7GiHlmSSxrDd2hiWf0l8n
	/9y8oI7L405/558aGc1jt3WRtQgToGLCL9g+t6gC+A2Zcd1mJrAc+fX8Fm2TgoNyDk6OVWSQw1AoQ
	BYCao94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsuO-0000000EHQR-324O;
	Thu, 23 Jul 2026 12:52:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsuM-0000000EHPu-0UuJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784811131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQ06n/9MSTeWgZgZYvR1x63JBi/prHghMiykvG5JZW0=;
	b=fd+3n74501ZKCCfHanJwvhAIowdcmIwGRqhHDT3HJymXAaN56A1TobPhiJaLPIyrH8B8n1
	VyiXX1UyCCeFQPiUbK26LL6FKVKUvveX16++DwQI1wLUUmY+Euj+hBlN4oLUdKkTJ8IuBe
	7dZb/SfTtixZ68nxW7VMMXcUbxT6xGM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-1D0bYUiwPeuTcBx3feurIQ-1; Thu,
 23 Jul 2026 08:52:10 -0400
X-MC-Unique: 1D0bYUiwPeuTcBx3feurIQ-1
X-Mimecast-MFC-AGG-ID: 1D0bYUiwPeuTcBx3feurIQ_1784811128
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CA7A195FE3C;
	Thu, 23 Jul 2026 12:52:07 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9519F3000225;
	Thu, 23 Jul 2026 12:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 41 of 56): Test report for for-kernelci
 (7.2.0-rc4, upstream-arm-next, b66b0005)
Date: Thu, 23 Jul 2026 12:52:06 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <10448.126072308521000251@us-mta-262.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uBX-DelyURMN0qsAG2pNiE8hjshrEN0OOc9wXtbBFpU_1784811128
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055214_257772_08E76E18 
X-CRM114-Status: UNSURE (   6.60  )
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
    Commit message: Merge branches 'for-next/fixes' and 'for-next/core' int=
o for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2698586675

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Hardware - Firmware test suite [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    selinux-policy: serge-testsuite [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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


