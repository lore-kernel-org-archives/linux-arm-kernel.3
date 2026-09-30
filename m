Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B88CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AzuAnkLmWKJbfVNzARCkRXhEONPwq6GXzNIrTeug5k=; b=jTk6NjDPgJCEEsecTVl+EG67IU
	T5foZtELkODSmwDMl1Jf884Cl5L/1xX9YS12dsoGUlz1QxTYOCzB4NKg7De9B1OB39B3wxC+eNxiK
	NvGvVCD9G0DpLnJ00zTA6z2pUR5WwpeHBT91Fcof+XIcxU2TpQChM8dHI6P3ssWvdOAGhPAreCl0k
	1SmBygLlowFWJrCsVDc4xnmIOW7v685sebPpffMKRVuzF6moc2j6QquihoXHW1cVpc5pfH0bOZ/t5
	0WgZ3HwIC2vD1HUEgtVQgqC6zS7c/colAq7YsadpzsAf6ccam8izlcmCr5rSgmATCgl+xSdOgHEjs
	fb/+KvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsB0-00000005pMH-2yA5;
	Wed, 30 Sep 2026 11:08:42 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsAx-00000005pLm-21SR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:08:41 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 950AB7A0715;
	Wed, 30 Sep 2026 07:08:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 07:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790766512;
	 x=1790852912; bh=4AzuAnkLmWKJbfVNzARCkRXhEONPwq6GXzNIrTeug5k=; b=
	TYgonTj3zHArlIFZGBNKtF9HjJoGIgrS++oRvgrW5h6RlLcv2JIqhmfjKnZr1tpz
	KKDn1sk6tzGF+BIL/S36m37JcvTYzV9J31FUbaYWgt1sjUyBD9v4JAkijc39ohmB
	F6WSGSU+ptCOznb1yTco4CvR1q1KykW1EQtauvF4I/p8Qm0RBmbRBRg7hy35mR5V
	e4Oi00JcFmRcB5xIz+xztBEDN1wrbUAnmAX60sPBC+XQ1esN0aVsQDZOSbJuoffi
	t2GjrUQLFJZakrmPDpY3L0l8eS5rCvzSPyO6iAkr5j2lyMHVefstsVoteKp3Gksr
	c91WYbvRRiBO6C5jEkGiiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790766512; x=
	1790852912; bh=4AzuAnkLmWKJbfVNzARCkRXhEONPwq6GXzNIrTeug5k=; b=p
	WpZ4p7N2/37epyurh7+xa338PoEKHfJYNq6M2yfx+3+qn0OFa+eeOvCw5GCFXcV6
	EFrSVsOUUtd0vY0K8NRGD0pzqQF9P2rIX6Yl4rCu+0wEMbeE37/T8rjlrDGWzwRi
	P4vk6yTam8th7mZXEkainLXfL6sUAXlenUoP2Mh+uzMqYlGbw6eQkXmcOC0nY+9T
	QzunSpX7Q40GqJ6imiH1heQm+sduX2TliJGNQlKirAkRpOIJVdzqKdbO1mfsP0aa
	GKrzmk8cBCsd02EtzR0jJMx49d9427Nejc2S9SA1MkPK5I1ufVqeg6hSgz6/ifgy
	c4Q06t8bHW55BobO8Aq0A==
X-ME-Sender: <xms:q-28aiP5efh5ZGSdgspymMRlLcuJlnpTdirjOM_wo113QHDwo35JeQ>
    <xme:q-28arxZl0NsFf8udn9kpcSHDHl4daAJGpbv7hR4RgKfW_z-0VWqJIIWpd2Efpg-G
    MjkB4tyS79GR3NhobYnb-kHkAI9oDt9nanZ-RklelWZ8JmqJtCagY4>
X-ME-Proxy-Cause: dmFkZTFy3bF7+bjPu12m6iMXqrZCV6gemLfpxS14gilw2teEdR1Rcz+tq4NKIPCbVqoP8A
    cAMirvR5ixwssxeDDQ32mar9uOdtbj3jwsJZg53ua5lVCkPyTcES2JIeFH9+w5d6j65wmd
    S+qD9GooU27sERGwO54Fj2SG7JXPL30F+6twyhYu/v8McuM+0QHc43DybOnwVLOTj4G4rJ
    mrB6MnxK7/Ya5xKsC0NGc2lbDu/eHh5rEDIJ8cSTrh2z5vTrVo1H6l0vr6F5lM7UQ4fMzz
    tmYgFqJdOLK+3hzE1t3mqrT5TEFE8ZbB2i6WcQXK3rG72Tu9XnANoIiLBflxvvMHtNB6TK
    komnJNN0HMjNrraAiD+Fye+rzN3X0dtJymnNTWMTGjmKh08XK/6lrQy9pLm9/H3RPUIYDM
    6ybF1SE9m9f05j3xH2cdVbCWKqP34KIM48jAKvVxNhF3Co/aDkAV0XgR+ywEB3hUgt2Da7
    3moCJnkkyHKWWcSbdpXOdTNY9CEP34T9ecfytJoaxlt59dbVkDyskQ6076b8qbEhaUoZNi
    BfIokTAY85KDzJXVm6CWglpMYqYZmPVHy5HkfRb5/fs9nCF+5Qvoy80l/CAMYaXZWpntNK
    e8YegFOAlTJbVTw5dDbyAgG2Pp9ejpJ5V34/nbmp8jEawb18TcehWfiiu8ZQ
X-ME-Proxy: <xmx:ru28arFjYdF_QUfZJ70G3cjb2GXwBVZ_sJAQH9v2eNLW3aWmnI4STg>
    <xmx:ru28ajBR2i2YaLOzNun5tHbypAiUMtrJFd69XYQFj8tlSPN26T35SQ>
    <xmx:ru28ajxk5S8cV18NmLHp3vlzWkCeHqE3yHSEKOScarr_9joXFpHVdA>
    <xmx:ru28akAxMontNg_0msJQwE8AcmoykJfGRUMjaeGz5TaodYjRNCbigA>
    <xmx:sO28alNpmLhotEBKKqSPg7o8JZjWCROq5Ru6IbU3RGFadTLvDptPJuyt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B054032A008F; Wed, 30 Sep 2026 07:08:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AxcX56erMFXV
Date: Wed, 30 Sep 2026 13:08:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>, filipp.dunsky@gmail.com
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jason Li" <jason.li@cortina-access.com>
Message-Id: <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
In-Reply-To: <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_040839_953699_7AB4AFDC 
X-CRM114-Status: GOOD (  15.21  )
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

On Wed, Sep 30, 2026, at 12:57, Linus Walleij wrote:
> On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
> <devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
>>
>>
>> The ports are named ttyCS so that the driver can coexist with the 8250
>> driver in multiplatform kernels, and PORT_GENERIC is used rather than
>> allocating a new port type.
>>
>> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Look at this in your Linux tree:
> git log -p b61c8bf4694b5115766849378dcb8787ff54e65e
>
> This is essentially a resurrection of that driver. It was deleted again
> because it was merged prematurely. Cortina never came back to revise
> the driver. (People run out of steam. Such things happen.)

Jason actually came back this summer to try again, see
https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-1-jason.=
li@cortina-access.com/

> Anyways, clearly this driver is not just for CS75xx so name it
> cortina-uart.c simply, and update symbols accordingly. Kconfig
> should be SERIAL_CORTINA etc.

I think we clearly want a driver that works for both the Cortina
Systems CS75xx and the Cortina Access CA82xx, hopefully that
would also support the ones inbetween (CS80xx, CA81xx).

There do seem to be a few minor differences in the register
set, but I would expect that this can be dealt with based on
the compatible string.

   Arnd

