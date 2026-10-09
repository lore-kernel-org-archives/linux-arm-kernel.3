Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD299CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=waRfuVZmS/2NjhSFY0tBe8TyRqDp7UrLfXWJQxU09HU=; b=phk4r0mTeLiQBKTH6BK4RkmA0j
	GWOsHJQUt8EUXMpEjWq6Pnc3UHvuKg2nVVB//mNvO4HBeswqUSGr0cdDuNnTDQk6bjvEOHvy//k0d
	xNork4RDKKqA1sxOSNHsM14IOUAN534heXNdXpvSdswSt0y75gF65HsrezjqKlAdarEaAr5tObKM5
	qqUzAMlPO0GhFZ3z2zHspV+q+2ZPqdtYItrI2+y1dq5omwH2EKWhNLgu2AvNHg8L/OLHn9yWc+evn
	mopD05dssCpcN6nMt4wmgfqxvviiYV+E0ENmzHYsxNEn9SCXRwLV2f2e6OwD5IWioZ9XAXducKbhr
	wfADA0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyVf-00000005CGZ-2BF2;
	Fri, 09 Oct 2026 00:30:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyVc-00000005CFG-0RUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1791505837;
	bh=waRfuVZmS/2NjhSFY0tBe8TyRqDp7UrLfXWJQxU09HU=;
	h=Subject:From:To:Cc:Date;
	b=Q3YhmVQwB9+RIreU54jWKPRuoPrE6/uvQFVIUI651pGL/jGOMTXh9GG3IErHcAyBH
	 7Y9/RhA49V7KdzAVyk6rotpaLUqyUeZdGZCQkzg8pnz5wkJSnVOHY/sy5nabTCX63r
	 A+/4bOC9Pn+WaqW/f77hOCnbT4H15d7WvwuPTa4x5oBCHzHifMZoDr4H+Gk+fgfqF1
	 6LVHodLQGEbw3EPxT7oydKAq66+LwK5C2KxtEV5ltFnw7RAPY0mvbWuosvIoojvF6M
	 wtfZejvKe8e4qjIxB+mdp22nNpclx/tuaNAfwx4r6OvvSg5rLL8MxrBmEOfleGY6zk
	 baaDhldkLzkVw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7CA046F499;
	Fri,  9 Oct 2026 08:30:36 +0800 (AWST)
Message-ID: <1a070f5c87b1e4e765a7e481b53f66242a9753ec.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for v7.4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Tomer Maimon
	 <tmaimon77@gmail.com>
Date: Fri, 09 Oct 2026 11:00:35 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_173048_354046_B78683AE 
X-CRM114-Status: GOOD (  11.57  )
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

I've been absorbed with efforts outside of the kernel recently so
there's not much activity in the BMC tree this time around. This is the
only PR I plan to send for v7.4. That said, there are are many patches
on the list that need attention. I will get to them.

Various revisions of series I've applied from Tomer have been on the
lists for a while. I've worked through some tidying with him in recent
days so we can get them applied. There are still some process
improvements necessary on his part with regard to sending patches for
the BMC tree, which I've discussed with him. I've had to lightly rework
v10 of his series in order to get it applied as noted in the relevant
commit messages.

The work in the tag is currently in linux-next and I am yet to receive
any negative automated feedback on it.

I'll be travelling for the next week for the OCP Global conference but
will keep watch for any concerns that arise.

Please merge.

Thanks,

Andrew

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-7.4-devicetree-0

for you to fetch changes up to c895734d0ec6c3e94f1fb3a0575b9a7076201d9e:

  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes (2026-10-08 10:23:=
24 +1030)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for v7.4

A short series of enhancements for the NPCM845 SoC and its evaluation board=
.

----------------------------------------------------------------
Tomer Maimon (4):
      arm64: dts: nuvoton: npcm845: Split APB address ranges
      arm64: dts: nuvoton: npcm845: Add peripheral nodes
      arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
      arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 700 +++++++++++++++++=
+++-
 .../arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 439 ++++++++++++-
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |   7 +
 3 files changed, 1141 insertions(+), 5 deletions(-)

