Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ABDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBvzaojzHCTtJw88dGVNeIDb601fSbB9s6VLFLSWAu0=; b=XXHIYaN5Vo2eLgE6xS6E9QomID
	saLHuh6AE6Q5vJ8ymXPNnHEJEE0/SUaHbndZD2J62S4Cx+SmNww/uX4Zd3F5j75gVPmd+h3K+LlE6
	1zj9Yyhb2Gmmhlfg9bh80bkaggeR+Wgpvj43OgWgQAyKLDui05HMV/K/R17dAvP2uVx0YgoJxHqKF
	koKLs8vzV4H5CEuYZBMxrw1Fz7K1S4Pk+pLGTEVRRg/1J7dbHdaWJahGKkKzUntFeUXLTrwLk2/Gf
	PRBYuY7Y8stX4SPe0ZgSDmYknnS50dtwXoMILkrAa8f+FUUk9czzoRe360J5N5l4sr+iHMAmWUg/T
	/vefY8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLky-0000000AGwD-0iJk;
	Fri, 25 Jul 2025 16:58:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLiU-0000000AGRR-2Zyf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1E585C6B11;
	Fri, 25 Jul 2025 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F52FC4CEEB;
	Fri, 25 Jul 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753462577;
	bh=SLJ6zyvsEGx5dOBajxkJt0bN0i9JPXLTqdPwVoPQIUw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q0veXjJ5AllllDvPqyCs+XzSugi5QMZq9GopnRU3jcqhT+YxdHLejTX1a74CizcoR
	 a2MpPoGzSmcKc7O2+pDqdeWJvV9Mlcr5KZncs73E16ikEhZzaag6dj7TpIuim61CEz
	 8kIHg+GhS6fpD+txcxoc+CfQFKAuf9DcR6xEDyoP8ZlXRi/5aO/aNgIIPJx7xMleVE
	 xflzhAI3bsErR9KjC5041QfpbyxzfXCagAWxDdQR3bAbfL2jdpSwb76aF53pYaOtnT
	 ProvhS0jSTDCzTHh81Ag8YHt9JC2TFASf8j03XL6O++deitpRjWNtfM0rrHdWsKJu7
	 jLIDLWxzSOC9g==
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41030F40068;
	Fri, 25 Jul 2025 12:56:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Fri, 25 Jul 2025 12:56:16 -0400
X-ME-Sender: <xms:MLeDaNF6dv7PQxROA8isd4i-9cDyPoPdoNjpOALPNZy_-9U5zyMjZw>
    <xme:MLeDaCUtbIl7e7x4ncci20DZ6ioXzM7fOfdbL0YSoNrTbiIAKzZH1uGI2TD4_gAIg
    W1yPDMmdHR_-gXbrI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekgedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfuvhgvnhcu
    rfgvthgvrhdfuceoshhvvghnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epfeejteffgffhleeujeevgedtfedtveejffdtueefgffgveeutddtudeiteekheehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudehjeegtdelvdefuddqvdeitdeltdekleeiqdhsvhgvnheppehkvghrnh
    gvlhdrohhrghesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlvggv
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MLeDaBcIntZ09L9UW813uReK9zZ9tl-FNN_Qi_S1M-tunEKchocwrw>
    <xmx:MLeDaG13nDdAnx4JJ_hvMOiOVwb5CO-Z2U4z5Oj1f3rYtzYY2FHZuQ>
    <xmx:MLeDaILCz22HFGOu9Xudqp5IQQvjdyeNd3pT94mp1vn0dfZAHtaMcw>
    <xmx:MLeDaFFbmwl8F3-HYXF6fPLTHcIzwXzkMIIB1YUHO30PxmAvrlWmUQ>
    <xmx:MLeDaEXFxYz5-1B-LljESDYwvxjtpFSlMSjuJcd-KSAzbHE80FxV5574>
Feedback-ID: iea1648cf:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0BCFA2CE0071; Fri, 25 Jul 2025 12:56:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T417e00d05cb532a6
Date: Fri, 25 Jul 2025 18:55:54 +0200
From: "Sven Peter" <sven@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <e152b574-a064-4f5b-9f96-ee0188ba440a@app.fastmail.com>
In-Reply-To: <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
 <20250725113539.GB11056@google.com>
 <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095618_746434_004186AD 
X-CRM114-Status: GOOD (  16.82  )
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

On Fri, Jul 25, 2025, at 13:48, Arnd Bergmann wrote:
> On Fri, Jul 25, 2025, at 13:35, Lee Jones wrote:
>> On Fri, 25 Jul 2025, Stephen Rothwell wrote:
>>
>>> The following commit is also in the arm-soc tree as a different commit
>>> (but the same patch):
>>> 
>>>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
>>> 
>>> This is commit
>>> 
>>>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")
>>
>> Odd.  I don't see an applied email for this.

I mentioned I was going to apply it in
https://lore.kernel.org/asahi/a67fcfc9-e708-47db-8605-e20a8b54b0d1@kernel.org/
and also sent out
https://lore.kernel.org/asahi/175292958117.11653.12996215497191655678.b4-ty@kernel.org/
via b4 ty a few days ago. You should've been CCed, no idea why the
email didn't reach your inbox :(

>>
>> This was applied to MFD and a pull-request was provided for the other 
>> subsystems:
>>
>> https://lore.kernel.org/all/20250724102529.GA11056@google.com/
>
> This is the one I pulled in
>
> https://lore.kernel.org/all/20250722163258.62424-1-sven@kernel.org/
>
> I did not see anything from Sven about a shared commit. I can
> throw it out again without too much trouble if you already have
> the contents. The only other commit in that branch is 
> 65293c3276de ("soc: apple: Drop default ARCH_APPLE in Kconfig"),
> which I'm sure can wait as it only changes the default.

Yeah, feel free to just drop that entire PR.
I'll just include that commit in the ones I'll send next cycle.


Sven

