Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D28CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxjwySne1F1Y3iIbV5OhuNVo/I9dWR/VXGO56Ity3o0=; b=ksPIoKhiMguv+oTnr5nnIKRlyg
	91GA+6Ue3kO7U0NrPeEi1hk4bvkgEQ71iT8VVnB7AkXEOfAi9TcZuSLs0mF27v/bH57ysRQ3XY9Qw
	cNfVrz/cF0e0w3dqVptoo5C2Ul+tnaVBNo4JfIR70IXNp7byYEIEFNTkAa2+0Y5TMmSmhBMFheq4X
	9eFdnodvue00nXc1y6qeTI8CmTRN9bi3KkBBlzirKsi9D3HpwHICN5b9XsNr89KAseF1lTEiSgfRy
	CW7LbPDpxGexCVRWrtD3wkyP6JEkXMvZwu2Ecoxf0/mWSG8nkEdTNUIpBmGkTMcdYmxs92y/Op8F5
	5c7OPD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOtF-000000029aO-1nkQ;
	Wed, 07 Oct 2026 10:28:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOtC-000000029Z6-352C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:28:48 +0000
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 336201494;
	Wed,  7 Oct 2026 12:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791368805;
	bh=weuBvweQFZVt/7mS7Fc95N/a2AlwcIYomOHyPpIYkUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sAxtiXM+kPXP9eOSagM8GbX9NBuru7NkPy9Et0DiMeTUz7aXf6MmZ0jzFEYfmi2zH
	 t1z1kcCavBJ6tWWJLLf2wYktu7hrB/312nhJ1kpZInpw67LgAU334nxEU9QdTUMS8o
	 co6LO9BEO7edkyEKXfFy7tEDz5SxCEIAEcKlpO84=
Message-ID: <6e22143e-92f0-4611-90df-9d1674083cff@ideasonboard.com>
Date: Wed, 7 Oct 2026 11:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
 <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
 <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_032847_235234_481A0E24 
X-CRM114-Status: UNSURE (   8.12  )
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

Hi Geert

On 25/09/2026 11:10, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Fri, 25 Sept 2026 at 11:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
>> Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must
>> have slipped my mind. I can pick it back up and address the comments, including adding the other
>> interrupts.
> 
> Same for "[PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0"?

Ah - yes! I'll revive that since Linus is handling the IVC / ISP ones

Thanks
Dan

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


