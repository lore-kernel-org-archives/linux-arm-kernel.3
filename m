Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F79C982C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldoWCmv2KEHuqW3cyXO1z62yTD72EIotOKiDOWZuGaM=; b=UrWntZ6kFvvftzqjeNj86LQ+Kw
	HsmDcorekDZW374R9j454M22CP1ffylzIzCAkwsajtZRemnKnkcCsjuz8wOz5J9GBPVKp3KIdZLBE
	Us4n7/xGpswYyE75Fus5HVVOFE7WkS8cLuuce/JbuyxenEeM0MUCOJAejpfVChao2pHTc50CTm6S/
	QqwvcEZeVzboSiUBrhAGtdV37ZrpP6MOCNS4QvRvsMJGLRHUieni1zQlyBBUGy2iOc17OtHiMeEwv
	BdJ8aFPBizccKNjYEtQ5PkKHrL3EYV/3rdHgmmk/JwpLcyv0gI2qCbA/Hx7ibVGk8aUOI8fKJTVNR
	/lBwyPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7Y-00000005rU9-1Whb;
	Tue, 15 Sep 2026 10:10:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7S-00000005rNd-0Ath
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:10:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71B7442D7E;
	Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558F91F00A29;
	Tue, 15 Sep 2026 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467029;
	bh=ldoWCmv2KEHuqW3cyXO1z62yTD72EIotOKiDOWZuGaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QSeU9uaoq+fonHNb5Nn9BAK62BHpnzzv9tjsz3Syu9/s+gU/5jLR4NRw7jmnq0XDQ
	 ag+TJ7Wt0XLyczNVZgQMHLoIUmSWYasi1DP5gM/UxeqFB39D3qYEUlb395Vj9kZDqL
	 qnQivVbyNW3A2S+ZcpEi5JC38i1z5nDvu4O8A7HSxAddAPOYOSFT5s1ZBQUt1se/Rs
	 /ALSicjmper+obhHB87ZQ0b7CSnTTSFBTOhKaH/i3GZOr5zSOL0609bjcrcu2LxCvI
	 vT2tszHUewT1FzU8kstDVSh7oBmAlwMzS5HFF+fUaPkcI0sEoPkSKN+WK7H4StFmac
	 bt74YCoseCjUw==
Date: Tue, 15 Sep 2026 12:10:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas_turner@talktalk.net, alexey.klimov@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
Message-ID: <20260915-gleaming-thankful-lyrebird-b0d15a@quoll>
References: <20260913123740.203698-1-tturner@lineageos.org>
 <20260913123740.203698-2-tturner@lineageos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>
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

On Sun, Sep 13, 2026 at 01:37:39PM +0100, Thomas Turner wrote:
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
> 
> Signed-off-by: Thomas Turner <tturner@lineageos.org>

So I completely missed it because you cc-ed other address.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

Best regards,
Krzysztof


