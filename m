Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D185C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7BrtiSUQgtZEpJAUKq4Y1DO9UrvWTIYm/HIM1XeG0Ns=; b=ph7QLvTxWcEdxKWPOkUNEeBAG0
	p8qBwGlAiRj2MmSLHsFfEPMpdeXwLD1jjv+bMiwwM4t5wtdINEEFP4tM36lZB3OpcYOdSoGUIdpCD
	8kcitMN3xvrRlWMzBo+OPIrWH1fZkn/Fvln/J7InbE3+oVQ2Kcr9nfCIF2aenubeuPl0fL+1dMQl1
	qGPiUXbvRCAeMRgjqzxL5OghncVWPsevsURUcNSczhlJcQnGeoFte622Ecehm3/uVcSmL2znJ2AXG
	RZmqnlwK+YQet9UGdVWrDJU/tz84vDx5YIcWPgXpJS7fS2KH3j9s6pfyvggErcsP5X6EVzelysHLS
	YECTW4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvib0-0000000G72B-0g0G;
	Fri, 21 Mar 2025 20:03:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tviZJ-0000000G6pV-0LcR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742587331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7BrtiSUQgtZEpJAUKq4Y1DO9UrvWTIYm/HIM1XeG0Ns=;
	b=b0NpD0JIQxZ3+SV8BTKUjG6qPLt+aIADUH4nW0C2i6EwwIPInm142UJL08o6o0haXfSLzs
	NZyGx0WqwQknlvgFgxFesgqrMUpFykoeII8bsuXXEQ3SgAZR6rP7j41NW1N9HqbZImR3ob
	v34YWbgL/b/b0akWggsQE8vOYN/uBaE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-xx0cLs7bOJedskGf_luMWw-1; Fri,
 21 Mar 2025 16:02:08 -0400
X-MC-Unique: xx0cLs7bOJedskGf_luMWw-1
X-Mimecast-MFC-AGG-ID: xx0cLs7bOJedskGf_luMWw_1742587327
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02AF2180025B;
	Fri, 21 Mar 2025 20:02:07 +0000 (UTC)
Received: from [172.64.14.55] (unknown [10.30.33.138])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43EEF19373C4;
	Fri, 21 Mar 2025 20:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.14.0-rc7,
 upstream-arm-next, a2392f33)
Date: Fri, 21 Mar 2025 20:02:05 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <51435.125032116020802862@us-mta-517.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pqSHRbkWNi4ltuVollc6DRB59ZGZu8c0XsntL31N7Os_1742587327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130213_198140_5A90D611 
X-CRM114-Status: UNSURE (   6.77  )
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
    Commit message: drm/panthor: Clean up FW version information display

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1728800306


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


