Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3034510F6FA3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=BdcCNGBTcrUztv/ZDkp6ixFWtw
	9QRm231dm/JLX6a5fuHqgalXW5N024naJfEAwgihy6yZZvM2Ut4uJzTdPhxcU5SQnO8duQiiaPeSj
	kp1WxRDax1L+z4hGoABLIrKkc3ujigocies/GFuouNXnjieUXKndenfx0so5QqN70KODL1sx2NoSR
	Gzfxhbk0+6OF2yxJG/pFYsfiKLMssYbrlDSUFVvclW4++3iCSoZcPOl8ylBNL77VYfcIMmLXj5RQ4
	Ve3WIHLTn3v4DWFy6Td3pAAIlTgK2iIlKQs90rDxronDdcF9HMtkZebaQl2zXjbWlC03hbP338OLX
	5rAaeKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wi0-0000000FVm3-0OMR;
	Wed, 01 Apr 2026 14:38:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7whx-0000000FVlX-477R
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=Xby9w/igyvN5OthglfsiVIDtEU
	mgmAKt20ku1s57ALU8eqS3vvfgYmpflQ4AxiV5HfbQ1VAk3hGrFiHJMv149Pc/LhajNJNZg4RAx2T
	2updvwb6172Obp0+A0QG0Wel/dzG+qfIlH8Ary+SL/I+lV+vl5hV4PkvqT53O3r73Tibdgl8otmPu
	8VnN+8rZDdMjEySnNHGGKgXaTNOGNXgs39OLszwvfM5ykDPBdY7LB3dRpSDWD73Z6nxKBANuHRJVa
	8hJTDUq0lfUDTbpXZNQs9M3MlqCFpY9edhmGZr9dTCbziAV8r9GVVcDPZu2acUeRWQede21bmikLf
	5loqD3Rw==;
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wht-00000000dLR-2eHk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:38:12 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E4263EC02EA;
	Wed,  1 Apr 2026 10:38:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 01 Apr 2026 10:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775054286;
	 x=1775140686; bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=
	AmMRWEIDuVG8FlzSzMniBIBl1/a+uYzrF4spT2t1byEDbhJAtVMmGRP+fNleo4La
	abvHEcr7cdBRiqKxeyq3Pspp/yhOh+Ja6RWlequfppADLK9SQ3qC8TDj7lNgdZxL
	ovANINGOauwCGwGBF3tOhiNU9vt5LlHx4uD6wJdrQIy50cJTiQ2Gbs2inZxIJW6d
	Ti8DpAybtuREh+zrb12ioUgMEAd8C5ZwwOx61QrurS/X6XEdILK7RzJt6oml8Y0D
	w0P81Crm5JgSa2ItGX5Vf0ADDRtQ+91vX31AsPfVx5+FxcHDrFjGB5VCYWhvnZbD
	pYAGLA1g4G0mKQeoRJj7lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775054286; x=
	1775140686; bh=QbWZktnj9SVaA0UcPrEBNb83BuCCl6SWWSCqMxWbruE=; b=U
	bDDVo/UlZC+2WbbgnOAjGzFatFWBCrCwocPf4mOgL2hfJbohhXoFa6oN5T1AFL48
	fURzetkW+4E7M3BQ25IK2Dvz+WZB3utqKQQLwnVlfkiXIbupHsJoeiTaY+qMjvu4
	nbk2O45JR3ocvwnrK0qkLEhRNtyFlsv7NWuzDzzmqe9RaprrcqJSGTm+E6ovLJlH
	dmZbDJn4W72oqjBGh70GR/pWQZIqYiM+McAm1G3YOwBPOkWFKbcgnsm+SaHI01uZ
	nSNd37Un1WiFhFuy1mFYVRL3U5g+/DqL+NsUF03KIOZ3uDiZoX1kFsCS7BK/tPl9
	Zh1boUDVV0zospVnKnRLA==
X-ME-Sender: <xms:zi3NaYOU6A3o1zJkw149u30PTLfR6BydXE_YQic-o2BSq-vPdrlQnQ>
    <xme:zi3NaZzBxz_7hEHtYu6OR9qnoaUai_AMXOnfPZG46ATKTGGR2M_fc1JXzNxXzufvx
    3JsBCahLJnfBUNUgTqr3xHYT6hozJi0OBagjpiAvSHO944lFkuySsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeffeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghroh
    gruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegs
    rhhorggutghomhdrtghomhdprhgtphhtthhopeifrghhrhgvnhhsthesghhmgidrnhgvth
    dprhgtphhtthhopehmtggrnhgrlhesihhgrghlihgrrdgtohhmpdhrtghpthhtohepkhhh
    ihhlmhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrrdhhvghrsghurh
    hgvghrsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:zi3NaTtzslQiStsyHMdrnMouEt24KcyTfuDUD5QKsKdbConAfcf2sw>
    <xmx:zi3NaXgTW_i50r2BT8sVUhAsmoXzm5A1reU7evG6ekGttXbCkvLhVw>
    <xmx:zi3NaRbyAvGLJltjKhOxOmbpa2G0_CPddjDk08TNFdOtEoZpdKkzgw>
    <xmx:zi3NaeZOC10WBXgD052dgglgdAiLD-nvxEerlHRUX-6k8ovq1ySR9w>
    <xmx:zi3NaXOHF5khfW6xRJhMTdstpm2KrlNhZoXAilPKCDUEXEuMM9TAuadD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8B194700069; Wed,  1 Apr 2026 10:38:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Au-GG9YHiX1s
Date: Wed, 01 Apr 2026 16:37:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, "Rob Herring" <robh@kernel.org>,
 "Gregor Herburger" <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Stefan Wahren" <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
In-Reply-To: <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_153810_159284_8EFC2EDD 
X-CRM114-Status: GOOD (  18.23  )
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

On Wed, Apr 1, 2026, at 14:02, Krzysztof Kozlowski wrote:
> On 01/04/2026 13:18, Krzysztof Kozlowski wrote:
>> On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
>> 
>> I think the same issue was last time and repo is non korg, so nothing
>> seems to improve.
>
>
> Maybe last time I mentioned this only internally or on IRC, so could get
> lost. Please get your key in to the kernel keyring, to solve above. Pull
> is not rejected, but I leave it to Arnd who might have your key.
>
> How to get key signed? Obviously conferences are the easiest way, but
> other is to find people around you or on your travel itinerary via
> ksmap. Eventually many people do video call cross signing, so even
> travel is not needed. I video signed twice, but that was an exception
> because I prefer to meet in person. Kernel wiki has guideline on all
> this, so I am not saying anything new here.

I think what happened is that the key expired. I can see that
Florian is using the same key as the last 113 times, and I see
it has signatures from other developers, but the copy I have
expired in 2024, which probably caused it to disappear from
the keyservers.

this is what I see:

$ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
      FE4FA16F65261D8BDA57BCBD61579915B563760E
uid                 [ expired] Florian Fainelli <f.fainelli@gmail.com>
sig          DE95E6B5B9FA86CB 2008-09-16  Florian Fainelli <florian.fainelli@openpattern.org>
sig          9B1F67D46FF7D7AB 2008-09-16  Florian Fainelli <florian.fainelli@telecomint.eu>
sig          F91A73ED49C617B5 2008-09-16  Florian Fainelli <florian@minet.net>
sig          972BE49811AD8F26 2008-09-16  Florian Fainelli <florian@openwrt.org>
sig 3        61579915B563760E 2008-09-16  Florian Fainelli <f.fainelli@gmail.com>
sig 3        61579915B563760E 2014-11-09  Florian Fainelli <f.fainelli@gmail.com>
sig          3A8F3B2F5A7C9849 2016-03-12  Michael Turquette <mturquette@baylibre.com>
sig          E6BF0DCBA6694C84 2017-04-08  Andrew Lunn <andrew@lunn.ch>
sig          987E58D467ED50B8 2017-04-09  [User ID not found]

       Arnd

