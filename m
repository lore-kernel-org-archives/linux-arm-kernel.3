Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD11C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuSv0/XI/eD9FBwiYcZx/CO4wUCjzxcc9XNCARjCC6o=; b=DT1kdqePNiUStm8fLaSEPQYOTA
	K6wSlCxBGUv1PPMl5NZ7DkteEPG0hh6COj4vctCtnbQw94axDGE6Dfx765y3wvKwLgOBfr7y51yM/
	JasxMb1/yY8v76tmrYQdj2COgHcpBEJRp9VsOCVmt8sXmwkf+wctGdpoc5h3tyre6dEz8Oy3eux9W
	bioy0loASvQfgrgVdvU50toy45WnMxghvFyMQ84zBt1pZ853asA/yI3jHAFYxcy7Er6sjeRos/LFx
	0I42AWmbQGvPHQoshEUc+2Z22I9Nobrc8xs2Wg7795+Y0TLUwafa03ORd7UypVRe+pYVh0X8O18A8
	Eywta7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhQi-0000000G7D8-1UHN;
	Mon, 21 Jul 2025 03:43:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhEm-0000000G5xH-0inu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 03:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753068643;
	bh=VuSv0/XI/eD9FBwiYcZx/CO4wUCjzxcc9XNCARjCC6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DSouQuv27SyZh06F/ZYCO5G2WVwWjFsbsiPNoh8HGk2orE/qR23g8EAU3fUkCjLdI
	 Hvov4ZxhWauWqgDW3oCIhchw8bcj9v25Wa4DamYtaujlrup7qb3QyPtxBT4Iprj9i7
	 nYn79yWqv3jyNZmafxAKheJxGe1dWshVlktl8A1ggstKyM+5u/+xVTxsAwps4IdDvl
	 raOGV/8/KgVBZZ1lRN1R9Y/cCnztogEvWJoc9FHXrdY9GazNPygU+7x27jCH9XaNqz
	 DXhpNFACCQ9/qyy7x5S00fMncpFT8oT3UmakjPM1ajuALpk0qZs9e7b5C/1UrYl7Yg
	 od/N8MsWOdjoA==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9F6F4640A2;
	Mon, 21 Jul 2025 11:30:41 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 openbmc@lists.ozlabs.org, Willie Thai <wthai@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Deepak Kodihalli <dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>, 
 Leo Huang <leohu@nvidia.com>
In-Reply-To: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
References: <20250717-update-gb200nvl-dts-for-new-hardware-v3-0-f28145c55c98@nvidia.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: aspeed: nvidia: Update DTS to support
 GB200NVL hardware
Message-Id: <175306864149.1300934.10142311415731184566.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 13:00:41 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_203048_414510_EB017564 
X-CRM114-Status: UNSURE (   6.93  )
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

On Thu, 17 Jul 2025 09:52:09 +0000, Willie Thai wrote:
> Update the DTS file for the GB200NVL hardware change.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


