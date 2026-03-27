Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BB910F284D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pNHOOxkrInwAKVW1kychxWbDV24cN7qwurpLcenHAg=; b=PL/Qa3d4Kq87GyKo4ZJj9RlQFK
	4V+EYEwzaSIBXu6c59lFm84rzM/r6w9HjCih0TBnB8cagC3oDLwpchRQda747f+Oqr40bxMB0NnMe
	I+GHisjBBX3bgmKIcYDxgSjhuCWJpzsYJ4CU5JztjE/Ydvl701nVCJ6rA9MeevLIabzr9cOWEaKKc
	ELay/DcHX6eDdCxNTkOnzOfDSGCc1ntdQgssEJfstlel/Sxdc2NDYJ+HExnBzjmBkZdrNWJ0Bfeia
	bhisKcwnnen0/vKtCcYfvGl3h3Yj5+z99QhuYOBh8HxDWsgMNHP7hn5Ksu71+AFpqJEZbum5crN5V
	1eSRwGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AbM-00000007pHx-0h4T;
	Fri, 27 Mar 2026 17:04:04 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AbH-00000007pHG-1fpe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:04:01 +0000
Received: (wp-smtpd smtp.wp.pl 22480 invoked from network); 27 Mar 2026 18:03:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1774631028; bh=1pNHOOxkrInwAKVW1kychxWbDV24cN7qwurpLcenHAg=;
          h=Subject:To:Cc:From;
          b=CUSlZjbCPiBqxQiLpBHw2huIXCvZEblim9cHHLDW+olL1wSW0EUM03fCaDQlC6vhk
           seIVRHg+yHBBx2eMqOJ6c7+Pch2dzdgrBTC9ocHOIbZKhlSuPDgCnZSZL4NvF+PFi/
           fjvpWRR2REI1HKvnOMYMINOEr+SGCX8kfdpV1qk+pdXpgjXu4Fh61Ucaiag14ywOWD
           Brxok7210QSDFuM/h4YlftujO9V3uT+07kKpAk9bkgp2YlV/C8qMLe/djDe8NJ5r4U
           wL0UqmcrxEIc5BXmYe/rgGZBWanSraSi+HnYQz4f+sI0rajVL1vLDEWZ19OE6UK1xx
           XE4xilcro5gzA==
Received: from 83.5.169.164.ipv4.supernova.orange.pl (HELO [192.168.1.21]) (olek2@wp.pl@[83.5.169.164])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 27 Mar 2026 18:03:48 +0100
Message-ID: <c2a3dc2e-8d4a-4a59-ac5a-ca22be705488@wp.pl>
Date: Fri, 27 Mar 2026 18:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: testmgr - Add test vectors for
 authenc(hmac(md5),cbc(aes))
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260303184916.69132-1-olek2@wp.pl>
 <abToanZh-mkEjmJ-@gondor.apana.org.au>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <abToanZh-mkEjmJ-@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: c35bd8ae87df3f160010f467442666b9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [YFOn]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_100359_910278_89FE01FF 
X-CRM114-Status: GOOD (  10.33  )
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

On 14/03/2026 05:47, Herbert Xu wrote:
> On Tue, Mar 03, 2026 at 07:48:44PM +0100, Aleksander Jan Bajkowski wrote:
>> Test vectors were generated starting from existing CBC(AES) test vectors
>> (RFC3602, NIST SP800-38A) and adding HMAC(MD5) computed with Python
>> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
>> and NXP P2020 (talitos). Both platforms pass self-tests.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>> v4:
>> - rename aes-generic -> aes-lib
>> v3:
>> - correct sha384 -> md5 in description
>> v2:
>> - rebase and resolve conflicts
>> ---
>>   crypto/testmgr.c |   7 ++
>>   crypto/testmgr.h | 255 +++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 262 insertions(+)
> The previous patch has already been applied.  Please redo this
> as an incremental patch.

Checked the crypto tree, and this patch still isn't applied. I've sent 
multiple test vectors, and you're probably referring to a another patch. 
Should I send it again, or will you accept it as is?

By the way, that's the last one. As of now, all my routers have the 
missing vectors added :)

Regards, Aleksander


