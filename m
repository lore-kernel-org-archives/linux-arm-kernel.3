Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B673E103E174
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgETNFSkBCuNe00TK+uyXLmxYSvaHFnqr/AOivVYrGg=; b=tQmv3qpWuhfwKfuEj6gwK3Tebj
	UJbYVaGBDyiw0oylXBjURLc6qNxCSu+FbkaKl7hO6XDcrVds6zNy4K0PqtFTNs+Ktr4GMyfgl2121
	QmDKAKIHkqGJw40NdKzunlTG1HUwG2VU2hflGgQJBnuzQhF0YljJfHVZelqFwgboxaDcdnBx+Cik7
	hoMwgV2pPnfD0UdjW/IZyTtPXQH997GRiah47vfe75GTnxG/iDIHnxMxsXH8nZ55IMYX2RV5gOKf7
	LALjqAWqJe/vLfTa3mMGUCl/NywMFLjGdGzqb7z+sov5jyhpBmz6WVkwLK8wyEWdA0DX+x/RvfoOs
	4eEjKo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qU7-00000008REd-2g2o;
	Wed, 18 Mar 2026 12:58:51 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qU5-00000008REG-3VuP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:58:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1FD991400243;
	Wed, 18 Mar 2026 08:58:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773838729;
	 x=1773925129; bh=NgETNFSkBCuNe00TK+uyXLmxYSvaHFnqr/AOivVYrGg=; b=
	LJwZ8qoCOvpuw2sP0qvk6qXRdGJm52uroDrWcWj7BIimYw2bPdiuK5N+0jxStovX
	aOE4g+Iy9XRLS0uMe8kabVvquTlfpuk7LZ5fVZwpNyDStOoSUw5xxecS9WXhYBHq
	he+HcMKx4o/dgAl3L0BAfuKtbqG68IPSfecPvAM80Ie7lYbcT2sdHl/6MLdQj2b4
	2Mk20B0gk4uF8BCKaO/7aZ885/JjL1fHHIS9wEIAgHHFVi/RSbvi48Z1MXKKArbg
	HhX0vFK6VRywaa55DlT/bwDqn8GnUvnIsnodwVU3TfHo0IGGqZo4jgq7FvL+HA3R
	7REeqKkpQzJNddlcL7wesw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773838729; x=
	1773925129; bh=NgETNFSkBCuNe00TK+uyXLmxYSvaHFnqr/AOivVYrGg=; b=Y
	f/NjsNafW+O29jaEeA7kJMfCR6QX8OeS39U5TjT6gw0EyzxxPvzBTcP3dc2aQ4YL
	JD1uHbTury0m6rQ3VProognDyz4X7+4f0LOaADcL2wAb8gSjEcOFSr4cA2eXs2MD
	aLj4NzFBxIaS+TUNOmNCuIbw1jdBpetXbVcm30JrDV6y3JO6ijiTxkJ8FL4zmOh0
	6BT8sMNSufEqGmY1a+ifG6wOmkIO0TwZtApU6QY9IE0HLjQTn6a/VCqRM5io1d5+
	eF2gEsMk7cEYZ+cdThF8yvwQ1oWlm1X26wC3+WvbpYPUNS8HW+J99XMqYbJdYxqf
	J/F1hy2yM+H6TlErV0Zfw==
X-ME-Sender: <xms:iKG6aUjhmOnkFH-LDG8v1kiI00jOI_ij5vVQ-raWDo1SmcrS-b1wXg>
    <xme:iKG6aX1vbcphyWehzNIjiosphUwnVOyTZVb2m_xYASbHXOP3LVtxHEHtLw0vkQiw0
    oJfQ5jjMqSb3N4Xfz9b3Jh1oBYipj-egx1xILakCpyKNS1iKkFHoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtth
    hopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhu
    gidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iKG6aVFzr-gzim0unLZhggbbLZ7j_LFSiChxpokLPIhRFqYM_IhJDw>
    <xmx:iKG6acnjyD9Xf6cwZQTglI_hMQG2r2O4mdBXc1KNd8BaUeyh2AMpiA>
    <xmx:iKG6aZZuv9uvwDbMO1aSqp6bmOGNc7G9ofqcH6CQsUMAeyznza41lw>
    <xmx:iKG6aRFI1CK_-5PmWP7qH8MXdRvEVATIHvePtg-nycWg4vMMFiNTFA>
    <xmx:iaG6afwghU4sT5JPuaIz8nBOw0zIum17yk_y0Nj2UjiB0ygSpQy0N4Vv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D40AA700069; Wed, 18 Mar 2026 08:58:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXMg69VYQg4R
Date: Wed, 18 Mar 2026 13:58:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: soc@lists.linux.dev, "Magnus Damm" <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <a4174f08-cb01-4338-9909-e2d4cfd60934@app.fastmail.com>
In-Reply-To: <69927bd8-d476-4a24-91af-f21cdc0bce80@kernel.org>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
 <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
 <bdefa3d7-353c-4aa1-a013-685b46773fe7@kernel.org>
 <69927bd8-d476-4a24-91af-f21cdc0bce80@kernel.org>
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_055849_944146_BCFCFD87 
X-CRM114-Status: GOOD (  17.80  )
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

On Tue, Mar 17, 2026, at 10:53, Krzysztof Kozlowski wrote:
> On 17/03/2026 10:29, Krzysztof Kozlowski wrote:
>>>> See also submitting patches in DT dir.
>>>
>>> So the second commit is subject to II.3:
>>>
>>>   3) For a series going through multiple trees, the binding patch should be
>>>      kept with the driver using the binding.
>>>
>>> In this particular case, I could have included it in my drivers branch.
>>> Where do I put SoC-specific DT binding changes that are not picked
>>> up by anyone else (I don't have any this time)?
>> 
>> What is "SoC-specific"? You put the DT binding with the user, that was
>> always the rule and that is implied by submitting patches. If you do not
>> have any user, why would you pick that up?
>
> Actually I want to correct myself or explain more. If you document ABI
> for existing driver with DTS user of the ABI, but without driver change,
> e.g. new front compatible when using already documented fallback, I
> would keep the change in the driver branch, even  though technically the
> DTS is the user of new compatible. That is what I was always doing at least.
>
> Why? Because I expect there might be a next patchset with binding+driver
> adding new fallback to the same binding, which would have to go via
> driver branch because of mentioned submitting patches rule. Therefore if
> I put that first binding in DTS branch and in the future I want to put
> next change in the driver branch I would have unnecessary conflicts.

Right, this makes sense, though I've been rather relaxed about binding
updates in the past, merging them either through the soc/drivers
branches if they came with the driver changes, or through the soc/dt
branch otherwise.

       Arnd

