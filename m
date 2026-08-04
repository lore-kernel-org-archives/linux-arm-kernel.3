Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22879C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=htfmEBxdWe4p5gPSeaGp5t+0L7Q2woMpJDia0Suxgoo=; b=S0UveYqP7florCrp+CC1eM0zzu
	KFxFxRBwcr3GrceLzjrepBygzXgxDLdZjMJnWrWbQjJNmFtjhESd4ndrerrTEIoMQG94igBCXiMN/
	OXtEO/1sCnxu0B6i5RP4M6PdILzxdxNExFpA8wtXFymGSp0BcireUm7SlD7scqSDEOYWo+ZVDJBay
	zOaSitU3AkUAiso2msdZyAOoixI+cPJiIe41HVhDsuP63hL/VMDX4YZUGNaj2k2ydt0vGLacJ/A8n
	2VSizXqRCCXgU9zs2mAzUcgnisJrkrJbGrblCETckABi5UMEcdCJsihKaT/YC6K4wtW931K0Xqw4s
	WcpaQ8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7PD-000000011W6-2Kwn;
	Tue, 04 Aug 2026 05:09:35 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7PA-000000011Ui-4Ayc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820156;
	bh=htfmEBxdWe4p5gPSeaGp5t+0L7Q2woMpJDia0Suxgoo=;
	h=Subject:From:To:Cc:Date;
	b=BqMdCbTkkdnKbfagIRggDfKtkEFATJAkuuLRP8aGfremiaQB/VJJJ6AVE5E/LXkXn
	 ViSIaIIIHmziTH4bhotsbtvs8475vMBqtjUhPrR6FSH5XAtt93JutXreqpXgMm2/cS
	 BHG2zvdSDrjdi6VXClLaFx5GmZp6rrPu2/cmQhDlftLRNyyOKZCaXLJEZY4Hp0+QAt
	 sJ1Xyhf0lBn1xVqVkIqT3yaipnwl8jOJavzSQak/y66etc7QAOnV0aFRpAsfKSlBKc
	 nskKCMhjj6YNO3Djb0A5nS21qifWdnUXF6nN8D8IoJoXFwxTokSUocgfiKhsrq5fIS
	 eENXhCNkDgd8A==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 436AC655A9;
	Tue,  4 Aug 2026 13:09:15 +0800 (AWST)
Message-ID: <47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:39:14 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_220933_223341_0D4E2E1E 
X-CRM114-Status: UNSURE (   6.11  )
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
n-arm-7.3-devicetree-0

for you to fetch changes up to d7cb66fad58d8fe3cb8c43f5e48dd51a8c15358c:

  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names (2026-06-29 09=
:59:10 +0930)

----------------------------------------------------------------
nuvoton: First batch of ARM devicetree changes for 7.3

This time around we have a couple of cleanups from Tomer that make way for
improvements in the bindings.

----------------------------------------------------------------
Tomer Maimon (2):
      arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
      arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

