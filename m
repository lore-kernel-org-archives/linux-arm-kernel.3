Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A11C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxmqSZ1AK7yBB5MUSaTIQdTYBYRu6YuDz5DPNt9zgX8=; b=RdM6pIRuvzH9l3sJjgtppTT4Ma
	/t0REpa6lwTA7LzodZA94EEuP8FBwuX1+pTrwq1MaKUp6UfVKP9Kp1FbXaPJteBm7UueCinpTv8jB
	7s2omsyJVj4cwKo4rDLt2tvhzOmuMnzNHt5W07E+Ln3oiM+gCz9642o/nfsCaW4mIsPuzELsyyKl+
	qqH/6YpCp6c4Ru5VGW1GOlct/qQWwy55J0rT0sBtarpdm1hcVlWTi8zi3hIpDNzLch3ZInZMUTVN7
	7wzPjgPuSaOMe2rnqJv8dEnRx78SkHvoN57pkE5LFQXY+hm0E3rOa7HR6AmI9R3z0W5YWTb7HYKmc
	37XgE37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCimF-0000000GNR7-2iAr;
	Wed, 07 May 2025 17:41:51 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiIi-0000000GGDS-1aPY;
	Wed, 07 May 2025 17:11:22 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8BF492540051;
	Wed,  7 May 2025 13:11:16 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 13:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746637876;
	 x=1746724276; bh=CxmqSZ1AK7yBB5MUSaTIQdTYBYRu6YuDz5DPNt9zgX8=; b=
	TD8MeoFXIn00Al80JI5XHSktYNRxRkcus3vLgbmGgVz/giA9jWsvGiRPlTSCF62R
	SPRPCKSZRQlHnqrghPxoXESn/AHD/YE1gUnSm0TPa+hl9YnQr9TMlpylF5vWEZX8
	70qpjziLPxUlyAzY1B5J7wvSqNRwFbYdweccbt3XJn+9+k1P+lobGddJVYmLa1vz
	f5DTv6Fg1fntIA9WvjDC6PUZD+CEpnca1iqH/BUoUWhv8QSbtrEzzplIbgRl0+SY
	ii7Q3/z5vPrWEJoBXeHPzdAg3A11bUV1Zd2RoBpsZy1b204Vy6Xc3zb1FDbPjTpH
	96TCuaqbNvBJSrppI+aHZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746637876; x=
	1746724276; bh=CxmqSZ1AK7yBB5MUSaTIQdTYBYRu6YuDz5DPNt9zgX8=; b=p
	V1thzWp7eesDXNbedrvkD1iAzNrHo/OXQuyk/CTNDbUB+BHkdY3atJMJwoSezu02
	O4pnKco6LMh9FNLV7pk18A4UOAnpAY1mtF3VnIlrqJo5RH6Xgj+sgXxcxvkCQVHI
	byWwyEArtM+8aRcyavpO8F1LmkYQ3yZqRXURUYvTkEP9MnQkNqaOmCnsd2ZNi0sk
	9m4Gylxw3oUWGoxvaLnzD/NTje+gr23mwgyYsu1vOmrV134NBWjavDveRBY2WMtT
	4BMGlou69/KJYdDRuWwrCwjc33W2rSSdXsZgxviuKgGy388ml3+dNHxlMjirIsJ0
	DfR+Nmbaemm9s+ZVK6slg==
X-ME-Sender: <xms:M5QbaPsMwqf-pS3_653FHCGaoz9P_YagO9WpOIr_TpM7OBMshiq_TQ>
    <xme:M5QbaAclo64on0zQsOgWsim3nNFSsWsbwLz5rO_ZRdznEhjkpTdGFzmYF4OGFS7o5
    jMDYxSHyYiXwfBdq00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelveff
    feelkeeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheprghmvghrghhnrghtsegsrgihlhhisghrvgdrtghomhdprhgtphhtthho
    pegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorh
    grrdgtohhmpdhrtghpthhtohepnhhfrhgrphhrrgguohestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslh
    hishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:M5QbaCxmjxrDE9yrJxbt3PHNCP8k3VIrNux4v48ofmIojq2f1xZpTA>
    <xmx:M5QbaON0TcKXLcysSxt8BPSKohLTEKYCDL-UG7QhOOUFuV0kJJ8CPQ>
    <xmx:M5QbaP96hilH0TkMGS83WQ_pdM_Cx1a2PteS4DivZVflYIq3ug8fdQ>
    <xmx:M5QbaOUUvoZp3p8jSEdBS3unBjEDzBoQ7uGr-oRHGh87eakDVvUgaQ>
    <xmx:NJQbaLcnpQ6jhKJ4Hm6Hmzq6JnU4oeNA91IBLkIWJGTncBLWZdNMWR6l>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F40F51C20067; Wed,  7 May 2025 13:11:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2abdfe4f2fd01522
Date: Wed, 07 May 2025 19:10:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alexandre Mergnat" <amergnat@baylibre.com>,
 "Zoran Zhan" <zoran.zhan@mediatek.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>
In-Reply-To: <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
 <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_101121_196182_79097F78 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, May 7, 2025, at 18:41, N=C3=ADcolas F. R. A. Prado wrote:
> On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The driver support was added without selecting the codec, which leads=
 to
>> a link failure:
>>=20
>> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in funct=
ion `mt8188_mt6359_init':
>> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet=
_enable_jack_detect'
>
> Hm, I cannot seem to reproduce this. I just tried to build on today's =
next with
> CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
> CONFIG_SND_SOC_MT8188_MT6359 both =3Dm and =3Dy, but in both cases it =
compiles fine.

The config that failed for me had CONFIG_SND_SOC_MT6359_ACCDET.

> I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add=
 stub for
> mt6359_accdet_enable_jack_detect" [1]

> https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@c=
ollabora.com/

I had not seen that patch, but with that applied, my patch needs to
be revised as well. If the idea is that CONFIG_SND_SOC_MT8188_MT6359
can work correctly without CONFIG_SND_SOC_MT6359_ACCDET, it should be

      depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET

in order to force SND_SOC_MT8188_MT6359=3Dm if the ACCDET portion
is in a loadable module.

If SND_SOC_MT8188_MT6359 requires SND_SOC_MT6359_ACCDET to work
correctly, then my original patch is still needed and yours
should be reverted.

     Arnd

