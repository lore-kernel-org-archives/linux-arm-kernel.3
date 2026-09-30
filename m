Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BBFCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqxep6GiVLDWPq1CLLWzDYroRTT63dZ5HsotDLVOpmg=; b=H3zsgAhxX8w+zlPY7spwioXWab
	5qc9aRXxNmi4SfIRk0U6DYIZQ5uQ5HqCgXshfL/H0phILycFXHpr77Wv6nTrEh9ZBEK0LmkIaPWzq
	GTTEYL0SgOpZY/Pr4OR306G405G8iUKG1GLRysEVr3zo82GyJmEO5tZh3LBfNkSdDSTa5sXwAJ0UY
	gbBnrIEifVhSW0XCT5/VNS7/GMAsY57lf/IlXSNOY7XtZ95yXOFZ14qhIXsJHT0D+N8Z92WQLKNVa
	kAlXsGIjuJU3EihpnGnGZNdv/Us3L8Nbu/N2COSCsd/tD9oS4AbWaBbInNluBaSJosh3ff6Uql0Gx
	LqUAaB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt4c-00000005xxO-14kJ;
	Wed, 30 Sep 2026 12:06:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt4Z-00000005xwa-395K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 12:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xqxep6GiVLDWPq1CLLWzDYroRTT63dZ5HsotDLVOpmg=; b=F48TVfo44ytU+20I41Pq5/Utbz
	YByAApg+W5ER3y0UV2e9JH2BrxT/M9g8PV2Q2vNuwc3EZy49yIS/ChcSM8G9oGH4aikCV+73oLgVX
	NH+D4TSrT9zK65C3tqGi1hLOavIujP3So8nLUYLF0wpcGy13Tvsg6POLNUxHL2eeLNUA89Q3BPf6D
	TNIyJPzizn2d4MsXODO60Ur7KienJcrkHkp0rz9//LGvmL/i1jm1hX1IVrUz00f2p6AKhhjE8LNPg
	4gRo59JRPWogTMeYFlUMTe06pUzl6CXRvDUVRAFBzCyAr6FBJWXhlMQXoX/LmkP1NA9DG1oD3tYSv
	Up8yCtRQ==;
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBt4W-00000003lAu-2J51
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:06:06 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4CF1F14001FD;
	Wed, 30 Sep 2026 08:05:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 08:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790769957;
	 x=1790856357; bh=xqxep6GiVLDWPq1CLLWzDYroRTT63dZ5HsotDLVOpmg=; b=
	USxB9Tk9cR6GQT0+rKubXXVkloXK1fOTrGP0S/wBRsvrQAIDteaj6uDNPHAEz1OD
	SkBxHDxgQsiLj/HMibFbsezGbevR4UL5drOOljnhBa93gxfiKV4y1Um6ufWpshsa
	45gsjD0rkw5TQore01MIliSyJoV51GsOaAcTpmzqJ/fjFPHkv+7EjXKl3BaaA/Q3
	IdO1fVnzXiODZp1DkomAwdN6IUacEJDslJP/6yn8WlGpY2L0XfGa/B+dgk66y83s
	+gvF5yONZ+XT9VneApIxyJmjExPP3c86ZRKlISLI0eBYpVG5FhpXsZ+DoqHQbfdD
	YDW9nwl4X/+fj5eX4ES3Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790769957; x=
	1790856357; bh=xqxep6GiVLDWPq1CLLWzDYroRTT63dZ5HsotDLVOpmg=; b=N
	7m/4FinXgpayGXYcyxLKGjstS8mg08NIicqGdoO3BvH0RwSObEG6Db6vcpkZ59EC
	/Tu2Vy/D1dLL6wDtcaUJyzTe/+xJebuCPuCblreTQGajC2XnWS2N8N5owFiMWZeG
	pAOP5Q1U2VRiw5lRt7X80+VntsbRpCCAHTSKnsCM03snG7o5Nx2pxOjdMT16esvP
	qsajj38/aRZeSscjoCsJWHnZKL2w/IixgGswVquVMH45NwGsiL/swnUZvaopeWek
	DpNy2gekLHgSaohSEyyCMe8nzaDq8tDEwc8ujgpJ9AdtwTWONLLRjWTOfRgGVHXv
	D/lxDeZVLHA9mfS0IvdTA==
X-ME-Sender: <xms:Ifu8aoQ2uJrb2llCEAwAZiZm8eF18WigQcqDln29S6c08-QEnXz4Aw>
    <xme:Ifu8agmiqPbva4_rfP73yrJ-8zTc6yr2gAdk1TwTiJadPT8DOOkuMt3SIu3HXI3T0
    WoxJ49duB9gQp5cC1UKbM5-aP82UP_7ns1fORu0Azv3zzVXRn8MhyY>
X-ME-Proxy-Cause: dmFkZTELJ1wCFX7WFVpQk3imcnAa+TxAckaOriG6Ug6bxw1z7o1tOcu7rbEhcFIc0tbI2A
    PLepz8lcuJFN9pwXkLefg27Lm4nIoURdsMl09sL3CZEJ9XmJhsxBZD6qitLh99+70RwWcp
    2N+EII2nD/ZmIjd2o3KhpjnqnuYxaR9/7I3D59/sxIZMNVkODMMhUafZhe2o4a7COvekP6
    0HagR5EX1WfwemJu0QmApt1smf0RXm5ZzYP4DKZxVoQs5mdyU9YnQKRuCqasoXaHnlg0Gj
    rJj6CtSE4BHw0NWgEATUY9w4hRlPg4jdP6M8v95GZqTdErp7VtKZzXZ6QftFUrE/L1quPI
    megOIY+VQmheEEiutS3mFMiwHvksm65tCxXV/nwylXlLQY+0WqXXcPrJ/MoLSTpUDKlBsU
    cpS/uNETjdKLx0cfWXMFRc1vSwIE1Q4eeytP6yJDYTLudZcSFVsV6GLfv6aZAfPDakICur
    e40JgV4oIc40YWXrg86z9BuEu6x61XZu/qWgatkS4ufXgHVph52RT2odRiPsZwahxSFmUN
    tedG+89Na6Eg+ZKsB0yVsA6ai0G6YkdOjc44seV+Gp+ssFpK9OO2/L7linhjD4GWroXIcA
    lKF7QT5+1sm2U1sESEUs2J4bCuGCsxnNUfiJlt/HEDzWiVawZf5rJc2NAv0Q
X-ME-Proxy: <xmx:I_u8ajoIzuuX4TQXGIzBYYxwLPvLJtBS_fzqjwEuRSyFp3llqRO9uA>
    <xmx:I_u8aoV1O4YCNSVDusxuu7DWZavgt4-zbqQtK2L8jKIIbzV3-2qYIg>
    <xmx:I_u8am06Qkx7G8ghx0oUQKBKyE7wIsf8__2aNmj7xS0vzGPHqKXXzQ>
    <xmx:I_u8ah1qVfjMcaRsNnGRUGjZNW-aUHKsl1YN9uXdW5N8iApB-bwQJw>
    <xmx:Jfu8atqH_LiHKUtwEcJP9Ko_7j38Mn8mlntqsLvAYkQzEUrAuwx7V6lT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7FF3B32A008A; Wed, 30 Sep 2026 08:05:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AxcX56erMFXV
Date: Wed, 30 Sep 2026 14:05:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
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
Message-Id: <9ad7be0e-6a60-4e7a-b94b-fd79ad0fc91c@app.fastmail.com>
In-Reply-To: <179076749140.3134070.3869742286743401078@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_130604_823333_E629F8A6 
X-CRM114-Status: GOOD (  19.18  )
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

On Wed, Sep 30, 2026, at 13:24, Fil Dunsky wrote:
> On Wed, Sep 30, 2026 at 01:08:07PM +0200, Arnd Bergmann wrote:
>> On Wed, Sep 30, 2026, at 12:57, Linus Walleij wrote:
>>> Look at this in your Linux tree:
>>> git log -p b61c8bf4694b5115766849378dcb8787ff54e65e
>>>
>>> This is essentially a resurrection of that driver.
>>
>> Jason actually came back this summer to try again, see
>> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-1-jason.li@cortina-access.com/
>
> Thanks, I was not aware of either. Comparing the two, it is the same
> IP: the offsets of CFG, RX_SAMPLE, TX_DAT, RX_DAT, INFO, IE and INT
> and the bit layout of CFG, INFO and the interrupt registers are
> identical. The Cortina Access version additionally has a flow control
> register at 0x04, RT_TUNE at 0x0c, STATUS at 0x2c and three more
> interrupt causes (break, RX underrun, TX overrun).

Ok, thanks for checking.

>>> Anyways, clearly this driver is not just for CS75xx so name it
>>> cortina-uart.c simply, and update symbols accordingly. Kconfig
>>> should be SERIAL_CORTINA etc.
>>
>> I think we clearly want a driver that works for both the Cortina
>> Systems CS75xx and the Cortina Access CA82xx, hopefully that
>> would also support the ones inbetween (CS80xx, CA81xx).
>
> Agreed. For v2 I will rename it to drivers/tty/serial/cortina-uart.c
> with SERIAL_CORTINA and SERIAL_CORTINA_CONSOLE, and name the binding
> so that it can take the other parts. I would keep SoC specific
> compatibles ("cortina,cs7542-uart", later e.g.
> "cortina-access,ca8289-uart"), so that the flow control and the extra
> interrupt causes can be enabled per compatible.

Sounds good. The important bit here is to ensure the structure can
work with both variants.

    Arnd

