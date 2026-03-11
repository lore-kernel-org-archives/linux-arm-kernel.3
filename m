Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F676FD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5MR+vbweSMRTnAqA1FTSiAJGel5O7elkvsAf8mcOHiY=; b=BfgnqGml7akuJ4WDLdRhQmhEgu
	Z19+tTWw20Z28XTsGBIOQ5Q1hqB9WdQ7sBBDoybT3QwgvP7BAn5NIsr5C6csVYsE5PkEbagKCez/k
	6JL2v+dRKw5Q6DvGNvwjn22EQeqG+0cASJGSxWdPB8yRFfw9C1oWrK2t3Y3Q8iuOnyhun36JjBJE9
	b/M9W2kBD7ri3aylmbxGkbGwpSNwLaR8ffawEi2vz4NlUW2WdX+WoulYVGJWD4VxgxMl5Q4S/v8YF
	hqBEJ/J/eZa3A1QyiIixVdZfn1G8XdG2kK1WWRUTUSYwhWCCCIkML1zYa+xcx7VGWE+fCK0qBaQje
	l5XZyudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KS8-0000000BhJd-26Ue;
	Wed, 11 Mar 2026 14:22:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KS4-0000000BhJI-2Ihc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773238938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5MR+vbweSMRTnAqA1FTSiAJGel5O7elkvsAf8mcOHiY=;
	b=VNniIh3yhT38qavFM8/jFAtxnPx/p+jgSQbKjIOJo198y/gR/J8VRe0BJJpc5/vGMrDM5p
	ZdDJmCnBreAbhAOszbgisGYNhmKK28tI3O0oX/HEI8VUNZ3Nz3wcnbZyEPHKVptPmkxqCi
	3qZS8BI2jXN0AE/C9X0nLH6SktL6HW8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-kvlzFHjBMUmW60-1OGY1Nw-1; Wed,
 11 Mar 2026 10:22:16 -0400
X-MC-Unique: kvlzFHjBMUmW60-1OGY1Nw-1
X-Mimecast-MFC-AGG-ID: kvlzFHjBMUmW60-1OGY1Nw_1773238929
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6482419560B5;
	Wed, 11 Mar 2026 14:22:09 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1B9D18001FE;
	Wed, 11 Mar 2026 14:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 11 of 56): Test report for for-kernelci
 (7.0.0-rc3, upstream-arm-next, 0fa18c1f)
Date: Wed, 11 Mar 2026 14:22:07 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <05641.126031110221600391@us-mta-656.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZLJO9Ahp1qJkRTjW44Y-l6C9wRRdWXcNIWsqNk800Uc_1773238929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_072220_658179_825BFA4A 
X-CRM114-Status: UNSURE (   6.30  )
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
    Commit message: Merge remote-tracking branch 'arm64/for-next/read-once'=
 into for-next/core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2377995487

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64]
    /distribution/command [aarch64]
    /test/misc/machineinfo [aarch64]
    Boot test [aarch64]
    CKI/restraint [aarch64]
    Reboot test [aarch64]
    SELinux Custom Module Setup [aarch64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


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


