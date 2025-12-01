Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8599D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBFbnA+5/4ID63wzdmt4DH3jcYjIMynCJ2BikqCS29E=; b=dVXoxcZ1TE68vvHLZdqd4KwLMy
	noz65dG+gSfx6tFmUAT8MWRcizqSYRHVz3/Uf+EBfN7CFAOh7LK7HbO32uVJ8nmu8OSOPjxnjTVLy
	ky4y4wevVENorcuUk4QRvwcAyR9AiVZGXwfb9ji216c1H90uctqdfOl0n6qLWyRLoAOi8//8anKJ8
	Y32eCo5wBLz/UTo5cUFUQvL/qqu3hyV1XhmeHWFYgt7MJOOSfYw5eYJvArkAwKCVp0W+KE3M5XUpz
	QYXUAxTlgxyYRhxi55sIwUxntFgKav45ft8Djg3lqzaoXZ5tFhefxlC56JFcII1q0nK/6GkV/4dIz
	U96wZu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gU-00000003W0I-0lyd;
	Mon, 01 Dec 2025 12:07:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gS-00000003Vzl-2w6v
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Dec 2025 12:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MBFbnA+5/4ID63wzdmt4DH3jcYjIMynCJ2BikqCS29E=; b=KQ8DbFyloe0u7jyOPj64mEyvFo
	ucKoPNtA/nbhu/ciJo1JoeC/SdPzVcHdeEYYpsGFjfGsKgSL8pM7eGZU7fuL874taWk0gqGhcz0t8
	ia66s3PixORaJbwA4RbLRhid5T1TMUMEnYGU4TVOtr9fWsujDzgsWpamX+1sSmav4sJWX22seaB7j
	clw1X+F1LWY3biOisbo9dMxe0dDdel2bt24dKFNsR4zxALcFwCKW7756DnMZI95+bMuUMOmYkESUo
	JJbKherh1dhHsm4p4WunMa4TpLJzg6YsGQUmuhbsM8jKxSATwSOUa9ZZXV6xsKxSqZfrDcx/8QUPa
	Laf8q4CA==;
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1oq-0000000FjVO-3KTe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:11:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MBFbnA+5/4ID63wzdmt4DH3jcYjIMynCJ2BikqCS29E=;
	b=fffmOq++fhH/YvgRMGizRjJ7ZGTtOJSo07rt6Ra95clSadN5W3JZMA8xGwxL2d3B00WVGfkoh
	z/Ajy7IVNsEdZlHLAYQJt94cCkgVgZH3CZhjLEMOUe9VSJDkyk8oVaKqEJZkMWukmLNp5H7YQXi
	hDZaO5JJVUB5AB76ic8cGmQ=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dKjJR2D9LzmV93;
	Mon,  1 Dec 2025 20:04:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A84C14022D;
	Mon,  1 Dec 2025 20:06:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 20:06:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <ldv@strace.io>,
	<charlie@rivosinc.com>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<akpm@linux-foundation.org>, <mark.rutland@arm.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2] syscall: Cleanup and improve syscall_get_arguments()
Date: Mon, 1 Dec 2025 20:06:31 +0800
Message-ID: <20251201120633.1193122-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_111149_166633_E15A3F69 
X-CRM114-Status: UNSURE (   5.22  )
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

Remove unused SYSCALL_MAX_ARGS and avoid memcpy() for
syscall_get_arguments() for arm64.

Jinjie Ruan (2):
  syscall.h: Remove unused SYSCALL_MAX_ARGS
  arm64: Avoid memcpy() for syscall_get_arguments()

 arch/arm/include/asm/syscall.h    |  2 --
 arch/arm64/include/asm/syscall.h  | 18 ++++++++++++------
 arch/xtensa/include/asm/syscall.h |  1 -
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.34.1


