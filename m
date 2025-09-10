Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1420ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYMy2/LLnu2KAOtRSTu6UdjE6ow6Rx7TsQICVL6w6ak=; b=IbTkzDeRjvTnrV75jvynMFxUc2
	ubXjUPaikTGNdSG5gfKkqACItS7qSjynp6a8vG93etjV1hCI0A62RxAxqnqolYwlWm+EZKjdyohCK
	pTCQCAncj0ziGkoPYPtElRRPJ7VQxDfzZyjV4QHaL0ZwXEs7rZFVZm/Tr/TSuH4/XssDhomuzbBDM
	1WrJp7n6Nx5rlBldTfMFJtAkBHb5dwmhvrarE/YfHq6GahKwJmaYMhg+hXqc5P8GLzoZA+e8GCb6u
	9bb2HaTOM/aIey1lzvQYDYbyyQmFUiRAHEz7njzNRZ4/s2/n0uJlgpJuDDuWTlbi/HQEsmhN3t/lo
	MCpesDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKtk-0000000EOSj-2gFs;
	Wed, 10 Sep 2025 13:30:08 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKtg-0000000EORV-3xP5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gYMy2/LLnu2KAOtRSTu6UdjE6ow6Rx7TsQICVL6w6ak=;
	b=ZIAzvfhuS9W0YBFZsT9WvS6RE8IPbvsze8s+ZRyqDugfH9xf7UFC8g+knCJUnG
	aF/2I6Gzh/IJMhoVX9d5cY6KRJd4KSiVnvWgUIeuKTiPnuH/u3sLM6cZZtLUbZ8N
	wmxbLczxBZoPFGR3ICF7zumWrkip+kq6psJO069//eR9w=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHddlIfcFo5a5YBA--.43536S3;
	Wed, 10 Sep 2025 21:29:46 +0800 (CST)
Date: Wed, 10 Sep 2025 21:29:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Rosano <andrej.rosano@reversec.com>
Cc: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>,
	Andrea Barisani <andrea@inversepath.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
Message-ID: <aMF9SKDEu4dlq_Xe@dragon>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
 <b48844bc-07f3-4fc1-8486-8968bf6d2362@prolan.hu>
 <aMFofaIczqElAsLY@stjenka.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMFofaIczqElAsLY@stjenka.localdomain>
X-CM-TRANSID: Ms8vCgBHddlIfcFo5a5YBA--.43536S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr13Kry5Zry8tF1rtrWfAFb_yoW8Gr4xpF
	W8KF4YyF4UJ3yrGa1j9a1DZ3saqw4fKFy5AryDW347Zrn8Xr1FqF4xKry5KFy29r1DCF4j
	ya1aqFWSqay5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYpBfUUUUU=
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgz8YmjBfUyqYQAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_063005_342944_5BC899B8 
X-CRM114-Status: GOOD (  17.38  )
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

On Wed, Sep 10, 2025 at 12:01:02PM +0000, Andrej Rosano wrote:
> Hi Bence,
> 
> yes, we agree.

Andrej, could you give an explicit Acked-by tag for this patch?

Shawn

> On 2025-09-09 Tue, Csókás Bence wrote:
> > [You don't often get email from csokas.bence@prolan.hu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Hi,
> > 
> > On 2025. 08. 14. 9:47, Bence Csókás wrote:
> > > Replace verbatim license text with a `SPDX-License-Identifier`.
> > > 
> > > The comment header mis-attributes this license to be "X11", but the
> > > license text does not include the last line "Except as contained in this
> > > notice, the name of the X Consortium shall not be used in advertising or
> > > otherwise to promote the sale, use or other dealings in this Software
> > > without prior written authorization from the X Consortium.". Therefore,
> > > this license is actually equivalent to the SPDX "MIT" license (confirmed
> > > by text diffing).
> > > 
> > > Cc: Andrej Rosano <andrej@inversepath.com>
> > > Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> > 
> > +To: Andrea Barisani <andrea@inversepath.com>
> > 
> > Andrej, Andrea, do you agree with this?
> > 
> > Thanks,
> > Bence
> > 
> 
> -- 
> Andrej Rosano | Hardware Security | Reversec Foundry
> www.reversec.com/foundry
> BDE1 62F4 7020 1588 8046 AE02 EA17 8C32 AB56 54CE


