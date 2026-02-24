Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2319AF3C99F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdbiAuW7DFMBwfjS2vMQ1K/iVr4GBckWh/hFmYDp5pE=; b=00gVHC20qmitXPqrAQvKHse908
	mVmQqN2wx8HZsnGK2AoYt85ktH3Y7tYta4fAAt5tuJS181elHaQEH87jAyAp0df2IdV7e8FygbqFy
	GzMTD8535q72UBOBp8qPuHxUH/ULdlXShxlwb8cpc0Ndk9lQA4wLRwLVcofLM8DAkOdlia/sME6KK
	W9FFwWQmUXo8kN0tgEY9Qwo3Nvos8I+pARUuhm9GP06p/X3FxzNMP3nNMwdU6Bu/q8Md3K0gJRjU+
	XEzT6lVGMhcKLJAr2f4VvIRB3gtfmckAJguqxxjSa6gjn9XzgF6AN14EIS6idx5bIx95c1ChWBRLg
	iJrfWOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuay-00000002Kqr-0OrO;
	Tue, 24 Feb 2026 15:45:08 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuav-00000002KqC-11Qy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:45:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A789F26892;
	Tue, 24 Feb 2026 16:44:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xyD80bs-K9V; Tue, 24 Feb 2026 16:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1771947868; bh=CdbiAuW7DFMBwfjS2vMQ1K/iVr4GBckWh/hFmYDp5pE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=AKKuoRHMYpcTcf4DSfkaKL7PR0lNFp0OegfvvhIbh/Zc35nY2dehSqIhmylr7VF3N
	 OsiTV+GL6iuS9dOwnpmMcM1Tzcl3HTY2HgVWe4dcJ1UM2gcQhNg2qaMbaDW55X2sou
	 h6GZBX6wjXMODivdMj3+/lIg37v+ZWlFhyKx6OJmz8EKgugksCnZRmCZFb2sdjhD+1
	 Z+aWH9VqgvoEeIn1B6J/7JkqC3bzxnL64QY8/2b/Y0/QKWgIa9Rkyw75VEX62MsZ4m
	 it6laVov+XlKsvRNPQlyruVmWQoAo1dJ1pIQvoaoQWVV7W8Fp7YQ3qXWIV/+3hdv6b
	 ELGfsQQwSvseA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 21:14:16 +0530
Message-Id: <DGNB3BMA20CI.BFNTFEX5T5FY@disroot.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rayan Marzouk"
 <rayanmarzouk743@gmail.com>, "bluebunny" <kalorin.bok084@passinbox.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add initial support for Samsung
 Galaxy J7 (2016)
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
 <20260125-exynos7870-j7xelte-v1-2-5cacc3042c42@disroot.org>
 <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>
In-Reply-To: <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_074505_692995_2E4662AF 
X-CRM114-Status: UNSURE (   9.50  )
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

On 2026-02-24 12:20 +01:00, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:05, Kaustabh Chakraborty wrote:
>> From: Rayan Marzouk <rayanmarzouk743@gmail.com>
>>=20
>> Add initial devicetree support for Samsung Galaxy J7 (2016) (codename:
>> j7xelte), an Exynos7870 device.
>>=20
>> Signed-off-by: Rayan Marzouk <rayanmarzouk743@gmail.com>
>> Co-developed-by: bluebunny <kalorin.bok084@passinbox.com>
>> Signed-off-by: bluebunny <kalorin.bok084@passinbox.com>
>
> I cannot take anonymous contributions (see submitting patches). Please
> resend or confirm that I should drop above Co-dev and SoB.

If I recall correctly, "known identity" refers to anyone with a
consistently named user name. This previously used to be a "real name"
but was amended since, so I believed this was valid?

>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>
>
> Best regards,
> Krzysztof


