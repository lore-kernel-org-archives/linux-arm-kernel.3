Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9E7C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7sgwR+WXooqXINcTZCwW9yjXbU2uwikDwWN3ARKaYFo=; b=oAYK7HQFVm4dfYucNBAkvUSCms
	8AyEkWphgOvUOVpgA6F+6nueS7lvByMajTTebeqUgPyt9SDaHxJsnt93ZFEgpUSYxeEBkKGEUFOov
	7DmJptQB9AGJWgOLc2ut5cj1CAD5IU1BX/b2FqndbJabRof+GooXwAVQiTQTBiVhYDP0yp+aKKHIu
	RpBE0xowx6FSq5ngpE/+zUAd12y3iUOhvQPwCqiE72mAfZI0F6CUBwceXhRIc3uGvDldAnOC8Q76X
	ZwFfqvy+ryaOfca+XYa2sLznyrqFgvAyztGZt572lgC0iGPCJwFdvKZRZ+r3+aU2H0USCyPvIi9RC
	XG+GArdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9imQ-00000009Oyt-1lhk;
	Tue, 29 Apr 2025 11:05:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ikV-00000009Odz-3Gyo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-Id:MIME-Version:To:Date:Subject:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7sgwR+WXooqXINcTZCwW9yjXbU2uwikDwWN3ARKaYFo=; b=owLO0KLnOBsrTZg4UOqPQ5ERxt
	aT58Cx1l9PDaO3bcBslCn+gBhKFFuOgsvZTcQtzhvF3bn033/uXyTQs3donQ2BnBeMXDA2QdXF+Eo
	f55SaXmx1B1flm6sEPuxXY96oAKhMMOpVjvQHdIB+jS1RzaVnT3i9L+r/izEo9PHIkF4v8Y/7w7TM
	UULVkb7HFMLNxL4Za4OoQg9iNSHkZTHNfT9vHnDPlihMiJgZZqMldEh4B3Cp2RNhm3H4DBAL1BMKy
	Hp5r5n+vkRkPfebc2Z/dY110uLIHJS1ZhBp+iIkf5r8nrl0CIC+uUVuVmICO4vnoWhpqcdHuMxhLW
	Bw8rDMzw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9ikS-0000000DGzr-2X6O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745924613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7sgwR+WXooqXINcTZCwW9yjXbU2uwikDwWN3ARKaYFo=;
	b=Uwec0xEns7TAgjC6DkN8o0gJn5sSDiGhDboyAxjNK9Y+CMbzqgQ9rxRXbE3KvJdyDCz72M
	qJT98gQepLJ4pIds955azPJqvd1wLCWwT7kjBcB/peD+Plb/p3QsAFR2ohzNsKah49FTO3
	EOuO1b6rHhnIjKfjVJB1bstnc9cxjAc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745924614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7sgwR+WXooqXINcTZCwW9yjXbU2uwikDwWN3ARKaYFo=;
	b=QQBBTRu0dj4aWBECuH34O80aSI4IJdJygK8WUFOn1VdbJMYW9fLZVrTFI/n0/5YRgDiZz5
	P1r+4T8Lr4pTNmu3sYiWA175Vfhnqk1GzEVBlb3K/vJ6H9yaWtWges4JX3VfKfc+9I1M1h
	PYGqeETgaqnT5u6BfCVFMfaJWTwsmjU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-5zKGfOiQPByudJ3SmTd0UA-1; Tue,
 29 Apr 2025 07:02:07 -0400
X-MC-Unique: 5zKGfOiQPByudJ3SmTd0UA-1
X-Mimecast-MFC-AGG-ID: 5zKGfOiQPByudJ3SmTd0UA_1745924526
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF67F195609F;
	Tue, 29 Apr 2025 11:02:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 014751800378;
	Tue, 29 Apr 2025 11:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.15.0-rc4,
 upstream-arm-next, 66d2d510)
Date: Tue, 29 Apr 2025 11:02:04 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <27374.125042907020701570@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MGDkC_3iVqUyc5L5-3Z4V4mo0bMfcCRwEyxGgMAWEQY_1745924526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_120336_836316_CB8BBFD0 
X-CRM114-Status: UNSURE (   6.71  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1791553047


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


