Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745B4F3C989
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dy52TRTcToqhsBjNt2WPnWn3Gtsyt5NZRxNdcDwqr/U=; b=3dwNhyWBZPty1t4jaoHoyiTSlC
	JdYLLtNMW+k47QCo1A1CEZobaKbWyqNSUj+TDY/MqMZ9yCRA4M+T/y4qouIzQbrXfke1IRrl1Mjmm
	ZkF9T636va5GxLyEMAWE84MTCN3o/uaWpw+HBN6JZCzjhKv/I5yk0H6HqOzqeJhGV3HwsbJuFaOu/
	NFx+VkWAH0yEoB45dnsBY3gdO5odlfGPgmhdkzNsyg2E6z1WnwPuclqKVPgT//k3Boi8z+XThL7bi
	2+jLBjes5eMt5yxsAmKB/DA/sX5GI6ctlPC7m/cZlk0ph0mvDsWtdnYF/AsUbxs0f6npKRnljrc98
	pUSjEeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuu4B-00000002IBB-3kCX;
	Tue, 24 Feb 2026 15:11:15 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuu49-00000002IA6-0Dvh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dy52TRTcToqhsBjNt2WPnWn3Gtsyt5NZRxNdcDwqr/U=; b=HwzgDjSRmFaPfoyJVh0xby0D6J
	eBaGfxGc7Yul9IkeO80tiQ2w8dGJ2DvLXxeTZG4PKq9/DXY4RNhNzBtXoIGyCK7uA+vnJXkI7+2zi
	8Zs/T3767DicB+B7AKlAwderZ6/h0YRAcbrKYdnTqogyihb0VRigWkk6R9nvj0RSL0zUPbpsTvxA6
	I4eICZNMb3FCz07DN60eVvVkUSLpFnYoGD7RTiHe7xTbmeQX1rHRz1rcPL57KxDyYn4LUcc53YxjZ
	AUQMI0ip/IeFo7K4IrNS/9OgHtLCk1ORElGssPLlLt4nQyoCLww/iY0D1rjpTCsc9E7WOlX305P4u
	t1K74kQA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vuu3n-0009uN-0U;
	Tue, 24 Feb 2026 16:10:51 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vuu3m-000ChP-0Z;
	Tue, 24 Feb 2026 16:10:50 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 15:10:46 +0000
Message-Id: <DGNADOA8QYM2.2LA79O0V4M757@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260224093041.38699-1-rahulnavale04@gmail.com>
In-Reply-To: <20260224093041.38699-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27922/Tue Feb 24 08:24:31 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_071113_410234_861AFC50 
X-CRM114-Status: GOOD (  11.59  )
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

On Tue Feb 24, 2026 at 10:30 AM CET, Rahul Navale wrote:
> From: Rahul Navale <rahul.navale@ifm.com>
>
>>this is an important bit of information. Could you verify that your
>>customized driver uses dmaengine's dma_get_slave_caps() to obtain
>>channel capabilities and that the newly introduced
>>xilinx_dma_device_caps() is actually called?
>
> Hi Folker,
>
> Thanks for the clarification =E2=80=94 I misunderstood about custom drive=
rs.
>
> I have confirmed that we are using the upstream xilinx DMA driver (driver=
s/dma/xilinx/xilinx_dma.c)
> and using AXI DMA for audio. We use separate fixed-direction channels:
> MM2S for playback (DMA_MEM_TO_DEV) and S2MM for capture (DMA_DEV_TO_MEM),=
 referenced
> via device tree.
>

Ok good, but this does not say anything about whether
xilinx_dma_device_caps() is actually called or not. Could you please add

printk("xilinx_dma_device_caps: dirs =3D 0x%08x\n", caps->direction);

before and after

caps->direction =3D chan->direction;

in the RFC patch, rebuild and exercise your use case. Then please do

dmesg|grep xilinx_dma_device_caps

and post the output.

In case there isn't any output, your driver does not reach
xilinx_dma_device_caps(). In that case the proposed patch is uneffective
for your custom driver.


