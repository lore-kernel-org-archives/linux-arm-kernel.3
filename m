Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99CCC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYzcyAhdbTqEloTCK7Hw+Eq4nhD16eF4Mvm5eTNfpHI=; b=3i2UB/1VK047jXWuTDp0GB9JOY
	DxD3Wv3kKR4aB868hQTgJ+yC1v2+ntOl/GIAzDwnIgNbMvlhkd/9bRky9LYx/vBc0w1oMCjpUqWRJ
	6ooo1q5ek8yOy1B2NpM0D8gAJlZQ53LsG8fuI8fN6U7eXeXBZzLqbxPGwB/cZwDahE6nHI1BdWa0N
	tcFJTr0hg89JKfRt+kkKiWvX16Z0iVtpEKG92iFpbpHsx6ceE9gXL46+djzObHfuFjKnZ2RU65ENb
	RAHcyjvNXoUz5VdZleAdzFtMTWj0ntTEFZn4dPkzSNLzQ2ARhdN+V6Y7dV18axODuE27soQwWMwKN
	321hyEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfh1-00000004hQl-0eDq;
	Thu, 27 Aug 2026 19:23:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfgx-00000004hQB-3P12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 19:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787858592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EYzcyAhdbTqEloTCK7Hw+Eq4nhD16eF4Mvm5eTNfpHI=;
	b=YH/tOq2edmt0mba6Hl7TGDhFb8Ksu88o/dre/D2IRY5K0DoZlRAD7JmcJscblttMVUKt+a
	7ihVhEF5FKl+FLhQZfLTgw8V37e7X3m76efoAmNB+u+J5ofB2T8J9u/QJ7m0GGu/Zs8qAN
	hxNuI0/eiEmPeVtHhkPww2p9dBtnq6E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-zxLhmvDSOWamWVs6BqiNzA-1; Thu,
 27 Aug 2026 15:23:09 -0400
X-MC-Unique: zxLhmvDSOWamWVs6BqiNzA-1
X-Mimecast-MFC-AGG-ID: zxLhmvDSOWamWVs6BqiNzA_1787858586
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F64E1954105;
	Thu, 27 Aug 2026 19:23:05 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E4E13001D37;
	Thu, 27 Aug 2026 19:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.2.0-0,
 upstream-arm-next, f1b8fa82)
Date: Thu, 27 Aug 2026 19:23:03 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <30476.126082715230900145@us-mta-631.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZdC4JUukwrbR8MtqrzHhBk5MaPXw3UPebnaMMgCX9DU_1787858586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_122315_923501_0D7F17B5 
X-CRM114-Status: UNSURE (   6.50  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2797274735


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


