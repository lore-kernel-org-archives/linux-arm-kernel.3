Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24521C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxyYoBi3DgL4L83PBPGHn8OH+IryRzFYeqAsCylOSvo=; b=FvFwpY59rd3198iR0BLHIcVoKW
	a7gg5D18nIslUuDN8MMCUQzgMrtqFXgci7o2z8gt5HYSpByGxTRMrlRqrlrziZIFaSRUfEAOclW5R
	xhAH6vtBEgLJ8y6njyYmGMHHX/bTbBhleJrxdthd4qbwgKOIVkWDqFf4v7ocpNs5Wu6PWFRVlDRRi
	a0jNjxYk7WpwihyMZCcLiEc39w1V2vSEKG7GCwA9ArKLEWd9F5K/e3QFKWI7qzhpOBZZ/cCDLprON
	PW0bPrYJkHmC6rQ4o3ibsJme6kFd7i+J2olajWQJoLMXEZqtkEQO2BL1EP09sGDlosuQtIS4UbUYE
	B5R+xLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KRF-00000005Y2g-0hTQ;
	Mon, 28 Apr 2025 09:06:09 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K6U-00000005VEp-0AmW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:44:43 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 16E47A06AB;
	Mon, 28 Apr 2025 10:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=wxyYoBi3DgL4L83PBPGH
	n8OH+IryRzFYeqAsCylOSvo=; b=K35f0nYNDFT1Y4R6KNbrf7God9fUefsg/NU/
	lJAzVssoQE/gfdvfu1j1qWPHA/j0EbtInFVCmZeoVKlILUPNKNgcM3+u9T65Bsm3
	gbNCUrifGBZCgAX/oRnX/k3IR98iMcTVFGn2I4jgSv3fEg3/HmYlvRIO3sq885sL
	foz9rpvtJEXMLLV69BbWDPCZzLAFCeof2LcZxe46u0Al1bfjUTDgYIRKEd3/aE/E
	JN0XBZR2tEmu1ezpE5OhHJn80Fzzoo5OpkkCpBSY6FbmhFGcuvXTdILDIyc1/+IP
	tnuZ8l88auW8+Q8zoj7YC2yiiG8CpTbINO54XmUJICqxrc0AtU76Q22xen+bC6PC
	8aRRVwOIglvUpKR8WZkziLLKJdHP7XMy9xJZL+feht5+Z9HNvQcKRcvXuppKSJFs
	nt70fA9RSNOJqb24hmU9dTwSNC372qzFBweuHxfskG0O+QVE1K0yynAlvN1mxPTi
	X7pgxVB4vZ5gjOOzEJYZbDnKTBz3X+iBRcXqUQPycgSbYtqpeSnHmhn1j9FzcM9o
	tZ81VCViEavhaSmg7NDqdGBEhPaoDxbWKM5IGclh3dcRK3NXag9pIE2Z17KdcNv8
	27/jK0l1/89VnRjw66Fevo6LrcNzIhyvy9hId+bPMYwIAiq2Zgaxrl3tIyWYTe37
	44mHwgc=
Message-ID: <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu>
Date: Mon, 28 Apr 2025 10:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Len
 Brown" <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, "Alexander
 Dahl" <ada@thorsis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@kernel.org>
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu>
 <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853677366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014442_540015_9CCA31FA 
X-CRM114-Status: UNSURE (   7.34  )
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

Hi,

On 2025. 04. 09. 19:43, Rafael J. Wysocki wrote:
> On Thu, Mar 27, 2025 at 8:59 PM Bence Csókás <csokas.bence@prolan.hu> wrote:
>>
>> Add `devm_pm_runtime_set_active_enabled()` and
>> `devm_pm_runtime_get_noresume()` for simplifying common cases in drivers.
>>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> I can apply this one alone if you want me to do that, but I could also
> apply the other patch in the series if it got an ACK from the driver
> maintainer.

Did this end up being applied?

Bence


