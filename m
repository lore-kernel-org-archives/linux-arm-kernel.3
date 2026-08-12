Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6A2C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2JL3PRY80AkVSmiSyhrpRC6AMe0PAJpPdp/EWh5tcSk=; b=aQTbagYJOLeN9BEiGNUB946Ujr
	4TA1+TN05E2lUc13u2bt/jWO3ddYL8QN86WlpXO7tPfjasSo+g5V/yeoXODJ4yUa2u760ttRLysXU
	RS3U33TgcZOtfWqNSQfRKhmCShidx9+F9n6HwW85wZZ26E8mJfiVWmXR/rle+hE6gaiiSe8qsj62n
	h+SoAEQT/nZkkK9dRWPXqjplI6FcaihKdX48fs2R3xcaORjFT9eJdQ8pRxPUUk4ehSNe+HM2y1WhV
	tRwM7LROHo7jq6sjVICZRA2xMCxUkMHEfKe0xN5UGizhli4nFWu3k60N6p7BoMaJuN/97cIED364d
	/bzL7Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6sf-0000000G104-2olw;
	Wed, 12 Aug 2026 11:12:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6sZ-0000000G0yc-0pDk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786533130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2JL3PRY80AkVSmiSyhrpRC6AMe0PAJpPdp/EWh5tcSk=;
	b=btz052wx/JFi/BroasR3gnkp8/V0HX+7XISEVJbLWWVEcZZrqq0Ur1tGhv6w9HfRR9b2KH
	sXcS3qfMHLMeDIOliH8O6m8IyMV6W8K/8GIBzotGoHmeVthRmTGNjAdlSSC5ZsejEJVtZs
	x4RsDu8aLy4YpiM8r0ABHZpP0qwGmNk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-q4m_IsmTNTSA615o2dzfKw-1; Wed,
 12 Aug 2026 07:12:09 -0400
X-MC-Unique: q4m_IsmTNTSA615o2dzfKw-1
X-Mimecast-MFC-AGG-ID: q4m_IsmTNTSA615o2dzfKw_1786533128
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4199A1955F5A;
	Wed, 12 Aug 2026 11:12:08 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6712D195DF91;
	Wed, 12 Aug 2026 11:12:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.2.0-rc7,
 upstream-arm-next, f9054278)
Date: Wed, 12 Aug 2026 11:12:07 -0000
To: will@kernel.org, catalin.marinas@arm.com, fs-test@redhat.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <30679.126081207120900520@us-mta-640.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: La64mtvVhY4IMLUpK0JBhmiuJ2evF3EWhlqNy_7d8kY_1786533128
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_041215_830218_315942F8 
X-CRM114-Status: UNSURE (   6.99  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2750992499

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2750992499_aarch64_kernel_kcidb_tool_21852868_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2750992499_aarch64_kernel_kcidb_tool_21852869_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



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


