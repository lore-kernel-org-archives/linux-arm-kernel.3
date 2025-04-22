Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJjeYMmw4d06MV7IdK+vWICO7Di3IWNxGYXSaL2nCRY=; b=0ZxipQs/8Mvburlh2z/Co0UAQ1
	DsvTTk8DTaNsUdYHJEGk48lnQNS28uUboNG9zKjGVGLLDNv7os0bVhot2wxkycE8HDFpmDieYOgPj
	IWyCUy9s/DuiAoaAK9ahzGPpDmL7QSN1J/uxZ1SKjkt9IhyoTq97QCecBzDI/rKPQnlcerTj/FtnA
	+OhgQ3U9dlZ+rll2xsoQ5dB8Sq0k5lWKUzF7zQUl7C2RuNQE8a266d35GExW+QSAGI8+wRHcKmaic
	x9QGytQHy2Sx3llNuH/tZBPbjVvpSY4tjkuyhbtIZzviN8ANM745ciVARUBVkBZK3OHksa7XDZdLd
	wV4jfX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Ld-000000060z0-02ml;
	Tue, 22 Apr 2025 06:43:13 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Jj-000000060gl-1E7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:41:17 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 17DCA1140167;
	Tue, 22 Apr 2025 02:41:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745304072;
	 x=1745390472; bh=KJjeYMmw4d06MV7IdK+vWICO7Di3IWNxGYXSaL2nCRY=; b=
	JKqbUULzw0Gp3cDK9VuC8oHKIQ/0KFMJZUwtYo1yxTzi2NgDSb9X1/17ZsJ84CKO
	q8cTBCc7AG1kjJPuHpVkH9ZeKxMXYVnOiiGDBohLKNMeTrUp/u473JGbvuN8KH+s
	0p+1npRGQqQkKOiz4+jAx4hUNmLCONPj40aDUyPrPs4FndSI9zpem/pEeCALgAKV
	SAAstJsYbluDnT+KGDY4TVY46nQYy8sJi+TxqVG1+FM8Cz7WNdomUjg3tMEc3Vuf
	GUUoJULp/KiQdrcQ0oGmCWZb9apa1iIw+KVADZrf1KO6YPyVnuoSOR628R3mWOaH
	Uq4fh5fxGlQiWwCs8YJ5HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745304072; x=
	1745390472; bh=KJjeYMmw4d06MV7IdK+vWICO7Di3IWNxGYXSaL2nCRY=; b=c
	w3dfPuX2DRg/kKszp+VcVKA7/gFyUMVfcaaqH//GR4cTpaSyo3AqW/sTjgPopAf/
	CwE88HuUM3TJimmJN6jwsP94HaSjpdlq+W7RbhqyJPPdRrYv5aiF/ZMhHpG075RW
	kj7TihhaNgr2tazH/1nCpJzLqjODXNCP05pIJg3+dVNcAVz35YqFqtCFX232YeUo
	1lRszwdUp8q7tb1l6yBZE0UHJNdF4eybIPA2cROBBUp4wufVWjsuWDpJaXZcr+BI
	GmSlcdAKsQ+KJv2I/CRYoR8KuUc0wFS126a1fOfyqyfo0hikhtoWmLfW4wQzGwEB
	puj7jPS6fkNHOuksyeyHA==
X-ME-Sender: <xms:BzoHaDfMQJFQzz1ruTZLMNc2nN2f6M8iXFYSMio-DufyAlYTPsTm0g>
    <xme:BzoHaJN5ukyxgdSeU5HhZfWG-ZyyYsykTRuT-LVorXEFDdnYnOVv-ivn6NRDpgbj5
    afvRklH7pV-8kNGDbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrhhivgguvghrsehfrhhish
    druggvpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrihgv
    uggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehsrhhinh
    hivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:BzoHaMgthLmsNXpyo63_egO3S8DBrggBCT_NFRySoAreRSF8ecZXnw>
    <xmx:BzoHaE-arKdzLjEa361kAgN-jDTQ6GjalEIKVsE3p_6knTVsBfxXQw>
    <xmx:BzoHaPtxOHaPwqsEgoXYX1W8_ExFvV3szrgPJ_4uHFcgKbIJSqdAww>
    <xmx:BzoHaDGmukrU4tB7DOOH6k7akyw1EeGSULwm2Vaq2JBYaRwjFgXdVA>
    <xmx:CDoHaNnPAoGAMKqEiOVv0aa71npJ8PvwCXwSR8C6XIJJyQXD_qsgnkh5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B60452220074; Tue, 22 Apr 2025 02:41:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tb1fe2b3b8ab1c58e
Date: Tue, 22 Apr 2025 08:40:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frieder Schrempf" <frieder@fris.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pankaj Gupta" <pankaj.gupta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, "Rob Herring" <robh@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Cc: "Frieder Schrempf" <frieder.schrempf@kontron.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 "Shengjiu Wang" <shengjiu.wang@nxp.com>,
 "Shenwei Wang" <shenwei.wang@nxp.com>, "Xu Yang" <xu.yang_2@nxp.com>,
 "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <6ee90a9e-cfa0-45f5-8036-bf04cb19db46@app.fastmail.com>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Subject: Re: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through ELE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234115_390624_D619CE57 
X-CRM114-Status: GOOD (  14.39  )
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

On Wed, Apr 16, 2025, at 16:26, Frieder Schrempf wrote:

> Therefore I implemented a simple driver that uses the ELE S400 API only, as the
> FSB access (1) doesn't provide any benefits except for that it doesn't depend
> on the ELE firmware being available. This is used by us downstream.
>
> For the upstream solution I would like to have some feedback on how to move
> on:
>
> 1. switch imx-ocotp-ele.c to use ELE API exclusively
>    -> this will create a hard dependency on the ELE firmware/driver 
> being available

Could this cause problems for real-time Linux users? Usually going
through a firmware driver adds more latency than doing the thing
from Linux directly, and the firmware is usually not preemptable.

In particular, programming a one-time fuse is likely a slow
operation in hardware, so it may still be necessary to support
both methods if there are users that need to update the fuses
on real-time systems.

     Arnd

