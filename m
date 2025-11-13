Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F226DCD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wNRUn79dgjwfF4u3BUDs23zer2xUiveMU6qFtxndxjo=; b=pzgDEtQce+ywmpvsU03592yWpW
	/2pVQ/ifNJl0SrZ7XpHH9JdyPNoDkz3FTuHxjzlBWMf3EvmLv1TY0wvuko5v6knrMLg6Vu0ap9+gS
	pz1qe7oPZjZ6QEMwBsrPbLh3foqN3vmrx6YeF7GIOINkdmOioCEyIfK0hMhw12EJ1AN/05bntBqMr
	yWerFHFLBh9ekM9YtGjjT9nqJqVgg9qAZTJxwg2WoDCLfQi5zFH7K4cE2p+FUvn7VfGc2gTBZlaTO
	h1BaCBXWmeKsXtuulqnwJuVG4jv5jQi1V/0EDcGYbFy2Qy+dGlRuivJEAVIasUQo2YMTZFiE17WEo
	Edzsb00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgAs-0000000BDAp-1C0a;
	Thu, 13 Nov 2025 22:52:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgAo-0000000BD8K-0WbM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 22:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763074331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wNRUn79dgjwfF4u3BUDs23zer2xUiveMU6qFtxndxjo=;
	b=fFxJH7cf6w3z2gOTJLQtKqsGLPQppAmtjTfRg9bOljZOfqxV6bbDAP7luYmjqXaly5OidI
	NjgdaCTHnfsMZHtlxqRQrpnpiBPG6xSxWUpuKipu3Pxy9koWpL2CkKTtsnmjwWk8kqCpAx
	5iTYjvsg6Pol78bPnN8uUU+c6O+uH+8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-1JOa_i7sM9WKyd3tkGRgLg-1; Thu,
 13 Nov 2025 17:52:08 -0500
X-MC-Unique: 1JOa_i7sM9WKyd3tkGRgLg-1
X-Mimecast-MFC-AGG-ID: 1JOa_i7sM9WKyd3tkGRgLg_1763074327
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6AD5A195606E;
	Thu, 13 Nov 2025 22:52:06 +0000 (UTC)
Received: from [172.20.120.109] (unknown [10.30.44.79])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D3C8300018D;
	Thu, 13 Nov 2025 22:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.18.0-rc5,
 upstream-arm-next, db9030a7)
Date: Thu, 13 Nov 2025 22:52:04 -0000
To: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <05487.125111317520800587@us-mta-609.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -itfwJIyWUS1MSuJ2txzm1za-VrvbpLh9bcYOnBKZ-s_1763074327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_145214_245519_8C482CCA 
X-CRM114-Status: UNSURE (   6.58  )
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
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2157509586

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
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


