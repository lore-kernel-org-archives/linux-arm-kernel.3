Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A543F588F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOLUDtAObi9cNB1YbiwgpKOxMdJ9+CVtAVlix6JvZQ8=; b=HiGziugv4K08MbC7vbOW53XWAy
	wB8aVjRbcY5ZMZyg3F1rcSHJMRcgusE1fSC6uuPpTqY8fa5lLos2qtt2BrILF853GBwDO058MDuPk
	wo/NaPs9qJXSAiGBBSWM/g3wgIOQ+KCuf3pzZUptoia9AD2BQj0wW4s+YCu8R7PvHl6rqxyFZRoo5
	6TKb0hMI+BmJf/FMsjcfMq3dO9shACy3TKUt3uBmNO6IhgqwPiOtNrW1uu5fDR5cq29U3a9tBQh+m
	AePZFdvIbpEGazC+sO3zBle2yZSCiDXmWSdFUYyYbslQaSrbr3Saw3u/Ljb360059mNDklR1bdj97
	DUc/K2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErqx-00000007SVp-36wj;
	Mon, 20 Apr 2026 16:52:07 +0000
Received: from mail.lvkasz.us ([2a01:4f8:c0c:b86d::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErqv-00000007SUw-283i;
	Mon, 20 Apr 2026 16:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lvkasz.us; s=vps;
	t=1776703920; bh=2IHn37+cMsbWYkDsy6cJEMCnVMxpyEd3hiZhGarHxt4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gSf26RAzleLxCuDaz1ZlUE6GSUTBEsw+vqGcDicob5TfGtK4hlqYFantxpgi4Q+BX
	 hNGMlh1tqvCwWF88GDM3ZZOxdhbLq2NWlN9NYEs/QFOoaQCe3XFw+w4SOYeIvSNzj+
	 tQ0M0F2EK3nrGwrqO8dQ/9Vw9OAe+jLY/PeAkrarK1qS2XQP2hBd+V7cqImsg+3gPi
	 wZJhMIP92WpYu8GLvV1ryQHld3iC9UQ9KFBEM20gch8NPkHPIvfDe2KgG+r4VdyYX/
	 PgylcGPBA3EGvcy6jEQJVWI4v/cAYbLpDxVdd9WPUFkJ6FbsNNM2xdQN5sI6m84pQJ
	 P0cmFVvrl5xzA==
Received: from [10.30.1.147] (5.185.72.109.ipv4.public.orange.pl [5.185.72.109])
	by mail.lvkasz.us (Postfix) with ESMTPSA id 36A60E061C;
	Mon, 20 Apr 2026 18:51:59 +0200 (CEST)
Message-ID: <84f4bc8a-f94d-495e-9ab2-7997798953c2@lvkasz.us>
Date: Mon, 20 Apr 2026 18:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values
 for Exynos7870
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com,
 andre.draszik@linaro.org, pritam.sutar@samsung.com, kauschluss@disroot.org,
 johan@kernel.org, ivo.ivanov.ivanov1@gmail.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406135627.234835-1-kernel@lvkasz.us>
Content-Language: en-US, pl-PL
From: =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>
In-Reply-To: <20260406135627.234835-1-kernel@lvkasz.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_095205_741893_896D7797 
X-CRM114-Status: UNSURE (   9.79  )
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

On 4/6/26 15:56, Łukasz Lebiedziński wrote:
> The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
> causing the USB 2.0 PHY to fail high-speed negotiation and fall back
> to full-speed (12Mbps) operation.
> 
> Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
> TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
> (squelch threshold) from 6 to 5. Also explicitly set
> TXPREEMPPULSETUNE to 0, which was previously missing from the
> tuning table despite being included in the register mask.
> 
> All values are derived from the vendor kernel for the Samsung
> Galaxy A6 (SM-A600FN), as no public hardware documentation is
> available for the Exynos7870 USB DRD PHY. With these corrections,
> the PHY successfully negotiates high-speed (480Mbps) operation.
> 
> Fixes: 588d5d20ca8d ("phy: exynos5-usbdrd: add exynos7870 USBDRD support")
> Cc: stable@vger.kernel.org
> Tested-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Łukasz Lebiedziński <kernel@lvkasz.us>

Friendly ping.

I'd also like to mention that this patch was tested on two devices:
Samsung Galaxy A6 (SM-A600FN) by me and Samsung Galaxy J6 (SM-J600FN)
by Kaustabh Chakraborty <kauschluss@disroot.org>.


Regards,
Łukasz

