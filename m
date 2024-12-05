Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25333E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WUrF8YRFW5mT7zPjxtFPPCkjDeiW/D826tPc9KJ3bI=; b=LXFgmBkN8eJE16VRGbQPycQewh
	hwUK673/S77na90O6vTgPnKf/leQkHSLSHhlxIpEoy40pjtXnnftq5a1pP6ckonQcIWdmSKwP1YiJ
	EtPGsjFRJAiq0jUNCLPxSco1p4kHdNK6x8z84oQmRVlXfyo/6B0v/0sUgJ7FjHQthqEyR6gsEH1b/
	8urA15HzI9/+Lb/YkL9mbEiX0L2bOHTCKG0/5HWWn1r1Dg4oaLEQ3t8FA1z9KnYi79Gu88BaDyVbF
	9VksxCoNl2FpIBlhau2z+PCez3OdO1wwm4C1QhSMNNCUMVOdCGJHF1NJ2mDPZOGElaLjGHb0S7u24
	zo+NKAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Zv-0000000FQZQ-2fei;
	Thu, 05 Dec 2024 09:55:23 +0000
Received: from lx20.hoststar.hosting ([168.119.41.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Yk-0000000FQMI-1k8Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5WUrF8YRFW5mT7zPjxtFPPCkjDeiW/D826tPc9KJ3bI=; b=DYKpTZ2gl/ZGzJm8tQJrKBFA0b
	I/uIBIN+y5zcGlDjCCeyulaZqmdAjKA5q7ndvyTqUOJGpa93VmdRGdH+r15Nzu+27qEAZzEHJMWcz
	70rgvN43haRuumvvQYDIYB5KbDWqNeLshHQH8sTYdqi3fu2As8Via2Dr4o+XTl71TfNE=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:52757 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tJ8Xa-00BvzZ-Ct; Thu, 05 Dec 2024 10:52:58 +0100
Message-ID: <90ec4241-c8d2-452a-a7c3-e983e5df1872@emfend.at>
Date: Thu, 5 Dec 2024 10:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: sony,imx415: add required clock-names
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241130141716.1007115-1-matthias.fend@emfend.at>
 <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015410_446712_6AEF2CF6 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Krzysztof,

Am 02.12.2024 um 08:56 schrieb Krzysztof Kozlowski:
> On Sat, Nov 30, 2024 at 03:17:15PM +0100, Matthias Fend wrote:
>> The imx415 driver expects a clock with the name "inck".
>> Document this in the bindings.
> 
> No, fix the driver instead of bypassing review. It was decided to drop
> it during review, so you cannot reintroduce it 2 years later claiming
> that's now ABI. Of course original submission was buggy and never
> tested, but that does not allow review bypass.

Sorry. I discovered this by accident when I was using a copy of the DT 
snippet and realized it doesn't work that way.
I wasn't aware that this was intentionally removed (at least partially) 
during the review discussion...

Best regards
  ~Matthias

> 
> Best regards,
> Krzysztof
> 


