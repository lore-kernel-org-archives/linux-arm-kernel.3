Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D31CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQWomF6yqwD8oGpdiJWckVYqwS2FEf4lq5dqhSRHyIc=; b=hxUQQyNFkHlOm00e7IQKKWavC5
	PE3LxxBnBK6DTMDjVYH6DAeNDRfdBxXQofvITx31k8gaEC47Syk+x5qQOM241a5qfctR3X/4KhJMs
	pCV71QhdHiLinQWlLMoPBw1eHkeEnqH+gi4svoU+DtKaYXmqjp0G+qnJmcWajokWysyv0qIUMqSVQ
	QY6PTFqn6mxGoow8x443mIxuP4+wI1JZJK85AgrQrmUL/y2ZhYIDihoDVH0ddRdxEpOkSfz4Ev89l
	vYrxQFM0LZGYdv0Q4RhUOJ79CkYCHzHYg69KuJRFEaVN+1aTNPPtTamJWoPdOYJSZCYJcKpQMuM7M
	7X6NaeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t429t-00000001OfM-0Yyp;
	Thu, 24 Oct 2024 18:02:05 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41uL-00000001Kbt-2SVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:46:06 +0000
Received: from [192.168.2.102] (213.87.90.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 24 Oct
 2024 20:45:45 +0300
Message-ID: <884de5fe-9f3b-4720-8be6-88972d8fc897@omp.ru>
Date: Thu, 24 Oct 2024 20:45:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Ivan Epifanov <isage.dna@gmail.com>, <andriy.shevchenko@intel.com>
CC: <aospan@netup.ru>, <conor.dooley@microchip.com>,
	<ddrokosov@sberdevices.ru>, <dmaengine@vger.kernel.org>, <dushistov@mail.ru>,
	<fancer.lancer@gmail.com>, <geert@linux-m68k.org>,
	<gregkh@linuxfoundation.org>, <hoan@os.amperecomputing.com>,
	<ink@jurassic.park.msu.ru>, <jeffbai@aosc.io>, <kexybiscuit@aosc.io>,
	<linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fpga@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
	<mattst88@gmail.com>, <netdev@vger.kernel.org>, <nikita@trvn.ru>,
	<ntb@lists.linux.dev>, <patches@lists.linux.dev>,
	<richard.henderson@linaro.org>, <serjk@netup.ru>, <shc_work@mail.ru>,
	<torvalds@linux-foundation.org>, <torvic9@mailbox.org>,
	<tsbogend@alpha.franken.de>, <v.georgiev@metrotek.ru>,
	<wangyuli@uniontech.com>, <wsa+renesas@sang-engineering.com>, <xeb@mail.ru>
References: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
 <20241024170743.241144-1-isage.dna@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241024170743.241144-1-isage.dna@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.90.120]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/24/2024 17:32:48
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188703 [Oct 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 40 0.3.40
 cefee68357d12c80cb9cf2bdcf92256b1d238d22
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.90.120 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.90.120 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.90.120
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/24/2024 17:35:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/24/2024 2:57:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_104601_664491_5C9750EB 
X-CRM114-Status: UNSURE (   2.28  )
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

On 10/24/24 8:07 PM, Ivan Epifanov wrote:
[...]

>> $ git log --author="andriy.shevchenko@intel.com"
>> $ 
> 
> Look who's talking

$ git shortlog | grep "Andy Shevchenko"
Andy Shevchenko (5564):
[...]

   Even I was surprised!

MBR, Sergey


