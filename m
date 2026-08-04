Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3353C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1A/KBD+ttLHFVfVvYGOtSgdKkMaEe4HsHsCsRXDAhhc=; b=vc+7lGfhVwvFV0LGJtHzm0XvUJ
	qhe6I+9bQbZEfkxTx4gLZDNXA01DPytwPrK9x731P74KeQuN8YhPBFzQUv+qthAkinyji6Vyu86ZU
	wsU/5pywj5oaU1ghUhAAavtF2bBNQVkQduLitQPoYiUwO+To4KkDvtd0DOqac2kGWPMlYcDkByl8R
	uuy7eQTE/d1Kaeme6HVqHZvx1dxoSBOUI368byVGUAaB+I754Yjcyc7Fa2LQ4sSB9+goXdWnuo2W1
	CjCpiyPePWrd/FrT74UTlWUrQ40Z3HQik9BGmmQ0AO6VvkfoHLe+o1mApeTD/Vr4QKkDDeXvr0TVm
	ohE7GeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7cM-000000012U1-1Lyg;
	Tue, 04 Aug 2026 05:23:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7cJ-000000012Tc-2rRm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820985;
	bh=1A/KBD+ttLHFVfVvYGOtSgdKkMaEe4HsHsCsRXDAhhc=;
	h=Subject:From:To:Cc:Date;
	b=IGFmogKVFy0r3QOEkmBcdVljcYoReqRdbjf1dC07PNyXN5eBb+mX3YMtsQyjUOYov
	 8nlouW+/2rENq7/VDrZ1K5cyzU+YRHc4a7ujb+kBUu92f/PkdO5a2sesHUonrIj3JV
	 aIgUWZLKBPXdd1o5oj8jClv9/lozGGpkdKZ0M6gdo6lYr1rvcjKYB0DCFvkCbXhB5t
	 hE7+TdxHE2lur3aIX8zizF67s91/C2diAmUPk2JZc+MGzrnJJFV0eIWUkXeyXCJy9s
	 VFsK20M1+BNUjL3bsMflX0CxvFqNGcSKIvU36nUS7YvuNrlTZp60lSxuSemlbMkqdo
	 AnyabYUQdthvg==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6C895655A9;
	Tue,  4 Aug 2026 13:23:05 +0800 (AWST)
Message-ID: <6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:53:05 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_222307_911897_31BE70CA 
X-CRM114-Status: UNSURE (   5.19  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git nuvoton-arm=
64-7.3-devicetree-0

for you to fetch changes up to 60b9d5b8ca8b09019d8b162bf41fdf24f847fa02:

  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes (2026-07-22 2=
0:27:35 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for 7.3

Similar to the 7.3 ARM PR for Nuvoton we have a couple of arm64 tidy-ups
from Tomer.

----------------------------------------------------------------
Tomer Maimon (2):
      arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
      arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 33 +++++++++++-------=
----
 1 file changed, 16 insertions(+), 17 deletions(-)

