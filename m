Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D57606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JE2xc9D5;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CFHq/4I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mpW7Rx8PuBJeOKNX2dQ8d9XnAjnbB8743kHyv8YBQHw=; b=JE2xc9D5cutQd3
	CheJ2JGL6vgW4I1W1W1hZz2d4dTOXUYJ2HVbQPpX3fVmcxYYGmO0qAk6Ti2UWoMS4y4n+tWC3mlZy
	txQQz7y2C9zMnLu4y9b+t3oYZG2RX1K8EGghwbQoFzzbPkMpO5Z1QcP/S4GB2tAnxytlBHm4ve1e9
	cWEFCh0FJm63qXBKa/RW3rGWNPzQLRkVQ3Cw2YTLXmPjQc6HAsICcTxLXPRBf5r+N2oYqEwcDJADC
	EUqyp8iJg0dNpdD6UTHB0c9ZL9TTKMLbEd7DG2aSiAPFbkbI6+n4VLztZitWjRxFCNwxUwY+wHvIQ
	iwqc13m2f4sxQ6C567Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMS1E-00000009dDt-0kI6;
	Thu, 29 Oct 2026 15:26:20 +0000
Received: from out-68.mta0.migadu.com ([2001:41d0:1004:224b::44] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMS1A-00000009dDU-1djQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:26:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vYqatMBexbASiH/pDoDg+soUpC7jr6OsHv3SiCXY0DQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793287570; v=1; x=1793892370;
 b=CFHq/4I7/Ryp9pDrYCokipvX9Q3IBM65pbtpLZ0ZnxwtpVp4/KZergKO2A6hs85u2EgK1XI4
 salYWiH7GwXrPHodZwh3cocV/ZBi2TKG3EyzBZ710vT60x7aM4qAx1NbVH12ki0e43SO8KIm1bB
 HywAW1I7jNTMsiGuMH2y4/qo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7378328bbc0346d2;
	Thu, 29 Oct 2026 15:26:09 +0000
X-Mizu-Trace-ID: 7378328bbc0346d2
X-Migadu-Flow: FLOW_OUT
Message-ID: <12988c8e-95ad-4989-a6de-e02af3c9ef1b@linux.dev>
Date: Thu, 29 Oct 2026 20:55:53 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
To: Sasha Finkelstein <k@chaosmail.tech>,
 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: alexandre.belloni@bootlin.com, andy@kernel.org, asahi@lists.linux.dev,
 bhelgaas@google.com, bp@alien8.de, brgl@kernel.org,
 dave.hansen@linux.intel.com, dlechner@baylibre.com,
 dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, griffin@kroah.com,
 hansg@kernel.org, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 j@jannau.net, jarkko@kernel.org, jic23@kernel.org, jmorris@namei.org,
 lee@kernel.org, lenb@kernel.org, linusw@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net, mfd@lists.linux.dev,
 mingo@redhat.com, neal@gompa.dev, nuno.sa@analog.com, paul@paul-moore.com,
 pavel@kernel.org, platform-driver-x86@vger.kernel.org, rafael@kernel.org,
 roberto.sassu@huawei.com, serge@hallyn.com, sre@kernel.org, sven@kernel.org,
 tglx@kernel.org, wim@linux-watchdog.org, x86@kernel.org, zohar@linux.ibm.com
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
 <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
 <0683C803-C578-4C55-B893-BC03EBF9A9F1@chaosmail.tech>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <0683C803-C578-4C55-B893-BC03EBF9A9F1@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_082616_885997_AD25DBAC 
X-CRM114-Status: GOOD (  15.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/29/26 8:23 PM, Sasha Finkelstein wrote:
> On Oct 29, 2026, at 15:39, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
>> 1. The patch is required, atleast on intel macs, as without writing GPU and CPU
>> states to smc, the system gives PROCHOT signal under small load
>> , and heats up a lot.
> 
> In that case, why are you exposing a generic smc key interface instead
> of one that just does that? If you think that this data should be set
> from userspace - whitelist the set of keys that are needed.
> 

Whitelisting will create an endless cycle of upstreaming new keys. But 
considering T2 no longer is receiving updates, Asahi would be happy to 
send their keys they wish to be whitelisted right ;)>
>> 2. the smc dosent expose keys of nature that can physically damage the system
>> it only exposes power/volt data, and the most you can poke is reboot
>> keys and gpu/cpu p-states.
> 
> Are you willing to make that claim for every smc-equipped device, not
> just T2? Are you willing to make the same claim for future versions of
> smc firmware?

Fair enough. We can restrict it to T2 Macs, and Asahi can later adopt if 
useful?>
>> 3. If a person is randomly touching keys, Its their problem and not ours.
>>
>> 4. There are a lot of things that can mess the system way more and permanently
>> than smc (undervolting for example), but they are not safe guarded, why
>> should this be then?
> 
> I think it is inadvisable to leave a loaded footgun around and then
> blame the user for using it. As an "OS Vendor" you have a duty of care
> to your users.

It would say the "duty of care" argument is more of a philosophical 
thing than a technical argument here. Still, I respect that but there 
needs to be a balance between adding features and respecting the duty. 
It seems various vendors have different views in determining the 
balance. The above 2 arguments look like a good balance. What do you think?


