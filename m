Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3ECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRk+m0ylelb0MFEK2ufkPqihO7787jCK43Nrzsk+OFI=; b=NORs2g2k2z+F1A7HtFDaLLMlgD
	GPRGnQzWJsvXl56wBSNinPF+XOweRTRPylhIS7t/yV4hUImmL1MdTCZwoAtZyQr8z5p5biucWkOxr
	Df0A41W5rubLsz/PnNVDTA61oK28u07osZlHAK6Ape8FC/5O4lJlHz32+9szkHFSZ6CfNr1YUeuJJ
	lA5ctCKaAQfsXNrCl+hl+dlemyYLLV5FrHVGszGDp928cTGJLh9BHPNLy/NA2PQTWXWNSd/6NkPyf
	I6vzLbJu30GPxhecoir2sAPO9xC57Ai9Lb1RDSI3ykl5tr8Q+zksubNyYoFpEoESBWgmW8YO2t+2N
	gOoZTrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA1X-00000002pSm-1AWk;
	Wed, 13 May 2026 13:53:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA1W-00000002pSD-1qGA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oRk+m0ylelb0MFEK2ufkPqihO7787jCK43Nrzsk+OFI=; b=ZNZt77Np69zxlqzMUxjcvWsfNd
	L2up2alEPgkZFYUHjVMGT8jMqHpuHh4XKDG+tMfuCUs4Fj5DWrOfCSOOiqmLL158NAvuS/mMQu5bx
	BYXPOk5sBL+ohV5oxczxSyP/rVpv5LZADA6TfFgpydYUXBnR6Apo+xSyJVR0FQ2wqJov0CcCBobp8
	6iYzq4zU7wqICG/M4TBntAWYDh9W4tZR0IrbqPm+JQiqCA5HAApmNIULJEQFrn7ogxH2mBqwRtp/j
	4vXWZG3EosCHA7EX5RzO04ooDFTfHadyhsge8hN8Ctm0aMf7XagCdawvnaKX6Szh3bt9T0hccd+Qa
	/DYLRXZQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA1S-000000004mV-1tg1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B99C407B7;
	Wed, 13 May 2026 13:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30095C2BCB7;
	Wed, 13 May 2026 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778680393;
	bh=vboSbNrhRoqpwhCEDdVvoJxSw2POTG5BmRbeyr6o4VY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GTNKAIBkIXuP1UZacQ3v4jPyQXH2SdW/3YmEtUUU6GFKwEzHnJdSFeXI1PhulfTK9
	 ov7ztaqGpNo9EldG4Nl+Kzsl6GNzsoB3b/EdxxQZtMaPDBXWEtUDg1E4Bfd+jpH3Iy
	 F08WTE6Sop4lRBVC1YWBs4PPuX1u+MRSBR1nkOsl9A9TjclBBKgvZR3DG2HMzLDUKB
	 0KcfEWZkEaFfHl05tcnkWJPcIFyOpadHMiBQlX9dvZtcQmy27OcG6FIRz50kgaUTfn
	 9SPXpYHiS6/IQlQJqCHvaOYFZdVjmNVpTX1OaCIUmBsaC4f7ZGp5y/hLUHIemFzIfP
	 tVnmoTc3wrZyw==
Date: Wed, 13 May 2026 14:53:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform
 devices
Message-ID: <20260513145300.11b4fdd6@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
	<20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145315_004472_11EF8825 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, 13 May 2026 11:14:32 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add mcf5441x DAC platform devices.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
Looks good now.
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

