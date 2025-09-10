Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED741CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKq2I1Pc15B5DW5nOnzTBvaO804siuKpXj5udWtqDZs=; b=JXDpPjx96KzPbUN23c//mfax/D
	IdWrMxyw9X0bB3fFa/TYhrjHPHteGCqRrG0EcAmL1F6SA3wKwPYGtQRqdJ1ofWlO34ryrVvb2ztri
	4GC3DUqYl+cc+NKAf4tPBRKhs5w9THLIuHuUes9S7ejN/B5GRfaO/8bHkXX4IgBbvIWoWwcMykq6L
	+ar+TpVzyAMK7VCrRYSahChrSW7Mm6bFskcViH7+VRCaKWVrUdWdTfY1DOT6e7sKz/wPJ7P9v7x++
	7tIuA/ciIcBbDhys702nTMYKsY0a8KCFr+jmrp2VSlfFqqBtVDZqE0iL3vAoYKIqdkKoVmZzFCDpm
	tPF2jxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGD1-0000000Cvp9-1BhX;
	Wed, 10 Sep 2025 08:29:43 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGCy-0000000Cvm1-3K2A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gKq2I1Pc15B5DW5nOnzTBvaO804siuKpXj5udWtqDZs=;
	b=UmRwnLK5WDCTcBjj0v5BwPktP4p4PRv9I1U1NWyAJ+Xul4USAxZaxHGKYtJfFo
	n2ms8QMwTTYfXv8jek5QAEXrYS4Jbz2pTgiyUOri0ZmtlXevvVHx99B9bKz4vkD7
	CGilnLyzHbR9FdS/+BcBWSA9bfjpZMg3wQ+6IJEaD1xJs=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnz7zXNsFoucI8BA--.60195S3;
	Wed, 10 Sep 2025 16:29:13 +0800 (CST)
Date: Wed, 10 Sep 2025 16:29:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH v2] ARM: dts: imx6-aristainetos2: Replace license text
 comment with SPDX identifier
Message-ID: <aME2149l8ncGLCec@dragon>
References: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
X-CM-TRANSID: M88vCgDnz7zXNsFoucI8BA--.60195S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoWxKrb_uF
	WxGw15tr4agFW0krWfCF1avasFgFWDZr12qwnY9FsrJF98trZ8XFn8Wrn0vrn8Xw47Jr17
	CFy5J342kwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbhZ23UUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxlOs2jBNtlMHQAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012941_143860_641A7D23 
X-CRM114-Status: GOOD (  10.25  )
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

On Wed, Jul 09, 2025 at 09:28:47AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Heiko Schocher <hs@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!


