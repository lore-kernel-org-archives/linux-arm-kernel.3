Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9B2109E543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eB+dLsG5tXfnyNIFXfqQOMNtjQr+D5glJc3VgXXmzsk=; b=IiKKkemXu2O4nzC3OUtaX9dm1h
	UvgZyccpfmnQAsyNkM/zPuz/Fclv6FrzGtQ95WgaU19cNupV9ewtdC02LxQLcZyu64U/bUwq13lD2
	ofPUG59S+HuUhWUJprkR5qdIbU3aLZHZIUlYhH1xJX/ZwiAugOCoBx133/KGcQM8Job/iiDLswRvI
	rkhaxCZVNAaepbh0PYMuXzTXNR33rAOxObsam9tn9+qwZ7dHkVqCjSM5O7uz8DzNnbm5g9WfT5R9k
	zUMENBKivHgLtoGR/t8LHUwHQd2k/4WepUWtloL71v4+Ecc+VXNbSWG37/18QUOncL802ePQ9rIAt
	BBdxiQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bML-00000004dBV-1fvO;
	Thu, 26 Mar 2026 03:26:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bME-00000004dAt-2MlE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 03:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774495564;
	bh=eB+dLsG5tXfnyNIFXfqQOMNtjQr+D5glJc3VgXXmzsk=;
	h=Subject:From:To:Cc:Date;
	b=EOR0wMesdSerzGer9QZ3uJSHa96ISOkKd/JLd+h6xt0wovzpoeic096Drj2uVMemy
	 jEQjI7RRhvADgnBKnNloQuEClQpWoSksAjGnA/cQMtHh+0FydaCtHbhvsyWvg//XUq
	 cqGyGvWV7ZOc0Z9n0pW2VBIr+ALXaOrlkLeFjuIMX49YMmIvpm0ApWprGbV0MlfMv2
	 nGVy4g4HkiChklNJ0s5q2b3NA1ya+j/GRxoZxPVD3nzvS9pQGDwrcHwQpOG1F6Rt7C
	 kjf2pu/yAxt89bNWLqHmHeKF1NlA86DgRZnLs/JueF5onfqBmDFz0x1WOWqj5BsBJH
	 AUo2McuK1U74Q==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F53A645CA;
	Thu, 26 Mar 2026 11:26:04 +0800 (AWST)
Message-ID: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for v7.1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:56:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_202606_790510_F3F32788 
X-CRM114-Status: UNSURE (   4.49  )
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

Just the one Nuvoton devicetree change for v7.1

Please pull.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-7.1-devicetree-0

for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:

  arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026=
-02-23 09:43:36 +1030)

----------------------------------------------------------------
nuvoton: first batch of arm64 devicetree changes for v7.1

Just the one change this time, dropping syscon properties where they weren'=
t
defined.
----------------------------------------------------------------
Tomer Maimon (1):
      arm64: dts: nuvoton: drop unused syscon property from watchdog node

 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)


