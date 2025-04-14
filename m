Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51064C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fUTt49ngH9LwQeutmpqAtan+y77TmFvSLDx00ftJms=; b=foxw7tbyc3IOKDGdxBG/96sGEj
	U76CCG5UXo/VFDonXges3/G8nzMUyRVVMIjqms+5clzgwg5hVUhWKVeewT3Hh+okm1eQ8XESbMueB
	VMpf77AhKygWiECIUFzbF9S52+0FWcH/FSA2ignvxT5OyQwYIU5ms6x2EUaQEDQyCp3n/TPvZkVc4
	ZSnBVguT1wsSq4tlFq7zKYRDa1fVYmD+ZRaqjxEdcV18ffgVa3wj4bi/uZ8h/KluzzK+5hovQAOAd
	PzTAUYE1A6IV+3tErGMN6CieUO1W5OeYO5y4wdHgdePsYVR/rdydFh0XAsq1OdUVeNschBKLioCDQ
	DO/el1rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KPm-00000002HTs-3oAt;
	Mon, 14 Apr 2025 14:03:58 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KJ4-00000002Fuz-1ZGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:57:04 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B451CA0370;
	Mon, 14 Apr 2025 15:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=8fUTt49ngH9LwQeutmpq
	Atan+y77TmFvSLDx00ftJms=; b=t9pCPRQ2tmxUZmdzLFDzbVZeoRtXZjDfgQoU
	JMJpuozYaayHGe5M8rtZeul0OU/+F9X4CpMRAVyMFQFkPO7wR8zzEFtkI74Ye0dI
	ADOz7gwLOQPJeZujzuajq635AW7etk4of6jaKUDWUnjyUgcgFHA4wFSlBn/Wema8
	h8PFPH2UyOzNqCyjL2KDQXPqbCYhed4NZ+0Rdyx3IVfp7MVupbKlIeo055aR5zyn
	HiCcr96E4uWhI47L71f0twy8JsoxjMausdIw6mCa8yjWiEtCvWdk6CGx7J6CHx0T
	3vuIVBNAzb4osY94mucmeauKFPNuFOfSdxzd9dJ8utOPILJ/OE8X5nPlPxMHeiMC
	wVXUT1b961oG1BveaAZz2BIctqzdxleO5HU5r+7ayNSEvR5IdBqo6C18d17+1q/k
	6OfkDYosROTg7TUakxHUyXJ8/R5NGwv3dJcEYDWEujln53H1zsGk5oI6J/J0KlkT
	D6Sfd2ElQtNUWMqubsWtaD+9X51Ux5MhtelheK6OGoHUbcfr/RTY2UgGmTWZJrVd
	zrgeq4F2WGqcvULyHEHgHmQqicc3w6dcEJqT07jV+Rc7UpvLaUahU8thqM5ebD+i
	PQ0nPK8VdUJDejG2Hffd2qnwkKH5+R/XbwdIHNuP1hKpkDZkJbL0w8fkZJkLUI+F
	Y3cED88=
Message-ID: <832eb5e3-7e2d-4ed2-8571-eca9fe129013@prolan.hu>
Date: Mon, 14 Apr 2025 15:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: "Rafael J. Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pavel Machek <pavel@kernel.org>
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
X-EsetId: 37303A2980D94853647464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_065702_871641_49C55D37 
X-CRM114-Status: UNSURE (   8.01  )
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

I think you can apply it and then Mark can apply the SPI part to his 
tree. @broonie what do you think?

Bence


