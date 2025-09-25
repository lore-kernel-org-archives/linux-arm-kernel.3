Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804C8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7STaaSUdqKk89dT4N5ZHAL0UyFyXTg+lq1Zkpb4gCY=; b=kznMvz3WXcpP3TAa25YNlP2Wv5
	bB3h1I18C5H4b9wpKVfaHvaLx/CmIa82Hbcw/uZZrqK2N7N0A2+8zK4CRX3MZ1zo5NK8pQlO5T82m
	Sb0lDZcy/RFsCJn45/8Lq5MqleKe1A5wXKKen2UHLskMG2ywF8+mlEOLPR1PUdOv61b1we7/yFBpS
	xuOEPy2jAwfKfLUxM5Oey+9L0hTeyhRotsc8ZD4tw/6D8bg7Tx79bksqBuYhTXlNGrJmJPtmex7Oj
	+nkKIxs4F96Pz8fnmG5cdhAUMT3cx+TmKT8KRkZex7tGIw7CjmuFrUERo1e8pDRsDMsCcg6s0XerZ
	lnWDhZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tBB-0000000D0Dq-1OK5;
	Thu, 25 Sep 2025 21:07:05 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tB3-0000000D08M-1ncW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:06:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 78A4D1D00065;
	Thu, 25 Sep 2025 17:06:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 17:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758834416;
	 x=1758920816; bh=o7STaaSUdqKk89dT4N5ZHAL0UyFyXTg+lq1Zkpb4gCY=; b=
	Yafvo0YaAHCkW4NctUc+cK3rMhcbX7S9jnInNsiWZaXpr/t64DG98NUz6avVhnvo
	iL6gzs3UFtvgRFMvLG1BKEV5AyDcflBJ8SNY7mhH9Tgu/RoBFdw7okL23iYYIZpq
	7IJxgrr9ZOn8lGxesWB9NepOneqwqsjihwslOei0DunQk6DRwsVq/Yzp+MQhdp7d
	NwdvQj8tKvZXh/twO1t7Pai1uN/vBgLUbrgc3byjobcFBk8uic6p6BCpgOacz//3
	+u2yrBM8bJtGFgmNrhoXIzR1C7H1OvA/bhYu/MNfyfTEu6wg1XygcmiHo94diWck
	/NHfDi9s/Y+8MpE3vdwXSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758834416; x=
	1758920816; bh=o7STaaSUdqKk89dT4N5ZHAL0UyFyXTg+lq1Zkpb4gCY=; b=I
	QJ+ccjz0ywXJG7p0ZiOXH0RIcEn3pd7PoJXC0mXEqxIFxQ8um7KgQnvpdBaf89Zd
	Snsp0Nmmszdw3wZx4dGMIE7MKZggoANbde/Mj7ELycES7AISLXAoPu+6IpSY7eI4
	tFL7/pErAy6VkWGXdiId71KUm08r4RyYjCMtntr3qWUCCYKNi8bOiGN/HB7eAnDr
	8zh+OzBnTKHxsHh3QJrXxxhinAoCGUoQVuamA3Vw/LJbsHSGxb1NIckOAsd3hg5s
	AjG3nmRoJGEIs4/G6uebOuPuLj+2zKwjDJcPEHNBZ4N61JhVibnUj0Muk8GGrUHl
	KCAQpSpITg8eiBjk/qtYg==
X-ME-Sender: <xms:767VaOnshokvJsrQUBPLrFpdBU7lgxKc2v2BLgOXwq3ESLakD1dHOg>
    <xme:767VaAoJpxePGlcrgpp1KjgWtVLnif5IYZlBQT5ZhEWpiMtsIMNscT7EVTaTBJapQ
    j9fEEsUcF-ubhwMfOD2ofEfIhrOVFXFW49F8auhtyUt6MNIx6kH2NY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeguuhhjvghmihhhrghnohhvihgtfedvsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopegsrghlvghjkhesmhgrthhfhiiirdgtiidprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:767VaD4t1iHqtoGxZMIEmDaXcn01hTRFoDPUoU7FW9L4uOTllsYlmA>
    <xmx:767VaMk4cEUPCt75VGIP9jNmU_OcAqsqfVCw27xHceAe6novjIJREg>
    <xmx:767VaEQe3FOHoTU4q6M2YySfBDv6OUK-jk1583aZpDQdcJm1yVSIAQ>
    <xmx:767VaLFqhzqArUCTGf_2oxCSZ7IMyWNGiIym--LxFkh_m5waPTxeNA>
    <xmx:8K7VaPbewnkUfiIq01Y4A8u9VddhV6Zh3VrEt1c2cr89SVv_gZKnF1t5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A9A19700065; Thu, 25 Sep 2025 17:06:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2mPhEQg0_sB
Date: Thu, 25 Sep 2025 23:06:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>,
 soc@lists.linux.dev
Cc: "Karel Balej" <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <d723fba3-1539-4728-951f-8697ecdf176c@app.fastmail.com>
In-Reply-To: <2398680.ElGaqSPkdT@radijator>
References: <4685744.LvFx2qVVIh@radijator>
 <c0516d21-16c4-4101-9d9f-a679f7459ef5@app.fastmail.com>
 <2398680.ElGaqSPkdT@radijator>
Subject: Re: [GIT PULL] PXA1908 DT changes for 6.18
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_140657_771939_9BE1266E 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, Sep 25, 2025, at 22:30, Duje Mihanovi=C4=87 wrote:
> On Wednesday, 24 September 2025 23:41:17 Central European Summer Time =
Arnd=20
> Bergmann wrote:
>> If you can send an updated pull request based on -rc1, I'll
>> try to do find the time to merge that, otherwise please
>> rebase on 6.18-rc1 once that is out.
>
> I don't want to rush anything, I'd rather wait until after the v6.18 m=
erge=20
> window then unless the merge itself is very trivial.
>
> My only question then would be whether I could still target v6.18 or w=
ould=20
> that postpone the series for v6.19? I don't really mind the latter, I'=
d just=20
> like to know.

I meant sending a pull request for 6.19 based on 6.18-rc1.

Generally speaking, I need pull requests to be based
on an -rc release that is no newer than the one I'm
already using in the tree, so -rc1 is what you can
use to be on the safe side.

You can also send multiple pull requests during a
cycle if you either want to add more contents or find
bugs in the earlier patches. This way you can ensure
that there is enough time to fix up mistakes if you
send something at first that for some reason needs
a rework.

      Arnd

