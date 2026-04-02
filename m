Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F27CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/pztzp39i3HT94X+HqCLWdysDOPc60KRRFKFlcKWW2s=; b=kL27uzem60X9FE33O8L6DRmHzS
	DfsmBjVNZ7AZ4muRs0/uk0TTtnt1NETKkzG63H6yeRuWbufiUNlQPQTMmyWEoPlY7TZy73AU0ngFE
	IXUASqx4ezdXVfUW+pcbyxuQXnK6CKAYnYK9gdGOOdXpw5kebV6TTSK5BMxFOGGqiLlDSWME2UkjU
	zSRHoc6WPEHjBVlvW2Z9oAky7yoECBCfFhTjAQmJjedvcfG+Lo9Xs+XF8tpTXWWKv5RF8o+dHbbjn
	hVfpZDX40Y7LAVpRlR660rYi7HOKW+K8kb9PDgsOaKbPH3uCuOYs0Ce6imIwOY1ADnfO+fEZjqqSd
	jaZPZtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DKZ-0000000HAsp-2RRd;
	Thu, 02 Apr 2026 08:23:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DKW-0000000HAsT-3D5m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775118187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/pztzp39i3HT94X+HqCLWdysDOPc60KRRFKFlcKWW2s=;
	b=e8R5WCmiC1B/k2YyqOtDy9uiIO1lJwbOiu5bnizlrHrKn66tnuyKpVlsaLpPW0CbLphGCb
	Q5awF2nJwqdlng6aywk4AAZr4aFJ39mFnVzuVqiaqmgSo+tQEzDI/UlFDquNe1oP+qb+ij
	8kPM/1VZDn80FluU5qSBc1keq3sfLpQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-s3GYoIo-PvSKmiJDfUonSw-1; Thu,
 02 Apr 2026 04:23:05 -0400
X-MC-Unique: s3GYoIo-PvSKmiJDfUonSw-1
X-Mimecast-MFC-AGG-ID: s3GYoIo-PvSKmiJDfUonSw_1775118184
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDF7518002CF;
	Thu,  2 Apr 2026 08:23:04 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3184218001FE;
	Thu,  2 Apr 2026 08:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 2 of 56): Test report for for-kernelci
 (7.0.0-rc6, upstream-arm-next, 851b1b57)
Date: Thu, 02 Apr 2026 08:23:03 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <73646.126040204230501617@us-mta-688.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: isO-DzDJ1eVw9OePotbCkDlKKPBbE2QgH_9kMrnBqTM_1775118184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_012308_880758_C3A5A3C6 
X-CRM114-Status: UNSURE (   6.51  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2424789119

Tests that were not ran because of internal issues:
    /distribution/command [aarch64]
    Reboot test [aarch64]


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


