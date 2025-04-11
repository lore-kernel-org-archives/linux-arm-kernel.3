Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BFFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnpogYSibsZIjLuVr6OHFEsDolmRPgMsSOQs9WMEleo=; b=3JNCC5C27xGRat3Om3asqwpAQN
	x2ywskVMVUQTGu/Qir4OICUBDrMHaqNO+bDfs1Pon7b5E4Xzz038SOnBht5F8CeTZ66AHsPushKCL
	isBMu55UqXeGCk8QEOPtzFIR/JbDfIuU+2EUAc3Zwtbe3FaNt7h76PrtnadEZhiQOHxprVIf4A/6g
	aChiR5j8LI2KMhJJ78NdwjZqxSVIs4330LD/JhfTjaGduGaX5B8jFT0t8hcwZK/DzjVS2wLHEV19a
	NHMqepyhpCRGtVNVNq+EqakDwbwOhI5y6gY+bwi9n/pnR8GfG51OYHz9y+zs1wWn6lqynGBP3Np1Y
	YLp3E5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F84-0000000E2uG-3MMf;
	Fri, 11 Apr 2025 14:13:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Eh3-0000000DyRH-01s4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 13:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FnpogYSibsZIjLuVr6OHFEsDolmRPgMsSOQs9WMEleo=; b=ENzxwOPjFln6iWH9MQI5LBJFSi
	/mSkmnIYZJKWMyEifGNcjhL//qOs6QEeI4cPc34CkIr6UaYjrSMhw1iGHOW3ZkcZC1wdys7RRP+FL
	B8TgJLpveLoEJivIVcQTBt453ZMNz2li63KGFCvq3mF4S/HY9jQyOuEVdL/C7/HKSYZXDfTPYj/+E
	5KUw7LdeQu+mLqH4kTyuz6N8Y7lg9/T1oHIrnoan7tWthCsr2r4umtH8X6QWYm3dkjRTdpoq3mJdh
	taVKhBnJF1yrDSGBMc6pvCY6/iB7WepW51dPyk7dHnvt6RWrkmHbmwi79XU7E2sGu/Iv/RKW4b/34
	LR7JpR7w==;
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3Egz-0000000923b-11ad
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:45:15 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1D78B1140259;
	Fri, 11 Apr 2025 09:45:07 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 11 Apr 2025 09:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744379107;
	 x=1744465507; bh=FnpogYSibsZIjLuVr6OHFEsDolmRPgMsSOQs9WMEleo=; b=
	jZH1erNkGDdoo+8ELmjvhKmHM56/XhZr6ePrPW2NG4o0a7iuzINfEVnJM0Ju/app
	XMEJOGOsyTh0vgSTf/QOID/tr5ntYYni5AVAV4gllezNpdjky10u0I5uSfeff4af
	80kpbJfqQ9HEGzfs7sWZwJWTg4NB4U5BLgDVQWgMJYLCpRngrd9Z8L871UDtYrod
	i2i42DvtlAcHyRaLFxWaUZvSQx8cGNUX5TQ5USq/kJ9yYA/jL9IneIJa6Wj4FhzG
	1m1jnhhLjc9jGlaVaEsZIkT9KXdDmb7ryMZtYcYRcAXyV+mfvurPskmuadieliXD
	KLZhKwsyyZIo1jHdamAIfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744379107; x=
	1744465507; bh=FnpogYSibsZIjLuVr6OHFEsDolmRPgMsSOQs9WMEleo=; b=O
	VpoLqkUF+YW/6gJhRYF62kEN2EgNcF777xNU/x48KBk984a8k8fW1btirX3i0RB/
	QlziQhp8RS68KjfJ8tdD7ZLJW2PXIw5XZhvv2qEgZEPtpxCtioIEfNGBvnqH9vy5
	eOizgvdgpOTjWOG2L5LVX4EVRE7w3k/N5FvikcLkGAN1gxkbif5J7QQSYSUpzLOB
	8+r4Th9CZotz3ScETnxyxJL9Whm15/Isez45jC6eQ8gm7kSAAxabSoqffjz7hzvv
	CgmCI67a2minPIB59TCEh04yP2yDXYTiRExPtHFjO86oGYKM8q9eNNbg8AaQ/KuX
	5p3rSQwop9qMG+D7RvSwg==
X-ME-Sender: <xms:4hz5ZwiYXQy_HpXPmJ_0VgQPfKNqO1Tx9IXy3GVjxDavnINRNHjKRw>
    <xme:4hz5Z5AHx7nj7Kkj3o9rLeIl7dULfTP78m5bnAtJRbacdjkaQphVsiS0jTJRRODQU
    MtSFZud8dr5VuaUP2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvghsrd
    horhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghp
    thhtoheprhhosggutghlrghrkhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepsh
    hmohhsthgrfhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkvghvihhnrdhtihgr
    nhesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehiohhmmhhusehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:4hz5Z4HwqbqPWxwuAJu6wbo0cUbsEU0JtxlevWtaf_FIeER0WY3-jg>
    <xmx:4hz5ZxS5PgKv95zBM-X952-vxxqNzh7vpvCaGH_n55p-U2KbpeFTFA>
    <xmx:4hz5Z9yJsIE3ibPySn6XAlNfEhsJ2QC-FMfgoCstkkmzZAunWxgWvQ>
    <xmx:4hz5Z_72vDNtUntyfNl_Flauot27qnFa0UtYYy277QcCgto2wUlb1Q>
    <xmx:4xz5Z6hLPy-HUB0VDSe7B8qNLfy2F3ivwTMnZhKunOLiHyT6nZmA8q0F>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6AACB2220073; Fri, 11 Apr 2025 09:45:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T9a37218b235c564b
Date: Fri, 11 Apr 2025 15:44:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robin Murphy" <robin.murphy@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Joerg Roedel" <joro@8bytes.org>
Cc: "Mostafa Saleh" <smostafa@google.com>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Kevin Tian" <kevin.tian@intel.com>, "Rob Clark" <robdclark@chromium.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <9c010a5d-a2a7-4002-9411-58009c1a21c8@app.fastmail.com>
In-Reply-To: <60c980c1-16b6-460e-89a4-203e9f0cbf3b@arm.com>
References: <20250411125423.1411061-1-arnd@kernel.org>
 <60c980c1-16b6-460e-89a4-203e9f0cbf3b@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: dynamically allocate selftest device struct
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_144514_076674_CE20C12F 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, Apr 11, 2025, at 15:19, Robin Murphy wrote:
> On 11/04/2025 1:54 pm, Arnd Bergmann wrote:
>> @@ -1433,15 +1434,17 @@ static int __init arm_lpae_do_selftests(void)
>>   	};
>>   
>>   	int i, j, k, pass = 0, fail = 0;
>> -	struct device dev;
>
> Could we not simply make this static? Per the comment it's only here to 
> serve a NUMA node lookup buried deep in the pagetable allocator (TBH my 
> first thought was to just put an int on the stack and contrive a pointer 
> as the inverse of dev_to_node(), but I decided that would probably be 
> too contentious...)

A static device would work here, but that has other (small)
downsides:

 - static devices are discouraged for any real purpose because
   of the problematic lifetime rules. I think Greg would still
   want to eliminate these entirely.

 - there is slightly more memory usage: the __init function
   gets eliminated after boot, while a static allocation says
   around. It could perhaps be made __initdata.

 - If we ever need anything beyond the NUMA node from it, the
   dynamic allocation is probably close enough to make that
   work.

>> +	struct platform_device *pdev;
>>   	struct io_pgtable_cfg cfg = {
>>   		.tlb = &dummy_tlb_ops,
>>   		.coherent_walk = true,
>> -		.iommu_dev = &dev,
>>   	};
>>   
>> -	/* __arm_lpae_alloc_pages() merely needs dev_to_node() to work */
>> -	set_dev_node(&dev, NUMA_NO_NODE);
>> +	pdev = platform_device_alloc("io-pgtable-test", 0);
>
> Otherwise, this would seem to be another perfect case for the new 
> faux_device.

Good point, that is clearly better than platform_device in this
case. Shall I send a new version with that?

     Arnd

