Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C7EC61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 01:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgcTdmN1+NZPi395+qYMSKomq+S9lhZAqZQzX8ZSS6w=; b=bjz3J2WSKp4DP/wrZhQxlSc1eK
	iXLVAUXYJwFEM062A+30Ob9jMs9aeEoPJwPyQtU/3L4EFTyf/mYYA7KB4FEFE0oDK0k8Uf3ZOwj7A
	1O7t1DJNGyvosyyEkrgkhla5Ge5Zgx3SsocQstahPlfk3gfjCPmqAFVMCNASP/ijP+EE5PhZjeSZY
	YrN3wWv7AvYz57L2sOUkC8sq/g4mfa4TntQbZIeYxLJTXiF57zHrg8Oo+waM66a1I8vLGhvypVX6Y
	LjpaZMUamN3jnafayG35xLnMABknMo9N7J/PG6YmKTSWjHn/9llPc2Jvl78/ecqbZ/sG33FJid4Ch
	UUn3qfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0r22-00000008JyS-3Mni;
	Mon, 31 Aug 2026 01:41:54 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0r1z-00000008Jy0-2SAb;
	Mon, 31 Aug 2026 01:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1788140477;
	bh=VgcTdmN1+NZPi395+qYMSKomq+S9lhZAqZQzX8ZSS6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VcYEwYIiDlA/qvBI+r+bmydK3L4PoXy1A2QjzPyhfma4efAZH+2vCKdhLrW/OYqzP
	 bBBuANIypPMxIeGKM3AuSZjTvI2U/hogzPhrRXPdJNYJEIztqPfrN3MTQETbh94NdK
	 46+PUqVrm56AUIgUgV27gauTJaKzH/FQfoJO8Ia8=
X-QQ-mid: esmtpsz19t1788140471t4a3b1f4e
X-QQ-Originating-IP: 3UhhlstAmz7bt2FV6PFHCQNwYydpMBw8AK9pSZHATEI=
Received: from [172.16.12.90] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 09:41:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 920350159676869033
Message-ID: <84A6832DFD4B9FF2+64806113-d65e-448a-b2c4-ee83e125a665@airkyi.com>
Date: Mon, 31 Aug 2026 09:41:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
To: Rudi Heitbaum <rudi@heitbaum.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <aouw7rH6FZxscUTO@0d3a7a881997> <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e> <4512468.iIbC2pHGDl@diego>
 <apGMEsCwly8TCOww@5be1eda4e59e>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <apGMEsCwly8TCOww@5be1eda4e59e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OWISOlifo4HyrF+2ggBCw624Qpr6AIS8jGWgOY9VSU0Cx8+c1b99yWRd
	FAf/4tENwvcVeRwUwksRWPcoWKqO3sH98URnZCaa/MBCW1lYDKRll24no/oxZhm+g3b4kpQ
	NYS6R+xRLeiQrVwXZxs3TYwPTEQH4/IVbwN3GOpMWAaZXxHkWSsKWRh/Qgy0JCNL0T3rFbG
	BkbVTM/ckFHRnBDK8ph5QcNFCRTSyCUN4YbxthlrWuvEV4wtjb5NyFkWPFLVDCOuMOWGD7c
	eVoovPSThB+6xES62ejzP32x0kvzZTmOE9wsPOP9H/6RjDpLUgShxmgZ8TVHNif4PK9GchJ
	gqXSYt1O4ewuMjFr5SC8caz3hBAM5n9VRnpaZMlLRMLs0vc/GkzLG22glnYNV2rhgau/wdT
	IeRUcLk9IuJtXIh6LIr+deVB7uFcZHzXmuz4CDcJkWfM8xJwDqt+kxmgKQDrBnWffiWRpRx
	1vJZsYRJZm1IuPWhkRU34xPFp1n/zbqy3mfQxAPzRAyy0ddjNmSU5VzE4Cu1fwvcy5X85Jg
	aThX0cS++CoNcI2sA/c3eWA7QblY6OpoRQ+AnTd87hlODDeW6EmsANyD+dcafvbA7FbepKy
	KvDYipMIcm07kj37icagjWr55JctHv8Yp5zZNAYSfhNmBeJ6cjU7h7QpwiWdox07YV1idjy
	Ja7bofu6MHlYQOLq5myo8CD4W94v9Rwn2kvPuZccFH4rR/PzSFtE6wBdX08V1ttB41bfZi2
	TTvKy/9sTZICN5gpkAdKf27ZcI3gKP27x2RXTryTb6rfqyOmzC0IrCEE4gXksBO2Tqe4NNI
	nBdPlZXE68GiO2L+O4Iao4dFBqekkGe/WTbK1vQPFLiIYf3seBaQyrg9eEXQ736NCPvDqUf
	NA0H1hiIhI1mmXcMS0DaqKt+rcdCCeyfRU9JDke+LxW4Nx32dNPy4HzZPXC6SWJv445DkGl
	xo82X5Nlc0oEVv3ByI+85wuCrzeors9cBd0TXZF7t/XiS7r5IEAHcnlIC/08ii2eck5cASk
	8y+DZwrg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_184152_092539_36D14616 
X-CRM114-Status: GOOD (  10.23  )
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

Hello Rudi,

On 8/28/2026 9:24 PM, Rudi Heitbaum wrote:
> Hi Heiko,
> 
> I hadn't looked in to these from the mainline viewpoint. I had been
> using an adapted vendor script based on the radxa npu_powerctl binary
> which reimplements the npu_reset sequence over GPIO.
> 
> This has been the sequence:
> 
> gpio0 line 4   NPU_PWREN_1   -> 1, 2 ms
> gpio0 line 10  NPU_PWREN_2   -> 1, 2 ms
> gpio0 line 11  NPU_PWREN_3   -> 1, 2 ms
> gpio1 line 22                -> 1, 2 ms
> gpio1 line 23                -> 1, 2 ms
> gpio1 line 24  NPU_PWREN_6   -> 1, 25 ms
> gpio1 line 0                 -> 1  (reset release)
> 
> I have the schematics and the working N10 here, so let me look into
> describing these in the .dts and update the onboard_usb_dev.h.
> 

Perhaps we should first check whether the power-on sequence in
onboard_usb_dev.c meets the requirements, as it enables all
regulator supplies at the same time.

-- 
Best, 
Chaoyi


