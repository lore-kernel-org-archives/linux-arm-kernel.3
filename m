Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3BBC369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vER/u90S0SdkXA4UMsHIWKT1OAbjNluH8Bje8qojOyg=; b=nm52HI+N+LjwV0zKNbFg8SpDoU
	w6HLiEOmK8MYUVzPoxNebayLG0MbTHbAIu6oE0o/kch2IRGiBMLkjjBrJ+LoHbk505dVdv9IftnQ9
	c4h7NMrOxUK4JNN2wzqrquMW3P8ny6wk/Ut1aRk/QYeJNgU17yB8CRr1VKX1R2zYL32SbN0WSpX1w
	FfURYrihVlIPYJi9VskGaCsagnCBtguKWAXka77/KWXSqxjz9loqjYsisx5vOvdm18qYbKtqwHMJn
	4WGAwlX+bK9b3SrJWl1MJ2YiUI2Fdp1KZd4ARDCAAiF/Cm+/cFLLSbt3rWqulGX4CMc7unm9YHCkL
	2mKm5WxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4QPb-00000003SdJ-1J4L;
	Mon, 14 Apr 2025 20:28:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4P5O-00000003C2M-0uZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 19:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744657391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vER/u90S0SdkXA4UMsHIWKT1OAbjNluH8Bje8qojOyg=;
	b=IoGvnelvrgV9+8y/E8UfJPxGZhYC1Q8WFLQZx9bpuxsKs+cnlsgOLeC1ejrYutZDPjyaEd
	qsoafHgdP6KvV1DNbqZu6PwkUHXtIZagyuJYvnaKECVNRde32sh7hOTOG7vZhkEBgHyuZu
	IWgycaEhlXV/mUSVg6iBDuN3ZSj31Gk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-OLZCfNeFO86PPG6ahcSEUA-1; Mon,
 14 Apr 2025 15:03:07 -0400
X-MC-Unique: OLZCfNeFO86PPG6ahcSEUA-1
X-Mimecast-MFC-AGG-ID: OLZCfNeFO86PPG6ahcSEUA_1744657386
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46CD019560B5;
	Mon, 14 Apr 2025 19:03:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD3001808867;
	Mon, 14 Apr 2025 19:03:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.15.0-rc2,
 upstream-arm-next, c7269210)
Date: Mon, 14 Apr 2025 19:03:04 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <02753.125041415030701045@us-mta-434.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8WqgTndvmS60Vg3yVCzir7YzmOKKLGIkJpuJlfeigHY_1744657386
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_120314_411186_1AD1F09E 
X-CRM114-Status: UNSURE (   6.16  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1768012154


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


