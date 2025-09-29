Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B6CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQZgZsctU6O5E/qRW7sc8e2UWer2SjBZHkJy1c3Fybg=; b=UuDl74406TnIWseeQq7scVqMIs
	0uGhWlzXvdv5MgDfpPrDeRoUHOz1aMlpRLRCgmkm5kdVMdorGAxTCsfjNx3aptpWP08Dn3XNH20k8
	Jao8aShe/aFeE+ms58IBr5E3hF85XiJMYZsZ08r8L4K45G0jHfnJ81BK6tqfuGIq1VNHlYQaDqYYv
	LVOG1F9RpYfRzCWpT8G7/ekYKwdFufRasWSIb0djtHFjEDz45rNtwie9ieEx+yUVN2c7rjKnAqrBg
	rZ8STb4usF41d4lbJRcKkIF1k+sRVYvXui/ldnIyMBE+CKxseZhduQNXWebHIrN/qB2bIldZN0VQB
	0FoIydXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ahk-000000024tY-2Yuv;
	Mon, 29 Sep 2025 10:02:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ahg-000000024sa-3fTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 10:01:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6163C26106;
	Mon, 29 Sep 2025 12:01:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgPnpGQdaUeP; Mon, 29 Sep 2025 12:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759140113; bh=p5krCsk5tEj0RdSxxcj8uuSew5hXh67QcWAkeZl0lPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mCn1xxc+q+DoWnlmWYOr7lHIiwRv2WiGUM0nRQf4DYQBoWaBgTtR3UOYAielY4p8i
	 CaXZMlCYoPfDlfpVgEz2Twp26sitmR05DJvZoUsW5SOxJTilElHaBbAeavd7MpSQIJ
	 UFhMk698GAEB52fDa38Sdi5zg06FWY8q6wwMwYiPZVmz+JrOxrPtHrye89W2qTXgBe
	 3YwYA1lt1rWyrL2X+Nu+OGMYiGN94KGTAZrQJxJvdrvn6QWPUCQIO9qJDsTWgcpHTr
	 SN94jA9yjup6okXHquhbyticue/tb9AZj2de3wexH/vJnEiQaPR0KsiH1exu326ACJ
	 97Ye3k4miEzGQ==
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 10:01:53 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos7870: relocate ${x}-names property
 after ${x}
In-Reply-To: <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
 <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
Message-ID: <6dff1e8256f3d0932d1f5ad941e129db@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_030157_333432_1BF99C76 
X-CRM114-Status: UNSURE (   9.78  )
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

On 2025-09-28 21:56, Krzysztof Kozlowski wrote:
> On Mon, 29 Sept 2025 at 01:44, Kaustabh Chakraborty
> <kauschluss@disroot.org> wrote:
>> 
>> All ${x}-names properties are conventionally placed after their
>> corresponding ${x} properties. For instance, 'clock-names' must follow
>> 'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
>> changes to follow said convention. No functional changes made.
>> 
> 
> I don't intend to take such cosmetic changes, because they interfere
> with stable back porting, unless we have a tool for such cleanup. Did
> you use my prototype tool for that or some other tool?

No, I did it manually. This is due to your first remark in [1] and
my corresponding reply in [2]. What do I do here then?

[1] 
https://lore.kernel.org/all/6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org/
[2] 
https://lore.kernel.org/all/00240935c664edaec3092354a303a91f@disroot.org/

> 
> Best regards,
> Krzysztof

