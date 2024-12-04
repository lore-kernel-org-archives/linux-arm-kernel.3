Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A03E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE23B4ttHCwF11SMH/4cQGZLTPJosFh75fu9WJI1yRg=; b=uGziYH+VmePb00ctezaxMV2pH9
	f/mRPHpOPhdQTM2nKvtiD9HmGPa7KzoZCwkOqidfcYCX/bUhc5R42dtz5CAQ1eCFIZr36R+YMXnch
	VG0kaPgIrAZHpUTSRsB2FvIj4bgUyVqV+JpLhzWr4Y6dgjAH1LW570P47E7JB+GtuAkz9FJ05zqgM
	vhRyITaRKDaSZPdT6Y4ImhVqUpGPs3Mnpf+JS9IkuE9ueiWHE7tHoE3DGoRx2WWO3eSRKojlGhHp8
	3oLySGQ10K3o7gVNCEFmyYl9V6OScbHK4eJlji41bxsgrlwaILXjY66LP22dbTf0nTUiow566tnak
	VftvOa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpQn-0000000CgJH-0Nhn;
	Wed, 04 Dec 2024 13:28:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpPn-0000000CgDH-1aub
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Dec 2024 13:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sE23B4ttHCwF11SMH/4cQGZLTPJosFh75fu9WJI1yRg=; b=PEIOiyh3OTQTncQtyY5jElAJ8k
	vSgZIyqGbYv3WUIynZSN3ZVaNmheoQ+88Z+6NJCJkZMwYqheiQEHVVoem5+LKuvdwiDT7e72xz4an
	lKmL3xAzBTXelnWM5FAqLdaKP8z/6ftM9FAODXFG2xSGqfbQDp5SU2eGDG4umbOtkv21h8F1ak12I
	+n7wfP6beCNXix7vuIdotDO//bSWdCRtrb+umJuJet4yQ0QiGOvrhdOmqZKyoGl9JCUDlQMILqOEh
	fLSKgXFn0IMMpvrSRiVXItt9qgeKEhjHWfKXm+7VJGGOM+TE3OovYUdAK0WaxujEghogDWoEnxnt6
	ufAyuKpw==;
Received: from mout.gmx.net ([212.227.17.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpPi-00000002cKa-1OfW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 13:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733318845; x=1733923645; i=wahrenst@gmx.net;
	bh=sE23B4ttHCwF11SMH/4cQGZLTPJosFh75fu9WJI1yRg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S7s1XsDeA9AwZId04CoS+4zfCsuHwmpDQUsxAEFF+CDyauoaxLwu3cyFeku+btkr
	 nSUwCnHHXO7kOaQxZqfEL0eT3n3ySX0uS7lpgW+e6N4P1sGwGVA9rzMgvLbqZWBbR
	 siw4DqIAsVB5qy4xfq8G99px0uxrdV3aiQCKV3VnJJFtpt1E8LOb/UjyMyhlD6QbP
	 HY5F4+tJgrNtnh3PDdELp2dnUDH598gGnz7qgKDzgLWJL2blRc98DXLlspw6zJiKm
	 qEErLTZcD9+sv7iHO5L1cKUp8DQfV6sGfsF8XcfsCt/Pw+YtgcpBbfARobUKc46CI
	 tJ4rmERt7OR8onrPiA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1tMfxb0lHq-0036dg; Wed, 04
 Dec 2024 14:27:25 +0100
Message-ID: <5ab9b62a-6577-4a3f-9dfe-c7362bf725db@gmx.net>
Date: Wed, 4 Dec 2024 14:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] spi-mxs: Fix chipselect glitch
To: Fabio Estevam <festevam@gmail.com>, Ralf Schlatterbeck <rsc@runtux.com>
Cc: Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240202115330.wxkbfmvd76sy3a6a@runtux.com>
 <20240213170657.puwlx5pjl3odcs2k@runtux.com>
 <CAOMZO5CD7+E_BBH+oQ8HUdBeRFZxWW7s2uJgS5eaQAW_Fe4CNg@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAOMZO5CD7+E_BBH+oQ8HUdBeRFZxWW7s2uJgS5eaQAW_Fe4CNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G4xJvxn9JxBbFBtOCBgaPWVT/H5beKdM/r033wNOSnEfcHMS4uR
 kP50qLZwHr/eS++qjjefOovIiAMdSxwRdW7R39dQQcAclLnAEK2A6AXIpxWvfSG5tWJIM45
 5DsoOZSUoAnGuog2Klzv8mDYPC3LoLesgHuf52WG+9XY9ajGvQrFT1FRq6gAZLz3bD+33Rl
 4Gut2eCbMwAdMEbJBZdZg==
UI-OutboundReport: notjunk:1;M01:P0:n7ckTBxpn3Y=;meKGvBZSvoTceDyMUxt1Uwb/XKi
 EfnkEIwv36g25zdscY73nH7gKor1Xdd++wVXwrrbJphgiQHkTLB/dpViCk7rL0WKgegZHl3n3
 buOUlrbi9zY+oyTKNpma7+PR4OcO8DCO25qpReW3vRqIECTU9JmpAlYSliAu78WI0o/mcCMRK
 z4bKQdS7cXHc8maddHaiGfvGCCKePGEv9XP2fmjLBAiJCjFJUlezo8IrA32lvXP03UzkyNc3S
 0bsvVGgCuWVNXEQXtDHn9mB+2s5sD+pcE0q9UPc2xxz7ZO5X1M5MQ/4PklFynXj90+Tg7KB8c
 YkCQHWJX7nE2ryUxdmD1+X4xcJ4YJJoldXRdX/jPn08Fv957uyB5Ie9PDpYHyVFF+hN9Iil2u
 +lrcXgbHUYMAyq+iz1bslZDvQORL29LurfiB0i1q6ZnsUF490H0Fp/WRPc4QaDlCf8QqsLlaG
 UQzNBzpx3IEezahZpBgcYNyRGrlKrIb7mH+1GIIOGMO4DCqIHG1b0X0u+r4PZ+AkpzA+FtzLm
 DW4wpF5BQ8UEuUoJMCDjXXza3EDXtjZFeES1EJoxv4IVNSThMn+amekm7KS5SbJetUdznGYUk
 egl/M0Jmu57HNU7l5DCKZumFTTCWF9at/IRYiXtF70KXc9+mMDf3qf46J1fhks7W+ypBqoYtr
 lscVVFEvdhPc1D44LLVsogWrUcHg16GSLT0wig8f9CB2hbeM8h8ADuuWS4Q/4dUtVczRqx640
 KoiGL6+WG8CJkpyXrUoUfGwrTlIXqYpe4uT5oj82UE9Hq1uu75YaPjiLnSBuujAUCdx9SHqjo
 Fb92h43dQo1fpsMk7HzHLuVUHD/ZbwU+3qBRh2JZuKKTuIj+WUZ7E5v6Dpkwf5mt5S0FC7SiT
 e3Ep8IyPJOoOYQnzu5OxRB+d2xwr+P/2J6Swdizslf8KW0RTPptvaMIa4QvsP9co2hyRSgpFQ
 8wN+kBLhHm1dvKd9TQLNVxTEXFk0um5APrLQQ7NUpo1mPkhyCDHTGYf9WiiqHiHTJjhY+D7rN
 ihehpC8JfNMM7413lT+32ZeU07xNbqCU7TzCnJE3i54Jb0MECcLdT9+AER2Kjtx+hdZTnFYff
 3dV+7L6DCkIEW/jcOdFDtD4wDRjn3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_132734_705898_C57575AC 
X-CRM114-Status: GOOD (  14.77  )
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

Hi,

Am 13.02.24 um 18:22 schrieb Fabio Estevam:
> Hi Ralf,
>
> On Tue, Feb 13, 2024 at 2:07=E2=80=AFPM Ralf Schlatterbeck <rsc@runtux.c=
om> wrote:
>> On Fri, Feb 02, 2024 at 12:53:30PM +0100, Ralf Schlatterbeck wrote:
>>> There was a change in the mxs-dma engine that uses a new custom flag.
>>> The change was not applied to the mxs spi driver.
>>> This results in chipselect being deasserted too early.
>>> This fixes the chipselect problem by using the new flag in the mxs-spi
>>> driver.
>>>
>>> Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
>>> Signed-off-by: Ralf Schlatterbeck <rsc@runtux.com>
>>> ---
>>> For oscilloscope screenshots and a verbose explanation see my blog pos=
t
>>> at https://blog.runtux.com/posts/2024/02/01/
> I suggest putting the link to your detailed explanation into the
> commit log as this is useful information.
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
I noticed that this patch hasn't applied to stable yet.

Are there reason for not doing this or is it just because the patch
missed the Cc: stable@vger.kernel.org ?

