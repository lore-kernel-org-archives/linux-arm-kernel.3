Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E842C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ+oZpbOIRUh6eg8KwjLoofSwHDEYp16eNDo73C/hic=; b=pUwRQUk48mUSnkHIAOokL8FyEj
	X8u4gSxX4jnxkDc+d989dIryVdic3krH46DnbKkveqxcBYg3X3liCV40DJPVjqSPogJ49gKdRkLYx
	k7gAzPcjc0tA2P7C2z1TvBOZGJ0PaoV23lqCkoqo4AgUqEz/mpjAKeVAtu7CESIqqi++1ErjAz66c
	zOEsBOkoaI8Xdjv6BlR6Sau9GUHDoeBmzz8ys0KhXzJfUTHpDawqSlFLAyn228+xa1fSNOegVtzOW
	QeBnZke7536AoYeF787Psr49pC9t7i/QcBLaNRCbdOyClwLTaxUIvU782AqtB3iZXNmOA2GBDWzFo
	Jx5xuPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE2Jl-00000006yA3-2C5Q;
	Sun, 11 May 2025 08:45:53 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE21G-00000006wbf-0yQ4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1746952002;
	bh=EJ+oZpbOIRUh6eg8KwjLoofSwHDEYp16eNDo73C/hic=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V141oJNzWHmHvuq1fYeNvh0N5iDxba+4Tghv1QI1qKkJcBosIe7F2I7zkWej02nNx
	 +wAW+0+Wc69shSQCNiwVzp8kELgW4qOF1PlR9SQDPaiBBwxyxloTSIDnB5rsPmywKM
	 2iHr8JXKqUUDPXME2n21k8bpPi+FKGt6N2TRwfVc=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E219A65F62;
	Sun, 11 May 2025 04:26:40 -0400 (EDT)
Message-ID: <95e820cf9977b8d20d7cd3c64be463285ca57772.camel@xry111.site>
Subject: Ping^2: [PATCH v2] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Sun, 11 May 2025 16:26:38 +0800
In-Reply-To: <20250402031603.35411-1-xry111@xry111.site>
References: <20250402031603.35411-1-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_012646_283170_D6113B20 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, 2025-04-02 at 11:12 +0800, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature:
> discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.=C2=A0 While upgrading the firmware should =
be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.=C2=A0 Allow
> overriding it so our devices don't become some e-waste.
>=20
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---

Ping^2.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

