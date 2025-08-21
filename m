Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206F4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWUJOpVst/YmMMRlLpZwMEFvROh86/hNVtmyCtTvurw=; b=qw5dWnD9BUWEAJ8nSyZaeABPH0
	OjiKzg7xWCp3ketZ26X6jML73alqBOZxLyX/QxQK5G/YH+js6vphooTQmg5UlpNy4HQY+QqT/nLSC
	+Gf+fvLpo4J0P9HL0ZmJfY1wM27EuROrE/Zz1YC/H40sCpeYmvI8ijKbUVG4259xKP4z4Lgbz66hJ
	fcKCP6wXJaQYSzlHX29AEWvZOnd5QbyEMY/Apvq4TgPzP/yMuQ5hcSML4VPnd9oZ9lMaYCi1p7glj
	X7kRE1a+GSdkGebiVtR6G8wZet1zGdS+HMJXXkjmSNoY13+xJmsss1D22DFyRJU0Zm/IhCc8QxHqZ
	bsRkyDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3pu-0000000GoT4-0IQB;
	Thu, 21 Aug 2025 11:52:06 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up16D-0000000GKEM-2dG1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:56:47 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D49E1EC007C;
	Thu, 21 Aug 2025 04:56:43 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 21 Aug 2025 04:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755766603;
	 x=1755853003; bh=PWUJOpVst/YmMMRlLpZwMEFvROh86/hNVtmyCtTvurw=; b=
	ka18AQYlhBDAu0f0gGvasfnP7Gx4ZkscfHtofGo7wXTdZRpCy212fX5SWsewEwo4
	qSDcO/DoohtC1kUngNakGflIf9cJIF+dr4bm9OON2PZ7zPf0Oswc4kbw8obrEW18
	ZJ/a+Y8RsFi7ywGioMhP6n3f//aNLc8+sUV6ByI8rCZJsEE0iQLLmzhlqDmmbRGU
	jIk3VRK/as38x6mGilROBeHX4dRwB8/ivy4QgtHeFk0xe3ThA05hU2uZrOiJtbys
	ezvMKztRmzk07vAdQn2YDnW9sfvUBiF3m6BecZ84FskqbRf99L5EJO/FgARKhDBM
	XrOTAJ33R69+RLRBr2IxLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755766603; x=
	1755853003; bh=PWUJOpVst/YmMMRlLpZwMEFvROh86/hNVtmyCtTvurw=; b=G
	rQ80cykBTpscz+0cte7aixSEKdpEleELfCJbR+AOsCZyBws8Zvol3u1fZ8Was10c
	4qbmNp6MqUp0ZufnVJJW8P6A983ErEgyTVKYyYeqAWF+qoXaMOrxMvso6L+60aap
	VwH/6f6zyg6qoUzp1P0gj2MK9sWyr9n53E/hpioHusgDpZyUdPqGPjDNa0dRZPxd
	OyD89ri6upLpZ4GGRMHwkESrZ2Rlw9l5A26CfRPYLZeNKiDHgTHkIaN/IhpLUzl/
	tS4/nasrMe66ZOhWaQqckaYLembyaFH9yTIYZY0mQ7g/NikG97RFKnZU7Vzar6d/
	1OemTpBIjip+JV1WkyZAQ==
X-ME-Sender: <xms:S9-maL8pmu64l9nEtKTGP1Z_c2z0MECdFrFst-KkU7KjxuL0AlDG6A>
    <xme:S9-maHt8L3-tFafCR_g7iRdWVuNiM1B2lLTMiziKlOxVdhyK07o7yfTkLR9cIKIjv
    NEvqF09S39XK_mY-gU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprh
    gtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehf
    vghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehpvghnghdrfhgrnhesnhigphdrtghomhdp
    rhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhope
    hkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:S9-maOCrP5OE2BCPwQrHUwLMCXuy82-ITAilNRTItJOIwLDeSlthvA>
    <xmx:S9-maOAEkt86365ksOCQbqB8S3f5ZAsbj15tdoOhHEycoWaDomj20w>
    <xmx:S9-maAolDEsGL_wpYjXy7a8YjvVcy8EKHPz8hLy7ixr4CcuRsD0jAQ>
    <xmx:S9-maBHPQ3gnUyk7DSxjdL98zBCCfH7l4UV_om2sWqnuwh_dOKrkFg>
    <xmx:S9-maOXTQFC_sPO9vJCFBxjut-TQnhsM8RCraBoVTttupZ4j0wxVELf5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4FF34700068; Thu, 21 Aug 2025 04:56:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A6YapAphagno
Date: Thu, 21 Aug 2025 10:56:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peng Fan" <peng.fan@oss.nxp.com>
Cc: "Peng Fan" <peng.fan@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Sudeep Holla" <sudeep.holla@arm.com>,
 "Cristian Marussi" <cristian.marussi@arm.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <b92218a6-e30c-4163-b441-1187d2e429d0@app.fastmail.com>
In-Reply-To: <20250821095657.GB19763@nxa18884-linux.ap.freescale.net>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
 <2ff85fec-b571-4423-9161-674f88a32e18@app.fastmail.com>
 <20250821095657.GB19763@nxa18884-linux.ap.freescale.net>
Subject: Re: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_015646_208562_489A995B 
X-CRM114-Status: GOOD (  24.22  )
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

On Thu, Aug 21, 2025, at 11:56, Peng Fan wrote:
> On Wed, Aug 20, 2025 at 03:55:20PM +0200, Arnd Bergmann wrote:
>>On Thu, Aug 7, 2025, at 03:47, Peng Fan wrote:
>>
>>
>>When a caller of this function is in a built-in driver but the
>>IMX_SCMI_MISC_DRV code is in a loadable module, you still
>>get a link failure, see 514b2262ade4 ("firmware: arm_scmi:
>>Fix i.MX build dependency") for an example.
>>
>>As you still need the correct Kconfig dependencies, I
>>think your patch here is not helpful.
>
> The consumer driver still needs Kconfig dependcies, such as
>   depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
>
> So when IMX_SCMI_MISC_DRV is module built, the consumer driver will
> also be module built.
>
> But if IMX_SCMI_MISC_DRV is n, the consumer driver is y, there will be
> link error.
>
> The consumer driver is to support platform A and platform B.
>
> Platform A does not require the real API in IMX_SCMI_MISC_DRV.
> Platform B requires the real API in IMX_SCMI_MISC_DRV.
>
> So when producing an image for platform A, IMX_SCMI_MISC_DRV could set
> to n to make Image smaller. Introducing the stub API is mainly for this
> case.
>
> Hope this is clear

I see. In this case the stub helpers are not wrong, but I
still find them more error-prone than not having them and
using IS_ENABLED() checks as in commit 101c9023594a
("ASoC: fsl_mqs: Support accessing registers by scmi interface"):

+static int fsl_mqs_sm_read(void *context, unsigned int reg, unsigned int *val)
+{
+       struct fsl_mqs *mqs_priv = context;
+       int num = 1;
+
+       if (IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV) &&
+           mqs_priv->soc->ctrl_off == reg)
+               return scmi_imx_misc_ctrl_get(SCMI_IMX_CTRL_MQS1_SETTINGS, &num, val);
+
+       return -EINVAL;
+};

The logic is the same here in the end, but the link failure
is easier to trigger and repair if someone gets it wrong.

Also, for drivers that actually need the exported interface,
the dependency becomes the simpler 'depends on IMX_SCMI_MISC_DRV'.

Which driver using this symbol are you actually looking
at? I see you have three similar patches for a couple of
interfaces, and want to make sure the added complexity is
really needed here. I do a lot of randconfig build tests,
so quite often I end up being the one that runs into
the subtle link failures from these.

      Arnd

