Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D1BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vljEVmCBMVf7/gaihdY1Pi6lbeZJAQVefneDlx0Ozrc=; b=Bn4sE2jBmaqNhHR7DLQVRqlf99
	8/to3JiuHMce79aqd1CgIKZxsk+wvFcWhZwCqcXKY2HPihfkyXIlMZanvIOKyoUkyRXXXZrmrWfly
	k/l9DFXISiPrmbHBAf6qi8H0Gbw+/Eo9KhtYxnGGJFz/ijPJHskyda+zx6sTWMt/affnqi0CTHpaE
	IAZsq36jG6xXgIEzsO/eJ/e51oCgAhRfrIZPzwrKcDzqJe9VqVNmhoA+jSQymj1AxOf4ZlLDlTCHn
	6gsXrb8D0yB/T1yulLtggoOMxpRlh/wk0qUPzFurvDVIowSsk28KsUDbmx/hA1TuGgYTjyb+mExkk
	dR2fm4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvM7V-0000000D8Up-2IsC;
	Thu, 20 Mar 2025 20:04:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvM5l-0000000D8Hl-3v0R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 20:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742500930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vljEVmCBMVf7/gaihdY1Pi6lbeZJAQVefneDlx0Ozrc=;
	b=Up7MNeXJ3/TE1dPf+1s06jO2yf3zDsUweImpxZ2U2b5CzL7pmwiFpU6hPA+oSnXiJ8232B
	F79cb6eUWEeZ9dot84hqEQYOaiyFR1yR6AtJgK6stlOkM6tTAD/nyW+S0n59qrBcGOvhwx
	uB+Q1mzDt5BKE6JJJtBsyXZv44SoiXo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-i3g_ouGPMKuoAYdmsonGcg-1; Thu,
 20 Mar 2025 16:02:06 -0400
X-MC-Unique: i3g_ouGPMKuoAYdmsonGcg-1
X-Mimecast-MFC-AGG-ID: i3g_ouGPMKuoAYdmsonGcg_1742500925
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 812B618007E1;
	Thu, 20 Mar 2025 20:02:05 +0000 (UTC)
Received: from [172.64.12.41] (unknown [10.30.33.24])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D70FB18001F6;
	Thu, 20 Mar 2025 20:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.14.0-rc7,
 upstream-arm-next, 8571575d)
Date: Thu, 20 Mar 2025 20:02:04 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <55408.125032016020602450@us-mta-650.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TDlTbn65JdFhbP4Ha6TiIh5mL6CKj0y2Y0aeQZ4iUlU_1742500925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_130214_040254_C9E68547 
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

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge remote-tracking branch 'will/for-next/perf' into =
for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1727130494

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1727130494-aarch64-kernel


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


