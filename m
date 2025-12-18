Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8131D6ACDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyebNfzeCgpKC74F6qdDfkAx0zKHrIp7zs6SdWi0Lzk=; b=UlbwAbyjrW27Fe5nDYJDiS28Ad
	2LRmz15qQTktjsn8EipZFxzPpydb3yLW1fRQJ0JIjzHTwLxsFjo9rf/uoBnwuItXqbRiz+IU+soQ3
	JltbsniTkEzcGmJ24cy5ishEoRqAgh5XC0F8Wu6RoOFcDJ3l/fwWMnREowuF0EpO8eMc1rMDkgylb
	quOUVXpu5KFAO0UyVErXLEd8UB8JCya3FxxbHstA24i0otlfcJPnsYUSS3eYtboG4sJaQnR8MxDjX
	2F5wK41EWmSZZDUSy8VwfsbJHntFnHHCv2Gpmb8GfBS8XlbVq+n9j0HDOEzjhIl5+Rq3yORMb0a15
	+A1m3Rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCrS-00000008PPK-2yVL;
	Thu, 18 Dec 2025 12:12:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCrP-00000008POw-46D6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C239143D6F;
	Thu, 18 Dec 2025 12:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD324C4CEFB;
	Thu, 18 Dec 2025 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059918;
	bh=XGQ+7SgEew4iClGYURs+C9L0stXJTBsZbjZ2oG7UIc0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Pbfm1N29OV600qM6UTmHFrWBgKAAPaEIi8H31U8/D7Fy4/yQH7DtTr8fjL1JU2ZGr
	 6nwz3dwH1V2m2ot6sPml3YHiTkco7la+c2nu+l+SxzciJta8kjjah21YI0wd4vAeV1
	 isA2l1yKhqypiDWu4LQeHt4ykcmpaBp/ImSwyvJVre9a3pRs4GXVsIRHvw6x+1fCZ3
	 aTjQTA27ccRELqk9h2L0kraeNtbMTR5EzRmpbnJomxT+NeArdctTyUhXcuNcwN7S86
	 MwPNLvKu3CLTwt2KbzjkGo2I4spjFwLzTY0Numflrkc7wTVrfPPFNtqzCFaA++T+6a
	 inlbyNZVWvrqA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD61AF40069;
	Thu, 18 Dec 2025 07:11:56 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 07:11:56 -0500
X-ME-Sender: <xms:jO9DafeY02D3zYoswm455JApvwyXo9N__fUotOJi51wAZtuEx-h72w>
    <xme:jO9DaQDfyGYFoXV11b_RfSRExwBkMCEzZBimiIe7NMQwesYYigYemrJGclZL6-nUN
    5nH6_xmiiK7evyXwi9tI-nHYYwNuyJSE2e3okgtOjc_KJ6UT8WLB40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekgfduveffueffveduleefgfejhfevfeduueeiueetleeugeeivdfhfedv
    geeuhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpe
    epkhgvrhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhl
    vghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
    tghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdrtghomh
    dprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:jO9DaW3ei8lQ9gcPxNPUeQZve5kN2H4YDdliFX36bDRD9uMeDsZ4KA>
    <xmx:jO9DaUpMFxuOPj7_hGyyy_s579il17M-kR5TgcqcXniyOzdDRg_9ow>
    <xmx:jO9DaWJBfSyOkp-S-guhU4sCQMQj21t9ZeDTKlB6MTu_eAniobrx8g>
    <xmx:jO9DaQMmPwxjAIxGEGDyRXW1Dza8HIb57oy-5TquwYRW4FNWdPdjfg>
    <xmx:jO9DaU3nohCadRXkzPkJY71Xjbbz3hpclv3AJ-2YED3d89Ht1quCx0PH>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DD622CE0072; Thu, 18 Dec 2025 07:11:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AsrGuGndWMm3
Date: Thu, 18 Dec 2025 14:11:35 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geoff Levand" <geoff@infradead.org>,
 "David Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Jason Gunthorpe" <jgg@nvidia.com>
Message-Id: <77e73a01-9f7e-475b-a810-278f931910ed@app.fastmail.com>
In-Reply-To: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
 <20251218084002.GD39046@unreal>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys interface [qemu
 test failure]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_041200_068515_2F61763C 
X-CRM114-Status: GOOD (  12.43  )
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



On Thu, Dec 18, 2025, at 10:40, Leon Romanovsky wrote:
> On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
>> Hi,
>> 
>> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
>> > From: Leon Romanovsky <leonro@nvidia.com>
>> > 
>> > Perform mechanical conversion from .map_page to .map_phys callback.
>> > 
>> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> 
>> This patch causes all my 32-bit parisc qemu tests with C3700 machine
>> to fail. Network interface tests fail, and all boot attempts from
>> any kind of hard drive (scsi, usb) fail with this patch in the tree.
>
> Thanks for the report. I have a fix ready; I'll clean it up and send it out
> by EOD.

The fix is available here
https://lore.kernel.org/all/20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com/T/#u

Thanks

>
>> 
>> Guenter

