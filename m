Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00490C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otTZPdVoKvw8luLeLUDPJQFJKPErGVRpX3bFB7ulP0A=; b=eSI2UGv4VFV95B+mDOpHslic50
	zAfgcODr9SmTmj1ymOYtxXebi3QK59ZUe7nXprwtR/eLwSmrJYHzCidUk5sc70eBou1mrUy7BcxLt
	sABbPcGPjE56bEWklf523Jd0Dux2aYv0pAoc6+RBSWYMHrjBMJ8Z8rtSDfoQBUWOhgjIUkUkzoNxP
	x9UNtq6fntNLTDf/K9aG6HGrHwWtphvPs32tBPJtVaJB563NOQB8Lfc1865g5YNpKuPtCZnnu1ApC
	r84kZAe7T0HHGCdjMhOh2IwdWe5C4sDXD82oNAsyF9OP7+1SKrV82XJmSX0w1QcV0fZ4afG64GrbJ
	dRVKX7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2Xv-0000000D2cA-286L;
	Fri, 25 Sep 2026 09:48:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2Xe-0000000D2Kf-1Rq4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:48:32 +0000
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6287CC1;
	Fri, 25 Sep 2026 11:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790329597;
	bh=NjLVS14if/D56akbo8g2fO7dZ7ShBsZeA5Bs4VPK77c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HZJBU2S38eHmYkJYdhFyGl8wwCYNYICMMceHhEhukIUcbJQM/rs40VjkPxN3hnkQm
	 DzRQiY1n34360T2ICePutfbxXgCgaclf8S8coQEkbDGqXPryqixNl3huQM5iZj5Jxk
	 +Zvz3vCy78OP3KnzG/1Wi8//t7eSLgqtiWUk7QWk=
Message-ID: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
Date: Fri, 25 Sep 2026 10:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_024830_676716_63CF378A 
X-CRM114-Status: GOOD (  13.22  )
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

Hi all

On 23/09/2026 18:17, Linus Walleij wrote:
> Hi Geert,
> 
>> Hi Linus,
>>
>> Thanks for your patch!
>>
>> On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
>>> From: Daniel Scally <dan.scally@ideasonboard.com>
>>>
>>> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
>>> tree file for the RZ/V2H(P) SoC.
>>>
>>> [Rebase onto v7.3-rc1, place the nodes in address order, and sort
>>>   the interrupt properties. - Linus Walleij]
>>>
>>> Assisted-by: LLM
>>
>> Dear LLM: Please take into account the review comments on the original
>> submission:
>> https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/
> 
> Don't blame the LLM, it's me.
> 
> I didn't find Daniel's original submission, just noticed this
> never made it upstream.
> 
> I'll address the comments and send a v2.

Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must 
have slipped my mind. I can pick it back up and address the comments, including adding the other 
interrupts.

Thanks
Dan

> 
> Yours,
> Linus Walleij


