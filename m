Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=DDJtmtGMKVXRAslZLqpM5jaXkE
	OZWwK2DNue1kL+rol5n70z1kri/0Ct0FKHCq/KYM4SzFSSP1WYDYXfUE3l0Bq1tM259X11ND9/3IX
	fLaYpQVnj6sv3/sLZDKNo/tE0XSBl3R7NXQDI+QKq0uvrGKQ7gvSApUBqx/IjVmqQcvFkd8lF5EKK
	UQKSa6nON/1RYhqPzRPeOMRrEK9KeEbaAo0S8eI37pl1YU/FTekOOKBcXfDutxOAowQrAqD+fOv31
	C7JArCfOP0ftjKppoNgstq5iz0VVmWcgNVEk+8MczrNgjABHFh8pcpHOLle1HEPEGD8FOmrT8FJHW
	YB394ZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxma-00000006C77-0mSV;
	Wed, 02 Apr 2025 13:05:28 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxk7-00000006BNa-0yZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:02:57 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 092981140120;
	Wed,  2 Apr 2025 09:02:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 02 Apr 2025 09:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743598972;
	 x=1743685372; bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=
	gg6RUPXXt3H3z8L8cmXCPtMBoyEnxaJFzuHjASmOTUQ+M9GlyUQru0hXh41oFKP2
	dFxqjRfR4GsCU3hTndh3uV8MV9gj+uavPPv+EjXQNt6xHA8090cbxGLODU2L2v05
	+3+GnpqEsBzm67jNpHUD1G1kcMyKMLobRwcG0p9B6u6OpxF648pAnXvDEpk2zeKZ
	nEcJExcz/6PClokw8X49JtMMioNymK3ICVBD4WliTeWQ4qpPr06v45lSQUh0yUH9
	oYs9GWq49tB9dnfLdRvQcE4dk0eiNtzdNOlr3RcZg4QeRP71t39ww8R8ZW2jdYsE
	kHxOOLocuzu2Clp4ZpFsCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743598972; x=
	1743685372; bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=n
	78nMbbPtE46JMldQeHEXrxRqA+SmvqqlDOlSWSZuaEKGZSoIfmz3WDIV74UvXqjg
	7o6qANRtJ4E/mGd535EW5krWHEj+S/nHHb0h2cRAqcp47UcbjkLFC19lx3sT5Q/o
	ziSt59wqjxlvhB7ggLxScg5bTjDHubrtKSTOIcEhLzvsverk2BKjFVdZm/3ejboU
	5F9elXkDNLiTTpe87NYPKK6mV2rt5SECFE27nHGyDb7eEe3SN4Jsgb5wwc4nLyky
	VwfnGpgJSKVwhXnH/ttlPrG78uN5fDJ0RCOMOJ7ipntXP/ZGiTyz5vBw/Wod87wr
	bVrFrt/VHgJ2M6Rp3iYIA==
X-ME-Sender: <xms:ezXtZ6sDCpW9FyCUSQTXNandTpb9tgG3W3mja7hq1S554mwWeC8lyQ>
    <xme:ezXtZ_dNKWh-_EfibN9NxlOcJTeaKAcr6vrNE54sTxChc3LmCMu4E5LOvvvNH6-bs
    OF0I8YvrkeKxKxDcAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgu
    vghrshdrrhhogigvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopegurghnrdgtrg
    hrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehnrghrvghshhdrkhgr
    mhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhi
    nhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehl
    khhfthdqthhrihgrghgvsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhope
    hllhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ezXtZ1x0tn7ltpGTDYGifQyNGRwv05HQhp7VrRtfOYJERIsYFU5jDA>
    <xmx:ezXtZ1Of7TE_gxWrJ9c7KR2LYhhzet4wNAtbTSz6jf4tXfLOFRPmbw>
    <xmx:ezXtZ68sGdYz2vnEQ6TnUK9X4QGhn2liLK4occMVE2styVeDxOwdsA>
    <xmx:ezXtZ9XcFzt4U54KRH7UKrG6STA-h_Ug_wweIkJej96LpAu49GYE5A>
    <xmx:ezXtZzN6BS9dQtVWxt3yAmWJ7-RuOF4CsSi15WszlIkVW3qMZzB9w9x6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4E1562220072; Wed,  2 Apr 2025 09:02:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1e4eead9af4a5be9
Date: Wed, 02 Apr 2025 15:02:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-s390@vger.kernel.org, "open list" <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>
Cc: "Steve French" <sfrench@samba.org>, bharathsm@microsoft.com,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Anders Roxell" <anders.roxell@linaro.org>,
 "Shyam Prasad N" <sprasad@microsoft.com>
Message-Id: <3ad96ab5-72a3-48ee-8ab3-e68d066169a4@app.fastmail.com>
In-Reply-To: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
References: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
Subject: Re: clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_060255_339317_0DA16638 
X-CRM114-Status: UNSURE (   5.58  )
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

On Wed, Apr 2, 2025, at 14:21, Naresh Kamboju wrote:
> Build regression: arm powerpc s390 modpost "wcslen" fs smb client
> cifs.ko undefined
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
>
> ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!

This is from the latest clang release, and Nathan already sent a fix:

https://lore.kernel.org/lkml/20250328-string-add-wcslen-for-llvm-opt-v3-1-a180b4c0c1c4@kernel.org/

     Arnd

