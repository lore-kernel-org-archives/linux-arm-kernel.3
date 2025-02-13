Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EB9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTfPLLBbXfx8ryu8Naehs5xuSjDzT7uQBSlExNoy8T4=; b=ha+KQF9uZ7dWtk3SfWQPa7hUfH
	wYvLF18pCzFf6PWgH7Xseal+RJeFsGM6mdofJUGTstr2CVE8sUzpPrsUWgyMlO42Z9lGqIm7EQO77
	D4D+/gXLfiLt2HxmDO/Jwl8AYnWFZRuRMjjkJypoEFjcdZiTOCgf4gA8CubULNJXjer4zRydIgDTV
	2a7IjORJy1567ycGlJQ1s0ovdeqIxjf+hGnFRCV0oNQL3lgyaNSLey3FgM+yKSjnndf7RM88kz2dn
	mLRCds6Ab4Y5vE0R8HTiTPVc9fpfb8BKsk9A0ooXcL3eKqOue6yF9pEZEwa9uetbNyq4AhhrhS7mi
	FV/naPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiae0-0000000BR5D-0ftp;
	Thu, 13 Feb 2025 14:56:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaag-0000000BQJe-3l9z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739458400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cTfPLLBbXfx8ryu8Naehs5xuSjDzT7uQBSlExNoy8T4=;
	b=CnKec6HUJn7cjyZGMZQvkZr++6b6MT0joDN0IJrTJOYw7MuRen5M6uvDN4VzmnpsN9xniy
	d2YHlZgHr/NYksJK50xUOJ/OFo0jGlY4sp46OZrb1PI4+cl2uPToCNPeMQCctSnirwaunY
	bPv3AEC1OFkSlONZ5LzSUy8BFfdlRGk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-201-d2z6_Z8-MJWBOKjcoPKxNw-1; Thu,
 13 Feb 2025 09:53:18 -0500
X-MC-Unique: d2z6_Z8-MJWBOKjcoPKxNw-1
X-Mimecast-MFC-AGG-ID: d2z6_Z8-MJWBOKjcoPKxNw_1739458398
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0E41190F9C9;
	Thu, 13 Feb 2025 14:53:17 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEAE61955F0F;
	Thu, 13 Feb 2025 14:53:16 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.14.0-rc2,
 upstream-arm-next, a64dcfb4)
Date: Thu, 13 Feb 2025 14:53:16 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <64234.125021309531800883@us-mta-201.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OfE8qF9_nXUOQ61T9WlJTh1tiHs6xS-PpZy9hQr9GsM_1739458398
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_065323_005355_7F59E315 
X-CRM114-Status: UNSURE (   6.36  )
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
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.14-rc2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1669747201

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1669747201-aarch64-kernel


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


