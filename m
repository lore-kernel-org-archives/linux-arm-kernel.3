Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB342CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNeGfpQkD9fJ/pYJdJLVV0A/azvebw9X720XN2OXVKQ=; b=EMjNlITWqgvc9fnkKMsJe+2RfN
	dwd6033+w4uU8MmDS9vkWejmCyTbnUItS6QaMxiEzc8PqJ10E+JrF8HhTFn6wrwVZC62f+CsiwvDi
	4JFUmVWsW+j3cQP2g3jG19tS6s74YdsIyzxnAiaycgAiMq0xbHRt6v2s241rhpjmFT4lOUZve/vW5
	pv5M4z+2UjW53bt10+7DB16PB+0KzEUYSXQqokkNPV7n7yT0k/9WgzE/wJdDkCOcc8SNiFJ3AVK6c
	r+zm3v2he4PVOXt4d0Ms2Ts34PkjZteL3wGxY2AY6ERIiCzjBdLv+qfvFpff+ElKVb3oI6JIOQJyx
	j/lbQq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywp6-0000000DtYU-1nJo;
	Wed, 17 Sep 2025 18:24:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywp3-0000000DtXJ-2LH7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758133445; x=1789669445;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KQBYLBTGVcI6B/UU8+PuP9ANhqubXd++Fn247awfx+M=;
  b=XuWCWs+NGCzRB+Uw9EdBGC0UXe+pkX29JdZC7Nk1wnaNCGw9mjxflYGS
   tzJ/QfqCkPgUoRi8hJhYg+U0Kd/oefgfwxniL+3q6MVuVCbPmASTcU74z
   vtp0MK/l0OAkzA/AwI4TwajIDtBdd2bNDpYKq0Ek5i8CkFzhpCX3t8Hql
   wLSZkT1X2O1S4bxkb7KoBGUUVwcwiw27tSv3eWTt2s5GcholG6SrH03nd
   nJ3e0Apdu3uiH6mOMKpJxDp2nSiy9Ye4H186d8Y6yJgpFIXM5ZROIgqxF
   sL2GZqnfTSAgcDZgVTCEz/AlICvUGMytxJMR282TK0gcpR8VswD8iTWrn
   Q==;
X-CSE-ConnectionGUID: 5jJN7IFvSvKlx8qiM0vY4w==
X-CSE-MsgGUID: RvhQqBJPShSHvESk7QwlQw==
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="214017525"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2025 11:24:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Sep 2025 11:23:40 -0700
Received: from [10.12.48.170] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 17 Sep 2025 11:23:36 -0700
Message-ID: <1a740af5-78c9-421f-a58a-fd4a2066493a@microchip.com>
Date: Wed, 17 Sep 2025 20:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: microchip: clk for 6.18 #1
To: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, SoC Team
	<soc@kernel.org>, <linux-clk@vger.kernel.org>, <mturquette@baylibre.com>
CC: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, <oe-kbuild-all@lists.linux.dev>,
	<llvm@lists.linux.dev>, kbuild test robot <lkp@intel.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com>
 <0695ca65-536c-48d9-ad1b-49452e67a6f9@microchip.com>
 <175808457715.4354.11044142356915096975@lazor>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <175808457715.4354.11044142356915096975@lazor>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_112405_662872_FE6A6391 
X-CRM114-Status: GOOD (  13.55  )
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

Stephen,

On 17/09/2025 at 06:49, Stephen Boyd wrote:
> Quoting Nicolas Ferre (2025-09-16 06:19:11)
>> On 16/09/2025 at 10:05, nicolas.ferre@microchip.com wrote:
>>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>
>>> Dear clock maintainers,
>>>
>>> Here are the first clk changes for 6.18.
>>> I don't think they have conflict with changes for the deprecated round_rate()
>>> to determine_rate() topic.
>>> They are in linux-next for a couple of days.
>>
>> But... this series depends on this patch:
>> https://lore.kernel.org/r/20250827145427.46819-4-nicolas.ferre@microchip.com
>>
>> Which will be part of a pull-request to-be-sent soon to arm-soc (which
>> is part of linux-next, so the build error doesn't appear there).
>>
>> Once the pull-request is done, do you prefer that I do an immutable
>> branch between CLK and ARM, that I queue this at91 PM patch into the clk
>> pull-request or that everything goes through arm-soc?
> 
> Whatever is required to build the code should be included in the PR. If
> the same commit goes into arm-soc tree that's OK, just make sure the
> branches aren't broken if you checkout a commit anywhere along the
> branch that is sent to clk or arm-soc trees. Broken includes
> functionally broken.

Thanks for your quick response Stephen. v2 of the pull-request has just 
been sent.

Best regards,
   Nicolas


