Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E046EE6B4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EvUkGikLGBVG5LNiJdmoCiaus9vguvrveELNY97Pqw=; b=I5g4l4wl2eKdi1Vcc6s/Jk9DmT
	Omu9snAr4hKx6exBYLwNTDYIF+8wQTzm9yv1vnszRyBF7AOmPxNFUEosM+da4bbinIRf7vSE1uX1F
	FNehAU9pcuDkPGaeG9467nJPo0L5N9cAP2x2ZJZqynDhA1Mr7qAZJ06wLYaKnzfUfqEFpoiUFcmXf
	bsBFdoVjEUPcvpFn6CdUV9WkVQ/yjU0PYOR3N86csEo88U6kpwpHAypMBsGlEtt4Lf7J/LJU32I/n
	/CINl+6fd5rYnQv3/8ldgtgDsLC2S4kJN/ejn262U3XX/68QJ6wuD7kUsEnjdp0OTcqyh+OcG9YCt
	6QSyy9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRgn-0000000BkxA-0xAK;
	Fri, 06 Feb 2026 19:40:25 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRgk-0000000Bkwe-3xwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:40:24 +0000
Received: (wp-smtpd smtp.wp.pl 27143 invoked from network); 6 Feb 2026 20:40:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1770406819; bh=+EvUkGikLGBVG5LNiJdmoCiaus9vguvrveELNY97Pqw=;
          h=Subject:To:Cc:From;
          b=SqeEpPv0BlEAhNqth5R+pVW07rUJPFpn9MKv+CRwCBlV+Av025KXHqFyldMsUnekl
           kELamoDdM004EiEZAeAdzO856R0hOxfrJ6zJcQ+nJsz88rDpqGYQuVyL4GSXqI5D0w
           imC9WEP6L4hQerhQEIj6fK8u9+HtD1iNzWpo64Xn5hJ6RMfVGKvFIcaSFxaCCb96GD
           b9koQkkdkEbHQRzzgoIwaiMnga39Z3OkhEqlA2f2fkR69snEXSOvrLdoxGo36KdV8r
           4lKpLbT1klOAmlMioz/iHDQGk8MCoh3Xcv6NyfaD66eZhpXysYvlKQxIFfcJ6RJEWz
           mHdFXapvGoRSw==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.5.238.100])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 6 Feb 2026 20:40:19 +0100
Message-ID: <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
Date: Fri, 6 Feb 2026 20:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(des3_ede))
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260201112834.3378-1-olek2@wp.pl>
 <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5428d022556c331c140129cf87531499
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [YNM0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_114023_138822_46E94D07 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Herbert,

On 2/6/26 12:01, Herbert Xu wrote:
> On Sun, Feb 01, 2026 at 12:27:08PM +0100, Aleksander Jan Bajkowski wrote:
>> Test vector was generated using a software implementation and then double
>> checked using a hardware implementation on NXP P2020 (talitos). The
>> encryption part is identical to authenc(hmac(sha1),cbc(des3_ede)),
>> only HMAC is different.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>>   crypto/testmgr.c |  7 ++++++
>>   crypto/testmgr.h | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+)
> Patch applied.  Thanks.

While resolving the conflict, the entry was added in the wrong place. As a
result, the test manager complains about sorting:
[    0.050891] testmgr: alg_test_descs entries in wrong order: 
'authenc(hmac(md5),ecb(cipher_null))' before 
'authenc(hmac(md5),cbc(des3_ede))'

Should I send a patch to fix the sorting? Or would you prefer to replace
the patch in your tree and apply [1] first, then [2]? That way there should
be no conflicts.

1. 
https://patchwork.kernel.org/project/linux-crypto/patch/20260131174020.3670-1-olek2@wp.pl/
2. 
https://patchwork.kernel.org/project/linux-crypto/patch/20260201112834.3378-1-olek2@wp.pl/

Best regards,
Aleksander


