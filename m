Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78AAD78338
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcIwgDwhH0r2JEAbp50oSCByWlOCYMPyzaBWedWcxxE=; b=VWbMUcFPynrhBeo0t9zuTlULUo
	prqqjPL+sZo2bU+huf1VKM0gIO8JtZaxKYfhk++YGhkhvdKPEiSOyuOUV6v0djnC55kOFwfy5+m5C
	UuuKr9BebeVrIwhbVV20My2JoLi681ugEeQaRgabylegsAPB/kqd0NrRb5F4xth2BNY5L8CE/UuA6
	ytZZFWp8/9uRbvxInEjp9RItLsSPFZcfT3xKTgnx+brFmPoF39v0RewMptYOHJeScnD3xLP9W6s5P
	KL8e83hqKiuWaHA9Femq5ZlJ9ygf8xucfrDSR1Az/yvMDbcF9LRRJHjHqi3yydlzVS1140as0xpPx
	chQN43EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI98R-00000006onv-2djO;
	Mon, 02 Dec 2024 16:18:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8rs-00000006lU9-03X0;
	Mon, 02 Dec 2024 16:01:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa5366d3b47so718595966b.0;
        Mon, 02 Dec 2024 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733155306; x=1733760106; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KcIwgDwhH0r2JEAbp50oSCByWlOCYMPyzaBWedWcxxE=;
        b=BenBxHKtWpHdDSVMHdooT14R3MNQo0/zKoGDlWx45rtz2B/NtfRi7ak+//BWFvy+ZC
         8b2+WSunq97TfCDxhwtlyZ6xx5of043qOKeYxxyO8GlokosZvU5CSzS4DFOvZ3oZwgYp
         iLERrGu0RP78hRTIAZsTYm3Fr55zbJhZDW6ZhpaixJMheiv9w6ItF3i2WUYFi4NGc4vL
         M9lFDJvmPwZ1yD0+2gT4MDnj4/LB9qNpHzmekMJGwzv5L2y79X8Kybt5+wht9JXLDzfc
         l3Psn4OMWg3oBF7/q7L/hsHVnc66R+NvLcrPBInupIfshd0PwVc14z5cKQEWDxfz8Pq9
         JEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155306; x=1733760106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcIwgDwhH0r2JEAbp50oSCByWlOCYMPyzaBWedWcxxE=;
        b=pSYeJB21oXWAKHTC65y/2/YN+wlAHK/lEZWv7SyiUpzeDAQ1PQgGvadwEUBQ7mXV8Q
         8pVIltV8KGEZjpUeUBkqonOqaMzP7IhucYaAKl5qtr2pM/QhP5v8WPKjG1Rl/xHh9amt
         AV+mIvtO8sV6lxZkpXzBhdOqXvW3J7a4wN05qvS6R4D3kPf01V7M2fEM4hvM+wqxI84O
         KJD4FyctGCxIriR2Cau6vVaPOvTaAWHn8FYtM0hNcY6Bv6ucwLjQu0q/fvh5UwCCHszP
         Tx6CUpROUAVezvsiFqWiN6SQraPz85paVCg0roDkIN48311nkQzwnqluA1mj2ESGQBNW
         mzDg==
X-Forwarded-Encrypted: i=1; AJvYcCUsMKhl9KNS9nSLHbKiLoMnpwhktvcEgt7oZLiew8/CMRSDGSU4V8QAZUHzGmXbQ7MaycEFLsWScZp9KAchHn0=@lists.infradead.org, AJvYcCW5mSIO8NPy1/hyQJdqd6Q3oGtv5WUa1wfWNnpkaJtIxtrV4/HzuKSiJah3mTwAWuyA2RW/ARQtwgIc@lists.infradead.org, AJvYcCX/i6qfExZMyceWepnwCN6nZL6oCv4O37B+jcmnOVap0NCD0fVA1tK1JrZ6cm9seQ9LIyWOWWMrnKMW5Sxx0Y9L@lists.infradead.org
X-Gm-Message-State: AOJu0YwZPjy6CwRzJV4YeHfDUYC1wzNsAZp8axAqn8Z/CNwCsSLf0yDt
	B0TbeJ049yvP/Ds60EJDHiSYNrF/VTnYyzQBPcupR0SDc5ResvRrKCmo1e962llVmu4zBBVqLeM
	0obfW3bdVkCzqC9UQKR6QE0b/rxQ=
X-Gm-Gg: ASbGncv2AnW7L0GGFD2OLaFjXubr6RssRchCZffZQ0SSY9Ku6fBiOAdZERH4VDwbImp
	SIzkJPWTh8gtNAiGiVFBe5qOP0/cfPZ4X
X-Google-Smtp-Source: AGHT+IGFABNZQaOPRburPWloYkSi4CpGPxba8eF7BykGzMmRWWY/MWtNoKOUl7owa7F4QGuaqVaPpnIxNrEo8kH/2NE=
X-Received: by 2002:a17:906:846c:b0:aa5:2a71:1646 with SMTP id
 a640c23a62f3a-aa580f56a7fmr1829897466b.33.1733155303815; Mon, 02 Dec 2024
 08:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20241012071919.3726-1-linux.amoon@gmail.com>
In-Reply-To: <20241012071919.3726-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 2 Dec 2024 21:31:26 +0530
Message-ID: <CANAwSgSusXfr73LNySLJVnYPDNsyYmK_=2+YXAwm6bLE+NsWdQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RK3399: PCie Phy using new helper function
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080148_051314_FDC2DCF1 
X-CRM114-Status: GOOD (  14.39  )
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

Hi All,

On Sat, 12 Oct 2024 at 12:49, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Few clean of the phy change and Using guard notation makes the code
> more compact and error handling for mutex_lock/mutex_unlock.
>
> Plz review te code changes, I tend to do silly mistake.
>
> v1:
> [1] https://lore.kernel.org/all/20240901183221.240361-5-linux.amoon@gmail.com/
> v2: Fix some typo in the subjects.
> [2] https://lore.kernel.org/all/20241006182445.3713-1-linux.amoon@gmail.com/
>

Do you have any device comments on these code changes?

> Thanks
> -Anand
>
Thank
-Anand

> Anand Moon (6):
>   phy: rockchip-pcie: Simplify error handling with dev_err_probe()
>   phy: rockchip-pcie: Use devm_clk_get_enabled() helper
>   phy: rockchip-pcie: Use regmap_read_poll_timeout() for PCIe reference
>     clk PLL status
>   phy: rockchip-pcie: Refactor mutex handling in
>     rockchip_pcie_phy_power_off()
>   phy: rockchip-pcie: Refactor mutex handling in
>     rockchip_pcie_phy_power_on()
>   phy: rockchip-pcie: Use guard notation when acquiring mutex
>
>  drivers/phy/rockchip/phy-rockchip-pcie.c | 148 +++++++----------------
>  1 file changed, 47 insertions(+), 101 deletions(-)
>
>
> base-commit: 09f6b0c8904bfaa1e0601bc102e1b6aa6de8c98f
> --
> 2.44.0
>

