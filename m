Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC341CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgziH4kIZ7vCwuDFMy2H2sa/DZNDXnfB805FtgBuIlQ=; b=V7ascLamgDhl4rmtG5uLsqlIuA
	NY0RcA1zTb3a4LG2CgripWCXPWzSSpRs47Rbvhnq2OkTNW5ftqCQt8knGQu/x4jAJturL9jQ76I01
	QabVCns/L8Hm7ENQFxJAkzcd+D/5UDu1KCvPlvaSM3cUAPFKDOce2S7v6mZsTLQb3fLpy5dwr4hPW
	3ma+XGDYYZlog5EyJi533RFtYrY0RhE8GZM9spo1zJjF3Xd06hJXiU8PnoNpLc5SyNx6f2lDoLYzF
	/0hlbsebWNQBzpfEZihx4kkjYp4ZWegcZb5mSQ0XFzAsV+xqB/iNfwuK01zoMY7O9E0pl1pfbmCQn
	fho+erNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL19k-00000004H8v-25Qi;
	Thu, 07 May 2026 16:00:56 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL19h-00000004H81-3zLU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778169654; x=1809705654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8BPtm1ERjnpYkkfFpMlDgHXX0eJd4mOVQdjMNGpCaCY=;
  b=C7NSu8YJxPMrD97+bngifOaDYpzHo0yFXbxdnlXDvK9+I/6TjKOPyoXb
   9Pu4LEl0DcKRb9oCVRKmr9HI0UtPGAsi7FT8+LUg8QNHCfunrRPhpdaBs
   dKQz9IndzDMvtOCRM0StEep3xue7xYK/oED2qOYR6vwiSTC1ADIUsLO+z
   jznoBNmQzenAN9Uu9NpTdlJm7pDmHtiDyahlIekhm5JD1BzHElPmiGsrM
   qUOuWeSeoeZVE9AF2xAZIAtxai9xNihu9UZsKte7pNeE4VK0VGnPVTaNj
   swrAQxTtZXhev0qmtQz4s5o2v8JVF2gA2jzbqBoi3iZlFpw3KCGuP0T7h
   w==;
X-CSE-ConnectionGUID: IJvFxRwnQqSovUil7D4KAg==
X-CSE-MsgGUID: BpJIrh3cQcSaTVTMYx4xyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90502282"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90502282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:00:50 -0700
X-CSE-ConnectionGUID: W8JdCnF+Q1ynh0P7UD8UIg==
X-CSE-MsgGUID: mY5sbussT2WvLYe2eD1VnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266870993"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:00:50 -0700
Received: from [10.246.17.81] (unknown [10.246.17.81])
	by linux.intel.com (Postfix) with ESMTP id 9DE2F20B5713;
	Thu,  7 May 2026 09:00:46 -0700 (PDT)
Message-ID: <b1d56feb-9847-41b1-8bba-733963055cae@linux.intel.com>
Date: Thu, 7 May 2026 18:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] soc: aspeed: Add AST2600 eSPI controller support
To: YH Chung <yh_chung@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "maciej.lawniczak@intel.com" <maciej.lawniczak@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
 <20260313-energy-casket-ca8adc1f1fd1@spud>
 <23909400-4e7f-49c9-a982-14036372af98@app.fastmail.com>
 <c3b28ee92fa46700887d0c68b23045b2418358a7.camel@codeconstruct.com.au>
 <KL1PR0601MB4276ED93723F0B1F42349AD89041A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <0f7f0f96-a918-47d5-a0bd-bbde494c8fed@app.fastmail.com>
 <KL1PR0601MB4276B5BE3B96C18E3A66AD709049A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <14870d17-2471-4522-b8b5-03cb9002a4f7@app.fastmail.com>
 <KL1PR0601MB42763DAD359305DEBA4B769D9057A@KL1PR0601MB4276.apcprd06.prod.outlook.com>
 <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Language: en-US
From: "Shulzhenko, Oleksandr" <oleksandr.shulzhenko@linux.intel.com>
In-Reply-To: <KL1PR0601MB427603A6A5768D6A537CAFCB905AA@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_090054_004777_B2E6C7E3 
X-CRM114-Status: GOOD (  20.57  )
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

On 4/7/2026 11:36 AM, YH Chung wrote:
> Hi Arnd,
>
> Thanks for the comments and questions.
>
>> These all seem to be viable options, but I still think we should focus on
>> agreeing on a design for the low-level hardware interface and whether this
>> can or should be abstracted between SoC vendor specific drivers before
>> trying to solve the user interface side.
>   
> Could you share your thoughts on whether it would make sense to accept our
> eSPI driver as is, and whether it should live under the SoC vendor-specific
> directories? Any comment would be greatly appreciated.
>
> Thanks,
> YunHsuan

Hi YunHsuan,

Let me add my 5 cents on this matter.

Integrating this driver into the SPI subsystem may allow reusing some 
existing definitions, e.g.|spi_controller|,|spi_message|, and perhaps 
parts related to single/dual/quad I/O handling. At the same time, parts 
such as the Flash channel (included in the current series), and OOB / 
Virtual Wire support (I would expect to come later), appear to be 
specific to the Intel eSPI protocol. Modeling all of that as just 
another SPI IP driver may introduce some awkward layering and overhead.

Also, the current series already seems to separate common eSPI logic 
from AST2600-specific pieces, assuming that 2700 driver is also coming 
at some point.

This makes me wonder whether a dedicated eSPI layer/subsystem could be a 
better fit — either under the SPI or as something separate (but not SoC 
driver).

Given my limited experience with SPI/eSPI, could you help clarify a few 
points for me (and probably others as well)?

  * How much of the SPI subsystem can be reused for this implementation,
    both for the current patchset and for likely future extensions?
  * Are there any pitfalls or abstraction mismatches in trying to reuse
    the SPI core here?

I think this would help make the subsystem placement discussion much 
clearer.



