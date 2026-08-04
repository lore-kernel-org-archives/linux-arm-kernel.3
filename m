Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0438CC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXzc8xnYbWowhoGDOoifA47wg1cCzQKm9c6k8J0ADYE=; b=u1C190Cn7Omc4lq6tMN4xI6V0F
	xcMN1b9IHRl9E8CXnxPhJK8NlKdfVUN/9zKQJRIchVVSRACzKWYzeqnCwQKScqymgO6XDJPU7JXZf
	RSTDpW0+g/tSRNAqvpZGN69m3tNGlAmb2+JnxlbxVSvDkc9rZbZVpWMi++AqZCMtST9Tn7HnILctL
	eg/kf1waGBsnU70UhwxU7ir/qsqkGzaX9wT0vYM/iU5lh0205ovGqZlvYsfvwaz4433TcXHz88hXf
	bzkC2q3gJhBU8Wf9HuXoFA6OvycrWT4vd/U57xzzcAHUyy0YbXq7LpPYpc7r02eBLTJh4sQipTwDH
	ho1wAqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9BD-00000001Aot-33ex;
	Tue, 04 Aug 2026 07:03:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9BB-00000001AoY-09Xz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785826990;
	bh=qXzc8xnYbWowhoGDOoifA47wg1cCzQKm9c6k8J0ADYE=;
	h=Subject:From:To:Cc:Date;
	b=H4K9HCfPzmEExrjN+zsd2ZVcn+t2WRv2iUUva8SxCmNBBjexcqtLxevBzZDC0+p3K
	 AmochYOVQHZLBHkUuzNZk+ScehrWG4l9y0FWf1LFpeVRLsr/dHtE8/AOulT0KZhLNG
	 idNvzygCWS/c5xu2eu1vV3pRxCXebHEkj0KK05hRqOtVTrUJXWz4RsZJJDjbJy9KbJ
	 dsE1oRDLTfbMzKhbpMqYZau3k4KZIWE2VFL1tspgSTBaIWjsP5C3QCa69pdlgXtVwZ
	 kDrBVwsQ+K0rYQgVw+EY0I3c7FWMVDuFzZU8O2AqB7rCJA2PGpvM3SYsU7wHMtiBig
	 QAIc6a3IjviPA==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2F47655A9;
	Tue,  4 Aug 2026 15:03:09 +0800 (AWST)
Message-ID: <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of ARM arch fixes for 7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:33:08 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000313_293585_56E4A9CA 
X-CRM114-Status: UNSURE (   5.83  )
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

Hello SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-arm-fixes-0

for you to fetch changes up to 8eb052f48331474c2789d07b7f11165c323bd2f9:

  ARM: npcm: Fix OF node refcount leaks in SMP setup (2026-07-22 23:11:56 +=
0930)

----------------------------------------------------------------
nuvoton: First batch of ARM arch fixes for 7.2

Again a one-off change, fixing OF resource leaks in the SMP-bringup code fo=
r the
NPCM7xx SoCs.

----------------------------------------------------------------
Yuho Choi (1):
      ARM: npcm: Fix OF node refcount leaks in SMP setup

 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

