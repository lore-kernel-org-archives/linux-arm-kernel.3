Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08714C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEskk/2SpuLO/Xrp6JjdV4QHbWz2DrijKvj/WGpMo98=; b=rxWEjaepWIZMQAVbD1oS1w5q4q
	ND+9ZHcie0y2Ut4b18lElmLbuSQVJlq+tW+VqkzElIs5u7atyuPcqmNmG6aWfbf1FyRobjHlUnzuK
	JlFQzuoJsB1Wc3K+eI0F4ck4roYEgRydt+7b0POLQCXq6fB4XQ/ztS63oave901h1jmc1LJXvEpkf
	2MoLS8adU/Jd/WRLmGO5EMoH3F2+kyZvlhbaYFUDuY/61H0R2duiThrgRZ7jXweJoHQJXHE1OwWFb
	JK8KZYtkpV0juFdXeR8S5T+LqeKb+/6ndRRTuk+4MjF9CTJQObsLSit1ScopY4EHyZTNv6xA1O/YJ
	RvVPxWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjXr-00000004AGb-2etd;
	Wed, 05 Feb 2025 17:50:39 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjTo-000000048mg-2wYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:46:29 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 243E12540196;
	Wed,  5 Feb 2025 12:46:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 05 Feb 2025 12:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738777584; x=1738863984; bh=HEskk/2SpuLO/Xrp6JjdV4QHbWz2DrijKvj
	/WGpMo98=; b=r2luspizoix2AEF4EaO2ehJhs7Fw4jAPTtpliuS8JBSUfGJyPua
	qLdsjnxyl17PnEZrM4NHbR0U+29fas76j99i19IxBZURQBifLWxhbBqW55hLySrx
	HAVXCsRLmha2HcqHknDjkL9Xeidf4rObORpsZyMfh5Sh3d027iSyZfBz4EzQqP+g
	m01JL38qT4d+2xoffTqqVpTOqa0+KIuGWPiDNHhSa5VLQhJe1yIQwKQapH1D+A2w
	MrEUldAKDRixrRe9FXa1hGt0oYIx1AP3k/BxL5lJIGHjq+LNbgWNgo19+fF9B1a2
	7z4uNy2MiJ6gkm/dGMNt19qfUpvbLRREaDw==
X-ME-Sender: <xms:76OjZxlYzksRscRa_qX5S04h1IkoM8bn-hTsZOcJs7JyXwTEf9lRwA>
    <xme:76OjZ80UBNf8ydUkrTr-5DJ_vaOkIknryww7-2SJIuyzqEUoknba85E7p97tABPvO
    HqhNu5PCTaAYnk>
X-ME-Received: <xmr:76OjZ3phySEI9zZFX2fLzlWk0i1_zAvHzDKe_9rYPI_Jp7XAtN684i8eLv1I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefkughoucfutghhihhmmhgvlhcuoehiughoshgthhesihguohhstghhrd
    horhhgqeenucggtffrrghtthgvrhhnpedvudefveekheeugeeftddvveefgfduieefudei
    fefgleekheegleegjeejgeeghfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehiughoshgthhesihguohhstghhrdhorhhgpdhnsggprhgtphht
    thhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhdqmhgrlhhlrgguih
    esthhirdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegurghnihhshhgrnhifrghrsehtihdrtghomhdprhgtphhtthhopehprggsvg
    hnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfido
    nhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:76OjZxmJrT1mw4cGC5Z3PVwsGehnoRCjZxYdJ_ABfe7RSiEUpwplPA>
    <xmx:76OjZ_2ZX3nJ9G-5vJnVR0qR9wI4381VmwucynYbHX0TQW3fcgNk8w>
    <xmx:76OjZwt7MG6j-mRcytoklvUnMHVjIFGoXdLvzheatidojseNs3d1tA>
    <xmx:76OjZzXX8eMbKVIFytFckbC4ddt2sHqyb_DKlX_qbpoIeIP9ViJf-Q>
    <xmx:8KOjZ6GI8IvEawqZnrxSUKqmofGTrPSXj8dpIMcsPw-APgDOhhVJr7tK>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 12:46:22 -0500 (EST)
Date: Wed, 5 Feb 2025 19:46:21 +0200
From: Ido Schimmel <idosch@idosch.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, robh@kernel.org,
	matthias.schiffer@ew.tq-group.com, dan.carpenter@linaro.org,
	rdunlap@infradead.org, diogo.ivo@siemens.com,
	schnelle@linux.ibm.com, glaroque@baylibre.com,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net 3/3] net: ti: icssg-prueth: Add AF_XDP
 support
Message-ID: <Z6Oj7eMRV9z9lF2I@shredder>
References: <20250122124951.3072410-1-m-malladi@ti.com>
 <20250122124951.3072410-4-m-malladi@ti.com>
 <Z5J7kGFU_ZgneFAF@shredder>
 <f1cf5bfc-e767-4ced-9aad-76a578c53706@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1cf5bfc-e767-4ced-9aad-76a578c53706@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_094628_786457_186ADC2B 
X-CRM114-Status: GOOD (  11.84  )
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

On Tue, Feb 04, 2025 at 11:25:39PM +0530, Malladi, Meghana wrote:
> On 1/23/2025 10:55 PM, Ido Schimmel wrote:
> > XDP program could have changed the packet length, but driver seems to be
> 
> This will be true given, emac->xdp_prog is not NULL. What about when XDP is
> not enabled ?

I don't understand the question. My point is that the packet doesn't
necessarily look the same after XDP ran.

> 
> > building the skb using original length read from the descriptor.
> > Consider using xdp_build_skb_from_buff()
> > 
> 

