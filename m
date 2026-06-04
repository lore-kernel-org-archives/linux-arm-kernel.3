Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86711CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 00:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oJFFOg1O2Bv6RiRl+12Nl7ytz0Rzi4JyFqupyIMEXZ4=; b=t0TpEnVKHpv3Z24pyA2FmqAQuL
	8WZd3HjV3xs+2dEbFByLjw0O5W2nNqUUDXzEfYfIAezgTfwZLKHh/9pUS5ON6ZAi/nGfDAuRveK6v
	5gAgs0vW/wijH6un7iBtfyvEos7rkej7oLrAtQ5GJ0B9k8yZmkDooPMbdtjGBnqyQbX+/No0+Eo6Y
	fxS7TTy4UbbFSfG4EF/6qTqeViWJssknKLN38OPhHUzIpQ8tBNqXhLxaJL48Bt7hXkXFRaRZekYHA
	1eoz4Al1KSlgLtiOj+clv27EwrIJqiB695Ivb7HaUptYbiFmVNrw2TLFbzUkl/FQT3DtpxI7z1pCs
	X4z6wR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUvYN-0000000FxFs-34Mb;
	Thu, 04 Jun 2026 00:03:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUvYJ-0000000FxFJ-46CO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 00:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780531394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oJFFOg1O2Bv6RiRl+12Nl7ytz0Rzi4JyFqupyIMEXZ4=;
	b=g+MJNNizYo6WTtNvmeBSctAdeAkgsNlco9mSa5oxbUpjrQIkTtmysuRUIGJlufWqHdjKTk
	9EkrRUYgOsqv2AOjswclK6ukzU+mnCLeC0yVC6TI+qQl14aOEmu9IQ3rNLBORXb7OSOJt6
	vZ797GHAKR7TaVSzJCnsX53AXvInkWw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-5Q51s-3DMHmMwgLRWpiGTA-1; Wed,
 03 Jun 2026 20:03:08 -0400
X-MC-Unique: 5Q51s-3DMHmMwgLRWpiGTA-1
X-Mimecast-MFC-AGG-ID: 5Q51s-3DMHmMwgLRWpiGTA_1780531387
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45DAB1956066;
	Thu,  4 Jun 2026 00:03:07 +0000 (UTC)
Received: from [172.20.191.214] (unknown [10.30.44.124])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B2E5919560AD;
	Thu,  4 Jun 2026 00:03:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (7.1.0-rc6,
 upstream-arm-next, ec7ef10b)
Date: Thu, 04 Jun 2026 00:03:05 -0000
To: yoyang@redhat.com, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <99831.126060320030800589@us-mta-467.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PM_gcvVOwL13UyVHVuD9jIkvH4DkVtwEdzLtPoSP_xQ_1780531387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_170316_111180_F61290DC 
X-CRM114-Status: UNSURE (   6.73  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2574758120

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2574758120_aarch64_kernel_kcidb_tool_21407599_9
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


