Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5476EE0ADC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKfz8khjNl/LTu3C6GNZbX7HdCtyRoxHHXHrzIGrMME=; b=MWbfX2hVWzk3leYiBOkEU/ni2E
	hHvgwayM+ynHixQOBB/uIP9nJdbaj8nuC+RhF0BNxI84O0J03QyikojrRXkIqObKcZJO++V9upwmX
	TXdWf/2tB90c43IJs6iqsPWK8tSZJn8J66abkF3IGvZ7cuxdN5IBPFfhX6NfI6CDxApA4Wyfttoiy
	AzChZdrEY+f6zoD/L9ozpXjDqoXAy2F5ZhxD55A1Vu5/yUN3o8jQaEqoBLwXEingvoLaxtL3XbaWI
	kbFfUxHec0r2K/LJWjk5QnjFUQC+wrIPOv0Lgl9IHy4ge2bPy4ai8T6UUjACU3+q/ylkwGTHxRzjF
	Oj4GADfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojS5-0000000CXhl-1zSC;
	Sat, 07 Feb 2026 14:38:25 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojS2-0000000CXhL-1B68
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 14:38:23 +0000
Received: (wp-smtpd smtp.wp.pl 11881 invoked from network); 7 Feb 2026 15:31:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1770474698; bh=tKfz8khjNl/LTu3C6GNZbX7HdCtyRoxHHXHrzIGrMME=;
          h=Subject:To:Cc:From;
          b=Pb8CnKdlS/CPgQk4qAreqcA8wUwE4yRtmJNyM5nfU3l8ZQU/FbcS8iIlIrwEjUph+
           9RI3eP7L9OzuTfVrH3EO0YWhF8BoVRJBgpX153dlhAFHyPeI7F1+kGmuss0Lp4PJDS
           YD/CwaZgd4abkL76lfvLSs2kfMfg4qoNbt+aP+oNP2v7yGyBlSnL2nvvBEeik7ysz3
           6ilI2k6fJMVwA16jgmYHZM3vKmZfEi+2gEU1BS30/ZheroWEtnAC+DOJbzuWRNrhV9
           ZnEWNo4QhE/WemtCQzlp66k36rnUqU5vHRnqWHnPIzWr62WPealH8ihnGw+EacDobZ
           T4IxAXGauDg4Q==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.5.238.100])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 7 Feb 2026 15:31:38 +0100
Message-ID: <4be44ce1-6e46-4fc7-9497-7a99f8e54047@wp.pl>
Date: Sat, 7 Feb 2026 15:31:37 +0100
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
 <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
 <aYaWWy2KSYz787a-@gondor.apana.org.au>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <aYaWWy2KSYz787a-@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: affa130d7d053aabd69a05928304064c
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [gJP0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_063822_542948_FE7B46BD 
X-CRM114-Status: UNSURE (   7.22  )
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


On 2/7/26 02:33, Herbert Xu wrote:
> On Fri, Feb 06, 2026 at 08:40:18PM +0100, Aleksander Jan Bajkowski wrote:
>> While resolving the conflict, the entry was added in the wrong place. As a
>> result, the test manager complains about sorting:
>> [    0.050891] testmgr: alg_test_descs entries in wrong order:
>> 'authenc(hmac(md5),ecb(cipher_null))' before
>> 'authenc(hmac(md5),cbc(des3_ede))'
> Thanks for the heads up.  I've just pushed out a fix, can you
> please double-check?
It's fine now. Thanks.


>
> Cheers,

