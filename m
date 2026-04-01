Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65F610F6FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNyjEC1krGnXx7stQTOSVbw/FrakGO4Ep3sSimp9/m8=; b=ZVMUgxqNobC82vO3z5D9gTq7tz
	5lWNuv/D6ecOOC9syGGyvyl9lbpiRUJGU04KoiMT9uYFDvn4z9xR/vLxcSrAzQLnMp4Jxc6dFeocg
	cU8vSnplTMepXponEyj1jxADjuOPlgB2dpG+2PzsI/tYqXWXMAdTqqwkEJ3ac+8+NntDOjYwu/tmt
	a2UVTqRa5c8rcqkJJ3B1mPBkNCkJwvjccWND+j4P2oQ3uALs3pt9TuUA1/M6SGrSOHYKBCLiHbb1p
	Qgyfpzhc0x1iraC+FOOevy6qCZ1fo8xFPztLia9zGBhG21WF7+73M2So13p4Fg4VQGwAgd0Fv20qi
	YFuS8Sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yW9-0000000FjsU-3Yh7;
	Wed, 01 Apr 2026 16:34:09 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yW5-0000000FjrI-08xs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:34:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 24985EC01CF;
	Wed,  1 Apr 2026 12:34:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 12:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775061243;
	 x=1775147643; bh=eNyjEC1krGnXx7stQTOSVbw/FrakGO4Ep3sSimp9/m8=; b=
	g14YNAjMYEOBftpeojjGYB/xes7Y/Pm+wBJzYpM2hSTy6wxWpy6oIh15+fWP7Dcm
	RmAItmu8F5/OzeKfktKdCPG61nccS5pK2pHd5C46aZUjdqwrmMRLQS+2PTYfakIR
	hiSc1+eV/8UxVLVo72Qq2VdI/8Lco0RWFWdekbOV7VVfNOOsSIVbLR+7CuJdZHhr
	IPY04K3y4RnSLMpWWeHCJvZHElGrLh+ffu+jpXNkzJPS2F3HW6Ik675zgAGIio+E
	7W+h4NnEPvtELASHgU9ZGKBIr1oS/ThqKZZ8iHXv23ch5zM+TYRPohqFUcUgPZB4
	BZ8gfIbaGukIdOvcHkX0ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775061243; x=
	1775147643; bh=eNyjEC1krGnXx7stQTOSVbw/FrakGO4Ep3sSimp9/m8=; b=R
	kapDPRwiNBtgNNmu+Hb4gikyUXhHcqPNUYtNLs01xxePVNEewUUeA2dWtj/vx7bs
	mXfgBHYiV2Q2bD6TMilaqJVIgS7wJ2rezeN3mbOWF6a7gghXZ/W27Ihj/gOKHvYX
	4iLHEZhBuR/+qtkrbllHY/sw0vOtgehuqArP9P441MHbmojbUKs3q7XC5LYaReLv
	9SIbg1dLCakCUqsBE0a0QCgLmiEzvY5FZkMvpJsmywEEKxnbSc8h0OCGxCprRWew
	TMHpf8pNXEcVqlTCqpAUF8TabBMvDPVJ8d977O8u1/yAMu/gfOuANQvlsR23sGSj
	i5wzJYNZT1r9tTdN3G/xQ==
X-ME-Sender: <xms:-kjNaevDchDeWeh52EWYO3V1St1mUDxioq7Hq1v943NaCuxJnOMA5Q>
    <xme:-kjNaeRgFV8_CvIerqgI2adZj0ydupSHViLehQgsRJNi0ZSz2nxziNSksffSUqDnA
    62RPcES_BXaNP2J5Gka-wSzMCqpg16ao4T_FHARreY8INgOMG984T03>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htohepfigrhhhrvghnshhtsehgmhigrdhnvghtpdhrtghpthhtohepmhgtrghnrghlsehi
    ghgrlhhirgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrhgvghhorhdrhhgvrhgsuhhrghgvrheslhhinhhuthhrohhnihigrdgu
    vg
X-ME-Proxy: <xmx:-kjNaaNK3jkERpPwEPGUjMgCH0KBHCAbpQ3r8QmfEkQ8LYYYAaPRVg>
    <xmx:-kjNacA6bbM7stq5ZZUSI45UXXJdI6gM_y9qgSM4O3qGEXjCUx9j1Q>
    <xmx:-kjNab5baI2gEH1V-HXAf1YIBnL-EIf24n-fgRT-H2CYRf4uBN40Ew>
    <xmx:-kjNaW47BijTRpmIB2RXus-979b23403EOK4wgvoG_X126gmYKRfIg>
    <xmx:-0jNafsMUtWyZTPAMg8WsgbwKjBsU25vMSAO0VCZNNo5gQxt7PvVpQje>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 844E5700069; Wed,  1 Apr 2026 12:34:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Au-GG9YHiX1s
Date: Wed, 01 Apr 2026 18:33:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>,
 "Gregor Herburger" <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Stefan Wahren" <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
In-Reply-To: <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_093406_652858_79260D0A 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, Apr 1, 2026, at 16:47, Krzysztof Kozlowski wrote:
> On 01/04/2026 16:37, Arnd Bergmann wrote:
>> $ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
>> pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
>
> dsa1024 might be another answer... DSA1024 was deprecated by NIST in
> 2013, so maybe gnugp even drops it just like keys with too weak signatures?
>
> But another problem is that I do not see it in the `git log` of keyring
> at all which suggests it wasn't ever submitted.

Indeed, that also explains why the Broadcom tree is hosted on github
rather than git.kernel.org. While using the kernel.org hosting
is by no means a requirement, github does occasionally cause problems,
and I do get a bit annoyed when it takes ages to pull from that.

Florian, I don't know if there is a Broadcom specific policy that
requires you to use the corporate github account, but if you
are setting up a new key already, it may be a good time to
also move the hosting.

> I don't think DSA1024 can be accepted now in keyring, so this requires a
> new key, cross signed by the old one.

+1

      Arnd

