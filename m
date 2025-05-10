Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BBAC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMTY9qFogQa0Mq320HhUniBejxmAeYawCBgAAg59X50=; b=SSffP3ExHqOA9EsI6eF+lB3EP/
	BG/ei9LiYSFv3zCM0ISo0ImIevgAjKcpgeR8KVWxyqcER0tNJ3uoDqKguQobAWdKjOBbOG2l53D0l
	VKXichV3L4QU8sm7hvgP5fW6q/lkGPoFdTdAYYrWTqRZhcugs53s5LJW9MEoFqdeI1V0c814oJSHv
	IMC4d8dhM7hCnCnlbnv64LxcJizIAofkjl7UKmlqH7AdY5N2okM55sfd1EMlNS6jmeeoQzavqOpWm
	yh1+bBuFymlJGrL3pDYma9W4o9PvOfdH2HKCqghBNLHqcbw9xTkN2q8J/3E6Qhh90wBNAshkkkqSO
	PdSnDFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqhO-00000006LLk-1hXf;
	Sat, 10 May 2025 20:21:30 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqfH-00000006LH8-0fbI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 20:19:21 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ECAAE1140080;
	Sat, 10 May 2025 16:19:14 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Sat, 10 May 2025 16:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746908354;
	 x=1746994754; bh=uMTY9qFogQa0Mq320HhUniBejxmAeYawCBgAAg59X50=; b=
	W1roBAZHchvU7brkv5sM+bEPS6+gPBxpN9gdQRR3tsG+7vbQDJ7sw+IsjKONi9Ea
	p2+m8URLPJxGPTz8V5ODbG65PFYHpk9OXKz6ZsKcfAGYcfEYQWN9RgqQH4hfigFN
	+gfMQRVA85DY/vc03Vf92KVAslm+wH1qX3IWJ//Soql3A3Z2ZW581gR/cql0Umqa
	K/yX7gYK3h5ESrbzyohgP2rC8xF8+vcxj0CTpIWOjXe6Rp5x4kHNhjOdys2cNXCP
	IeMOz5TZBFOv1yLWC9Ud0vZI/GWHxmN4wFCZoJ8Vbi/U6ilI45uIlyc4vu0rEjZe
	PikbmnQ1GSFSzhJ8DTx4Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746908354; x=
	1746994754; bh=uMTY9qFogQa0Mq320HhUniBejxmAeYawCBgAAg59X50=; b=K
	SH/bjorPMgfh4SJiCT2jhxZ89WsG0wowhuT3ljJKMy4M30LEDPQaAU/W6I47T16K
	RdA7wd88tpcVJMk3v+eOO93VNew4UtFc6mQbIb3QHXaJ/9rBZz77MHBiW63sjtWA
	8Qa4PDpiUU/jgHYW7QnqNb1Nbwo2z6fvd1nrWrxBDq5qOyfEgIStSTmr+/3pbLww
	e46aRDzdYq3NU1+YOg26BDADq785/fWHTEMYGKf/u+d8MsNYgpIJrzaXHh+gTyps
	3xlYfy1KUmwjXFEWaIEHDZCxmjVQymLG4Kv59kGP18O+/lmd1l0aevRblu35taCY
	wh4tUqYym5ncdszs1reLw==
X-ME-Sender: <xms:wrQfaI5-GTxu5-SAYyEQ2M-xFj3rYxxFjMWdoGh90jGnI6RhXsyGpA>
    <xme:wrQfaJ6SbJVb6Xret8fhE70NUWTQJZzvOgXnV4HtyhtXLj2ty8AGaUaCSWScuvnVu
    0H0FRUNSpuUjSM1RiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeigeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguihhnghhuhigv
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:wrQfaHe5_E_y10KKiRmwHJuBabKD2gu8Xp85cPArkxajpCWSGiuHIg>
    <xmx:wrQfaNJN0437e2noiJoV9lDzMFQeLmVlDCYyyKYDh5vTXXugiZn3zw>
    <xmx:wrQfaMKSvlDq5RY9pUROEQDT7xMKeH-gAETfOufv13J9RW3-f0a4Qw>
    <xmx:wrQfaOxkvaCKoj54Ft0LhQUvWgRezYwnCBpTmkj7gDeiESCHI12XKA>
    <xmx:wrQfaMskA1r8DApt5puWdB5-BIdb_mfBiGK5ZdJHOFRIR2O6LWR-ycKX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 52FD41C20067; Sat, 10 May 2025 16:19:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 10 May 2025 22:18:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dinh Nguyen" <dinguyen@kernel.org>, arm <arm@kernel.org>, soc@kernel.org
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-Id: <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
In-Reply-To: <20250506004825.134929-1-dinguyen@kernel.org>
References: <20250506004825.134929-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] ARM: socfpga: updates for v6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_131920_084274_575E80DA 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, May 6, 2025, at 02:48, Dinh Nguyen wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git 
> tags/socfpga_dts_updates_for_v6.16
>
> for you to fetch changes up to 8dbffe5f5dd531a3c3f9d603462e499085449277:
>
>   dt-bindings: clock: socfpga: convert to yaml (2025-05-03 13:33:23 -0500)
>
> ----------------------------------------------------------------
> SoCFPGA DTS updates for v6.16
> - Updates to dt-bindings
> 	- Document Agilex5 NAND daughter board
> 	- Convert Stratix10 FPGA Manager to json-schema
> 	- Convert Stratix10 Service Layer to json-schema
> 	- Add document for Terasic's DE10-nano board
> - Add support for Agilex5 NAND daughter board
> - Add basic support for Terasic's DE10-nano board

Hi Dinh,

I'm not sure exactly what happened, but I see that this is
almost the same as the previous pull request that you had sent
for 6.15 in late march.

I had already pulled in the previous version, and if I pull
this one now it would result in duplicate commits. Would
it work for you if I just cherry-pick the "dt-bindings:
clock: socfpga: convert to yaml" patch on top, to avoid
rebasing everything else?

Note: the list address has changed again, so please send
future pull requests to soc@lists.linux.dev, cc:linux-arm-kernel.
The arm@kernel.org and soc@kernel.org aliases still work
for the moment, but the real address is the @lists.linux.dev
one.

     Arnd

