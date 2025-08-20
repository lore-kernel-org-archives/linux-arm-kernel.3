Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B393ACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RofOJEfn1P9mwF+4wr1q1ngNmkqmQURn9mwJjYoVRs=; b=snw5UTyrBRlSUFbrQugAa7h6ZL
	6yCpJW0vRm9cveYbi7ijf11qPQJK6d8VwSjGkDsyjmhJWo02kmZpnDsdg7oa4vr3tDpm+LeZcBax8
	NfyCV4M8PKc/1Rz6XA3x/TYxs7565tKCzr4C7rqVEonKSNqRQOE4a8MDi+P1QfYRfFLtBxkYKuhHw
	1mk+R8Y6Uqt25EDaYAo1r4eyE0KtcH9zZcxWg8UwLKFUHZkiVfI05M5ArIPSZ4tPThqQUrLIx3wiz
	VkOP7tE8sDPd/x/4v/nkKSHBpA7kxY+wOzQvhMwzzxvEDjntdxL0hiM4fg6NViZyA90hpypjOUilq
	WmnEoxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZCH-0000000CElW-0R3N;
	Wed, 20 Aug 2025 03:09:09 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZ9b-0000000CEQC-2Mtm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 03:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2RofOJEfn1P9mwF+4wr1q1ngNmkqmQURn9mwJjYoVRs=;
	b=PO/0gJEuI/g09HqkDHc1OzLiqd/rrnJawcn/rOV2MiA/sZyBeblvSORzIOo8D5
	VgAZPcKtlkgBTaDTE+Ip/bs06N0QDUbe5e0d385HyKmJDogo5U1lXOlLH4rQH2iQ
	6deyueT9LN2/p8m33dLryWar/O0t4qWTmjHIED9SygDxo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnBYuVO6Vodyb4Ag--.56412S3;
	Wed, 20 Aug 2025 11:05:59 +0800 (CST)
Date: Wed, 20 Aug 2025 11:05:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH v2] ARM: dts: imx6-karo: Replace license text comment
 with SPDX identifier
Message-ID: <aKU7leerEAZHf4Qr@dragon>
References: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
 <0fdab5ac-604b-46fd-bd25-cfa7afd06f98@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fdab5ac-604b-46fd-bd25-cfa7afd06f98@prolan.hu>
X-CM-TRANSID: M88vCgDnBYuVO6Vodyb4Ag--.56412S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr15Kr1xCrWfGry5WrW5GFg_yoWDKrgE9F
	4xuwsxCw15KF4I9F4fGryavasrKFy8XF47XwsYvF9xZ3ZrGryDXFs5WwnYvrn8W3yfZ3Zr
	CFy5X34DCwnFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU86wZ3UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxh43WilO5j6owAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_200623_917238_4CFA2802 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, Aug 07, 2025 at 04:46:26PM +0200, CsÛk·s Bence wrote:
> Hi,
> 
> On 2025. 07. 03. 11:09, Bence CsÛk·s wrote:
> > Replace verbatim license text with a `SPDX-License-Identifier`
> > 
> > The comment header mis-attributes this license to be "X11", but the
> > license text does not include the last line "Except as contained in this
> > notice, the name of the X Consortium shall not be used in advertising or
> > otherwise to promote the sale, use or other dealings in this Software
> > without prior written authorization from the X Consortium.". Therefore,
> > this license is actually equivalent to the SPDX "MIT" license (confirmed
> > by text diffing).
> > 
> > Cc: Lothar Waﬂmann <LW@KARO-electronics.de>
> > Acked-By: Lothar Waﬂmann <LW@KARO-electronics.de>
> > Signed-off-by: Bence CsÛk·s <csokas.bence@prolan.hu>
> > ---
> > Changes in v2:
> > - fix message tags and typos
> > - collect Lothar's Ack
> 
> So, what do you think, is this patch acceptable now this way?

Hmm, I applied it [1], didn't I?

Shawn

https://lore.kernel.org/all/aGuOO36kkTWtM2yy@dragon/


