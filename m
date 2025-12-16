Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42A9D5E38D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldnqBVievPPwN4paIWz2GuHWUsTTTEenwvxVDL16XSg=; b=IWu+mhTuUFR1vuOGouIF4uiwuX
	08Fq6PReo8llpvEly8S4iNTEIZKRb58orm8sYoPaIhyOCnWvxu5CT3iMTXhSQo47hq3/hAFCmnOuu
	vUjr6dNL63D0qFt7UsB5YSiB8S4tZc4e5laY9thajmX9yhY1HDy/BLK49V+eIJLrrT05ofJT5bv6t
	u2moiUznG5fw2rf89nLfBbDukUD2xxxDYckM2l+6o2KFm2ctAF7zCx036usHmc1UIN+QbwBcMt9AK
	wLJe7J2JRTSBIw903keAcvdDbr9nihpW2dVRbFcun/qz+ud7xNxbmWDmlhLPrGP1eIAzkVd7RkVWD
	mxzjhARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWDr-00000005M7R-15xU;
	Tue, 16 Dec 2025 14:40:19 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWDn-00000005M6r-2l1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:40:17 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 434F17A0179;
	Tue, 16 Dec 2025 09:40:12 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Tue, 16 Dec 2025 09:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765896012;
	 x=1765982412; bh=ldnqBVievPPwN4paIWz2GuHWUsTTTEenwvxVDL16XSg=; b=
	gE/EUmHbO+OXO2BdF016z86Vz21blRipkOSSr4ycrxmEXrT/TGB3ChfE86veMmzX
	sIrqJc+BU0eBKB1meL+YfEtP+tSiHA5WwrZm2hnUtq2tW1jOnxQ+n2uYZ+VhFh+v
	9fQwLQixR4ijJaWqK9J/BMuqK6h76Dl4VuZXbeVPWVOLA+Iw5d+2FnO5xiVV0KvI
	leMV7AfoWE9wcKjIkJrSDMO3d4W3Sf4YGQlp8bQpsMwprFtW6OjvvUNZzCLnWYJu
	AfuI5EvmHZWV5XSDH8igiOUuNLuahspkyv47L0LepBMsXbyANI6ff2hMnGN2+elD
	O8KJ4naVmNMlQ3Dk/3yBxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765896012; x=
	1765982412; bh=ldnqBVievPPwN4paIWz2GuHWUsTTTEenwvxVDL16XSg=; b=V
	B+t+7yjpFwZ2csKvS8fZ1/PP/V72Z/Rw9PPDRu19VYcVqsfob+qyg8vfFhZbUT2k
	mbmO0lf7kSZrEjMVj891P9X3MYqRFGm02I+EYmwOop8My8mE7AfMAzRqyjP2+iLG
	O8i9b6yRzrXtzhdU2AsHgkrjFKda9ACHab4Wz4Wp7cg6N/At5zWhSUn3xgagZmms
	CMknZ7nAlYtD6a02WQGTu0if4XlKALkyhFs3WZMVXVnAbK0zRlPDlc5pu3iNrIdv
	KUM5WxBEbodH329EYW2KE8NUikLh0YzCGDQkOKh+BMDsPHj5oQondDiwyC1bfBOe
	MPYvj8f8GKJk7yZEvprYw==
X-ME-Sender: <xms:S29BaTITgBu11-TbY251uBEDBdnc6v5Mta2fCFbDl0DF8UDyDce7Ig>
    <xme:S29BaR_sbbCntKwxtnMtF7VXEFjGdXyAC7fDVzF-zZKfs-11nt7CHWoSNXyXImuwn
    7dNnVCRFI06Q0e143zfoXfntjuccOmsrSlP9_ZNtNx7WgBn7cIu0J8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefleelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorh
    hgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:S29Bab8dgtdIlgC9z8aGTms_TY5oWJleV_TdMh5ahJjghxMSSvxkDA>
    <xmx:S29BabaFpa7-VSxT59eZ6akRqdoBvtz_sh2wZh1f44Vrr4ILDTkXDg>
    <xmx:S29BaS3NJnO6tZ2Ec6b2YK6ygkKggXe0jTOexrWv8CUTExett-XjWg>
    <xmx:S29BaeY5RfNSIIRlx3nGhOiPcwgH0hKbQyIgoqBZ3e3PqBK-y7mNFA>
    <xmx:TG9BaQ5uP1GeIfHYAM9NejjoHNVC3tK0faMhSJym7--6tvivhxiNyDfU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D38D3C40054; Tue, 16 Dec 2025 09:40:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AgGhHji4LWAw
Date: Tue, 16 Dec 2025 15:39:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <1ce00594-66ce-4fa7-b75a-d26dc756541e@app.fastmail.com>
In-Reply-To: <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com>
 <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
 <CAMuHMdUKreg6NcMUK-jvgM=R1Mt=VQPntTrwN-PO-S3fnAUw2A@mail.gmail.com>
Subject: Re: [GIT PULL 3/6] soc: devicetree updates for 6.19
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064016_223967_3EE37395 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 16, 2025, at 15:35, Geert Uytterhoeven wrote:
> On Fri, 5 Dec 2025 at 19:28, Arnd Bergmann <arnd@arndb.de> wrote:
>> Three new SoCs got added in existing arm64 chip families:
>>
>>  - Renesas R-Car X5H (R8A78000) is a new generation of automotive SoCs,
>>    based on 16 Cortex-A720 (Armv9.2) cores, which makes the the currently
>>    highest-perforance embedded SoC.
>
> Actually 32 Cortex-A720AE cores, which I believe could indeed reduce to
> 16 cores when enabling dual-core lock-step mode.
>

Sorry about that, I should have looked more closely.

      Arnd

