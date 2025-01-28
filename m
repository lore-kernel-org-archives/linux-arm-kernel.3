Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14541C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD6aGMkGgUesAlsT3HDG5pObkWdXtnRJmAMs5WiLGeg=; b=JCvr6m9DRHGWK4LyhZjzKCCchy
	uuC6+3zJjyC8jvcab6lScOcAOl7QfBfM9CRM+RWW2V/9iETdXRbLUg5emjeefhg49FZCJiyYVCY2v
	JZhoZT2u27pSrD6/a8fAixw43G9mWBZDQyvAi/5nGXU/VsNiTHNxXnLL9j6OJLXbLW+lMHFcXcx1m
	iJAbX1Jr232au3rRQfOkLIAnSA1wKltROtiQhKipv5PotJQDSn6G0Gjkda1CuKmMfPy+FD3prPxfM
	/fTtTgDOQq3TWjSsEAwd6QVbFUtNxt1EKV4/6q1DyhTF5lANYtF5RLWurCf2UgxEsK5PHIzyxveBd
	pQf4QPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchr8-00000004X2B-3LIt;
	Tue, 28 Jan 2025 09:26:02 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchpm-00000004WoQ-0Bck;
	Tue, 28 Jan 2025 09:24:39 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738056274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CD6aGMkGgUesAlsT3HDG5pObkWdXtnRJmAMs5WiLGeg=;
	b=RwBEXPtNpHhxIK0t1mNdkDQc4WmPYgNvEIrU0KFOUGiJhLvU1tUPFOFS4REGW1ckPFLfrQ
	H8qzihaB1kt/C2NzPQ/gy4Qr+9qvnivYaw8kx0sBiXNVyc25ul18bOiE9rVxx2JQ9Nmlp4
	aQ6nuSf5CI3yuCt29gsJGFDLnKKCRB6gP8KiR0Jraq/MFqpysbGp1GXosdIUa2tZLWEBGV
	QDRtFGGuTuVPxOftgmEuUdOUPXG7cxigRIg3sXFAXQc2+ZbghIhOmlJ2xNXusGwapbPj8s
	ugEVWMbUsodqcY6N/wV/t0Optb2qVQebaMc+aQFHPP7w4zQwdxkMDfYexkJong==
Date: Tue, 28 Jan 2025 10:24:33 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, Sebastian Reichel
 <sebastian.reichel@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
In-Reply-To: <CAP1tNvTRER=QzC29Udw4ffOetVECWV+MfZ2o-mbUFvuZ0_i-Kw@mail.gmail.com>
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
 <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
 <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <CAP1tNvTRER=QzC29Udw4ffOetVECWV+MfZ2o-mbUFvuZ0_i-Kw@mail.gmail.com>
Message-ID: <b57d8a834f5c07e37e0e7ee74346c700@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_012438_245090_A91BA408 
X-CRM114-Status: GOOD (  13.78  )
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

Hello Alexander,

On 2025-01-26 15:25, Alexander Shiyan wrote:
>> > > I think it's actually better to accept the approach in Alexander's
>> > > patch, because the whole thing applies to other Rockchip SoCs as well,
>> > > not just to the RK3588(S).
>> >
>> > Anyway, I've just tried it after including the changes below, and
>> > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
>> > pinctrls under tsadc, the driver still doesn't seem to be triggering a
>> > PMIC reset. Weird. Any thoughts welcome.
>> 
>> I found the culprit. "otpout" (or "default" if we follow Alexander's
>> suggested approach) pinctrl state should refer to the &tsadc_shut_org
>> config instead of &tsadc_shut - then the PMIC reset works.
> 
> Great, I'll use this in v2.

Please, let's wait with the v2 until I go through the whole thing again,
which I expected to have done already, but had some other "IRL stuff" 
that
introduced a delay.

