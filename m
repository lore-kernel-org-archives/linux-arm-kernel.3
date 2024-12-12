Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvFzlbXEBoeLfR6wopNviGt20jspaAB1Gg4QK1MAff8=; b=orTXp8vworC5veAVARojhhCY3o
	n8+kLOOFXOBX13FU9xKK8dZuXFdyOZPaBEolXWizxdNwcOFeOralRRvLPjaJ3LkpCRtAK/Tdv3NiI
	laSZY1iDBP2yx71+L2Zg/ymQHNXUBRYPgKLr0ECdqTSIPHZIMeGmyh36rdhxgxBIXzwjYFHqCNEDf
	mHrUqC8S2LWjMZ/uNxqrajyACtbMTp+Bx9dwl9NgUXwdTuFsYZBR+KSAEx/6SnP3oE+We0b1YRo71
	XDVxmwAw/FQnxTcwRYm3I/wrzbLAMJauRJV01pj+lVPShG0AIEa0mNcChul3yHfZ5akWZGemEHjim
	gboYlmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZdf-0000000GnSq-11lz;
	Thu, 12 Dec 2024 03:13:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZca-0000000GnLk-2nYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 03:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733973130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TvFzlbXEBoeLfR6wopNviGt20jspaAB1Gg4QK1MAff8=;
	b=NnYWs08n3c9LdjhxA6+JPUNY8wasjSGvLKobGXsnBkOdic9ZCdlE16seNrChI3Uq90zsW0
	PVwevOrjSm4zyxdlGB48BzweRgaSxNu7vtLg3LI/GPboo8ys9jqycB6LFrZgw2S4cC0C6j
	wSQlt35voLCniKzk14pR6Abric+x02Y=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-3LEv8XVhOJWWlAhV5RSoLw-1; Wed,
 11 Dec 2024 22:12:07 -0500
X-MC-Unique: 3LEv8XVhOJWWlAhV5RSoLw-1
X-Mimecast-MFC-AGG-ID: 3LEv8XVhOJWWlAhV5RSoLw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C15FC19560BC;
	Thu, 12 Dec 2024 03:12:05 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0D891956054;
	Thu, 12 Dec 2024 03:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 4 of 69): Test report for for-kernelci
 (6.13.0-rc2, upstream-arm-next, 2e7aff49)
Date: Thu, 12 Dec 2024 03:12:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <90068.124121122120700101@us-mta-207.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UTdLG-MOsdgSY0uyPkFemaJqY6kuh6ZNYv18Rm-ZvUk_1733973126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_191212_783840_790E0B34 
X-CRM114-Status: UNSURE (   5.87  )
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
    Commit message: Merge branches 'for-next/core' and 'for-next/perf' into=
 for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1584886177

Tests that were not ran because of internal issues:=20
    Reboot test [aarch64]
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


