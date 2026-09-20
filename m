Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DC4C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXZQlewp3FOudGIFjI5+q8McIea7iBI7OR1Mj7pdUdI=; b=o8hP7r69zGZx74x5uD/g8Gb3bc
	F89/QyCfFe33QmIdVL82jQBW2vEpQZgWpaPtMW7QwUuWXOwuqTVwghsNr25SqDzAw9pxNQA/UXYhW
	/XX08N5TMg9jKZWXaqyKlRN+ySRha2ZuWG48OAW5Rn1HeB1Rwg3eV+3DBNSZOGUKY07Jvb54cadmB
	/6FFfF6gYZCmLV4BMbxDM6OO1hH9GHaDYMY06vSQKOPhb2qdg9UuM7hdMR7EzdiLWhXticOr9TlYN
	qOEwAFoT60PkkAU9bn9MhB7IF9I05sALsGIEL/z60qg/237yiXkzChLRlyygXVWLm5+0f7bkFDmBe
	DwutpNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Dxu-0000000HCH2-0cC8;
	Sun, 20 Sep 2026 09:36:06 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Dxr-0000000HCGa-3PA2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:36:05 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 42C4B7A00E4;
	Sun, 20 Sep 2026 05:36:01 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 20 Sep 2026 05:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789896960;
	 x=1789983360; bh=aXZQlewp3FOudGIFjI5+q8McIea7iBI7OR1Mj7pdUdI=; b=
	X8eEgeYWvqI6Gz3Mppm1U4dW5q1DMr2LTy37xMxnlPR7CKhysNGQGckS4jLY/HlG
	fXgwVqJKgRVe30UyOGeRLMLCEd9G05AGfuGopNitt5fHtw3NVtfizSbFZDH+4gVb
	TVEagoYxMxH3LHzEo/vYzMhV7f75F7z8VwVoCSWEzAMUX20RZwBjT6cCt1YIxHdX
	ssDWb6GMJbly1JP4eNkH4VM3mueNGcn9C8uYDmNcI8+hsvFKH0mpXEV96ofoPoNL
	x9YinC6Hs1rBJS7TM1p9nt862ChRMFfiWcBI5bUoHfdUPkIo+DyrzQMNqUvtA5QP
	Kt8abo8wtudVfYByClIe8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789896960; x=
	1789983360; bh=aXZQlewp3FOudGIFjI5+q8McIea7iBI7OR1Mj7pdUdI=; b=n
	uwZMD6IR4D2eRcWgvCF2Ii8WpMfbKogtFU3azvB5cPBy4+7yojvGjqIll/xOlBP2
	cX4ligbLSX6Guoegofxz/4XMS+m7U+SCzXd+M6YWMUC03wbXSCX434Qjp6aOG1H/
	tPzwg64Bjv0TMM/kCGm0pmKlKoZtIdYN2Mu+5VXRYEe/p3nE6n2C/53Y8Jhf9Uf0
	IYNGMkOWzmhpE2BfrNahNkB6hmUZ9IN2ew2GO8VNk+Ku8c+Usnzqu3hBadByxL+N
	mcnX0KV3ZFIKjXwOknjAadIOfsug7s0IQQj8xZoNfY2A+xDpxE5Qn5kGd+WsZGbY
	LJfcXtJfNu5fmNbeXd5uQ==
X-ME-Sender: <xms:_Kivaqtq_eaxvj9KGZdD-QY7PY7CGsbV1Rm-bxlF9CB9gkDDy59lfQ>
    <xme:_KivaqTg7oIFi5Am-BwOqDp3yFtxWl1hXhtH7Ci3SG6Zq2uxaJ2hjlz3_BypnH4Or
    nGXZNRnfSG02BXrdnvF6ah_9wv8A9E1aBgG0C2rFFQpBoJ1Kmn2nY2v>
X-ME-Proxy-Cause: dmFkZTGAtlQUANsN4AJ36NuNRpiQFwnrUyDrYaEaCjWHJ8dyNwtmvUDEVzz9POWYXNQ4vW
    gJJBuj7MZoqG3ALb4GB/LQOL0pWQ91HxOqZZmF7chtv/HQpnrqFGiaAnh/kCWMBG12oDyc
    bEe3Cm1JP4ciwNh8X/ZM9YBw28mCWSc3di1IxBfBoPi29msQVvj2Ph7mmfVumIGvwdVVMy
    hZhafsdI/bdWFeMegt5xyB9rIwwyRiDtBcYbcCCFJYC+T4ILJ+V+srW6sOcFrHbaV2d4H6
    CvLZJ/HA8LDCbAv29wPnBFKl/oAgazO2xpkeUnJPqnXw49q670kR9iLAicqVVxlqmWRzgv
    /DC7wZRrgl77YQEyFyXwaCfA3SbAmqgEbHE53t3VEFgI0IOeCVcPa5OzCfGpqzWrlg7Srh
    AYez4PHceQxw9yHGLvUt1RIPgYX4aPI6ycjQiYt703DuSWosFncZNQunayd53/9iXzxqGf
    +yvmhkVoJ9oeZx2IPPU3tf962y7Ueh5PuYTIHt9RYLwPWkjREU5dGFo7TPF1j/5s9mgQe/
    pHrv7N4lkzFB2rILc85tQ+7IXDOXAemJNkw3gVaM6NHb1fxWxnLHPtkImnzjBOJGLoB4rP
    Gk2P0VOr2EbDV/M2ASgkKYXrs2hIjvQTPKlPQK0wDr7flY15zcDMaee5FSKw
X-ME-Proxy: <xmx:_qivao0kPcpfr1cR-qsjcVeBZTUtoJGS7CjenDmRkoUuN_3i0Yu2Tw>
    <xmx:_qivau6oDMDfMJgcaXD98ocWmxB-KTtF8M3hL6DUoo2HRS_ox90hSg>
    <xmx:_qivasT64gwXfQwxkz3cjvIhmK1_lOTdRTc98K-5oRHd_BDhqIXceg>
    <xmx:_qivarUaT8GUxteAT51fLiXeJPNovWas2cppYTMWvL5RCqqgsDArqQ>
    <xmx:AKmvareo9nTawTgUSvYVsQ68HqJEacgAm8nkrAo6awF0snBgiBua9ODF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CB68632A0087; Sun, 20 Sep 2026 05:35:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AzgOxjlYMeWB
Date: Sun, 20 Sep 2026 11:35:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <qingfang.deng@linux.dev>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Vikram Sethi" <vsethi@nvidia.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Shanker Donthineni" <sdonthineni@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <114d7d69-dd0a-499a-8cd5-732baa21c74c@app.fastmail.com>
In-Reply-To: <3250a625-7900-40a9-8f3c-612d333122dc@app.fastmail.com>
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
 <20260920014357.7069-3-qingfang.deng@linux.dev>
 <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
 <9895e60c-6a3c-40c8-b188-51891ee6b216@linux.dev>
 <3250a625-7900-40a9-8f3c-612d333122dc@app.fastmail.com>
Subject: Re: [PATCH v2 3/3] arm64: use generic MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_023603_898702_3090D493 
X-CRM114-Status: GOOD (  10.85  )
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

On Sun, Sep 20, 2026, at 11:30, Arnd Bergmann wrote:
> On Sun, Sep 20, 2026, at 11:24, Qingfang Deng wrote:
>>
>> Regarding unaligned accesses, the splitting can only happen when the 
>> address is known to be unaligned at compile-time. Do these accessors 
>> need to support unaligned MMIO? If so, I could add 
>> OPTIMIZER_HIDE_VAR(addr) to the generic accessors.
>
> I think all architectures that have had this problem just started
> using the inline asm variant, and I'd probably try to encourage
> that more.

Also, I have only seen this problem in combination with driver bugs
that define their MMIO registers as a __packed data structure
instead of the usual 'void __iomem*' with constant offset or a
normal structure without packing.

     Arnd

