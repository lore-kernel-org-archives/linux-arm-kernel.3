Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B38CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4g4adTQMUVwYTDDDF3YwmkpD9IuhJi9J7dGpH8tKXI=; b=ERuloM2L4WjL7kuwvoOBs2csBb
	WaA/NpWyKeINs1suygRfD2TovXkIXRXzW3sJAQ8FMrDC1Gzyf+tN69uPT9+b44ghMAWtnKUIR+Xve
	RILfnAqdThtXaco+M5CqjGE+r+BgnqdU8FUBjcqobOy4SNgpz7hdheDJd9plGytKBzV6CJZHUQ9jW
	+/8+WdKyWFhCVE7nVC7wazMnxW1QgvfSwK3v4/byW1q8EWQFd9mqNGXQiuf8mlcfOrcMw15qE4Fuq
	B/UjLlLoqZkjACWyhvC9+9X9WBVtfDSq3ZHVm3/R1IIv6Gju2byVOPpOS6wzK0D3KN03e6lVc8Xlt
	HHZmlLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PVn-00000003SgO-0v2F;
	Wed, 08 Oct 2025 08:27:03 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PVj-00000003Sfc-3dsR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:27:01 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C908EC0215;
	Wed,  8 Oct 2025 04:26:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 08 Oct 2025 04:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759912016;
	 x=1759998416; bh=F4g4adTQMUVwYTDDDF3YwmkpD9IuhJi9J7dGpH8tKXI=; b=
	zTDwunbgyiibER+SJRhVJ+wD8TQHC+nS5vN6gnuJkpoCMK14LuJ7xVdZv/FtGJM5
	IYm1EJu0KyvUHx03BsLReaNFEHGmIUj8U1VPHKgG3hFxr3IzJF2NcuDtLkZ8kXTd
	EGb96HO6CvmndsCCo/a3+c6q3cOj3Q6kooj1F6daq9E+rBPJLdcChoDk7NSSr1Kw
	jsGihAdTGM4glkALrJf6HWlgnKiFSaNFDF1B/ZOTwLRuLb6dGjs+1/erTd2rqalt
	XLT/9ikSGBcYqd+Az6PLpMTna1mjlnd5AM3l0pXYhMiyZA0odoAdKrhq6yXLb/EK
	icj927pR6I7LBhY+ZzQwxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759912016; x=
	1759998416; bh=F4g4adTQMUVwYTDDDF3YwmkpD9IuhJi9J7dGpH8tKXI=; b=M
	erVP5i+Y9D4XNXBQRjJOzk1JGwnjOFCsrKtlQZ4+z9LhO95zA1wi3evNak1A0gUb
	ggDDJfrDw5qiM49bGqJXsbKHFreGINqu/YieesKfTcxqmHEsgUtag6pCZiw8FsxT
	bHpmw+LMRXwmqtsy5v3PxEUaWw3QyF2xPtk75Bx6/GPIfKOuh/E/bhsQEv2xf4fH
	mu3PvkZDKJhW6Hmp4+9Se4ldz0v0VzyTv6q0m1Jpr7m8zJjHMN4Fm4ZkePPDFHlq
	H5kU5pzqQA00dI1haKXO8Y/ieM6bqvlVTP1vAVT0jaApi1rt+u1rFzqpAZNbsifN
	nHmU8bZ5cEzlLwn3ddb3w==
X-ME-Sender: <xms:UCDmaL0IImzm_PwDSWna-4KHTqF_cK4_Y_cTVNtaxk4gzR4FuGokPw>
    <xme:UCDmaE5aIm7pFRnzvlVbg172uS3EqNI61R2QrTIlgIbBlMOPd_cvDr5jPnkk7MeV2
    4Vu1L0Rq3sORWcFcPZJHLWN5lo8UqMqPSCIkQ5YcIaIFOU-r2L7QB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutddvkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegthhgvshhtvghriedvheduheesghhmrghilhdrtghomhdprhgtph
    htthhopehjihhnghhoohhhrghnudesghhmrghilhdrtghomhdprhgtphhtthhopegshhgv
    lhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptggrshhsvghlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhifih
    hltgiihihnshhkiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhpihgvrhgrlhhi
    shhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghniheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:UCDmaLOlPWHWdQNn4xwFmfSGyab7IqavwPNkHkbJHvvIlDF412pKvQ>
    <xmx:UCDmaF3eBOY6zZMrPIU2phnPckb9VbQZjihp4ek57JRTeF9RPqLjlA>
    <xmx:UCDmaHlCbkpoXY8N1wP84u7TScth8RLT_OtHiGT6yZXAibJBU3XSTw>
    <xmx:UCDmaL66592w09_8OC5012ug0qgCwMPjzCNBU-Re4z41ccAqlChzFA>
    <xmx:UCDmaPYlOr7WPuRBXF8g9VDKDh-FKa8dFjSczSM3F_4uhgs3VBvXXCwE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EB7F6700063; Wed,  8 Oct 2025 04:26:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIHrVq-NOQMk
Date: Wed, 08 Oct 2025 10:26:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manivannan Sadhasivam" <mani@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>
Cc: "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>, bhelgaas@google.com,
 jingoohan1@gmail.com,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com,
 "Larisa Grigore" <larisa.grigore@nxp.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>,
 ciprianmarian.costea@nxp.com, "Bogdan Hamciuc" <bogdan.hamciuc@nxp.com>,
 "Frank Li" <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 "Niklas Cassel" <cassel@kernel.org>
Message-Id: <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
In-Reply-To: <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_012700_323027_8D4ECADF 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, Oct 8, 2025, at 00:28, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 05:41:55PM +0200, Lorenzo Pieralisi wrote:
>> On Mon, Sep 22, 2025 at 11:51:07AM +0530, Manivannan Sadhasivam wrote:
>> 
>> [...]
>> 
>> > > +                  /*
>> > > +                   * non-prefetchable memory, with best case size and
>> > > +                   * alignment
>> > > +                   */
>> > > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
>> > 
>> > s/0x82000000/0x02000000
>> > 
>> > And the PCI address really starts from 0x00000000? I don't think so.
>> 
>> Isn't the DWC ATU programmed to make sure that the PCI memory window DT
>> provides _is_ the PCI "bus" memory base address ?
>> 
>> It is a question, I don't know the DWC inner details fully.
>> 
>> I don't get what you mean by "I don't think so". Either the host controller
>> AXI<->PCI translation is programmable, then the PCI base address is what
>> we decide it is or it isn't.
>> 
>
> As per the binding, I/O PCI address already starts from 0x0. How can you have
> two OB mappings with same PCI address?

I/O space and memory space can use the same bus addresses,
since they are disambiguated by the type in the actual PCIe
transactions.

We usually assume that I/O space port numbers start at 0 (as done
here), while PCI memory ranges are identity-mapped to the CPU
physical address they are mapped at, but in this case the physical
address window is outside of the low 4GB range, so an identity map
at 0x58.0x00000000 woulds prevent the use of 32-bit BARs, and
mapping something in the low bus address range is the only
possibility.

On the other hand, what looks like a bug to me is that the CPU
physical address range for the PCI BAR space overlaps with the
the physical addresses for RAM at 0x80000000 and on-chip devices
at 0x40000000. This probably works fine as long as the total
PCI memory space assignment stays below 0x40000000 but would
fail once addresses actually start clashing.

Maybe the memory space can be split into two windows like

 <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x40000000>, //  1GB 32-bit non-pref
 <0xc2000000 0x1 0x00000000 0x59 0x00000000 0x6 0x00000000>; // 24GB 64-bit pref

The 64-bit window could be either prefetchable or
non-prefetchable in this case. If there is only one programmable
window for memory space, that would probably have to be
limited to 1GB non-prefetchable for the normal 32-bit BARs.

       Arnd

